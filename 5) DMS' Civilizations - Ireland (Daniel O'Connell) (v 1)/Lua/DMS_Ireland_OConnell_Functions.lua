-- DMS_Ireland_OConnell_Functions
-- Author: DMS
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local bPrintForDebug = DMS_GetUserSetting("DMS_IRELAND_OCONNELL_DEBUGGING_ON") == 1
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local bUserSettingPiety = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
local stringFormat								= string.format
----------------------------------------------------------------------------------------------------------------------------
-- IsCPDLL
----------------------------------------------------------------------------------------------------------------------------
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
-- HasTrait
----------------------------------------------------------------------------------------------------------------------------
function HasTrait(player, traitID)
	if isCPDLL then 
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
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GetMajorityRelgion
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetMajorityRelgion(player)
	local ownReligion = nil
	if isCPDLL and (not bUserSettingPiety) then
		if player.GetOriginalReligionCreatedByPlayer then
			ownReligion = player:GetOriginalReligionCreatedByPlayer()
		else
			ownReligion = player:GetReligionCreatedByPlayer()
		end
	elseif isCPDLL and bUserSettingPiety then 
		if player:HasStateReligion() then
			ownReligion = player:GetStateReligion()
		else
			ownReligion = player:GetCapitalCity():GetReligiousMajority()
		end
	elseif (not isCPDLL) then
		if player:HasCreatedReligion() then
			ownReligion = player:GetReligionCreatedByPlayer()
		elseif player:GetCapitalCity() and player:GetCapitalCity():GetReligiousMajority() ~= -1 then
			ownReligion = player:GetCapitalCity():GetReligiousMajority()
		else
			ownReligion = nil
		end
	end
	return ownReligion
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GetForeignReligions
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetForeignReligions(player, ownReligion)
	local tableForeignReligion = {}
	local i = 1
	for row in GameInfo.Religions() do
		local religion = row.ID
		if (religion ~= -1) and religion ~= ownReligion then
			tableForeignReligion[i] = tableForeignReligion
			i = i + 1
		end
	end
	return tableForeignReligion
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GetForeignReligionsPressure
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetForeignReligionsPressure(city, tableForeignReligion)
	DMS_Print(stringFormat("DMS_GetForeignReligionsPressure: called for city: %s", city:GetName()))
	local foreignPressureTotal = 0
	for _, religion in ipairs(tableForeignReligion) do 
		local foreignPressure = city:GetPressurePerTurn(religion)
		foreignPressureTotal = foreignPressureTotal + foreignPressure
	end
	DMS_Print(stringFormat("DMS_GetForeignReligionsPressure: foreignPressureTotal = %i", foreignPressureTotal))
	return foreignPressureTotal
end
--==========================================================================================================================
-- VARIABLES
--==========================================================================================================================
-- Player and Components
----------------------------------------------------------------------------------------------------------------------------
local Players									= Players
local activePlayerID 							= Game.GetActivePlayer()
local activePlayer 								= Players[activePlayerID]
local activePlayerTeam 							= Teams[Game.GetActiveTeam()]
local civilisationIreland						= GameInfoTypes["CIVILIZATION_DMS_IRELAND_OCONNELL"]
local traitTwillightOfTheGaels					= GameInfoTypes["TRAIT_DMS_TWILIGHT_OF_THE_GAELS"]
local buildingPressureFromGreatWorks			= GameInfoTypes["BUILDING_DMS_PRESSURE_FROM_GREATWORKS"]
local buildingCultureFromPressure				= GameInfoTypes["BUILDING_DMS_CULTURE_FROM_PRESSURE"]
local buildingFaithFromPressure					= GameInfoTypes["BUILDING_DMS_FAITH_FROM_PRESSURE"]
local buildingFraternalLodge					= GameInfoTypes["BUILDING_DMS_FRATERNAL_LODGE"]
local unitDevilsOwn								= GameInfoTypes["UNIT_DMS_DEVILS_OWN"]
local buildingUnitProductionFromPressure		= GameInfoTypes["BUILDING_DMS_UNIT_PRODUCTION_FROM_PRESSURE"]
local promotionDevilsOwnAbility					= GameInfoTypes["PROMOTION_DMS_DEVILS_OWN_ABILITY"]
local promotionDevilsOwnCombatStrength			= GameInfoTypes["PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH"]
local specialistWriter							= GameInfoTypes["SPECIALIST_WRITER"]

