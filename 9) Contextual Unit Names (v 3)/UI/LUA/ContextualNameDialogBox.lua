-- ContextualNameSettingsDialogBox
-- Author: astog
-- DateCreated: 7/17/2015 8:25:03 PM
--------------------------------------------------------------

--include ("NamingScript.lua")
include ("NameSettings.lua");
include ("IconSupport");

print("Contextual Dialog File loaded")

-- Hide dialog by default.
ContextPtr:SetHide(true);

-- To do list:
-- 1. Get name of era's from table, rather than hard-coded
-- 2. Dynamic Era Preset Pickers?

--==========================================================================================
-- Variables
--==========================================================================================

local numberSetting, combatClassSetting, contextSetting, arrangementSetting, connectorSetting	= 	getNameVaraibles()

local nameUnitNumber		= getNameUnitNumber()
local nameCombatClass		= getNameUnitCombatClass()
local nameContext			= getNameUnitContext()
local nameArrangement		= getNameArrangement()
local nameFirstConnector	= getNameFirstConnector()
local nameSecondConnector 	= getNameSecondConnector()

-- Presets
local presetDefines 		= getPresetDefines()
local overallPresetDefines	= getOverallPresetDefines()
local overallPreset 		= getOverallPreset()
local isCompatabilityMode 	= getIsCompatabilityMode()
local compatabilityPreset 	= getCompatabilityPreset()
--local currentPreset 		= getCurrentPreset()
--Era Preset
local ancientEraPreset		= getAncientEraPresetSetting()
local classicalEraPreset	= getClassicalEraPresetSetting()
local medievalEraPreset		= getMedievalEraPresetSetting()
local renaissanceEraPreset	= getRenaissanceEraPresetSetting()
local industrialEraPreset	= getIndustrialEraPresetSetting()
local modernEraPreset		= getModernEraPresetSetting()
local atomicEraPreset		= getAtomicEraPresetSetting()
local informationEraPreset	= getInformationEraPresetSetting()


-- Getting setting for the range of city check while naming units
local cityCheckRange = getCityCheckRangeSetting()

-- Getting setting as to naming units other than players
local isNamingNonhumanUnits = getIsNonhumanNamingSetting()

-- Is Contextual Naming Units?
local isContextualNamingEnabled = getIsContextualNamingEnabled()

----------------------------------------------------------------------
-- Extra Variables. Only used here, and not part of settings.lua
----------------------------------------------------------------------

local arrangementNameUnitNumber		= 0

local arrangementNameCombatClass	= 0

local arrangementNameContext		= 0

local showFutureUnits				= false

local showUntrainableUnits			= false 

local currentUnit					= nil

local unitList						= {}

local exitPanelOriginalOffsetY		= Controls.ContextualExitPanel:GetOffsetY()

local mainPanelSizeY				= Controls.ContextualMainPanel:GetSizeY() - Controls.ContextualMainPanel:GetOffsetY()

local nameSettingsValid				= false

local customPresetIndex 			= 0

local totalCustomPresets 			= 8

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Normal Panel Start ============================================================================================================================================
------------------------------------------------------------------------------------------------------------------------------------------------------------------


--==========================================================================================
-- Main Functions
--==========================================================================================



-- Refreshes the name, Note: Uses global varaibles
function refreshName()

	-- Check if contextualNaming is enabled
	if not isContextualNamingEnabled then
		if currentUnit and currentUnit.Description then
			Controls.UnitNamePreview:LocalizeAndSetText(currentUnit.Description)
		else
			Controls.UnitNamePreview:LocalizeAndSetText("TXT_KEY_CONTEXTUAL_UNIT_NAME_DEFAULT")
		end

		return
	end

	nameSettingsValid = false

	if(checkArrangementValidity()) then
		nameArrangement = getArrangementSetting()

		local preTech
		local preTechEraID

		-- Get Current Unit's PreReq Era. Don't run this if editing a custom Preset, so that settings don't get overwritten
		if customPresetIndex == 0 and currentUnit then
			if currentUnit.PrereqTech then
				preTech = GameInfo.Technologies[currentUnit.PrereqTech];
			else
				-- Using first tech availabe in tech table.
				preTech = GameInfo.Technologies[0]
			end
			
			if preTech and preTech.Era then

				preTechEraID = GameInfo.Eras[preTech.Era].ID;
				applySettingsBasedOnEra(preTechEraID)
			else
				print("refreshName: Problem with preTech")
			end
		else
			print("refreshName: Problem with currentUnit")
		end
		
		local newName = getName()

		if newName then
			Controls.UnitNamePreview:SetText(newName)

			-- Set tooltip
			if(nameContext == contextSetting.CITY.ID) then
				Controls.UnitNamePreview:LocalizeAndSetToolTip("TXT_KEY_UNIT_NAME_WARNING")
			else
				Controls.UnitNamePreview:LocalizeAndSetToolTip("TXT_KEY_UNIT_NAME_NO_CITY_WARNING")
			end

			nameSettingsValid = true
		else
			-- For some reason this doesnt seam to work...
			print("Could not find a name").
			Controls.UnitNamePreview:LocalizeAndSetText("TXT_KEY_CONTEXTUAL_UNIT_NAME_DEFAULT")

			Controls.UnitNamePreview:LocalizeAndSetToolTip("TXT_KEY_UNIT_NAME_NO_NAME_FOUND")
		end
	else
		Controls.UnitNamePreview:LocalizeAndSetText("TXT_KEY_NAME_ARRANGEMENT_ERROR")
		Controls.UnitNamePreview:LocalizeAndSetToolTip("TXT_KEY_UNIT_NAME_ARRANGEMENT_WARNING")
	end
end

function getName()
	pPlayer = Players[Game.GetActivePlayer()]
	local newName

	-- Getting values for each part of the name
	local numberPart 		= getNameNumber();
	local combatClassPart	= getNameCombatClass(pPlayer, currentUnit);
	local contextPart		= getNameContext(pPlayer);
	local firstConnector, 	
		  secondConnector 	= getConnectors(nameFirstConnector, nameSecondConnector)

	-- Checking name for null values
	if(not checkName(numberPart, nameUnitNumber, combatClassPart, nameCombatClass, contextPart, nameContext)) then 
		return
	end

	----------------------------------------------------------
	-- NUMBER - COMBATCLASS - CONTEXT
	----------------------------------------------------------
	if(nameArrangement == arrangementSetting.NUMBER_COMBATCLASS_CONTEXT) then		
		newName = addNames( numberPart, firstConnector, combatClassPart, secondConnector, contextPart )
	
	----------------------------------------------------------
	-- NUMBER - CONTEXT - COMBATCLASS
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.NUMBER_CONTEXT_COMBATCLASS) then
		newName = addNames( numberPart, firstConnector, contextPart, secondConnector, combatClassPart )

	----------------------------------------------------------
	-- CONTEXT - NUMBER - COMBATCLASS
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.CONTEXT_NUMBER_COMBATCLASS) then		
		newName = addNames( contextPart, firstConnector, numberPart, secondConnector, combatClassPart )
	
	----------------------------------------------------------
	-- CONTEXT - COMBATCLASS - NUMBER
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.CONTEXT_COMBATCLASS_NUMBER) then		
		newName = addNames( contextPart, firstConnector, combatClassPart, secondConnector, numberPart )
	
	----------------------------------------------------------
	-- COMBATCLASS - NUMBER - CONTEXT
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.COMBATCLASS_NUMBER_CONTEXT) then		
		newName = addNames( combatClassPart, firstConnector, numberPart, secondConnector, contextPart )
	
	----------------------------------------------------------
	-- COMBATCLASS - CONTEXT - NUMBER
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.COMBATCLASS_CONTEXT_NUMBER) then		
		newName = addNames( combatClassPart, firstConnector, contextPart, secondConnector, numberPart )
	end

	return newName
end

-- Checks the arrangement validity. Uses global variables
function checkArrangementValidity()
	--print("checkArrangementValidity: Current arrangement values: " .. arrangementNameUnitNumber .. " " .. arrangementNameCombatClass .. " " .. arrangementNameContext)

	-- Check if the values are valid
	if(arrangementNameUnitNumber 	<= 0  or arrangementNameUnitNumber 	> 3) then return false end
	if(arrangementNameCombatClass 	<= 0  or arrangementNameCombatClass > 3) then return false end
	if(arrangementNameContext 		<= 0  or arrangementNameContext 	> 3) then return false end

	-- Just check if the any two values are the same
	if(arrangementNameUnitNumber == arrangementNameCombatClass or 
			arrangementNameCombatClass == arrangementNameContext or
			arrangementNameUnitNumber == arrangementNameContext) then
		return false
	end

	-- If it reaches here, the arrangement values are valid
	return true
end

-- Converts arrangement Settings to NamingSettings.lua understandable value
function getArrangementSetting()
	
	if(checkArrangementValidity()) then
		
		-- Convertion if-statements
		if(arrangementNameUnitNumber == 1) then
			if(arrangementNameCombatClass == 2) then
				return arrangementSetting.NUMBER_COMBATCLASS_CONTEXT
			else
				return arrangementSetting.NUMBER_CONTEXT_COMBATCLASS
			end
		elseif(arrangementNameCombatClass == 1) then
			if(arrangementNameUnitNumber == 2) then
				return arrangementSetting.COMBATCLASS_NUMBER_CONTEXT
			else
				return arrangementSetting.COMBATCLASS_CONTEXT_NUMBER
			end
		else
			if(arrangementNameUnitNumber == 2) then
				return arrangementSetting.CONTEXT_NUMBER_COMBATCLASS
			else
				return arrangementSetting.CONTEXT_COMBATCLASS_NUMBER
			end
		end
	else
		print("getArrangementSetting: Arrangement not valid")
	end
end

