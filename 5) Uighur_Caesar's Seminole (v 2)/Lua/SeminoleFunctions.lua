-- Lua Script1
-- Author: pedro
-- DateCreated: 07/28/16 11:13:28 PM
--------------------------------------------------------------
--WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "SeminoleFunctions";
--include("PlotIterators")


--local seminoleID = GameInfoTypes.CIVILIZATION_UC_SEMINOLE

-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
-- function JFD_IsCivilisationActive(civilisationID)
--	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
--		local slotStatus = PreGame.GetSlotStatus(iSlot)
--		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
--			if PreGame.GetCivilization(iSlot) == civilisationID then
--				return true
--			end
--		end
--	end
--
--	return false
--end
--
--local isSeminoleActive = JFD_IsCivilisationActive(seminoleID)
--
--local tValidUnitDomains = {[GameInfoTypes.DOMAIN_LAND] = "true"}
--local bUseUnitSetXY = true

--------------------------------------------------------------------
--create in this function the actual effect for units gaining XP
--------------------------------------------------------------------

-- function UnitXPEffects(pPlayer, pUnit, iNewXPValue, iOldXPValue)
	--example if I want to add 1 culture point for every XP gained
--	local delta = iNewXPValue - iOldXPValue
--	pPlayer:ChangeJONSCulture(delta)
--	local previousCulture = load(pPlayer, "SeminoleCulture")
--		if previousCulture == nil then
--			previousCulture = 0
--		end
--		culture = (iNewXPValue - iOldXPValue) + previousCulture
--		save(pPlayer, "SeminoleCulture", culture)
--		if pPlayer:IsHuman() then
--		local alertmessage = Locale.ConvertTextKey()
--					Events.GameplayAlertMessage()
--		end
--end

--------------------------------------------------------------------
--generally don't change below here
--------------------------------------------------------------------
--local bCivilizationIsActive = false
--local tXPValues = {}


--function OnUnitCreatedRegisterInTable(PlayerID, UnitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState)
--	if tXPValues[PlayerID] then
--		local pPlayer = Players[PlayerID]
--		local pUnit = pPlayer:GetUnitByID(UnitID)
--		if(pPlayer == nil or
--			pUnit == nil or
--			pUnit:IsDead()) then
--			return
--		end
--		if tValidUnitDomains[pUnit:GetDomainType()] and pUnit:IsCombatUnit() then
--			if not tXPValues[PlayerID][UnitID] then
--				--print("function OnUnitCreatedRegisterInTable was executed")
--				tXPValues[PlayerID][UnitID] = pUnit:GetExperience()
--			end
--		end
--	end
--end

--function PlayerDoTurnSeminole(PlayerID)
--	if tXPValues[PlayerID] then
--		local pPlayer = Players[PlayerID]
--		for pUnit in pPlayer:Units() do
--			if tValidUnitDomains[pUnit:GetDomainType()] and pUnit:IsCombatUnit() and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE) then
--				local UnitID = pUnit:GetID()
--				if tXPValues[PlayerID][UnitID] then
--					if pUnit:GetExperience() > tXPValues[PlayerID][UnitID] then
--						UnitXPEffects(pPlayer, pUnit, pUnit:GetExperience(), tXPValues[PlayerID][UnitID]) --makes the UA effect for the XP change
--					end
--				end
--				tXPValues[PlayerID][UnitID] = pUnit:GetExperience() --records the units current XP amount
--			end
--	for pUnit in pPlayer:Units() do
--	local plot = pUnit:GetPlot()
--	if plot ~= nil then
--	if plot:GetFeatureType() == GameInfoTypes.FEATURE_MARSH or plot:GetFeatureType() == GameInfoTypes.FEATURE_JUNGLE then
--	if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE) then
--			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE, true)
--			end
--			else
--		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE) then
--			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE, false)
--								end
--							end
--						end
--					end
--				end
--			end
--		end
--[[
function OnSetXYUnitSeminole(PlayerID, UnitID, x, y)
	if tXPValues[PlayerID] then
		local pPlayer = Players[PlayerID]
		local pUnit = pPlayer:GetUnitByID(UnitID)
		if(pPlayer == nil or
			pUnit == nil or
			pUnit:IsDead()) then
			return
		end
		if tValidUnitDomains[pUnit:GetDomainType()] and pUnit:IsCombatUnit() and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE) then
			if tXPValues[PlayerID][UnitID] then
				if pUnit:GetExperience() > tXPValues[PlayerID][UnitID] then
					UnitXPEffects(pPlayer, pUnit, pUnit:GetExperience(), tXPValues[PlayerID][UnitID]) --makes the UA effect for the XP change
				end
			end
			tXPValues[PlayerID][UnitID] = pUnit:GetExperience() --records the units current XP amount
		end
	local plot = pUnit:GetPlot()
	if plot ~= nil then
	if plot:GetFeatureType() == GameInfoTypes.FEATURE_MARSH or plot:GetFeatureType() == GameInfoTypes.FEATURE_JUNGLE then
	if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE, true)
			end
	else
	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_SEMINOLE, false)
						end
					end
				end
			end
		end