local isIrelandCivActive 						= JFD_IsCivilisationActive(civilisationIreland)
local isIrelandActivePlayer 					= activePlayer:GetCivilizationType() == civilisationIreland
if isIrelandCivActive then
	print("The Liberator - Daniel O'Connell - of the Irish people joins in this game!")
end
----------------------------------------------------------------------------------------------------------------------------
-- Math
----------------------------------------------------------------------------------------------------------------------------
local mathCeil 									= math.ceil
----------------------------------------------------------------------------------------------------------------------------
-- GameEvents
----------------------------------------------------------------------------------------------------------------------------
local PlayerDoTurn								= GameEvents.PlayerDoTurn.Add
local CityTrained								= GameEvents.CityTrained.Add
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
-- DMS_Ireland_OConnell_UA_FaithFromForeignPressure
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UA_FaithFromForeignPressure(player, city, foreignReligionsPressure)
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UA_FaithFromForeignPressure: called for city: %s, foreignReligionsPressure: %i", city:GetName(), foreignReligionsPressure))
	local faithBonus = mathCeil(foreignReligionsPressure / 5)
	if faithBonus > 15 then
		faithBonus = 15
	end
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UA_FaithFromForeignPressure: faithBonus: %i", faithBonus))
	--player:ChangeFaith(faithBonus)
	city:SetNumRealBuilding(buildingFaithFromPressure, faithBonus)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UA_CultureFromMajorityReligionPressure
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UA_CultureFromMajorityReligionPressure(city, ownReligion)
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UA_CultureFromMajorityReligionPressure: called for city: %s", city:GetName()))
	local ownPressure = 0
	if ownReligion ~= nil then
		ownPressure = city:GetPressurePerTurn(ownReligion)
	end
	local cultureBonus = mathCeil(ownPressure / 5)
	if cultureBonus > 15 then 
		cultureBonus = 15
	end
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UA_FaithFromForeignPressure: cultureBonus: %i", cultureBonus))
	city:SetNumRealBuilding(buildingCultureFromPressure, cultureBonus)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UA_PressureFromGreatWorks
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UA_PressureFromGreatWorks(city)
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UA_PressureFromGreatWorks: called for city: %s", city:GetName()))
	local numGreatWorks = city:GetNumGreatWorks()
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UA_PressureFromGreatWorks: numGreatWorks: %i", numGreatWorks))
	-- if numGreatWorks == 0 then return end
	city:SetNumRealBuilding(buildingPressureFromGreatWorks, numGreatWorks)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UU_DevilsOwnProductionReset
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UU_DevilsOwnProductionReset(city)
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_DevilsOwnProductionReset: called for city: %s", city:GetName()))
	city:SetNumRealBuilding(buildingUnitProductionFromPressure, 0)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UU_DevilsOwnProductionFromForeignPressure
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UU_DevilsOwnProductionFromForeignPressure(city, foreignReligionsPressure)
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_DevilsOwnProductionFromForeignPressure: called for city: %s, foreignReligionsPressure: %i", city:GetName(), foreignReligionsPressure))
	if not city:IsProductionUnit() then return end
	local unitType = city:GetProductionUnit()
	if unitType ~= unitDevilsOwn then return end
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_DevilsOwnProductionFromForeignPressure: city is training Devil's Own"))
	if foreignReligionsPressure > 75 then 
		foreignReligionsPressure = 75
	end
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_DevilsOwnProductionFromForeignPressure: set bonus production to %i", foreignReligionsPressure))
	city:SetNumRealBuilding(buildingUnitProductionFromPressure, foreignReligionsPressure)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UB_GreatWriterPointsFromCulture
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UB_GreatWriterPointsFromCulture(city)
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UB_GreatWriterPointsFromCulture: called for city: %s", city:GetName()))
	if not city:IsHasBuilding(buildingFraternalLodge) then return end
	local cityCulture = city:GetJONSCulturePerTurn()
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UB_GreatWriterPointsFromCulture: cityCulture: %i", cityCulture))
	if cityCulture == 0 then return end
	city:ChangeSpecialistGreatPersonProgressTimes100(specialistWriter, cityCulture * 100)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UU_CombatStrengthReset
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UU_CombatStrengthReset(unit)
	if unit:IsHasPromotion(promotionDevilsOwnCombatStrength) then
		unit:SetHasPromotion(promotionDevilsOwnCombatStrength, false)
		DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_CombatStrengthReset: called for unit: %s", unit:GetName()))
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength(unit)
	if not unit:IsHasPromotion(promotionDevilsOwnAbility) then return end
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength: called for unit: %s", unit:GetName()))
	local unitLevel = unit:GetLevel()
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength: unitLevel: %i", unitLevel))
	if unitLevel <= 1 then return end
	local unitPlot = unit:GetPlot()
	if unitPlot == nil or unitPlot == -1 then return end
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength: unitPlot: %i, %i", unitPlot:GetX(), unitPlot:GetY()))
	for adjPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		local numUnits = adjPlot:GetNumUnits()
		if numUnits > 0 then
			for i = 0, numUnits do
				local adjUnit = adjPlot:GetUnit(i)
				if adjUnit and adjUnit:GetOwner() == playerID then
					DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength: found unit at plot adjPlot: %i, %i", adjPlot:GetX(), adjPlot:GetY()))
					local adjUnitLevel = adjUnit:GetLevel()
					DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength: adjUnitLevel: %i", adjUnitLevel))
					if adjUnitLevel < unitLevel then
						if not adjUnit:IsHasPromotion(promotionDevilsOwnCombatStrength) then
							adjUnit:SetHasPromotion(promotionDevilsOwnCombatStrength, true)
							DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength: added promotion"))
						end
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UU_ExperienceFromMajorityReligionPressure
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UU_ExperienceFromMajorityReligionPressure(city, unit, ownReligion)
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_ExperienceFromMajorityReligionPressure: called for city: %s", city:GetName()))
	local ownPressure = 0
	if ownReligion ~= nil then
		ownPressure = city:GetPressurePerTurn(ownReligion)
	end
	if ownPressure == 0 then return end
	DMS_Print(stringFormat("DMS_Ireland_OConnell_UU_ExperienceFromMajorityReligionPressure: ownPressure: %i", ownPressure))
	unit:ChangeExperience(mathCeil(ownPressure / 2))
