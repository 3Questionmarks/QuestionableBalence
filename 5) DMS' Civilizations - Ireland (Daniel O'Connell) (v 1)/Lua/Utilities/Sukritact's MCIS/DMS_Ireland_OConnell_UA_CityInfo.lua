-- DMS_Ireland_OConnell_UA_CityInfo
-- Author: DMS
--==========================================================================================================================
-- UTILITY FUNCTIONS	
--==========================================================================================================================
include("IconSupport")
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
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationIreland						= GameInfoTypes["CIVILIZATION_DMS_IRELAND_OCONNELL"]
local traitTwillightOfTheGaels					= GameInfoTypes["TRAIT_DMS_TWILIGHT_OF_THE_GAELS"]
local buildingPressureFromGreatWorks			= GameInfoTypes["BUILDING_DMS_PRESSURE_FROM_GREATWORKS"]
local buildingCultureFromPressure				= GameInfoTypes["BUILDING_DMS_CULTURE_FROM_PRESSURE"]
local buildingFaithFromPressure					= GameInfoTypes["BUILDING_DMS_FAITH_FROM_PRESSURE"]
if not(JFD_IsCivilisationActive(civilisationIreland)) then return end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GetForeignReligions
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetForeignReligions(ownReligion)
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
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_OConnell_UA_FaithFromForeignPressure
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_OConnell_UA_FaithFromForeignPressure(city, foreignReligionsPressure)
	local faithBonus = mathCeil(foreignReligionsPressure / 3)
	if faithBonus > 15 then
		faithBonus = 15
	end
	return faithBonus
end
----------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
----------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "DMS_TwilightOfTheGaelsCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "DMS_TwilightOfTheGaelsCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_DMSTwilightOfTheGaels)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_DMSTwilightOfTheGaels)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_DMSTwilightOfTheGaels)
	
	Controls.IconFrame:SetHide(true)
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--==========================================================================================================================
-- CORE FUNCTIONS	
--==========================================================================================================================
isCityScreenOpen = false
g_DMSTwilightOfTheGaelsTipControls = {}
TTManager:GetTypeControlTable("DMSTwilightOfTheGaelsTooltip", g_DMSTwilightOfTheGaelsTipControls)
----------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
----------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)

	if not(instance) then
		instance = Controls
	end

	-- Ensure City Selected
	local activePlayer = Players[Game.GetActivePlayer()]
	local city = UI.GetHeadSelectedCity()
	if not(city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingTwilightOfTheGaels = GameInfo.Buildings[buildingTwilightOfTheGaelsID]
	instance.IconFrame:SetToolTipType("DMSTwilightOfTheGaelsTooltip")
	IconHookup(0, 64, 'DMS_IRELAND_OCONNELL_ATLAS', instance.IconImage)
	
	local faith = city:GetNumRealBuilding(buildingFaithFromPressure)
	local culture = city:GetNumRealBuilding(buildingCultureFromPressure)
	local pressure = city:GetNumRealBuilding(buildingPressureFromGreatWorks)
	
	local titleText = "[COLOR_POSITIVE_TEXT]TWILLIGHT OF THE GAELS[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_MCIS_DMS_TWILIGHT_OF_THE_GAELS", faith, culture, pressure)
	g_DMSTwilightOfTheGaelsTipControls.Heading:SetText(titleText)
	g_DMSTwilightOfTheGaelsTipControls.Body:SetText(helpText)
	g_DMSTwilightOfTheGaelsTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_DMSTwilightOfTheGaels()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_DMSTwilightOfTheGaels)

function SerialEventCityDirty_DMSTwilightOfTheGaels()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_DMSTwilightOfTheGaels)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_DMSTwilightOfTheGaels)
----------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_DMSTwilightOfTheGaels()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_DMSTwilightOfTheGaels)
--==========================================================================================================================
--==========================================================================================================================