-- Builds all the lists and potraits
function initializeDialog()

	local pPlayer = Players[0];	
	local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];

	if leader then
		print("initializeDialog: Leader Found: " .. Locale.ConvertTextKey(leader.Description))
	
		-- Build CIV LEADER Potrair
		IconHookup(leader.PortraitIndex, 128, leader.IconAtlas, Controls.ContextualLeaderPortrait);
	else
		print("Leader not found")
	end

	-- Setting the default layout. 
	-- Hiding main panel
	-- Showing main panel exit buttons
	-- Hiding custom preset exit button (to be safe)
	-- Set customPresetIndex = 0
	-- Setting Custom Preset to 0
	
		hideMainPanel()
		showMainPanelExitButtons()
		hideCustomNameExitButtons()
		customPresetIndex = 0
		Controls.CustomPresetList:GetButton():SetText(getDescriptionPreset(0))

	buildOverallPresetList();
	buildCustomPresetList();
	buildUnitList();
	--updateUnitPotrait();
	buildNameUnitNumberList();
	buildNameUnitCombatClassList();
	buildNameUnitContextList();
	buildFirstConnectorList();
	buildSecondConnectorList();

	initializeArrangement();

	-- Displaying default values
	currentUnit = unitList[1]

	-- This basically sets initial values for current unit and potrait
	if currentUnit then
		onUnitSelected(currentUnit.ID)
		print("initializeDialog: Unit Initialized: " .. currentUnit.Description)
	else
		print("initializeDialog: Current Unit Empty")
	end
end

-- Initializes Arrangement Buttons based on the current global value of nameArrangement
function initializeArrangement()
	----------------------------------------------------------
	-- NUMBER - COMBATCLASS - CONTEXT
	----------------------------------------------------------
	if(nameArrangement == arrangementSetting.NUMBER_COMBATCLASS_CONTEXT) then		
		Controls.FirstUnitNumber:SetCheck(true);
		arrangementNameUnitNumber = 1
		Controls.SecondUnitCombatClass:SetCheck(true);
		arrangementNameCombatClass = 2
		Controls.ThirdUnitContext:SetCheck(true);
		arrangementNameContext = 3
	
	----------------------------------------------------------
	-- NUMBER - CONTEXT - COMBATCLASS
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.NUMBER_CONTEXT_COMBATCLASS) then
		Controls.FirstUnitNumber:SetCheck(true);
		arrangementNameUnitNumber = 1
		Controls.SecondUnitContext:SetCheck(true);
		arrangementNameContext = 2
		Controls.ThirdUnitCombatClass:SetCheck(true);
		arrangementNameCombatClass = 3
	----------------------------------------------------------
	-- CONTEXT - NUMBER - COMBATCLASS
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.CONTEXT_NUMBER_COMBATCLASS) then		
		Controls.FirstUnitContext:SetCheck(true);
		arrangementNameContext = 1
		Controls.SecondUnitNumber:SetCheck(true);
		arrangementNameUnitNumber = 2
		Controls.ThirdUnitCombatClass:SetCheck(true);
		arrangementNameCombatClass = 3	
	----------------------------------------------------------
	-- CONTEXT - COMBATCLASS - NUMBER
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.CONTEXT_COMBATCLASS_NUMBER) then		
		Controls.FirstUnitContext:SetCheck(true);
		arrangementNameContext = 1
		Controls.SecondUnitCombatClass:SetCheck(true);
		arrangementNameCombatClass = 2
		Controls.ThirdUnitNumber:SetCheck(true);
		arrangementNameUnitNumber = 3	
	----------------------------------------------------------
	-- COMBATCLASS - NUMBER - CONTEXT
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.COMBATCLASS_NUMBER_CONTEXT) then		
		Controls.FirstUnitCombatClass:SetCheck(true);
		arrangementNameCombatClass = 1
		Controls.SecondUnitNumber:SetCheck(true);
		arrangementNameUnitNumber = 2
		Controls.ThirdUnitContext:SetCheck(true);
		arrangementNameContext = 3	
	----------------------------------------------------------
	-- COMBATCLASS - CONTEXT - NUMBER
	----------------------------------------------------------
	elseif(nameArrangement == arrangementSetting.COMBATCLASS_CONTEXT_NUMBER) then		
		Controls.FirstUnitCombatClass:SetCheck(true);
		arrangementNameCombatClass = 1
		Controls.SecondUnitContext:SetCheck(true);
		arrangementNameContext = 2
		Controls.ThirdUnitNumber:SetCheck(true);
		arrangementNameUnitNumber = 3	
	else
		print("getName: Arrangement Setting unknown")
	end
end

-- Applies the user setting into NameSettings.lua
function applyUserSettings()
	if nameSettingsValid then
		print("applyUserSettings: Applying Name Settings")

		-- Check if using Custom Preset
		-- if currentPreset == presetDefines.CUSTOM.ID then
		-- 	print("applyUserSettings: User has Custom Preset. Saving existing values...")
		-- 	-- Saving current setting into memory to be used later
		-- 	setCustomPresetNumber			(1, nameUnitNumber);
		-- 	setCustomPresetCombatClass		(1, nameCombatClass);
		-- 	setCustomPresetContext			(1, nameContext);
		-- 	setCustomPresetArrangement		(1, nameArrangement);
		-- 	setCustomPresetFirstConnector	(1, nameFirstConnector);
		-- 	setCustomPresetSecondConnector	(1, nameSecondConnector);
		-- 	print("applyUserSettings: Saved")
		-- end
		setIsContextualNamingEnabled	( isContextualNamingEnabled )
		setOverallPreset 				( overallPreset )
		
		-- Apply Era Presets
		setAncientEraPresetSetting		( ancientEraPreset )
		setClassicalEraPresetSetting	( classicalEraPreset )
		setMedievalEraPresetSetting		( medievalEraPreset )
		setRenaissanceEraPresetSetting	( renaissanceEraPreset )
		setIndustrialEraPresetSetting	( industrialEraPreset )
		setModernEraPresetSetting		( modernEraPreset )
		setAtomicEraPresetSetting		( atomicEraPreset )
		setInformationEraPresetSetting	( informationEraPreset )

		-- Name Setting File
		-- setNameUnitNumber 			(nameUnitNumber)
		-- setNameUnitCombatClass 		(nameCombatClass)
		-- setNameUnitContext 			(nameContext)
		-- setNameUnitArrangement 		(nameArrangement)
		-- setNameFirstConnector 		(nameFirstConnector)
		-- setNameSecondConnector 		(nameSecondConnector)
		-- setIsContextualNamingEnabled (isContextualNamingEnabled)

		-- Advanced Settings
		setCityCheckRange 				( cityCheckRange )
		setIsCompatabilityMode 			( isCompatabilityMode )
		setCompatabilityPreset 			( compatabilityPreset )
		setIsNamingNonhumanUnits		( isNamingNonhumanUnits)



		print("New Settings should be: ")
		printSettings()

	else
		-- Print Error Dialog Box
		print("applyUserSettings: Name was invalid. Not Applying Settings")
	end
end

--==========================================================================================
-- Build Drop Down Lists
--==========================================================================================

-- Builds the Presets List
function buildOverallPresetList()
	if(Controls.OverallPresetList == nil) then
		print("Preset List missing...")
		return
	end	

	local list = {};

	for _, row in pairs(overallPresetDefines) do
		if row then
			table.insert(list, { ID = row.ID, Description = row.Description });
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	-- Clear entries
	Controls.OverallPresetList:ClearEntries()

	for _, row in ipairs(list) do
		local entry = {};
		
		Controls.OverallPresetList:BuildEntry("InstanceOne", entry);
		entry.Button:SetVoid1(row.ID);
		entry.Button:SetText(row.Description);

		local tooltipString = getTooltipOverallPreset(row.ID)

		if tooltipString then
			entry.Button:SetToolTipString(tooltipString)
		else
			print("buildOverallPresetList: Could not find a tooltip")
		end
	end

	print("buildOverallPresetList: Setting initial value")
	print(getDescriptionOverallPreset(overallPreset))

	-- Finish the list
	Controls.OverallPresetList:GetButton():SetText(getDescriptionOverallPreset(overallPreset))

	Controls.OverallPresetList:CalculateInternals()
	Controls.OverallPresetList:RegisterSelectionCallback(onOverallPresetSelect)
end

-- Builds the Custom Preset List
function buildCustomPresetList()
	if(Controls.CustomPresetList == nil) then
		print("Preset List missing...")
		return
	end	

	local list = {};

	-- Add none. This is special to this list only
	table.insert(list, { ID = 0, Description = "None" });

	for _, row in pairs(presetDefines) do
		if row and row.Custom then
			table.insert(list, { ID = row.ID, Description = row.Description });
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	-- Clear entries
	Controls.CustomPresetList:ClearEntries()

	for _, row in ipairs(list) do
		local entry = {};
		
		Controls.CustomPresetList:BuildEntry("InstanceOne", entry);	
		entry.Button:SetVoid1(row.ID);
		entry.Button:SetText(row.Description);

		local tooltipString = getTooltipPreset(row.ID)

		if tooltipString then
			entry.Button:SetToolTipString(tooltipString)
		else
			print("buildCustomPresetList: Could not find a tooltip")
		end
	end

	--Finish the list. Don't select a custom preset
	Controls.CustomPresetList:GetButton():SetText("None")

	Controls.CustomPresetList:CalculateInternals()
	Controls.CustomPresetList:RegisterSelectionCallback(onCustomPresetSelect)
end

-- Builds the Unit List
-- Used General Tso's Really Advanced Setup as reference.
function buildUnitList()

	local units = {}
	local pPlayer = Players[Game.GetActivePlayer()]

	for unit in GameInfo.Units() do
		local addThisUnit = true;

		-- Only add units that will be actually named. 
		if(unit and not unit.CombatClass) then
			addThisUnit = false
		end


		-- Future Unit Check
		if addThisUnit then
			if not showFutureUnits and unit.PrereqTech then
				local preTech = GameInfo.Technologies[unit.PrereqTech];
				if preTech and preTech.Era then

					local currentEraID = pPlayer:GetCurrentEra();
					local preTechEraID = GameInfo.Eras[preTech.Era].ID;


					if currentEraID  and preTechEraID > currentEraID then
						--print("Not Adding this unit. Current Era: " .. currentEraID .. " and PrereqTech Era: " .. preTechEraID)
						addThisUnit = false;
					end
				end
			end
		end

		-- Untrainable Units Check
		if addThisUnit then
			if pPlayer and not pPlayer:CanTrain(unit.ID) then
				if not showUntrainableUnits then
					addThisUnit = false
				end
			end
		end

		if addThisUnit then
			table.insert(units, { ID = unit.ID, description = Locale.ConvertTextKey(unit.Description) });
		end

	end

	table.sort(units, function(a, b) return Locale.Compare(a.description, b.description) == -1; end);

	unitList = units

	Controls.UnitList:ClearEntries()

	for _, unit in ipairs(units) do
		local entry = {};
		
		Controls.UnitList:BuildEntry("InstanceOne", entry);

		entry.Button:SetVoid1(unit.ID);
		entry.Button:LocalizeAndSetText(unit.description);
	end

	Controls.UnitList:GetButton():LocalizeAndSetText("TXT_KEY_UNIT_LIST_CHOOSE")

	Controls.UnitList:CalculateInternals()
	Controls.UnitList:RegisterSelectionCallback(onUnitSelected)
