---------------------------------------------------------------------------------------------------------------------------------------
--===================================================================================================================================--
---------------------------------------------------------------------------------------------------------------------------------------
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "CivBhutan";
include("PlotIterators")
---------------------------------------------------------------------------------------------------------------------------------------
--===================================================================================================================================--
---------------------------------------------------------------------------------------------------------------------------------------
local civilizationID 		  = GameInfoTypes["CIVILIZATION_BHUTAN"]
local improvementNormalYield  = GameInfoTypes["IMPROVEMENT_DZONG"]
local improvementDoubledYield = GameInfoTypes["IMPROVEMENT_DZONG2"]
local promotionID 			  = GameInfoTypes["PROMOTION_DAPONBONUS"]
local unitType				  = GameInfoTypes["UNIT_DAPON"]
local faithBuilding			  = GameInfoTypes["BUILDING_BHUTANFAITH"]
local happinessBuilding		  = GameInfoTypes["BUILDING_BHUTANHAPPYHAPPYJOYJOY"]
--===================================================================================================================================--
--UA
--===================================================================================================================================--
function UA(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID then
		local happiness = player:GetExcessHappiness()
		local capital = player:GetCapitalCity()
		if happiness > 0 then
			local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			local faith = 0
			if teamTechs:HasTech(GameInfoTypes["TECH_THEOLOGY"]) then
				faith = math.floor(happiness * 1.00)
			else
				faith = math.floor(happiness * 0.50)
			end
			capital:SetNumRealBuilding(faithBuilding, faith)
		else
			capital:SetNumRealBuilding(faithBuilding, 0)
		end
	end
end
GameEvents.PlayerDoTurn.Add(UA)

function happinessConquer(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	local plot = Map.GetPlot(iX, iY)
	if player:GetCivilizationType() == civilizationID then
		local city = plot:GetPlotCity()
		local numMountains = 0
		for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:IsMountain() then
				numMountains = numMountains + 1
			end
		end
		city:SetNumRealBuilding(happinessBuilding, numMountains)
	end
end
GameEvents.CityCaptureComplete.Add(happinessConquer)

function happinessSettle(playerID, cityX, cityY)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID then
		local plot = Map.GetPlot(cityX, cityY)
		local city = plot:GetPlotCity()
		local numMountains = 0
		for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:IsMountain() then
				numMountains = numMountains + 1
			end
		end
		city:SetNumRealBuilding(happinessBuilding, numMountains)
	end
end
GameEvents.PlayerCityFounded.Add(happinessSettle)	
--===================================================================================================================================--
--UI
--===================================================================================================================================--
function UI_ReplaceBuild(playerID, plotX, plotY, improvementID) 
	local player = Players[playerID]
	if improvementID == improvementNormalYield then
		local plot = Map.GetPlot(plotX, plotY)
		for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:IsMountain() then
				plot:SetImprovementType(improvementDoubledYield)
				break
			end
		end
	end
end
GameEvents.BuildFinished.Add(UI_ReplaceBuild)
--===================================================================================================================================--
--UU
--===================================================================================================================================--
function uu1(playerID)
	local player = Players[playerID]
	local doEet = false
	if load(player, "hadDaponLastTurn") == true then
		doEet = true
		save(player, "hadDaponLastTurn", false)
	end
	if player:GetUnitClassCount(GameInfoTypes["UNITCLASS_ARCHER"]) > 0 or doEet == true then
		local archers = {}
		for unit in player:Units() do
			if unit:IsHasPromotion(promotionID) then
				unit:SetHasPromotion(promotionID, false)
			end
			if unit:GetUnitType() == unitType then
				save(player, "hadDaponLastTurn", true)
				table.insert(archers, unit)
			end
		end
		for key,archer in pairs(archers) do 
			local plot = archer:GetPlot()
			if plot then
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
						local otherUnit = loopPlot:GetUnit(i)
						local range = GameInfo.Units[otherUnit:GetUnitType()].Range
						if otherUnit and otherUnit:GetOwner() == playerID and range > 0 then
							otherUnit:SetHasPromotion(promotionID, true)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(uu1)

function uu2(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	unit:SetHasPromotion(promotionID, false)
	if player:GetUnitClassCount(GameInfoTypes["UNITCLASS_ARCHER"]) > 0 then
		local plot = unit:GetPlot()
		if unit:GetUnitType() == unitType then
			save(player, "hadDaponLastTurn", true)
			if plot then
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
						local otherUnit = loopPlot:GetUnit(i)
						local range = GameInfo.Units[otherUnit:GetUnitType()].Range
						if otherUnit and otherUnit:GetOwner() == playerID and range > 0 then
							otherUnit:SetHasPromotion(promotionID, true)
						end
					end
				end
			end
		else
			local range = GameInfo.Units[unit:GetUnitType()].Range
			if range > 0 then
				if plot then
					for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
							local otherUnit = loopPlot:GetUnit(i)
							if otherUnit and otherUnit:GetOwner() == playerID and otherUnit:GetUnitType() == unitType then
								unit:SetHasPromotion(promotionID, true)
							end
						end
					end
				end
			end
		end
		
	end
end
GameEvents.UnitSetXY.Add(uu2)
---------------------------------------------------------------------------------------------------------------------------------------
--===================================================================================================================================--
---------------------------------------------------------------------------------------------------------------------------------------