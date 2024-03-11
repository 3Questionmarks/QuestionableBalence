-- JFD_Civs_BelgiumLeopoldII_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetDistance	= Map.GetDistance
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if g_IsCPActive then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
------------------------------------------------------------------------------------------------------------------------
--Player_SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player_SendWorldEvent(player, description, includeHuman)
	print("Sending World Event: ", description)
	local playerTeam = Teams[player:GetTeam()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activeTeamID)) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
-------------------------------------------------------------------------------------------------------------------------
--Player_SendNotification
function Player_SendNotification(player, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local notificationID = NotificationTypes[notificationType]
	local teamID = player:GetTeam()
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	if global then
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	else
		if (not player:IsHuman()) then return end
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	end
end   
-------------------------------------------------------------------------------------------------------------------------
--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
	return g_JFD_GlobalUserSettings_Table[type]
end
------------------------------------------------------------------------------------------------------------------------
--Game_GetRandom
function Game_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game_GetRandom
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationBelgiumLeopoldIIID = GameInfoTypes["CIVILIZATION_JFD_BELGIUM"]
local traitBelgiumLeopoldIIID = GameInfoTypes["TRAIT_JFD_BELGIUM_LEOPOLD_II"]
local buildingChocolaterieID = GameInfoTypes["BUILDING_JFD_CHOCOLATERIE"]
local buildingChocolaterieBuildingClass = GameInfo.Buildings["BUILDING_JFD_CHOCOLATERIE"].BuildingClass
local buildingChocolaterieBuildingClassID = GameInfoTypes[buildingChocolaterieBuildingClass]

local improvementPlantationID = GameInfoTypes["IMPROVEMENT_PLANTATION"]
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
--JFD_BelgiumLeopoldII_SerialEventUnitCreated
local promotionBelgiumLeopoldIIID = GameInfoTypes["PROMOTION_JFD_BELGIUM"]
local function JFD_BelgiumLeopoldII_SerialEventUnitCreated(playerID, unitID)
	local player = Players[playerID]

	--NIHON SHOKHI
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitType() ~= unitSettlerID then return end

	if (not HasTrait(player, traitBelgiumLeopoldIIID)) then return end
	if unit:IsHasPromotion(promotionBelgiumLeopoldIIID) then return end

	unit:SetHasPromotion(promotionBelgiumLeopoldIIID, true)
end
Events.SerialEventUnitCreated.Add(JFD_BelgiumLeopoldII_SerialEventUnitCreated)
--------------------------------------------------------------------------------------------------------------------------
--JFD_BelgiumLeopoldII_PlayerDoTurn
local buildingBelgiumLeopoldIIGoldID = GameInfoTypes["BUILDING_JFD_BELGIUM_LEOPOLD_II_GOLD"]
local yieldGoldID = GameInfoTypes["YIELD_GOLD"]
local function JFD_BelgiumLeopoldII_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--CONGO FREE STATE
	if HasTrait(player, traitBelgiumLeopoldIIID) then
		for city in player:Cities() do
			local numPlantations = 0
			if city ~= playerCapital then
				local plot = g_MapGetPlot(city:GetX(), city:GetY())
				for adjacentPlot in PlotAreaSweepIterator(plot, 5, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if adjacentPlot:IsBeingWorked() and adjacentPlot:GetWorkingCity() == city then
						if adjacentPlot:GetImprovementType() == improvementPlantationID then
							numPlantations = numPlantations + adjacentPlot:GetYield(yieldGoldID)
						end
					end
				end
			end
			city:SetNumRealBuilding(buildingBelgiumLeopoldIIGoldID, numPlantations)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_BelgiumLeopoldII_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--g_Improvement_ResourceTypes_Table
local g_Improvement_ResourceTypes_Table = {}
local g_Improvement_ResourceTypes_Count = 1
for row in DB.Query("SELECT * FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';") do 	
	g_Improvement_ResourceTypes_Table[g_Improvement_ResourceTypes_Count] = row
	g_Improvement_ResourceTypes_Count = g_Improvement_ResourceTypes_Count + 1
end

--JFD_BelgiumLeopoldII_PlayerCityFounded
local prereqTech = GameInfo.Builds["BUILD_PLANTATION"].PrereqTech
local prereqTechID = GameInfoTypes[prereqTech]
local function JFD_BelgiumLeopoldII_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local playerIsHuman = player:IsHuman()
	
	--CONGO FREE STATE
	if (not HasTrait(player, traitBelgiumLeopoldIIID)) then return end
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	--if (not teamTechs:HasTech(prereqTechID)) then return end
	local city = player:GetCityByID(cityID)
	local plot = g_MapGetPlot(plotX, plotY)
	for adjacentPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if (adjacentPlot:GetOwner() == -1 or adjacentPlot:GetOwner() == playerID) and adjacentPlot:GetImprovementType() == -1 then
			local resourceID = adjacentPlot:GetResourceType()
			if resourceID ~= -1 then
				local resourceType = GameInfo.Resources[resourceID].Type
				--g_Improvement_ResourceTypes_Table
				local improvementsTable = g_Improvement_ResourceTypes_Table
				local numImprovements = #improvementsTable
				for index = 1, numImprovements do
					local row = improvementsTable[index]
					if row.ResourceType == resourceType then
						adjacentPlot:SetFeatureType(-1)	
						adjacentPlot:SetImprovementType(improvementPlantationID)	
						adjacentPlot:SetOwner(playerID)	
						if playerIsHuman then
							local hex = ToHexFromGrid(Vector2(adjacentPlot:GetX(), adjacentPlot:GetY()))
							Events.GameplayFX(hex.x, hex.y, -1)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(JFD_BelgiumLeopoldII_PlayerCityFounded)
--------------------------------------------------------------------------------------------------------------------------
--JFD_BelgiumLeopoldII_CityConstructed
local function JFD_BelgiumLeopoldII_CityConstructed(playerID, cityID, buildingID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end

	--CONGO FREE STATE
	if (not isGold) then return end
	if (not HasTrait(player, traitBelgiumLeopoldIIID)) then return end
	local city = player:GetCityByID(cityID)
	local numGAP = player:CalculateGoldRate()
	if numGAP > 0 then
		player:ChangeGoldenAgeProgressMeter(numGAP)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLDEN_AGE]", numGAP))
		end
	end
end
GameEvents.CityConstructed.Add(JFD_BelgiumLeopoldII_CityConstructed)
-------------------------------------------------------------------------------------------------------------------------
--JFD_BelgiumLeopoldII_CityInvestedBuilding
local function JFD_BelgiumLeopoldII_CityInvestedBuilding(playerID, cityID, buildingID, value)
	local player = Players[playerID]
	
	--CONGO FREE STATE
	if (not HasTrait(player, traitBelgiumLeopoldIIID)) then return end
	local city = player:GetCityByID(cityID)
	local numGAP = player:CalculateGoldRate()
	if numGAP > 0 then
		player:ChangeGoldenAgeProgressMeter(numGAP)
		if player:IsHuman() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLDEN_AGE]", numGAP))
		end
	end
end
if g_IsCPActive then
	GameEvents.CityInvestedBuilding.Add(JFD_BelgiumLeopoldII_CityInvestedBuilding)
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_BelgiumLeopoldII_PlayerCanConstruct
local function JFD_BelgiumLeopoldII_PlayerCanConstruct(playerID, buildingID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end

	--CHOCOLATERIE
	if buildingID == buildingChocolaterieID then
		local numPlantatonResources = 0
		local numChocolaterie = player:GetBuildingClassCount(buildingChocolaterieClassID)

		--g_Improvement_ResourceTypes_Table
		local improvementsTable = g_Improvement_ResourceTypes_Table
		local numImprovement_ResourceTypes = #improvementsTable
		for index = 1, numImprovement_ResourceTypes do
			local row = improvementsTable[index]
			local resourceID = GameInfoTypes[row.ResourceType]
			numPlantatonResources = numPlantatonResources + player:GetNumResourceAvailable(resourceID, true)
		end
		
		if numPlantatonResources > numChocolaterie then
			return true
		else
			return false
		end
	end

	return true
end
GameEvents.PlayerCanConstruct.Add(JFD_BelgiumLeopoldII_PlayerCanConstruct)
--==========================================================================================================================
--==========================================================================================================================