end

-- Updates the Unit Potrait
function updateUnitPotrait(unitID)

	if(unitID == nil or unitID <= 0) then 
		print("Invalid ID for Potrait")
		Controls.PortraitFrame:SetHide(true); 
		return
	end

	local unit = GameInfo.Units[unitID]

	--------------------------------
	-- Update Potrait
	--------------------------------

	if unit ~= nil and IconHookup(unit.PortraitIndex, 256, unit.IconAtlas, Controls.Portrait) then
		print("Update Potrait")
		Controls.PortraitFrame:SetHide(false);
	else
		print("No Potrait Found, hiding...")
		Controls.PortraitFrame:SetHide(true);
	end
end

-- Builds the Unit Number List
function buildNameUnitNumberList()

	if(Controls.UnitNumberSettingPullDown == nil) then
		print("Unit Number List missing...")
		return
	end

	local list = {};

	for _, row in pairs(numberSetting) do

		if row then			
			table.insert(list, { ID = row.ID, Description = row.Description });
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	-- Clear entries
	Controls.UnitNumberSettingPullDown:ClearEntries()
	
	for _, row in ipairs(list) do
		local entry = {};
		
		Controls.UnitNumberSettingPullDown:BuildEntry("InstanceOne", entry);
		entry.Button:SetVoid1(row.ID);
		entry.Button:SetText(row.Description);

		local tooltipString = getTooltipUnitNumber(row.ID)

		if tooltipString then
			entry.Button:SetToolTipString(tooltipString)
		else
			print("buildNameUnitNumberList: Could not find a tooltip")
		end
	end

	-- Finish the list
	Controls.UnitNumberSettingPullDown:GetButton():LocalizeAndSetText(getDescriptionUnitNumber(nameUnitNumber))

	Controls.UnitNumberSettingPullDown:CalculateInternals()
	Controls.UnitNumberSettingPullDown:RegisterSelectionCallback(onNameUnitNumberSelected)
end

-- Builds the Combat Class List
function buildNameUnitCombatClassList()

	if(Controls.UnitCombatClassSettingPullDown == nil) then
		print("Combat Class List missing...")
		return
	end

	local list = {};

	for _, row in pairs(combatClassSetting) do

		if row then
			local entry = {};
		
			Controls.UnitCombatClassSettingPullDown:BuildEntry("InstanceOne", entry);

			-- Because COMBATCLASS has another table within it
			if(row and row == combatClassSetting.COMBATCLASS) then
			
				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						table.insert(list, { ID = nameType.ID, Description = nameType.Description });
					end
				end

			else					
				table.insert(list, { ID = row.ID, Description = row.Description });
			end
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	-- Clear entries
	Controls.UnitCombatClassSettingPullDown:ClearEntries()

	for _, row in ipairs(list) do
		local entry = {};
		
		Controls.UnitCombatClassSettingPullDown:BuildEntry("InstanceOne", entry);
		entry.Button:SetVoid1(row.ID);
		entry.Button:SetText(row.Description);

		local tooltipString = getTooltipUnitCombatClass(row.ID)

		if tooltipString then
			entry.Button:SetToolTipString(tooltipString)
		else
			print("buildNameUnitCombatClassList: Could not find a tooltip")
		end
	end

	-- Finish the list
	Controls.UnitCombatClassSettingPullDown:GetButton():LocalizeAndSetText(getDescriptionUnitCombatClass(nameCombatClass))

	Controls.UnitCombatClassSettingPullDown:CalculateInternals()
	Controls.UnitCombatClassSettingPullDown:RegisterSelectionCallback(onNameUnitCombatClassList)
end

-- Builds the Context List
function buildNameUnitContextList()

	if(Controls.UnitContextSettingPullDown == nil) then
		print("Context List missing...")
		return
	end	

	local list = {};

	for _, row in pairs(contextSetting) do
		if row then
			-- Because CIV has another table within it
			if(row and row == contextSetting.CIV) then
			
				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						table.insert(list, { ID = nameType.ID, Description = nameType.Description });
					end
				end
			-- Because FIXED has another table within it
			elseif(row and row == contextSetting.FIXED) then

				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						table.insert(list, { ID = nameType.ID, Description = nameType.Description });
					end
				end
			else					
				table.insert(list, { ID = row.ID, Description = row.Description });
			end
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	-- Clear entries
	Controls.UnitContextSettingPullDown:ClearEntries()

	for _, row in ipairs(list) do
		local entry = {};
		
		Controls.UnitContextSettingPullDown:BuildEntry("InstanceOne", entry);
		entry.Button:SetVoid1(row.ID);
		entry.Button:SetText(row.Description);

		local tooltipString = getTooltipUnitContext(row.ID)

		if tooltipString then
			entry.Button:SetToolTipString(tooltipString)
		else
			print("buildNameUnitContextList: Could not find a tooltip")
		end
	end

	-- Finish the list
	Controls.UnitContextSettingPullDown:GetButton():SetText(getDescriptionUnitContext(nameContext))

	Controls.UnitContextSettingPullDown:CalculateInternals()
	Controls.UnitContextSettingPullDown:RegisterSelectionCallback(onNameUnitContextList)
end

-- Build First Connector List
function buildFirstConnectorList()

	if(Controls.FirstConnectorPullDown == nil) then
		print("First Connector List missing...")
		return
	end	

	local list = {};

	for _, row in pairs(connectorSetting) do
		if row then
			table.insert(list, { ID = row.ID, Description = row.Description });
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	-- Clear entries
	Controls.FirstConnectorPullDown:ClearEntries()

	for _, row in ipairs(list) do
		local entry = {};
		
		Controls.FirstConnectorPullDown:BuildEntry("InstanceOne", entry);
		entry.Button:SetVoid1(row.ID);
		entry.Button:SetText(row.Description);
	end

	-- Finish the list
	Controls.FirstConnectorPullDown:GetButton():SetText(getDescriptionConnector(nameFirstConnector))

	Controls.FirstConnectorPullDown:CalculateInternals()
	Controls.FirstConnectorPullDown:RegisterSelectionCallback(onFirstConnectorList)
end

-- Build Second Connector List
function buildSecondConnectorList()

	if(Controls.SecondConnectorPullDown == nil) then
		print("Second Connector List missing...")
		return
	end	

	local list = {};

	for _, row in pairs(connectorSetting) do
		if row then
			table.insert(list, { ID = row.ID, Description = row.Description });
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	-- Clear entries
	Controls.SecondConnectorPullDown:ClearEntries()

	for _, row in ipairs(list) do
		local entry = {};
		
		Controls.SecondConnectorPullDown:BuildEntry("InstanceOne", entry);
		entry.Button:SetVoid1(row.ID);
		entry.Button:SetText(row.Description);
	end

	-- Finish the list
	Controls.SecondConnectorPullDown:GetButton():SetText(getDescriptionConnector(nameSecondConnector))

	Controls.SecondConnectorPullDown:CalculateInternals()
	Controls.SecondConnectorPullDown:RegisterSelectionCallback(onSecondConnectorList)
end


--==========================================================================================
-- Handling Button Functions
--==========================================================================================

---------------------------------------------------
-- Top Panel
---------------------------------------------------

function hidePresets()

	print("Hiding Presets...")	

	Controls.OverallPresetListLabel	:SetHide( true )
	Controls.OverallPresetList		:SetHide( true )
	Controls.CustomPresetListLabel	:SetHide( true )
	Controls.CustomPresetList		:SetHide( true )
end

function showPresets()

	print("Showing Presets...")

	Controls.OverallPresetListLabel	:SetHide( false )
	Controls.OverallPresetList		:SetHide( false )
	Controls.CustomPresetListLabel	:SetHide( false )
	Controls.CustomPresetList		:SetHide( false )
end

function onEnableButton(value)
	isContextualNamingEnabled = value

	if value then
		
		-- Enabled, so display presets
		showPresets()

		if customPresetIndex ~= 0 then
			-- Dialog opened with custom preset. Display main panel
			showMainPanel()
		else
			hideMainPanel()
		end
	else
		-- Not enabled, so hide the presets
		hidePresets()
	end

	refreshName()
end
Controls.EnableButton:RegisterCheckHandler(onEnableButton)
Controls.EnableButton:SetCheck(isContextualNamingEnabled);

function onOverallPresetSelect(value)
	overallPreset = value
	Controls.OverallPresetList:GetButton():SetText(getDescriptionOverallPreset(value))
	applyOverallPreset()
	refreshName()

	-- Hide Name Customization
	hideMainPanel()
	customPresetIndex = 0
	Controls.CustomPresetList:GetButton():SetText(getDescriptionPreset(0))
end

function onCustomPresetSelect(value)
	customPresetIndex = getCustomPresetIndexFromID(value)

	if customPresetIndex ~= 0 then
		
		-- Show Name Customization
		showMainPanel()

		-- Hide Main Panel Exit Button
		hideMainPanelExitButtons()

		-- Show Custom Name Preset Exit Buttons
		showCustomNameExitButtons()

	else

		-- Hide Name Customization
		hideMainPanel()

		-- Show Main Panel Exit Buttons
		showMainPanelExitButtons()

		-- Hide Custom Name Preset Exit Buttons
		hideCustomNameExitButtons()

	end
	Controls.CustomPresetList:GetButton():LocalizeAndSetText(getDescriptionPreset(value))

	-- Apply Custom Preset Values
	nameUnitNumber 	= getCustomPresetNumber(customPresetIndex)
	nameCombatClass = getCustomPresetCombatClass(customPresetIndex)
	nameContext 	= getCustomPresetContext(customPresetIndex)
	nameArrangement = getCustomPresetArrangement(customPresetIndex)

	-- Refresh Main Panel, so that the setting shown are correct
	refreshMainPanel()
	refreshName()

	print("onCustomPresetSelect: User Editing Custom Preset No: " .. customPresetIndex)
