-- JFD_CarthageDido_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
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
-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationID 			= GameInfoTypes["CIVILIZATION_CARTHAGE"]
local isCarthageDidoCivActive	= JFD_IsCivilisationActive(civilizationID)
local isCarthageDidoActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_CarthageDido_CityInfo", ["SortOrder"] = 1})
end
if isCarthageDidoActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_CarthageDido_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isCarthageDidoActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_JFD_CarthageDido_TipControls = {}
TTManager:GetTypeControlTable("JFD_CarthageDido_Tooltip", g_JFD_CarthageDido_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingCarthageDidoID = GameInfoTypes["BUILDING_JFD_DIDO_CARTHAGE"]
local buildingCothonID = GameInfoTypes["BUILDING_JFD_COTHON"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	if (not city:IsHasBuilding(buildingCothonID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_CarthageDido_Tooltip")
	IconHookup(1, 64, "JFD_CARTHAGE_DIDO_ATLAS", instance.IconImage)
	local defenseBonus = city:GetNumBuilding(buildingCarthageDidoID)
	if defenseBonus == 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_COTHON")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_COTHON_CITY_VIEW_HELP", defenseBonus)
	g_JFD_CarthageDido_TipControls.Heading:SetText(textDescription)
	g_JFD_CarthageDido_TipControls.Body:SetText(textHelp)
	g_JFD_CarthageDido_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
