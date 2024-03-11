-- JFD_Scotland_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
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
local activePlayerID		 = Game.GetActivePlayer()
local activePlayer			 = Players[activePlayerID]
local civilizationID 		 = GameInfoTypes["CIVILIZATION_JFD_SCOTLAND"]
local isScotlandCivActive	 = JFD_IsCivilisationActive(civilizationID)
local isScotlandActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_Scotland_CityInfo", ["SortOrder"] = 1})
end
if isScotlandActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_Scotland_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isScotlandActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_JFD_Scotland_TipControls = {}
TTManager:GetTypeControlTable("JFD_Scotland_Tooltip", g_JFD_Scotland_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingbuildingCollegeID = GameInfoTypes["BUILDING_JFD_COLLEGE"]
local buildingbuildingCollegeBonusID = GameInfoTypes["BUILDING_JFD_SCOTTISH_COLLEGE"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_Scotland_Tooltip")
	IconHookup(3, 64, "JFD_SCOTLAND_ATLAS", instance.IconImage)
	if (not city:IsHasBuilding(buildingbuildingCollegeID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	local cityBonus = city:GetNumBuilding(buildingbuildingCollegeBonusID)
	if cityBonus == 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_COLLEGE")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_COLLEGE_CITY_VIEW_HELP", cityBonus*10)
	g_JFD_Scotland_TipControls.Heading:SetText(textDescription)
	g_JFD_Scotland_TipControls.Body:SetText(textHelp)
	g_JFD_Scotland_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