end

-- Handle the Show Future Units Checkbox
function onShowFutureUnits(value)
	showFutureUnits = value;
	buildUnitList();
	updateUnitPotrait();
end
Controls.UnitListShowFutureUnits:RegisterCheckHandler(onShowFutureUnits)
Controls.UnitListShowFutureUnits:SetCheck(showFutureUnits);

-- Handle the Show Un-Trainable Units Checkbox
function onShowUntrainableUnits(value)
	showUntrainableUnits = value;	
	buildUnitList();
	updateUnitPotrait();
end
Controls.UnitListShowUntrainableUnits:RegisterCheckHandler(onShowUntrainableUnits)
Controls.UnitListShowUntrainableUnits:SetCheck(showUntrainableUnits);

-- Handle the selection of an entry from units drop-down list
function onUnitSelected(unitID)

	local unit = GameInfo.Units[unitID]
	Controls.UnitList:GetButton():LocalizeAndSetText(unit.Description)
	currentUnit = unit
	updateUnitPotrait(unit.ID)
	refreshName()
end

----------------------------------------------------
-- Main Panel
----------------------------------------------------

-- Hides the main panel
function hideMainPanel()

	print("Hiding Main Panel...")

	Controls.ContextualMainPanel	:SetHide( true )

	Controls.ContextualExitPanel	:SetOffsetY ( mainPanelSizeY )
end

function showMainPanel()

	print("Showing Main Panel...")

	refreshMainPanel()
	Controls.ContextualMainPanel:SetHide( false )
	Controls.ContextualExitPanel:SetOffsetY ( exitPanelOriginalOffsetY )
end

-- Refreshes the main panel to reflect its current settings
function refreshMainPanel()

	-- Unit Number Settings
	Controls.UnitNumberSettingPullDown:GetButton():LocalizeAndSetText(getDescriptionUnitNumber(nameUnitNumber))

	-- Unit Combat Settings
	Controls.UnitCombatClassSettingPullDown:GetButton():LocalizeAndSetText(getDescriptionUnitCombatClass(nameCombatClass))

	-- Unit  Context Settings
	Controls.UnitContextSettingPullDown:GetButton():SetText(getDescriptionUnitContext(nameContext))

	-- Arrangement Radio Button
	initializeArrangement()
end

-- Unit Number -------------------------------------

-- handle the selection of an entry from name units number drop-down list
function onNameUnitNumberSelected(id)
	if id then
		nameUnitNumber = id;
		print("New Unit Number ID: " .. nameUnitNumber)
		Controls.UnitNumberSettingPullDown:GetButton():SetText(getDescriptionUnitNumber(id))
		refreshName()
	else
		print("Unit Number ID error")
	end
end

-- Arrangement Order Push Buttons
function onFirstUnitNumberSelected()
	arrangementNameUnitNumber = 1;

	refreshName()
end
Controls.FirstUnitNumber:RegisterCallback(Mouse.eLClick, onFirstUnitNumberSelected)

function onSecondUnitNumberSelected()
	arrangementNameUnitNumber = 2;

	refreshName()
end
Controls.SecondUnitNumber:RegisterCallback(Mouse.eLClick, onSecondUnitNumberSelected)

function onThirdUnitNumberSelected()
	arrangementNameUnitNumber = 3;

	refreshName()
end
Controls.ThirdUnitNumber:RegisterCallback(Mouse.eLClick, onThirdUnitNumberSelected)
-- Unit Combat Class ------------------------------

-- handle the selection of an entry from name units combat class drop-down list
function onNameUnitCombatClassList(id)
	if id then
		nameCombatClass = id;
		Controls.UnitCombatClassSettingPullDown:GetButton():SetText(getDescriptionUnitCombatClass(id))
		print("New Unit Combat Class ID: " .. nameCombatClass)
		refreshName()
	else
		print("Unit Combat Class ID error")
	end
end

-- Arrangement Order Push Buttons
function onFirstUnitCombatClassSelected()
	arrangementNameCombatClass = 1;

	refreshName()
end
Controls.FirstUnitCombatClass:RegisterCallback(Mouse.eLClick, onFirstUnitCombatClassSelected)

function onSecondUnitCombatClassSelected()
	arrangementNameCombatClass = 2;

	refreshName()
end
Controls.SecondUnitCombatClass:RegisterCallback(Mouse.eLClick, onSecondUnitCombatClassSelected)

function onThirdUnitCombatClassSelected()
	arrangementNameCombatClass = 3;

	refreshName()
end
Controls.ThirdUnitCombatClass:RegisterCallback(Mouse.eLClick, onThirdUnitCombatClassSelected)

function onFirstConnectorList(ID)
	if ID then
		nameFirstConnector = ID
		Controls.FirstConnectorPullDown:GetButton():SetText(getDescriptionConnector(ID))
		print("New Connector ID: " .. nameFirstConnector)
		refreshName()
	else
		print("First Connector ID Error")
	end
end

-- Unit Context -----------------------------------
-- handle the selection of an entry from name units context drop-down list
function onNameUnitContextList(id)
	if id then
		nameContext = id;
		Controls.UnitContextSettingPullDown:GetButton():SetText(getDescriptionUnitContext(id))
		print("New Unit Context ID: " .. nameContext)
		refreshName()
	else
		print("Unit Combat Class ID error")
	end
end

-- Arrangement Order Push Buttons
function onFirstUnitContextSelected()
	arrangementNameContext = 1;

	refreshName()
end
Controls.FirstUnitContext:RegisterCallback(Mouse.eLClick, onFirstUnitContextSelected)

function onSecondUnitContextSelected()
	arrangementNameContext = 2;

	refreshName()
end
Controls.SecondUnitContext:RegisterCallback(Mouse.eLClick, onSecondUnitContextSelected)

function onThirdUnitContextSelected()
	arrangementNameContext = 3;

	refreshName()
end
Controls.ThirdUnitContext:RegisterCallback(Mouse.eLClick, onThirdUnitContextSelected)

function onSecondConnectorList(ID)
	if ID then
		nameSecondConnector = ID
		Controls.SecondConnectorPullDown:GetButton():SetText(getDescriptionConnector(ID))
		print("New Connector ID: " .. nameSecondConnector)
		refreshName()
	else
		print("Second Connector ID Error")
	end
end

---------------------------------------------------
-- Exit Panel
---------------------------------------------------

function hideMainPanelExitButtons()
	Controls.MainPanelButtons:SetHide( true )
end

function showMainPanelExitButtons()
	Controls.MainPanelButtons:SetHide( false )
end

function hideCustomNameExitButtons()
	Controls.CustomPresetButtons:SetHide( true )
end

function showCustomNameExitButtons()
	Controls.CustomPresetButtons:SetHide( false )
end

function onAdvancedSettingsButton()
	-- Hide Normal Settings Panel
	Controls.CotextualNormalSettingsPanel:SetHide( true )

	-- Show Advanced Settings Panel
	Controls.ContextualAdvancedSettingsPanel:SetHide( false )

	-- Initialize advanced panel
	initializeAdvancedSettingDialog()
end
Controls.AdvancedSettingsButton:RegisterCallback(Mouse.eLClick, onAdvancedSettingsButton)

-- Handle the Close Button
function onCloseButton()
	hideDialog()
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, onCloseButton)

-- Handle the Apply Button
function onApplyButton()

	applyUserSettings()
	hideDialog()
end
Controls.ApplyButton:RegisterCallback(Mouse.eLClick, onApplyButton)

-- Hidden buttons, that only appear when editing a custom preset
-- Cancel button
function onCancelButton()
	
	-- Hide Settings
	hideMainPanel()

	-- Select None in Custom Preset. Using 0 ID
	customPresetIndex = 0
	Controls.CustomPresetList:GetButton():SetText(getDescriptionPreset(0))

	-- Hide Custom Preset Exit Button
	hideCustomNameExitButtons()

	-- Show Main Panel Exit Buttons
	showMainPanelExitButtons()
end
Controls.CancelButton:RegisterCallback(Mouse.eLClick, onCancelButton)

-- Apply Button
function onSaveButton()

	if customPresetIndex == nil or customPresetIndex == 0 then
		print("onSaveButton: Invalid call for save. Check...")
		return
	end
	
	--Now save current values into the custom preset
	print("onSaveButton: Saving Current Values into Custom Preset Index: " .. customPresetIndex)
	setCustomPresetNumber			(customPresetIndex, nameUnitNumber		)
	setCustomPresetCombatClass		(customPresetIndex, nameCombatClass		)
	setCustomPresetContext			(customPresetIndex, nameContext			)
	setCustomPresetArrangement		(customPresetIndex, nameArrangement		)
	setCustomPresetFirstConnector	(customPresetIndex, nameFirstConnector 	)
	setCustomPresetSecondConnector	(customPresetIndex, nameSecondConnector )

	-- Hide Settings
	hideMainPanel()

	-- Select None in Custom Preset. Using 0 ID
	customPresetIndex = 0
	Controls.CustomPresetList:GetButton():SetText(getDescriptionPreset(0))

	-- Hide Custom Preset Exit Button
	hideCustomNameExitButtons()

	-- Show Main Panel Exit Buttons
	showMainPanelExitButtons()	
end
Controls.SaveButton:RegisterCallback(Mouse.eLClick, onSaveButton)

--==========================================================================================
-- Smaller Functions
--==========================================================================================

-- Show function
function showDialog()
	-- Show panel
	ContextPtr:SetHide(false);
	
	-- Make sure normal panel is visible. Main panel's fate is decided in initializeDialog
	Controls.CotextualNormalSettingsPanel:SetHide( false )

	-- Hide Advanced settings
	Controls.ContextualAdvancedSettingsPanel:SetHide( true )

	-- Initialize
	initializeDialog();
end

-- Hide function
function hideDialog()
	ContextPtr:SetHide(true);
end

------------------------------------------------------------------
-- Get Description Functions
------------------------------------------------------------------

-- Returns the description of the Presets
function getDescriptionOverallPreset(ID)
	local string

	for _, row in pairs(overallPresetDefines) do

		if row then
			if row.ID == ID and row.Description then
				string = row.Description
			end
		end
	end

	return string