end
--==========================================================================================================================
-- MAIN FUNCTIONS
--==========================================================================================================================
-- DMS_Ireland_OConnell_PlayerDoTurn
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	if not HasTrait(player, traitTwillightOfTheGaels) then return end
	local turn = Game.GetGameTurn()
	DMS_Print(stringFormat("DMS_Ireland_OConnell_PlayerDoTurn: playerID: %i, turn: %i", playerID, turn))
	local ownReligion = DMS_GetMajorityRelgion(player)
	local tableForeignReligion = DMS_GetForeignReligions(player, ownReligion)
	for city in player:Cities() do
		local foreignReligionsPressure = DMS_GetForeignReligionsPressure(city, tableForeignReligion)
		DMS_Ireland_OConnell_UA_FaithFromForeignPressure(player, city, foreignReligionsPressure)
		DMS_Ireland_OConnell_UA_CultureFromMajorityReligionPressure(city, ownReligion)
		DMS_Ireland_OConnell_UA_PressureFromGreatWorks(city)
		DMS_Ireland_OConnell_UU_DevilsOwnProductionReset(city)
		DMS_Ireland_OConnell_UU_DevilsOwnProductionFromForeignPressure(city, foreignReligionsPressure)
		DMS_Ireland_OConnell_UB_GreatWriterPointsFromCulture(city)
	end
	for unit in player:Units() do
		DMS_Ireland_OConnell_UU_CombatStrengthReset(unit)
	end
	for unit in player:Units() do
		DMS_Ireland_OConnell_UU_HighLevelAdjacentCombatStrength(unit)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_CityTrained
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_CityTrained(playerID, cityID, unitID, bGold, bFaithOrCulture)
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	-- if not HasTrait(player, traitTwillightOfTheGaels) then return end
	local city = player:GetCityByID(cityID)
	if city == nil or city == -1 then return end
	local unit = player:GetUnitByID(unitID)
	if unit == nil or unit == -1 then return end
	if unit:GetUnitType() ~= unitDevilsOwn then return end
	DMS_Print(stringFormat("DMS_Ireland_OConnell_CityTrained: playerID: %i, turn: %i, city: %s", playerID, turn, city:GetName()))
	local ownReligion = DMS_GetMajorityRelgion(player)
	if ownReligion == nil then return end
	DMS_Ireland_OConnell_UU_ExperienceFromMajorityReligionPressure(city, unit, ownReligion)
end
--==========================================================================================================================
-- GAMEEVENTS
--==========================================================================================================================
PlayerDoTurn(DMS_Ireland_OConnell_PlayerDoTurn)
CityTrained(DMS_Ireland_OConnell_CityTrained)
--==========================================================================================================================
--==========================================================================================================================