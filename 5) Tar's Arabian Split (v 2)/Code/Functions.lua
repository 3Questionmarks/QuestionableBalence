include("PlotIterators.lua")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "Tar_Arabia";
--______________________________________________________________________________________________________
--Defines
local rashidun = GameInfoTypes["CIVILIZATION_TAR_RASHIDUN"]
local umayyad = GameInfoTypes["CIVILIZATION_TAR_UMAYYAD"]
local abbasid = GameInfoTypes["CIVILIZATION_TAR_ABBASID"]
local ansar = GameInfoTypes["UNIT_TAR_ANSAR"]
local bazaar = GameInfoTypes["BUILDING_BAZAAR"]
local yamani = GameInfoTypes["UNIT_TAR_YAMANI"]
local physician = GameInfoTypes["UNIT_TAR_PHYSICIAN"]
local faith = GameInfoTypes["BUILDING_TAR_RASHIDUN_DUMMY"]
local production = GameInfoTypes["BUILDING_TAR_UMAYYAD_DUMMY"]
local science = GameInfoTypes["BUILDING_TAR_ABBASID_DUMMY"]
--______________________________________________________________________________________________________
function IsCivilizationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
--______________________________________________________________________________________________________
--Gain Science with theming bonuses.
function AbbasidScience(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == abbasid then
		for city in player:Cities() do
			local valScience = 0
			if city:GetNumGreatWorks() > 1 then
				local iteratedBuilding
				for row in GameInfo.Building_ThemingBonuses() do
					if city:IsHasBuilding(GameInfoTypes[row.BuildingType]) and GameInfoTypes[row.BuildingType] ~= iteratedBuilding then
						local building = GameInfo.Buildings[row.BuildingType]
						class = building.BuildingClass
					    valScience = valScience + city:GetThemingBonus(GameInfoTypes[class])
					    iteratedBuilding = GameInfoTypes[row.BuildingType]
					end
				end
			end
			city:SetNumRealBuilding(science, valScience)
		end
	end
end
if IsCivilizationActive(abbasid) then GameEvents.PlayerDoTurn.Add(AbbasidScience) end
--______________________________________________________________________________________________________
--Produces an extra copy of a Great Work of Writing for each one created.
function AbbasidProduceCopy(playerId, eGreatPersonType)
	local player = Players[playerId]
	if player:GetCivilizationType() == abbasid and eGreatPersonType == GameInfoTypes["UNIT_WRITER"] then
		local gw
		for i,v in ipairs(player:GetGreatWorks(3)) do
			if load(player,"AbbasidHaveCopied" .. Game.GetGreatWorkName(v.Index)) == nil and Game.GetGreatWorkCreator(v.Index) == playerId then
				gw = v.Index
				save(player,"AbbasidHaveCopied" .. Game.GetGreatWorkName(v.Index), true)
				break
			end
		end
		if gw then
			local city = player:GetCityOfClosestGreatWorkSlot(player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY(), GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"])
			if city then
		        local building = player:GetBuildingOfClosestGreatWorkSlot(player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY(), GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"])
		        if building then
			        building = GameInfo.Buildings[building]
			        local buildingClass = building.BuildingClass
			        local availableSlots = building.GreatWorkCount
					for slot = 0, availableSlots-1, 1 do
						if city:GetBuildingGreatWork(GameInfoTypes[buildingClass], slot) == -1 then
							city:SetBuildingGreatWork(GameInfoTypes[buildingClass],slot,gw)
							break
						end
					end
				end
			end
		end
	end
end
if IsCivilizationActive(abbasid) then GameEvents.GreatPersonExpended.Add(AbbasidProduceCopy) end
--______________________________________________________________________________________________________
--Discover Technology reveals a Technology known by the original owner of a Great Work stored in the city.
function DiscoverTech(playerId, eGreatPersonType)
	if eGreatPersonType == physician then
		local player = Players[playerId]
		local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
		local runTimes = 4
		local stealList = {}
		local targetTech
		for GreatWorkType = 1, 4, 1 do
			for i,v in ipairs(player:GetGreatWorks(GreatWorkType)) do
				local foreignCiv = Players[Game.GetGreatWorkCreator(v.Index)]
				if foreignCiv ~= player and not(foreignCiv:IsMinorCiv()) and not(foreignCiv:IsBarbarian()) then
					table.insert(stealList, foreignCiv)
				end
			end
		end
		for key,foreignCiv in pairs(stealList) do 
			local enemyTechs = Teams[foreignCiv:GetTeam()]:GetTeamTechs()
			for row in GameInfo.Technologies() do
				if not(teamTechs:HasTech(row.ID)) and enemyTechs:HasTech(row.ID) and not(player:GetCurrentResearch() == row.ID) then
					targetTech = row.ID
					break
				end
			 end
			if targetTech then
				break
			end
		end
		if targetTech then
			local amount = teamTechs:GetResearchLeft(targetTech)
			teamTechs:ChangeResearchProgress(targetTech, amount)
		end
	end
end
GameEvents.GreatPersonExpended.Add(DiscoverTech)
--______________________________________________________________________________________________________
--1 Production per city equally divided amongst all cities that follow your religion. 
function UmayyadProduction(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == umayyad then
		local religion = player:GetReligionCreatedByPlayer()
		if religion == -1 then
			local capital = player:GetCapitalCity()
			if capital:GetReligiousMajority() > GameInfoTypes["RELIGION_PANTHEON"] then
				religion = capital:GetReligiousMajority()
			end
		end
		if religion > -1 then
			local validCities = {}
			for city in player:Cities() do
				city:SetNumRealBuilding(production, 0)
				if city:GetReligiousMajority() == religion then
					table.insert(validCities, city)
				end
			end
			local valProduction = math.floor(player:GetNumCities() / #validCities)
			for key,city in pairs(validCities) do
				city:SetNumRealBuilding(production, valProduction)
			end
		end
	end
end
if IsCivilizationActive(umayyad) then GameEvents.PlayerDoTurn.Add(UmayyadProduction) end
--______________________________________________________________________________________________________
--Powerful land unit that grows in strength for each other of its kind that is garrisoned. 
local yamaniIngame
function IsThereAYamaniIngame(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == yamani then
		yamaniIngame = true
		Events.SerialEventUnitCreated.Remove(IsThereAYamaniIngame)
	end
end
Events.SerialEventUnitCreated.Add(IsThereAYamaniIngame)

function YamaniStrength(playerID)
	if yamaniIngame == true then
		local player = Players[playerID]
		if player:GetUnitClassCount(GameInfoTypes["UNITCLASS_PIKEMAN"]) > 0 then
			local baseCombatStrength = GameInfo.Units[yamani].Combat
			local yamaniList = {}
			local garrisonedNum = 0
			for unit in player:Units() do
				if unit:GetUnitType() == yamani then
					if unit:IsGarrisoned() then garrisonedNum = garrisonedNum + 1 end
					table.insert(yamaniList, unit)
				end
			end
			for key,unit in pairs(yamaniList) do
				if unit then
					unit:SetBaseCombatStrength(baseCombatStrength + garrisonedNum)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(YamaniStrength)
--______________________________________________________________________________________________________
--+2 Movement Points to units that cross this city.
function BazaarMovement(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if player:CountNumBuildings(bazaar) > 0 then
		local unit = player:GetUnitByID(unitID)
		local city = unit:GetPlot():GetPlotCity()
		if city and city:IsHasBuilding(bazaar) then
			unit:ChangeMoves(120)
		end
	end
end
GameEvents.UnitSetXY.Add(BazaarMovement)
--______________________________________________________________________________________________________
--+5 Faith per Holy City.
function RashidunFaith(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == rashidun then
		for city in player:Cities() do if city:IsHolyCityAnyReligion() then city:SetNumRealBuilding(faith, 1) end end
	end
end
if IsCivilizationActive(rashidun) then GameEvents.PlayerDoTurn.Add(RashidunFaith) end
--______________________________________________________________________________________________________
--Your Faith output is the starting Production threshold towards all land units. 
function RashidunProduction(ownerID, cityID, unitTypeID)
	local player = Players[ownerID]
	if player:GetCivilizationType() == rashidun then
		if GameInfo.Units[unitTypeID].Domain == "DOMAIN_LAND" and GameInfo.Units[unitTypeID].Combat > 0 then
			local faith = player:GetFaithPerTurnFromCities() + player:GetFaithPerTurnFromMinorCivs() + player:GetFaithPerTurnFromReligion()
			local city = player:GetCityByID(cityID)
			if faith > city:GetUnitProduction(unitTypeID) then
				city:SetUnitProduction(unitTypeID, faith)
			end
		end
	end
	return true
end
if IsCivilizationActive(rashidun) then GameEvents.CityCanTrain.Add(RashidunProduction) end
--______________________________________________________________________________________________________
--Has 2 charges to replenish nearby units of Movement and Health Points when near cities.
function AnsarReplenish(ownerId, unitId, ePromotion)
	local player = Players[ownerId]
	if Players[ownerId]:IsHuman() then
		if ePromotion == GameInfoTypes["PROMOTION_TAR_REPLENISH"] then
			local unit = player:GetUnitByID(unitId)
			--===========
			local plot = unit:GetPlot()
			local cityPlot
			for citySearch in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if citySearch:IsCity() then
					cityPlot = citySearch
					break
				end
			end
			for loopPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
					local otherUnit = loopPlot:GetUnit(i)
					if otherUnit and otherUnit:GetOwner() == ownerId and otherUnit ~= unit then
						local originalMoves = (GameInfo.Units[otherUnit:GetUnitType()].Moves) * 60
						otherUnit:SetDamage(0)
						otherUnit:ChangeMoves(originalMoves)
					end
				end
			end
			Events.AudioPlay2DSound("AS2D_SOUND_TAR_ANSAR_HEAL")
			--===========
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TAR_REPLENISH"], false)
			local spreads = load(unit, "SpreadsUsed")
			if spreads == nil then spreads = 0 end
			spreads = spreads + 1
			if spreads >= 3 and player:CountNumBuildings(GameInfoTypes["BUILDING_BOROBUDUR"]) > 0 then 
				unit:ChangeDamage(1000) 
			elseif spreads >= 2 and player:CountNumBuildings(GameInfoTypes["BUILDING_BOROBUDUR"]) <= 0 then
				unit:ChangeDamage(1000) 
			else 
				save(unit,"SpreadsUsed", spreads)
				CityCheck(unit)
			end
		elseif ePromotion == GameInfoTypes["PROMOTION_TAR_SAVE"] then
			--local unit = player:GetUnitByID(unitId)
			--unit:SetHasPromotion(GameInfoTypes["PROMOTION_TAR_SAVE"], false)
		end
	end
end
GameEvents.UnitPromoted.Add(AnsarReplenish)

function AnsarNearCity(playerID, unitID, unitX, unitY)
	if Players[playerID]:IsHuman() then
		local unit = Players[playerID]:GetUnitByID(unitID)
		CityCheck(unit)
	end
end
GameEvents.UnitSetXY.Add(AnsarNearCity)

function RePrompt(playerID)
	local player = Players[playerID]
	if player:GetUnitClassCount(GameInfoTypes["UNITCLASS_MISSIONARY"]) > 0 and player:IsHuman() then
		for unit in player:Units() do
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TAR_SAVE"], false)
			CityCheck(unit)
		end
	end
end
GameEvents.PlayerDoTurn.Add(RePrompt)

function CityCheck(unit)
	if unit:GetUnitType() == ansar and not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_TAR_SAVE"])) then
		local plot = unit:GetPlot()
		for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if loopPlot:IsCity() then
				unit:SetLevel(1)
				unit:SetExperience(0)
				local xp = unit:ExperienceNeeded()
				unit:ChangeExperience(xp)
				unit:SetPromotionReady(true)
				break
			else
				unit:SetPromotionReady(false)
				unit:SetLevel(1)
				unit:SetExperience(0)
			end
		end
	end
end

function AnsarConvert(playerID, unitID)
	local player = Players[playerID]
	if player:GetCivilizationType() == rashidun then
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() == GameInfoTypes["UNIT_MISSIONARY"] then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_RIVAL_TERRITORY"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_SIGHT_PENALTY"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_UNWELCOME_EVANGELIST"], false)
			Ansar = player:InitUnit(ansar, unit:GetX(), unit:GetY())
			Ansar:Convert(unit)
		end
	end
end
--if IsCivilizationActive(rashidun) then Events.SerialEventUnitCreated.Add(AnsarConvert) end

function AnsarAI(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if not(player:IsHuman()) then
		local unit = Players[playerID]:GetUnitByID(unitID)
		if unit:GetUnitType() == ansar then
			local team = Teams[player:GetTeam()]
			local plot = unit:GetPlot()
			if plot then
				local owner = plot:GetOwner()
				if owner then
					owner = Players[owner]
					if owner and team:IsAtWar(owner:GetTeam()) then
						local cityPlot
						for citySearch in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							if citySearch:IsCity() then
								cityPlot = citySearch
								break
							end
						end
						if cityPlot then
							for loopPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
								for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
									local otherUnit = loopPlot:GetUnit(i)
									if otherUnit and otherUnit:GetOwner() == playerID and otherUnit ~= unit then
										otherUnit:SetDamage(0)
										local runTimes = 2
										if player:CountNumBuildings(GameInfoTypes["BUILDING_BOROBUDUR"]) > 0 then runTimes = 3 end
										for i = 0, runTimes - 1 do
											local originalMoves = (GameInfo.Units[otherUnit:GetUnitType()].Moves) * 60
											otherUnit:ChangeMoves(originalMoves)
										end
									end
								end
							end
							unit:ChangeDamage(1000) 
						end
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(AnsarAI)
--______________________________________________________________________________________________________
function UmayyadBlockYamani(ownerID, cityID, unitTypeID)
	local player = Players[ownerID]
	if player:GetCivilizationType() == umayyad and player:HasPolicy(GameInfoTypes["POLICY_TAR_QAYS"]) then
		if unitTypeID == yamani then
			return false
		end
	end
	return true
end
if IsCivilizationActive(umayyad) then GameEvents.CityCanTrain.Add(UmayyadBlockYamani) end

function RashidunConvert(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	local player = Players[ownerId]
	if player:GetCivilizationType() == rashidun and player:HasPolicy(GameInfoTypes["POLICY_TAR_MOSQUE"]) then
		if buildingType == GameInfoTypes["BUILDING_SHRINE"] or buildingType == GameInfoTypes["BUILDING_TEMPLE"] then
			local city = player:GetCityByID(cityId)
			local yourReligion = player:GetReligionCreatedByPlayer()
			for religion in GameInfo.Religions() do
				if city:GetNumFollowers(religion.ID) > 0 and religion.ID ~= yourReligion then
					city:ConvertPercentFollowers(yourReligion, religion.ID, 51)
				end
			end
		end
	end
end
if IsCivilizationActive(rashidun) then GameEvents.CityConstructed.Add(RashidunConvert) end