end

-- Gets description from the unit number ID
function getDescriptionUnitNumber(ID)
	for _, row in pairs(numberSetting) do

		if row then
			if row.ID == ID then
				return row.Description
			end
		end
	end
end

-- Gets the description from the unit combat class ID
function getDescriptionUnitCombatClass(ID)
	for _, row in pairs(combatClassSetting) do

		if row then
			if(row and row == combatClassSetting.COMBATCLASS) then
				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						if nameType.ID == ID then
							return nameType.Description
						end
					end
				end
			elseif row.ID == ID then
				return row.Description
			end
		end
	end
end

-- Gets the description from the unit context ID
function getDescriptionUnitContext(ID)
	for _, row in pairs(contextSetting) do

		if row then
			-- Because COMBATCLASS has another table within it
			if(row and row == contextSetting.CIV) then
			
				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						if nameType.ID == ID then
							return nameType.Description
						end
					end
				end
			elseif(row and row == contextSetting.FIXED) then

				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						if nameType.ID == ID then
							return nameType.Description
						end
					end
				end
			elseif row.ID == ID then
				return row.Description
			end			
		end
	end
end

-- Returns the description of the Connector ID
function getDescriptionConnector(ID)
	for _, row in pairs(connectorSetting) do

		if row then
			if row.ID == ID then
				return row.Description
			end
		end
	end
end

-----------------------------------------------------------------
-- Get Tooltip Functions. Note: Some tooltip are in TXT_KEY. Refer to settings file
-----------------------------------------------------------------

-- Returns the tooltip for the Presets
function getTooltipOverallPreset(ID)
	local string

	for _, row in pairs(overallPresetDefines) do

		if row then
			if row.ID == ID and row.Tooltip then
				string = row.Tooltip
			end
		end
	end

	return string
end

-- Returns the Tooltip string from the ID
function getTooltipUnitNumber(ID)
	local string

	for _, row in pairs(numberSetting) do

		if row then
			if row.ID == ID then
				string = Locale.ConvertTextKey(row.Tooltip)
			end
		end
	end

	return string
end

-- Returns the tooltip string from the ID
function getTooltipUnitCombatClass(ID)
	local string

	for _, row in pairs(combatClassSetting) do

		if row then
			if(row and row == combatClassSetting.COMBATCLASS) then
				string = row.Tooltip
				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						if nameType.ID == ID then
							-- Note: The order of names should match exactly to that in TXT_KEY
							string = Locale.ConvertTextKey(string, 	nameType.UNITCOMBAT_RECON,
																	nameType.UNITCOMBAT_ARCHER,
																	nameType.UNITCOMBAT_SIEGE,
																	nameType.UNITCOMBAT_MOUNTED,
																	nameType.UNITCOMBAT_MELEE,
																	nameType.UNITCOMBAT_GUN,
																	nameType.UNITCOMBAT_ARMOR,
																	nameType.UNITCOMBAT_NAVALMELEE,
																	nameType.UNITCOMBAT_NAVALRANGED,
																	nameType.UNITCOMBAT_SUBMARINE,
																	nameType.UNITCOMBAT_CARRIER,
																	nameType.UNITCOMBAT_FIGHTER,
																	nameType.UNITCOMBAT_BOMBER,																	
																	nameType.UNITCOMBAT_NAVAL,																	
																	nameType.UNITCOMBAT_HELICOPTER)
							return string
						end
					end
				end
			elseif row.ID == ID then
				string = Locale.ConvertTextKey(row.Tooltip)
				return string
			end
		end
	end

	return string
end

-- Returns the tooltip string from the ID
function getTooltipUnitContext(ID)
	local string

	for _, row in pairs(contextSetting) do

		if row then
			-- Because COMBATCLASS has another table within it
			if(row and row == contextSetting.CIV) then
			
				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						if nameType.ID == ID then
							string = Locale.ConvertTextKey(nameType.Tooltip)
						end
					end
				end
			elseif(row and row == contextSetting.FIXED) then

				for _, nameType in pairs(row) do
					
					if (nameType and type(nameType) == "table" ) then
						if nameType.ID == ID then
							string = Locale.ConvertTextKey(nameType.Tooltip)
						end
					end
				end
			elseif row.ID == ID then
				string = Locale.ConvertTextKey(row.Tooltip)
			end			
		end
	end

	return string
end 

-- Returns random name of a city built by the player
function getRandomCityName(pPlayer)
	local cities = {};

	for City in pPlayer:Cities() do
		table.insert(cities, { Name = City:GetName()} )
	end

	if cities == nil then 
		print("getRandomCityName: City list empty. Returning...")
		return
	end

	local size = tablelength(cities)

	if size > 0 then
		--print("getRandomCityName: City List has names")
		local index = rand(1, size)
		--print("getRandomCityName: Index: " .. index)
		if index and cities[index] then
			--print("getRandomCityName: City Name: " .. cities[index].Name)
			return cities[index].Name
		else
			print("getRandomCityName: Couldnt find a city...")
			-- What to do?
		end
	else
		print("getRandomCityName: City List empty")
	end 
end

-- Returns a random unit (table entry) from the unitList
function getRandomUnit()
	if unitList then
		-- local index = rand(1, tablelength(unitList))
		-- if unitList[index] then
		-- 	print("getRandomUnit: Index = " .. index " and Unit Type = " .. unitList[index].Type)
		-- 	return unitList[index]
		-- else
		-- 	print("getRandomUnit: Unit from UnitList is empty")
		-- 	return
		-- end		

		print("getRandomUnit: Unit Type: " .. unitList[1].description)
		return unitList[1]
	else
		print("getRandomUnit: Unit List empty")
	end
end

-- Naming Function --------------------------------------------------------------

-- Return the number part of the name. Slightly different from NamingScript.lua
function getNameNumber()
	local num

	if(nameUnitNumber == numberSetting.NONE.ID) then
		--print("getNumber: No Number to return...")
		return
	elseif(nameUnitNumber == numberSetting.ROMAN.ID) then
		--print("getNameNumber: Getting Roman Format")
		num = rand(1,30)

		-- NOTE: romanNumber here is a string because covertToRomanNumeral returns a string
		local romanNumber = convertToRomanNumeral(num)

		--print("Original Number: " .. num)
		--print("Roman Numeral: " .. romanNumber)

		return romanNumber
	else
		num = rand(1,30)
		--print("getNumber: Number returning: " .. num)
	end

	local numString = tostring(num)

	-- If the number setting is Dynamic Normal, don't add a suffix
	if(nameUnitNumber == numberSetting.DYNAMIC_BARE.ID) then 
		return numString
	end

	-- We have to check the last digit of the number for the appropriate addition. Valid only for numbers <= 10 or number >= 20
	if(num <= 10 or num >=20) then
		if(num % 10 == 1) then
			numString = numString .. "st"
		elseif(num % 10 == 2) then
			numString = numString .. "nd"
		elseif(num % 10 == 3) then
			numString = numString .. "rd"
		else
			numString = numString .. "th"
		end
	-- All numbers from 10th - 20th, have "th" as a suffix
	else
		numString = numString .. "th"
	end

	return numString
end

-- Returns the combat class part of the name. Slightly different from NamingScript.lua
function getNameCombatClass(pPlayer, unit)
	if unit == nil then
		print("getNameCombatClass: Unit Passed empty")
	end

	
	if(nameCombatClass == combatClassSetting.NONE.ID) then
		--print("getCombatClass: Nothing to return")
		return

	----------------------------------------------------------
	-- UNIT TYPE
	----------------------------------------------------------
	elseif(nameCombatClass == combatClassSetting.UNIT_TYPE.ID) then
		--print("getCombatClass: Will return: " .. Locale.ConvertTextKey(unit.Description))
		return Locale.ConvertTextKey(unit.Description)

	----------------------------------------------------------
	-- COMBATCLASS
	----------------------------------------------------------
	elseif(isCombatClassSettingCombatClass(nameCombatClass)) then
		for i=1, combatClassSetting.COMBATCLASS.END - combatClassSetting.COMBATCLASS.START - 1 do
			if(nameCombatClass == combatClassSetting.COMBATCLASS["TYPE" .. i].ID) then
				local unitClassType = Locale.ConvertTextKey(unit.CombatClass);
				

				--print("getCombatClass: Unit Class found: " .. unitClassType)
				--print("getCombatClass: Will return: " .. combatClassSetting.COMBATCLASS["TYPE" .. i][unitClassType])

				return combatClassSetting.COMBATCLASS["TYPE" .. i][unitClassType]
			end
		end
	end
end

-- Returns the context part of the name. Slightly different from NamingScript.lua
function getNameContext(pPlayer)

	if(nameContext == contextSetting.NONE.ID) then
		--print("getContext: Nothing to return")
		return

	----------------------------------------------------------
	-- CITY
	----------------------------------------------------------
	elseif(nameContext == contextSetting.CITY.ID) then
		local context = getRandomCityName(pPlayer)

		if context then
			--print("getContext: City Name returning: " .. context)
		else
			--print("getContext: Player has no city...")
		end
		return context
	----------------------------------------------------------
	-- CIVILIZATON
	----------------------------------------------------------
	elseif(nameContext == contextSetting.CIV.NORMAL.ID) then		
		--print("getContext: Civ Normal returning " .. pPlayer:GetCivilizationDescription())
		return pPlayer:GetCivilizationShortDescription()
	elseif(nameContext == contextSetting.CIV.ADJECTIVE.ID) then
		--print("getContext: Civ Adjective returning " .. pPlayer:GetCivilizationAdjective())
		return pPlayer:GetCivilizationAdjective()

	----------------------------------------------------------
	-- LEADER
	----------------------------------------------------------
	elseif(nameContext == contextSetting.LEADER.ID) then
		--print("getContext: Leader Context returning " .. pPlayer:GetName())
		return pPlayer:GetName()

	----------------------------------------------------------
	-- FIXED
	----------------------------------------------------------
	elseif(isContextSettingFixed(nameContext)) then
		for i=1, contextSetting.FIXED.END - contextSetting.FIXED.START - 1 do
			if(contextSetting.FIXED["TYPE" .. i].ID == nameContext) then
				--print("getContext: Fixed Context that will be returned: " .. contextSetting.FIXED["TYPE" .. i].VALUE)
				return contextSetting.FIXED["TYPE" .. i].VALUE
			end
		end

	----------------------------------------------------------
	-- GLORY OF ROME
	----------------------------------------------------------
	elseif(nameContext == contextSetting.ROMAN.ID) then
		local romanName = contextSetting.ROMAN.VALUES[rand(1,27)]

		if romanName then 
			return romanName
		elseif contextSetting.ROMAN.VALUES[1] then
			return contextSetting.ROMAN.VALUES[1]
		else
			print("getNameContext: Error finding Legion Title")
		end
	else
		print("getNameContext: Context Setting not understandable")
	end
