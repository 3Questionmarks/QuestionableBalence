-- JFD_CarthageDido_Functions
-- Author: JFD
-- DateCreated: 12/4/2015 12:11:31 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local CarthagecivilizationID 	= GameInfoTypes["CIVILIZATION_CARTHAGE"]
--local isCarthageDidoCivActive	= JFD_IsCivilisationActive(civilizationID)
local mathCeil 					= math.ceil
local mathFloor 				= math.floor
if isCarthageDidoCivActive then
	print("Queen Dido is in this game")
end
-- Is this file loading?
print("Dido file loaded")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--function JFD_IsCivilisationActive(civilisationID)
--	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
--		local slotStatus = PreGame.GetSlotStatus(iSlot)
--		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
--			if PreGame.GetCivilization(iSlot) == civilisationID then
--				return true
--			end
--		end
--	end
--	return false
--end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-- Sukritact_PlaceResource
local featureAtollID = GameInfoTypes["FEATURE_ATOLL"]
local featureIceID = GameInfoTypes["FEATURE_ICE"]
local resourceShellFishID = GameInfoTypes["RESOURCE_JFD_SHELLFISH"]
local terrainCoastID = GameInfoTypes["TERRAIN_COAST"]
local terrainOceanID = GameInfoTypes["TERRAIN_OCEAN"]
function Sukritact_PlaceResource(pCity)
    local cityPlot = pCity:Plot()
    local plots = {}
    for loopPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        table.insert(plots, loopPlot)
    end
    for iVal = 1, 1 do
		local isPlaced = false
		while (not(isPlaced)) and #plots > 0 do
			local randomNumber = JFD_GetRandom(1, #plots)
			local plot = plots[randomNumber]
			if (plot:GetTerrainType() == terrainCoastID and (plot:GetFeatureType() ~= featureAtollID and plot:GetFeatureType() ~= featureIceID) and not (plot:IsLake()) and (plot:GetResourceType() == -1)) then
				plot:SetResourceType(resourceShellFishID, 1)
				isPlaced = true
			end
			table.remove(plots, randomNumber)
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
--function JFD_GetUserSetting(type)
--	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
--		return row.Value
--	end
--end
--local userSettingCarthageDidoUA = JFD_GetUserSetting("JFD_CIVILIZATIONS_CARTHAGE_UA") == 1
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- PHOENICIAN HERITAGE
-------------------------------------------------------------------------------------------------------------------------
-- JFD_CarthageDido_Init
local policyCarthageDidoID = GameInfoTypes["POLICY_JFD_DIDO_CARTHAGE"]
function JFD_CarthageDido_Init(player)
	print("Carthage Policy Function Called")
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == CarthagecivilizationID) then
			if (not player:HasPolicy(policyCarthageDidoID)) then
				print("Carthage added Policy")
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyCarthageDidoID, true)
			end
		end
	end
end
--if (isCarthageDidoCivActive and userSettingCarthageDidoUA) then
	--Events.SequenceGameInitComplete.Add(JFD_CarthageDido_Init) 
--end
Events.SequenceGameInitComplete.Add(JFD_CarthageDido_Init) 

-- JFD_CarthageDido_Shellfish
function JFD_CarthageDido_Shellfish(playerID, plotX, plotY)
	print("Shellfish Function Called")
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == CarthagecivilizationID) then
		print("Shellfish Check the player is Carthage true")
		local plot = Map.GetPlot( plotX, plotY)
		local city = plot:GetPlotCity()
		for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if (adjacentPlot:GetOwner() == -1 and (adjacentPlot:GetTerrainType() == terrainCoastID or adjacentPlot:GetTerrainType() == terrainOceanID))  then
				print("Shellfish Claiming Ocean ")
				adjacentPlot:SetOwner(playerID, city:GetID(), true, true)
				adjacentPlot:SetRevealed(player:GetTeam(), true)
			end
		end
		Sukritact_PlaceResource(city)
	end 	
end
--if (isCarthageDidoCivActive and userSettingCarthageDidoUA) then
	--GameEvents.PlayerCityFounded.Add(JFD_CarthageDido_Shellfish)
--end
GameEvents.PlayerCityFounded.Add(JFD_CarthageDido_Shellfish)
--==========================================================================================================================
--==========================================================================================================================