function OnLoadScreenClose()
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer:IsEverAlive() then
			if pPlayer:GetCivilizationType() == seminoleID then
				tXPValues[iPlayer] = {}
				bCivilizationIsActive = true
				for pUnit in pPlayer:Units() do
					if tValidUnitDomains[pUnit:GetDomainType()] and pUnit:IsCombatUnit() then
						tXPValues[iPlayer][pUnit:GetID()] = pUnit:GetExperience()
					end
				end
			end
		end
	end
	if bCivilizationIsActive then
		Events.SerialEventUnitCreated.Add(OnUnitCreatedRegisterInTable)
		GameEvents.PlayerDoTurn.Add(PlayerDoTurnSeminole)
		if bUseUnitSetXY then
			GameEvents.UnitSetXY.Add(OnSetXYUnitSeminole)
		end
	end
end
Events.LoadScreenClose.Add(OnLoadScreenClose)
--]]
function HammockFunction(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if unit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_HAMMOCK) then
				local isAdjacentHammock = false
					local unitPlot = unit:GetPlot()
					if unitPlot then
						for loopPlot in PlotAreaSpiralIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							local loopUnit = loopPlot:GetUnit()
							if (loopUnit and loopUnit:GetOwner() == playerID and loopUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_HAMMOCK)) or ((loopPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_UC_SWAMP_CHICKEE or loopPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_UC_CHICKEE) and not loopPlot:IsImprovementPillaged() and loopPlot:GetOwner() == playerID) or ((unitPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_UC_SWAMP_CHICKEE or unitPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_UC_CHICKEE) and not unitPlot:IsImprovementPillaged() and loopPlot:GetOwner() == playerID)  then
								isAdjacentHammock = true
								break
							end
						end
					end 
				if isAdjacentHammock then
					if (not unit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_HAMMOCK_FLANK)) then
						unit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_HAMMOCK_FLANK, true)
					end
				else
					if unit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_HAMMOCK_FLANK) then
						unit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_HAMMOCK_FLANK, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HammockFunction)

function SeminoleTraitFreePromotion(playerID, unitID)
	local promotionID = GameInfoTypes["PROMOTION_UC_SEMINOLE"]
	local civilizationID = GameInfoTypes["CIVILIZATION_UC_SEMINOLE"]
    local pPlayer = Players[playerID]
    if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
        local unit = pPlayer:GetUnitByID(unitID)
		if unit:GetUnitType() ~= nul then
            unit:SetHasPromotion(promotionID, true)
        end
    end
end
LuaEvents.SerialEventUnitCreatedGood.Add(SeminoleTraitFreePromotion)

function IncaTraitFreePromotion(playerID, unitID)
	local promotionID = GameInfoTypes["PROMOTION_CAN_CROSS_MOUNTAINS"]
	local civilizationID = GameInfoTypes["CIVILIZATION_INCA"]
    local pPlayer = Players[playerID]
    if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
        local unit = pPlayer:GetUnitByID(unitID)
		if unit:GetUnitType() ~= nul then
            unit:SetHasPromotion(promotionID, true)
        end
    end
end
LuaEvents.SerialEventUnitCreatedGood.Add(IncaTraitFreePromotion)