end

-- Returns the connectors. Identical to the NamingScript.lua
function getConnectors(firstID, secondID)
	local firstConnector, secondConnector

	if firstID and connectorSetting["TYPE" .. firstID] then
		firstConnector = connectorSetting["TYPE" .. firstID].VALUE
	end

	if secondID and connectorSetting["TYPE" .. secondID] then
		secondConnector = connectorSetting["TYPE" .. secondID].VALUE
	end

	return firstConnector, secondConnector
end

-- Checks if different parts of the name are ok, and prints any errors out. Identical to the NamingScript.lua
-- To do: Add connectors here
function checkName(numberPart, numberOption, combatClassPart, combatClassOption, contextPart, contextOption)
	if(not numberPart and numberOption ~= numberSetting.NONE.ID) then
		print("Could not find a Number part for the name. Returning...")
		return false
	end

	if(not combatClassPart and combatClassOption ~= combatClassSetting.NONE.ID) then
		print("Could not find a Combat Class part for the name. Returning...")
		return false
	end

	if(not contextPart and contextOption ~= contextSetting.NONE.ID) then
		print("Could not find a Context part for the name. Returning...")
		return false
	end

	return true
end

-- Adds the different parts of the name properly. Identical to NamingScript.lua
function addNames(part1, connector1, part2, connector2, part3)
	local name = ""

	if part1 then
		name = name .. part1
	end

	if connector1 then
		name = name .. connector1
	end

	if part2 then
		name = name .. part2
	end

	if connector2 then
		name = name .. connector2
	end

	if part3 then
		name = name .. part3
	end

	return name
end

-- Checks if the GLOBAL setting for context is "FIXED" variation. This requires the global variables to be initialized to work
function isContextSettingFixed(setting)
	if(setting > contextSetting.FIXED.START and setting < contextSetting.FIXED.END) then
		--print("Context Setting Fixed")
		return true
	end

	return false
end

-- Checks if the GLOBAL setting for combatClass is "COMBATCLASS" variation. This requires the global variables to be initialized to work
function isCombatClassSettingCombatClass(setting)
	if(setting > combatClassSetting.COMBATCLASS.START and setting < combatClassSetting.COMBATCLASS.END) then
		--print("Combat Class Setting Fixed")
		return true
	end

	return false
end

-- Converts the give number into Roman Numeral. Slightly complicated, uses recursion.
-- It works till 1,000+. Kinda overkill, but why not
function convertToRomanNumeral(num, string)
	
	if num <= 0 then
		-- Recursion breaks here
		return string
	elseif num < 5 then

		-- Handle subtractive notation
		if num >= 4 then
			return convertToRomanNumeral (num - 4,	addToString(string, "IV"))
		else
			return convertToRomanNumeral (num - 1, 	addToString(string, "I"))
		end
	elseif num < 10 then

		-- Handle subtractive notation
		if num >= 9 then
			return convertToRomanNumeral (num - 9,	addToString(string, "IX"))
		else
			return convertToRomanNumeral (num - 5, 	addToString(string, "V"))
		end
	elseif num < 50 then

		-- Handle subtractive notation
		if num >= 40 then
			return convertToRomanNumeral (num - 40,	addToString(string, "XL"))
		else
			return convertToRomanNumeral (num - 10, addToString(string, "X"))
		end
	elseif num < 100 then

		-- Handle subtractive notation
		if num >= 90 then
			return convertToRomanNumeral (num - 90,	addToString(string, "XC"))
		else
			return convertToRomanNumeral (num - 50, addToString(string, "L"))
		end
	elseif num < 500 then

		-- Handle subtractive notation
		if num >= 400 then
			return convertToRomanNumeral (num - 400,addToString(string, "CD"))
		else
			return convertToRomanNumeral (num - 100,addToString(string, "C"))
		end
	elseif num < 1000 then

		-- Handle subtractive notation
		if num >= 900 then
			return convertToRomanNumeral (num - 900,addToString(string, "CM"))
		else
			return convertToRomanNumeral (num - 500,addToString(string, "D"))
		end
	else
		return convertToRomanNumeral (num - 1000,	addToString(string, "M"))
	end
end

-- Applies current preset to the global variables
-- function applyCurrentPreset()
-- 	-- Check if the preset is custom
-- 	if currentPreset == presetDefines.CUSTOM.ID then
-- 		print("applyCurrentPreset: Preset is Custom, checking for save data")
		
-- 		-- If any of save values doesnt exists, apply default values
-- 		if (getCustomPresetNumber(1) 			== nil or
-- 			getCustomPresetCombatClass(1) 		== nil or
-- 			getCustomPresetContext(1) 			== nil or
-- 			getCustomPresetArrangement(1)		== nil or
-- 			getCustomPresetFirstConnector(1)	== nil or
-- 			getCustomPresetSecondConnector(1) 	== nil ) then

-- 			print("applyCurrentPreset: Save values don't exist. Creating one and applying settings...")
-- 			for _, row in pairs(presetDefines) do
-- 				if row.ID and row.ID == currentPreset then

-- 					-- Copy over the values
-- 					nameUnitNumber		= row.VALUES.nameUnitNumber
-- 					nameCombatClass		= row.VALUES.nameCombatClass
-- 					nameContext			= row.VALUES.nameContext
-- 					nameArrangement		= row.VALUES.nameArrangement

-- 					-- Dialog Arrangements
-- 					arrangementNameUnitNumber, arrangementNameCombatClass, arrangementNameContext = getSplitArrangement(nameArrangement)
-- 					--end

-- 					nameFirstConnector	= row.VALUES.nameFirstConnector
-- 					nameSecondConnector	= row.VALUES.nameSecondConnector

-- 					print("applyCurrentPreset: Default Values Copied over")
-- 				end
-- 			end

-- 			setCustomPresetNumber			(1, nameUnitNumber);
-- 			setCustomPresetCombatClass		(1, nameCombatClass);
-- 			setCustomPresetContext			(1, nameContext);
-- 			setCustomPresetArrangement		(1, nameArrangement);
-- 			setCustomPresetFirstConnector	(1, nameFirstConnector);
-- 			setCustomPresetSecondConnector	(1, nameSecondConnector);

-- 			print("applyCurrentPreset: Values saved")
-- 		-- else apply the save settings
-- 		else
-- 			print("applyCurrentPreset: Save Values exist. Reading them...")
-- 			nameUnitNumber		= getCustomPresetNumber(1)
-- 			nameCombatClass		= getCustomPresetCombatClass(1)
-- 			nameContext			= getCustomPresetContext(1)
-- 			nameArrangement		= getCustomPresetArrangement(1)

-- 			-- Dialog Arrangements
-- 			arrangementNameUnitNumber, arrangementNameCombatClass, arrangementNameContext = getSplitArrangement(nameArrangement)
-- 			--end

-- 			nameFirstConnector	= getCustomPresetFirstConnector(1)
-- 			nameSecondConnector	= getCustomPresetSecondConnector(1)
-- 			print("applyCurrentPreset: Loaded save values to current settings")
-- 		end		
-- 	else
-- 		for _, row in pairs(presetDefines) do
-- 			if row.ID and row.ID == currentPreset then

-- 				-- Copy over the values
-- 				nameUnitNumber		= row.VALUES.nameUnitNumber
-- 				nameCombatClass		= row.VALUES.nameCombatClass
-- 				nameContext			= row.VALUES.nameContext
-- 				nameArrangement		= row.VALUES.nameArrangement

-- 				-- Dialog Arrangements
-- 				arrangementNameUnitNumber, arrangementNameCombatClass, arrangementNameContext = getSplitArrangement(nameArrangement)
-- 				--end

-- 				nameFirstConnector	= row.VALUES.nameFirstConnector
-- 				nameSecondConnector	= row.VALUES.nameSecondConnector

-- 				print("applyCurrentPreset: Values Copied over")
-- 			end
-- 		end
-- 	end
-- end

-- Applies the current overall preset
function applyOverallPreset()

	for _, row in pairs(overallPresetDefines) do

		if row and row.ID == overallPreset then
			print("applyOverallPreset: Applying Preset")

			-- Set Local Values
			ancientEraPreset		= row.Preset.AncientEra
			classicalEraPreset		= row.Preset.ClassicalEra
			medievalEraPreset		= row.Preset.MedievalEra
			renaissanceEraPreset	= row.Preset.RenaissanceEra
			industrialEraPreset		= row.Preset.IndustrialEra
			modernEraPreset			= row.Preset.ModernEra
			atomicEraPreset			= row.Preset.AtomicEra
			informationEraPreset	= row.Preset.InformationEra

			-- Set Global Save Values
			setAncientEraPresetSetting 		(ancientEraPreset)
			setClassicalEraPresetSetting 	(classicalEraPreset)
			setMedievalEraPresetSetting 	(medievalEraPreset)
			setRenaissanceEraPresetSetting 	(renaissanceEraPreset)
			setIndustrialEraPresetSetting 	(industrialEraPreset)
			setModernEraPresetSetting 		(modernEraPreset)
			setAtomicEraPresetSetting 		(atomicEraPreset)
			setInformationEraPresetSetting 	(informationEraPreset)

			--Change dropdowns in Advanced settings
			Controls.AncientEraPresetPulldown		:GetButton():SetText( getDescriptionPreset( ancientEraPreset 	 ))
			Controls.ClassicalEraPresetPulldown		:GetButton():SetText( getDescriptionPreset( classicalEraPreset 	 ))
			Controls.MedievalEraPresetPulldown		:GetButton():SetText( getDescriptionPreset( medievalEraPreset 	 ))
			Controls.RenaissanceEraPresetPulldown	:GetButton():SetText( getDescriptionPreset( renaissanceEraPreset ))
			Controls.IndustrialEraPresetPulldown	:GetButton():SetText( getDescriptionPreset( industrialEraPreset  ))
			Controls.ModernEraPresetPulldown		:GetButton():SetText( getDescriptionPreset( modernEraPreset 	 ))
			Controls.AtomicEraPresetPulldown		:GetButton():SetText( getDescriptionPreset( atomicEraPreset 	 ))
			Controls.InformationEraPresetPulldown	:GetButton():SetText( getDescriptionPreset( informationEraPreset ))
		end
	end
