-- MC_Calusa_CoreFunctions.lua
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include("PlotIterators")


--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
-- JFD_IsCivilisationActive
-------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end

if not(JFD_IsCivilisationActive(GameInfoTypes.CIVILIZATION_MC_CALUSA)) then return end
-------------------------------------------------------------------------------------------------------------------------
-- CompileCityID
-------------------------------------------------------------------------------------------------------------------------
function CompileCityID(pCity)
	local iOriginalOwner = pCity:GetOriginalOwner()
	local iTurnFounded = pCity:GetGameTurnFounded ()	--Used to Compile Unique City ID
	local iCityID = ("X" .. pCity:GetX() .. "Y" .. pCity:GetY() .. "P" .. iOriginalOwner .. "T" .. iTurnFounded)
	return iCityID
end
-------------------------------------------------------------------------------------------------------------------------
-- GetRandom
-------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
--=======================================================================================================================
-- River of Grass: Core Function
--=======================================================================================================================
local iCiv = GameInfoTypes.CIVILIZATION_MC_CALUSA
local iMarsh = GameInfoTypes.FEATURE_MARSH
local iUADummy = GameInfoTypes.BUILDING_MC_CALUSA_UA

local iCanalP = GameInfoTypes.POLICY_DECISIONS_CALUSACANAL
local iCanalB = GameInfoTypes.BUILDING_DECISIONS_CALUSACANAL

local tValidFeatures = {}
tValidFeatures[-1] = true
tValidFeatures[GameInfoTypes.FEATURE_FLOOD_PLAINS] = true

function RiverOfGrass(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() ~= iCiv) then return end

	--local iTeam = pPlayer:GetTeam()
	local pPlot = Map.GetPlot(iCityX, iCityY)
	local pCity = pPlot:GetPlotCity()

	pCity:SetNumRealBuilding(iUADummy, 1)
	if pPlayer:HasPolicy(iCanalP) then
		pCity:SetNumRealBuilding(iCanalB, 1)
	end
	
	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if pAdjacentPlot:IsOpenGround() and not(pAdjacentPlot:IsWater()) and tValidFeatures[pAdjacentPlot:GetFeatureType()] and pAdjacentPlot:GetResourceType(-1) == -1 and (pAdjacentPlot:IsFreshWater() or pAdjacentPlot:IsCoastalLand() or pAdjacentPlot:IsRiver()) then
			pAdjacentPlot:SetFeatureType(iMarsh, -1)
		end
	end

end

GameEvents.PlayerCityFounded.Add(RiverOfGrass)

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iCityX, iCityY, iOwner, iPop, bConquest)

	local pPlayer = Players[iOwner]
	if (pPlayer:GetCivilizationType() ~= iCiv) then return end

	local pPlot = Map.GetPlot(iCityX, iCityY)
	local pCity = pPlot:GetPlotCity()

	pCity:SetNumRealBuilding(iUADummy, 1)
	if pPlayer:HasPolicy(iCanalP) then
		pCity:SetNumRealBuilding(iCanalB, 1)
	end

end
)
--=======================================================================================================================
-- Tidal Trap: Core Function
--=======================================================================================================================
-- TidalTrapCheck
-------------------------------------------------------------------------------------------------------------------------
local iTidalTrap 		= GameInfoTypes.BUILDING_MC_TIDALTRAP
local iTidalTrapDummy 	= GameInfoTypes.BUILDING_MC_TIDALTRAP_DUMMY
local iCap = 100

function TidalTrapCheck(pCity)

	local iNumWorkedMarshes = 0

	for iPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
		local pAdjacentPlot = pCity:GetCityIndexPlot(iPlot)
		if (pAdjacentPlot:GetFeatureType() == iMarsh) and (pAdjacentPlot:IsBeingWorked()) then
			iNumWorkedMarshes = iNumWorkedMarshes + 1
		end
	end
	
	local iNumTraps = math.ceil(iNumWorkedMarshes/2)
	if iNumTraps > iCap then iNumTraps = iCap end

	return iNumTraps
end
-------------------------------------------------------------------------------------------------------------------------
-- ResetTidalTrap
-------------------------------------------------------------------------------------------------------------------------
function ResetTidalTrap(pCity)
	pCity:SetNumRealBuilding(iTidalTrapDummy, 0)
	if pCity:IsHasBuilding(iTidalTrap) then
		pCity:SetNumRealBuilding(iTidalTrapDummy, TidalTrapCheck(pCity))
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- PlayerDoTurn_ResetTidalTrap
-------------------------------------------------------------------------------------------------------------------------
function PlayerDoTurn_ResetTidalTrap(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer:HasPolicy(iCanalP) then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iCanalB, 1)
		end
	end

	if ((pPlayer:CountNumBuildings(iTidalTrap) + pPlayer:CountNumBuildings(iTidalTrapDummy)) < 1)  then return end
	
	for pCity in pPlayer:Cities() do
		ResetTidalTrap(pCity)
	end