function ShoshoneTraitFreePromotion(playerID, unitID)
	local promotionID = GameInfoTypes["PROMOTION_GOODY_HUT_PICKER"]
	local civilizationID = GameInfoTypes["CIVILIZATION_SHOSHONE"]
    local pPlayer = Players[playerID]
    if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
        local unit = pPlayer:GetUnitByID(unitID)
		 if unit:GetUnitType() ~= nul then
            unit:SetHasPromotion(promotionID, true)
        end
    end
end
LuaEvents.SerialEventUnitCreatedGood.Add(ShoshoneTraitFreePromotion)
--[[
local bDummy1 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_1;
local bDummy2 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_2;
local bDummy4 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_4;
local bDummy8 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_8;
local bDummy16 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_16;
local bDummy32 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_32;
local bDummy64 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_64;
local bDummy128 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_128;
local bDummy256 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_256;
local bDummy512 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_512;
local bDummy1024 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_1024;
local bDummy2048 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_2048;
local bDummy4096 = GameInfoTypes.BUILDING_UC_SEMINOLE_TOURISM_4096;

function toBits(num)
    -- returns a table of bits, least significant first.
	t={} -- will contain the bits
    while num>0 do
        local rest=math.fmod(num,2)
        t[#t+1]=rest
        num=(num-rest)/2
    end
    return t
end

function SeminoleTourism(playerID)
	local pPlayer = Players[playerID];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == seminoleID) then
		if (not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_REFRIGERATION))	then return true, false end
		if pPlayer:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_UC_SEMINOLE_CANCEL) < 1 then
         for city in pPlayer:Cities() do
		 if city:IsCapital() then
		 local num = load(pPlayer, "SeminoleCulture")
						toBits(num)
				city:SetNumRealBuilding(bDummy1, t[1]);
				city:SetNumRealBuilding(bDummy2, t[2]);
				city:SetNumRealBuilding(bDummy4, t[3]);
				city:SetNumRealBuilding(bDummy8, t[4]);
				city:SetNumRealBuilding(bDummy16, t[5]);
				city:SetNumRealBuilding(bDummy32, t[6]);
				city:SetNumRealBuilding(bDummy64, t[7]);
				city:SetNumRealBuilding(bDummy128, t[8]);
				city:SetNumRealBuilding(bDummy256, t[9]);
				city:SetNumRealBuilding(bDummy512, t[10]);
				city:SetNumRealBuilding(bDummy1024, t[11]);
				city:SetNumRealBuilding(bDummy2048, t[12]);
				city:SetNumRealBuilding(bDummy4096, t[13]);
				if load(pPlayer, "SeminoleBomb") == nil then
					save(pPlayer, "SeminoleBomb", 3)
					local bomb = load(pPlayer, "SeminoleBomb")
				if pPlayer:IsHuman() then
					local alertmessage = Locale.ConvertTextKey()
					Events.GameplayAlertMessage()
						end
					end
				end
			end
		end
	end
end
end
if isSeminoleActive then
GameEvents.PlayerDoTurn.Add(SeminoleTourism)
end

function SeminoleCancel(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == seminoleID then
	if (not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_REFRIGERATION))	then return true, false end
		local timer = load(pPlayer, "SeminoleBomb")
		if timer > 0 then
				timerUpdate = timer - 1
				save(pPlayer, "SeminoleBomb", timerUpdate)
				local bomb = load(pPlayer, "SeminoleBomb")
					print("Seminole" .. bomb .. ".")
		elseif timer == 0 then
			print("done")
			 for city in pPlayer:Cities() do
				city:SetNumRealBuilding(bDummy1, 0)
				city:SetNumRealBuilding(bDummy2, 0)
				city:SetNumRealBuilding(bDummy4, 0)
				city:SetNumRealBuilding(bDummy8, 0)
				city:SetNumRealBuilding(bDummy16, 0)
				city:SetNumRealBuilding(bDummy32, 0)
				city:SetNumRealBuilding(bDummy64, 0)
				city:SetNumRealBuilding(bDummy128, 0)
				city:SetNumRealBuilding(bDummy256, 0)
				city:SetNumRealBuilding(bDummy512, 0)
				city:SetNumRealBuilding(bDummy1024, 0)
				city:SetNumRealBuilding(bDummy2048, 0)
				city:SetNumRealBuilding(bDummy4096, 0)
				city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_SEMINOLE_CANCEL, 1)
				print("success")
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(SeminoleCancel)

--]]