end

-- Converts the arrangement into the split setting used in the dialog.
function getSplitArrangement(ID)
	if ID == arrangementSetting.NUMBER_COMBATCLASS_CONTEXT then
		return 1, 2, 3
	elseif ID == arrangementSetting.NUMBER_CONTEXT_COMBATCLASS then
		return 1, 3, 2
	elseif ID == arrangementSetting.CONTEXT_NUMBER_COMBATCLASS then
		return 2, 3, 1
	elseif ID == arrangementSetting.CONTEXT_COMBATCLASS_NUMBER then
		return 3, 2, 1
	elseif ID == arrangementSetting.COMBATCLASS_NUMBER_CONTEXT then
		return 2, 1, 3
	elseif ID == arrangementSetting.COMBATCLASS_CONTEXT_NUMBER then
		return 3, 1, 2
	end	
end

-- Gets the customPresetIndex from the ID
function getCustomPresetIndexFromID(ID)
	if ID == nil then
		print("getCustomPresetIndexFromID: Index passed was nil")
		return
	end

	-- Handle unique row entry
	if ID == 0 then
		return 0;
	end

	for index=1, totalCustomPresets do
		if presetDefines["CUSTOM" .. index].ID == ID then
			return index
		end
	end
end

-- Applies setting based on passed Era Type
function applySettingsBasedOnEra(eraID)
	if eraID == nil then
		print("applySettingsBasedOnEra: Passed eraID is nil")
		return
	end

	local preset;

	if isCompatabilityMode 	then
		print("User in compatability mode")
		preset = getPresetFromID(compatabilityPreset)

	elseif	eraID <= 0 		then
		print("Unit belongs to Ancient Era. Applying relevant settings")
		preset = getPresetFromID(ancientEraPreset)

	elseif 	eraID == 1 		then
		print("Unit belongs to Classical Era. Applying relevant settings")
		preset = getPresetFromID(classicalEraPreset)

	elseif	eraID == 2		then
		print("Unit belongs to Medieval Era. Applying relevant settings")
		preset = getPresetFromID(medievalEraPreset)

	elseif	eraID == 3 		then
		print("Unit belongs to Renaissance Era. Applying relevant settings")
		preset = getPresetFromID(renaissanceEraPreset)

	elseif 	eraID == 4		then
		print("Unit belongs to Industrial Era. Applying relevant settings")
		preset = getPresetFromID(industrialEraPreset)

	elseif 	eraID == 5 		then
		print("Unit belongs to Modern Era. Applying relevant settings")
		preset = getPresetFromID(modernEraPreset)

	elseif 	eraID == 6 		then
		print("Unit belongs to Atomic Era. Applying relevant settings")
		preset = getPresetFromID(atomicEraPreset)

	elseif 	eraID >= 7 		then
		print("Unit belongs to Information Era. Applying relevant settings")
		preset = getPresetFromID(informationEraPreset)

	else
		print("applySettingsBasedOnEra: Can't understand eraID")
	end

	print("applySettingsBasedOnEra: Using preset- " .. preset.Description)

	-- Check if preset is custom

	if preset.Custom then
		local index = getCustomPresetIndexFromID(preset.ID)
		print("applySettingsBasedOnEra: Preset was custom. Accessing save with index: " .. index)
		-- Custom preset. Use SAVE values to apply preset into DIALOG variables
		nameUnitNumber		= getCustomPresetNumber(index)
		nameCombatClass		= getCustomPresetCombatClass(index)
		nameContext			= getCustomPresetContext(index)
		nameArrangement		= getCustomPresetArrangement(index)
		nameFirstConnector	= getCustomPresetFirstConnector(index)
		nameSecondConnector	= getCustomPresetSecondConnector(index)
	else
		-- Not a custom preset. Access values from file
		-- Apply preset values into DIALOG variables
		nameUnitNumber		= preset.VALUES.nameUnitNumber;
		nameCombatClass		= preset.VALUES.nameCombatClass;
		nameContext			= preset.VALUES.nameContext;
		nameArrangement		= preset.VALUES.nameArrangement;
		nameFirstConnector	= preset.VALUES.nameFirstConnector;
		nameSecondConnector	= preset.VALUES.nameSecondConnector;
	end
end

-- Does what it says
function getPresetFromID(ID)
	if ID == nil then
		print("getPresetFromID: ID passed is nil")
	end

	for _, row in pairs(presetDefines) do
		if row.ID == ID then
			return row
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Normal Panel End ==============================================================================================================================================
------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Advanced Settings Panel =======================================================================================================================================
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
-- Initializing / Building Functions
-------------------------------------------------------------------------------------

function initializeAdvancedSettingDialog()
	print("Initializing Advanced Dialog")

	Controls.CityCheckRangeValue:SetText(cityCheckRange)
	Controls.CityCheckRangeSlider:SetValue(cityCheckRange/20)

	if isCompatabilityMode then
		Controls.CompatibilityPresetPulldown: SetHide ( false )
	else
		Controls.CompatibilityPresetPulldown: SetHide ( true )
	end

	buildEraPresetPullDowns()
	buildCompatibilityPreset()
end

-- Be careful, it is massive. That's what she said...
function buildEraPresetPullDowns()
	local list = {};

	for _, row in pairs(presetDefines) do
		if row then
			table.insert(list, { ID = row.ID, Description = row.Description });
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	-- Clear entries
		Controls.AncientEraPresetPulldown:ClearEntries();
		Controls.ClassicalEraPresetPulldown:ClearEntries();
		Controls.MedievalEraPresetPulldown:ClearEntries();
		Controls.RenaissanceEraPresetPulldown:ClearEntries();
		Controls.IndustrialEraPresetPulldown:ClearEntries();
		Controls.ModernEraPresetPulldown:ClearEntries();
		Controls.AtomicEraPresetPulldown:ClearEntries();
		Controls.InformationEraPresetPulldown:ClearEntries();

	for _, row in ipairs(list) do
		local entry1 = {}; local entry2 = {}; local entry3 = {}; local entry4 = {};
		local entry5 = {}; local entry6 = {}; local entry7 = {}; local entry8 = {};
		
		-- Build Entry
			Controls.AncientEraPresetPulldown:BuildEntry("InstanceOne", entry1);
			Controls.ClassicalEraPresetPulldown:BuildEntry("InstanceOne", entry2);
			Controls.MedievalEraPresetPulldown:BuildEntry("InstanceOne", entry3);
			Controls.RenaissanceEraPresetPulldown:BuildEntry("InstanceOne", entry4);
			Controls.IndustrialEraPresetPulldown:BuildEntry("InstanceOne", entry5);
			Controls.ModernEraPresetPulldown:BuildEntry("InstanceOne", entry6);
			Controls.AtomicEraPresetPulldown:BuildEntry("InstanceOne", entry7);
			Controls.InformationEraPresetPulldown:BuildEntry("InstanceOne", entry8);
		
		-- Set return value for each entry
			entry1.Button:SetVoid1(row.ID);
			entry2.Button:SetVoid1(row.ID);
			entry3.Button:SetVoid1(row.ID);
			entry4.Button:SetVoid1(row.ID);
			entry5.Button:SetVoid1(row.ID);
			entry6.Button:SetVoid1(row.ID);
			entry7.Button:SetVoid1(row.ID);
			entry8.Button:SetVoid1(row.ID);

		--Set text for each entry
			entry1.Button:SetText(row.Description);
			entry2.Button:SetText(row.Description);
			entry3.Button:SetText(row.Description);
			entry4.Button:SetText(row.Description);
			entry5.Button:SetText(row.Description);
			entry6.Button:SetText(row.Description);
			entry7.Button:SetText(row.Description);
			entry8.Button:SetText(row.Description);

		local tooltipString = getTooltipPreset(row.ID)

		if tooltipString then
			entry1.Button:SetToolTipString(tooltipString)
			entry2.Button:SetToolTipString(tooltipString)
			entry3.Button:SetToolTipString(tooltipString)
			entry4.Button:SetToolTipString(tooltipString)
			entry5.Button:SetToolTipString(tooltipString)
			entry6.Button:SetToolTipString(tooltipString)
			entry7.Button:SetToolTipString(tooltipString)
			entry8.Button:SetToolTipString(tooltipString)
		else
			print("buildPresetList: Could not find a tooltip")
		end
	end

	-- Preselct current setting
		Controls.AncientEraPresetPulldown		:GetButton():LocalizeAndSetText( getDescriptionPreset( ancientEraPreset 	))
		Controls.ClassicalEraPresetPulldown		:GetButton():LocalizeAndSetText( getDescriptionPreset( classicalEraPreset 	))
		Controls.MedievalEraPresetPulldown		:GetButton():LocalizeAndSetText( getDescriptionPreset( medievalEraPreset 	))
		Controls.RenaissanceEraPresetPulldown	:GetButton():LocalizeAndSetText( getDescriptionPreset( renaissanceEraPreset ))
		Controls.IndustrialEraPresetPulldown	:GetButton():LocalizeAndSetText( getDescriptionPreset( industrialEraPreset 	))
		Controls.ModernEraPresetPulldown		:GetButton():LocalizeAndSetText( getDescriptionPreset( modernEraPreset 		))
		Controls.AtomicEraPresetPulldown		:GetButton():LocalizeAndSetText( getDescriptionPreset( atomicEraPreset 		))
		Controls.InformationEraPresetPulldown	:GetButton():LocalizeAndSetText( getDescriptionPreset( informationEraPreset ))

	-- Recalculate internals
		Controls.AncientEraPresetPulldown		:CalculateInternals()
		Controls.ClassicalEraPresetPulldown		:CalculateInternals()
		Controls.MedievalEraPresetPulldown		:CalculateInternals()
		Controls.RenaissanceEraPresetPulldown	:CalculateInternals()
		Controls.IndustrialEraPresetPulldown	:CalculateInternals()
		Controls.ModernEraPresetPulldown		:CalculateInternals()
		Controls.AtomicEraPresetPulldown		:CalculateInternals()
		Controls.InformationEraPresetPulldown	:CalculateInternals()

	-- On selecting entry defines
		Controls.AncientEraPresetPulldown		:RegisterSelectionCallback( onAncientEraPresetSelect 		)
		Controls.ClassicalEraPresetPulldown		:RegisterSelectionCallback( onClassicalEraPresetSelect 		)
		Controls.MedievalEraPresetPulldown		:RegisterSelectionCallback( onMedievalEraPresetSelect 		)
		Controls.RenaissanceEraPresetPulldown	:RegisterSelectionCallback( onRenaissanceEraPresetSelect 	)
		Controls.IndustrialEraPresetPulldown	:RegisterSelectionCallback( onIndustrialEraPresetSelect 	)
		Controls.ModernEraPresetPulldown		:RegisterSelectionCallback( onModernEraPresetSelect 		)
		Controls.AtomicEraPresetPulldown		:RegisterSelectionCallback( onAtomicEraPresetSelect 		)
		Controls.InformationEraPresetPulldown	:RegisterSelectionCallback( onInformationEraPresetSelect 	)