end
GameEvents.PlayerDoTurn.Add(PlayerDoTurn_ResetTidalTrap)
-------------------------------------------------------------------------------------------------------------------------
-- SerialEventCityInfoDirty_ResetTidalTrap
-------------------------------------------------------------------------------------------------------------------------
function SerialEventCityInfoDirty_ResetTidalTrap()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if not(pPlayer:IsTurnActive()) then	return end
	if ((pPlayer:CountNumBuildings(iTidalTrap) + pPlayer:CountNumBuildings(iTidalTrapDummy)) < 1)  then return end
	
	for pCity in pPlayer:Cities() do
		ResetTidalTrap(pCity)
	end
end
Events.SerialEventCityInfoDirty.Add(SerialEventCityInfoDirty_ResetTidalTrap)
-------------------------------------------------------------------------------------------------------------------------
-- TidalTrap_AddFish
-------------------------------------------------------------------------------------------------------------------------
-- Retrieve all Maritime Resources
local tValidResources = {}
for tRow in GameInfo.Improvement_ResourceTypes() do
	if (tRow.ImprovementType == "IMPROVEMENT_FISHING_BOATS") then
		tValidResources[GameInfoTypes[tRow.ResourceType]] = {}
	end
end

local iFish = GameInfoTypes.RESOURCE_FISH

function TidalTrap_AddFish(iPlayer, iCity, iBuilding)
	if iBuilding ~= iTidalTrap then return end

	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	local pPlot = pCity:Plot()

	local tPlots = {}
	local iNumCoastal = 0

	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if pAdjacentPlot:GetOwner() == -1 or pAdjacentPlot:GetOwner() == iPlayer then

			local iResource = pAdjacentPlot:GetResourceType()
			local iFeature = pAdjacentPlot:GetFeatureType()

			if tValidResources[iResource] then iNumCoastal = iNumCoastal + 1 end
			if iNumCoastal > 1 then return end --Don't bother continuing if there is more than 1 Coastal resource available

			if iFeature == iMarsh and iResource == -1 then
				table.insert(tPlots, pAdjacentPlot)
			end

		end
	end

	if #tPlots > 0 then
		local tRandom = {1,1,2,2,2,3}

		local iRandom = tRandom[GetRandom(1, #tRandom)]
		if iRandom > #tPlots then iRandom = #tPlots end

		for iNum = 1, iRandom do
			local iPlot = GetRandom(1, #tPlots)
			local pPlot = tPlots[iPlot]
			pPlot:SetResourceType(iFish, 1)
			table.remove(tPlots, iPlot)

			if iPlayer == Game.GetActivePlayer() then
				local sResource = Locale.ConvertTextKey("TXT_KEY_RESOURCE_FISH")
				local sCity = pCity:GetName()

				local sTooltip = Locale.ConvertTextKey("TXT_KEY_MISC_YOU_DISCOVERED_RESOURCE", sResource, sCity)
				local sTitle = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_FOUND_RESOURCE", sResource)
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE, sTooltip, sTitle, pPlot:GetX(), pPlot:GetY(), iFish, -1)
			end
			
		end
	end
end
GameEvents.CityConstructed.Add(TidalTrap_AddFish)
--=======================================================================================================================
-- NokaCanoe: Core Function
--=======================================================================================================================
local iPromotion = GameInfoTypes.PROMOTION_MC_CALUSACANOE

function NokaCanoe(iPlayer)
	local pPlayer = Players[iPlayer]
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(iPromotion) then

			local iStrength = GameInfo.Units[pUnit:GetUnitType()].Combat
			local iDelta = 0

			local pPlot = pUnit:GetPlot()
			for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			
				local iNumUnits = pAdjacentPlot:GetNumUnits()
				for iVal = 0,(iNumUnits - 1) do
					local pUnit = pAdjacentPlot:GetUnit(iVal)
					if pUnit:IsHasPromotion(iPromotion) then
						iDelta = iDelta + 1
					end
				end

			end

			iDelta = iDelta * 2
			pUnit:SetBaseCombatStrength(iStrength + iDelta)
			
		end
	end
	
end
GameEvents.PlayerDoTurn.Add(NokaCanoe)
--=======================================================================================================================
-- Double Move through Marsh and negate strength penatly
--=======================================================================================================================
--[[
function MarshPromotion(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
    local player = Players[playerID]
    if player and player:IsAlive() then
        local traitID = GameInfoTypes["TRAIT_MC_CALUSA"]
        if player:GetTraitInfo().Type == traitID then
            local unit = player:GetUnitByID(unitID)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_MC_CALUSA_UA"], true)
        end
    end
end
LuaEvents.SerialEventUnitCreatedGood.Add(MarshPromotion)
--]]
function CalusaTraitFreePromotion(playerID, unitID)
	local promotionID = GameInfoTypes["PROMOTION_MC_CALUSA_UA"]
	local civilizationID = GameInfoTypes["CIVILIZATION_MC_CALUSA"]
    local pPlayer = Players[playerID]
    if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
        local unit = pPlayer:GetUnitByID(unitID)
		if unit:GetUnitType() ~= nul then
            unit:SetHasPromotion(promotionID, true)
        end
    end
end
LuaEvents.SerialEventUnitCreatedGood.Add(CalusaTraitFreePromotion)