end

-- Similiar to Era Preset. Wrote it seperately for cleanliness
function buildCompatibilityPreset()
	local list = {};

	for _, row in pairs(presetDefines) do
		if row then
			table.insert(list, { ID = row.ID, Description = row.Description });
		end
	end

	table.sort(list, function(a, b) return Locale.Compare(a.Description, b.Description) == -1; end);

	---------------------------
	-- Build list
	---------------------------

	Controls.CompatibilityPresetPulldown:ClearEntries();

	for _, row in ipairs(list) do
		local entry = {};

		-- Build Entry
		Controls.CompatibilityPresetPulldown:BuildEntry("InstanceOne", entry);

		-- Set return value for each entry
		entry.Button:SetVoid1(row.ID);

		--Set text for each entry
		entry.Button:SetText(row.Description);

		local tooltipString = getTooltipPreset(row.ID)

		if tooltipString then

			entry.Button:SetToolTipString(tooltipString)

		else
			print("buildPresetList: Could not find a tooltip")
		end

		-- Preselct current setting
		Controls.CompatibilityPresetPulldown: GetButton(): LocalizeAndSetText( getDescriptionPreset( compatabilityPreset ))

		-- Recalculate internals
		Controls.CompatibilityPresetPulldown: CalculateInternals()

		-- On selecting entry defines
		Controls.CompatibilityPresetPulldown: RegisterSelectionCallback( onCompatibilityPresetSelect )

	end
end

-- Returns the tooltip for the Presets
function getTooltipPreset(ID)
	-- Handle unique tooltip
	if not ID or ID <= 0 then
		return "Select this to hide all custom name settings";
	end

	local pPlayer = Players[0]
	local string

	local index = 1
	for _, row in pairs(presetDefines) do

		if row then
			if row.ID == ID and not row.Custom then
				string = Locale.ConvertTextKey(row.Tooltip, getDescriptionUnitNumber(row.VALUES.nameUnitNumber), 
															getDescriptionUnitCombatClass(row.VALUES.nameCombatClass), 
															getDescriptionUnitContext(row.VALUES.nameContext),
															getDescriptionConnector(row.VALUES.nameFirstConnector), 
															getDescriptionConnector(row.VALUES.nameSecondConnector))
			elseif row.ID == ID and row.Custom then
				-- Custom preset. Retrieve values from saves
				string = Locale.ConvertTextKey(row.Tooltip, getDescriptionUnitNumber(getCustomPresetNumber(index)), 
															getDescriptionUnitCombatClass(getCustomPresetCombatClass(index)), 
															getDescriptionUnitContext(getCustomPresetContext(index)), 
															getDescriptionConnector(getCustomPresetFirstConnector(index)), 
															getDescriptionConnector(getCustomPresetSecondConnector(index)))
				index = index + 1
			end
		end
	end

	return string
end

-- Returns the description of the Presets
function getDescriptionPreset(ID)
	if ID == nil then
		print("getDescriptionPreset: ID passed is nil")
	end

	-- Handle unique row entry
	if ID == 0 then
		return "None"
	end

	for _, row in pairs(presetDefines) do

		if row then
			if row.ID == ID then
				return row.Description
			end
		end
	end
end

-------------------------------------------------------
-- Button Handling
-------------------------------------------------------

-- CITY CHECK RANGE------------------------------------
function OnCityCheckRangeSliderValueChanged(fValue)
	local cityRange = math.floor(fValue * 20)
	Controls.CityCheckRangeValue:SetText(tostring(cityRange))
	cityCheckRange = cityRange
end
Controls.CityCheckRangeSlider:RegisterSliderCallback(OnCityCheckRangeSliderValueChanged)

function onCityCheckRangeValueChanged(sValue, control, bFire)
	if (bFire) then
		local iValue = tonumber(sValue)
		
		if (iValue < 0) then
			iValue = 0
		elseif (iValue > 20) then
			iValue = 20
		end

		cityCheckRange = iValue
		Controls.CityCheckRangeValue:SetText(cityCheckRange)
		Controls.CityCheckRangeSlider:SetValue(cityCheckRange/20)
	end
end
Controls.CityCheckRangeValue:RegisterCallback(onCityCheckRangeValueChanged)
-- END-------------------------------------------------

-- PRESETS---------------------------------------------

function onAncientEraPresetSelect(ID)
	print("onAncientEraPresetSelect: Preset Changed")
	ancientEraPreset = ID
	Controls.AncientEraPresetPulldown:GetButton():SetText( getDescriptionPreset( ancientEraPreset ))
	-- checkAndApplyEraPresest()
end

function onClassicalEraPresetSelect(ID)
	print("onClassicalEraPresetSelect: Preset Changed")
	classicalEraPreset = ID
	Controls.ClassicalEraPresetPulldown:GetButton():SetText( getDescriptionPreset( classicalEraPreset ))
end

function onMedievalEraPresetSelect(ID)
	print("onMedievalEraPresetSelect: Preset Changed")
	medievalEraPreset = ID
	Controls.MedievalEraPresetPulldown:GetButton():SetText( getDescriptionPreset( medievalEraPreset ))
end

function onRenaissanceEraPresetSelect(ID)
	print("onRenaissanceEraPresetSelect: Preset Changed")
	renaissanceEraPreset = ID
	Controls.RenaissanceEraPresetPulldown:GetButton():SetText( getDescriptionPreset( renaissanceEraPreset ))
end

function onIndustrialEraPresetSelect(ID)
	print("onIndustrialEraPresetSelect: Preset Changed")
	industrialEraPreset = ID
	Controls.IndustrialEraPresetPulldown:GetButton():SetText( getDescriptionPreset( industrialEraPreset ))
end

function onModernEraPresetSelect(ID)
	print("onModernEraPresetSelect: Preset Changed")
	modernEraPreset = ID
	Controls.ModernEraPresetPulldown:GetButton():SetText( getDescriptionPreset( modernEraPreset ))
end

function onAtomicEraPresetSelect(ID)
	print("onAtomicEraPresetSelect: Preset Changed")
	atomicEraPreset = ID
	Controls.AtomicEraPresetPulldown:GetButton():SetText( getDescriptionPreset( atomicEraPreset ))
end

function onInformationEraPresetSelect(ID)
	print("onInformationEraPresetSelect: Preset Changed")
	informationEraPreset = ID
	Controls.InformationEraPresetPulldown:GetButton():SetText( getDescriptionPreset( informationEraPreset ))
end

function onCompatibilityPresetSettingCheckbox(value)

	isCompatabilityMode = value

	if value then
		print("onCompatibilityPresetSettingCheckbox: Player turned on Compatability Mode")
		Controls.CompatibilityPresetPulldown: SetHide ( false )
		Controls.EraPresetSettings: SetHide ( true )
	else
		print("onCompatibilityPresetSettingCheckbox: Player turned off Compatability Mode")
		Controls.CompatibilityPresetPulldown: SetHide ( true )
		Controls.EraPresetSettings: SetHide ( false )
	end
end
Controls.CompatibilityPresetSetting:RegisterCheckHandler(onCompatibilityPresetSettingCheckbox)
Controls.CompatibilityPresetSetting:SetCheck(isCompatabilityMode);

function onCompatibilityPresetSelect(ID)
	print("onCompatibilityPresetSelect: Preset Changed")
	compatabilityPreset = ID
	Controls.CompatibilityPresetPulldown:GetButton():SetText( getDescriptionPreset( compatabilityPreset ))
end
-- END-------------------------------------------------

function onNonhumanNamingSetting(value)
	isNamingNonhumanUnits = value

	if value then
		print("onNonhumanNamingSetting: Turning on Non-Human unit naming")
	else
		print("onNonhumanNamingSetting: Turing off Non-Human unit naming")
	end
end
Controls.NonhumanNamingSetting:RegisterCheckHandler(onNonhumanNamingSetting)
Controls.NonhumanNamingSetting:SetCheck(isNamingNonhumanUnits);

function onAdvancedCloseButton()
	-- This autocloses the advanced settings dialog
	showDialog()
end
Controls.AdvancedCloseButton:RegisterCallback(Mouse.eLClick, onAdvancedCloseButton)

-------------------------------------------------------
-- END OF Button Handling
-------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- End of Advanced Setting Panel =================================================================================================================================
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------
-- Utils
-----------------------------------

-- Returns a random number between the min and max
function rand(min, max)
	return Game.Rand((max + 1) - min, "") + min
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function addToString(mainString, thingToAdd)
	if mainString then
		return mainString .. thingToAdd
	else
		return thingToAdd
	end
end

---------------------------------------------
--	Add dropdown menu to Diplo Corner
---------------------------------------------

function addContextualSettingDropdown(additionalEntries)
  table.insert(additionalEntries, {
    text=Locale.ConvertTextKey("TXT_KEY_CONTEXTUAL_SETTINGS"), 
    call=showDialog
  })
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(addContextualSettingDropdown)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()