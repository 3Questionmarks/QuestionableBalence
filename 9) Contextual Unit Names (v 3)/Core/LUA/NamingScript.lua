-- Naming Script
-- Author: astog
-- DateCreated: 7/13/2015 7:00:38 PM
--------------------------------------------------------------

print("Script Loaded")

include ("NameSettings.lua")
include ("PlotIterators.lua")

--=================================================================================================================================================================
-- Variables
--=================================================================================================================================================================

local g_SaveData 	= Modding.OpenSaveData()
local g_Properties 	= {}

-- -- Initialize Variables--------------------------
local numberSetting, combatClassSetting, contextSetting, arrangementSetting, connectorSetting					= 	getNameVaraibles()
local presetDefines 		= getPresetDefines()
local overallPresetDefines	= getOverallPresetDefines()

local totalCustomPresets 	= 8

-- printNamingScriptSettings()

-- -- Order of these variables is important
-- local nameUnitNumber, nameCombatClass, nameContext, nameArrangement, nameFirstConnector, nameSecondConnector 	=	getUserSettings()


-- -- Getting setting for the range of city check while naming units
-- local cityCheckRange = getCityCheckRangeSetting()


-- -- Getting setting as to naming units other than players
-- local isNamingNonhumanUnits = getIsNonhumanNamingSetting()

-- -- Is Contextual Naming Units?
-- local isContextualNamingEnabled = getIsContextualNamingEnabled()


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--	Format of Save Data
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 	This might be quite confusing, but at the time of writing I thought this was the best way. Enjoy ;)
--	"UNITNAME_NUMBER_PLAYER" .. playerID .. "_" .. cityName .. "_" .. combatClassType


--=================================================================================================================================================================
-- MAIN FUNCTIONS
--=================================================================================================================================================================

local playerAssignedStartingUnitNames = nil;
local assignedStartingName = false;

-- This is the MAIN function, that actually does the naming of the unit
function doNamingOfUnits(playerID, unitID)

	if playerAssignedStartingUnitNames ~= playerID then
		playerAssignedStartingUnitNames = playerID
		assignedStartingName = false
	end

	local pPlayer = Players[playerID];
	local eraID = pPlayer:GetCurrentEra();
	local pUnit = pPlayer:GetUnitByID(unitID);
	local contextualNamingEnabled = getIsContextualNamingEnabled();
	-- local settingsChanged = getIsUserSettingChanged()

	-- check to prevent errors, for starting unitS
	if(Game.GetElapsedGameTurns() > 0) then

		-- Whether to name other units?
		if(pPlayer:IsHuman() or (getIsNonhumanNamingSetting())) then
			
			if(not contextualNamingEnabled) then 
				print("Contextual Setting Disabled")
				return 
			end
			
			------------------------------------------------------
			-- Apply Preset Settings
			------------------------------------------------------

			print("doNamingOfUnits: Applying newest settings")

			-- Apply new settings
			applySettingsBasedOnEra(pPlayer:GetCurrentEra())

			-- END-----------------------------------------------

			-- Only assign a new name for combat/air units, with no name
			if(pPlayer and pUnit and (pUnit:IsCombatUnit() or  pUnit:GetDomainType() == DomainTypes.DOMAIN_AIR) and not pUnit:HasName()) then
				
				-- Check for saveData. This usually will fire of, at the start of the game
				local variableName = getNameForSaveData(pPlayer, pUnit)
				unitNamingInitialize(pPlayer, pUnit, variableName)			

				print("Finding a new name")
				local newName = getNewName(pPlayer, pUnit, variableName)
				
				if(newName) then
					pUnit:SetName(newName)
					LuaEvents.SerialEventUpdateTooltip(playerID, unitID)

					-- Increase the counter for units
					doUnitCounter(pPlayer, pUnit, variableName)

					print("New Name for the unit: " .. pUnit:GetNameNoDesc())
				else
					print("Could not find a name. Handling save variable")

					if(GetPersistentProperty(variableName) == 1) then

						print("Save newly created. Removing value with name: " .. variableName)
						SetPersistentProperty(variableName, nil)
					end
				end
			end
		end
	else
		-- Note: No need to check for human or not. So starting units for ALL players will be named.
		-- I chose to do this so that you can literally meet the enemies leader on the field.
		------------------------------------------------------
		-- Apply Preset Settings
		------------------------------------------------------

		print("doNamingOfUnits: Applying newest settings")

		-- Apply new settings. Just in case the user chooses to change settings before the 1st turn. Rare case but why not
		applySettingsBasedOnEra(pPlayer:GetCurrentEra())

		-- END-----------------------------------------------

		-- Do naming of starting units. Can player start with air units?
		if(pPlayer and pUnit and (pUnit:IsCombatUnit() or  pUnit:GetDomainType() == DomainTypes.DOMAIN_AIR) and not pUnit:HasName()) then
			print("doNamingOfUnits: Naming Starting units")
			
			-- Assign the very first combat unit spawned to leader's name
			if not assignedStartingName then
				pUnit:SetName(pPlayer:GetName())
				assignedStartingName = true
			else
				-- If it comes here, the player spawned with more than 1 combat unit. Assign them as "[LeaderName]'s [UnitType]"
				pUnit:SetName(pPlayer:GetName() .. "'s " .. Locale.ConvertTextKey(pUnit:GetNameKey()))

			end

			LuaEvents.SerialEventUpdateTooltip(playerID, unitID)
		end
	end
end
Events.SerialEventUnitCreated.Add( doNamingOfUnits );

function  applySettingsBasedOnEra(eraID)
	if eraID == nil then
		print("applySettingsBasedOnEra: Passed eraID is nil")
		return
	end

	local overallPreset = getOverallPresetFromID(getOverallPreset());
	local preset;

	if getIsCompatabilityMode() then
		print("User in compatability mode")
		preset = getPresetFromID(getCompatabilityPreset())

	elseif	eraID <= 0 		then
		print("Player belongs to Ancient Era. Applying relevant settings")
		preset = getPresetFromID(getAncientEraPresetSetting())

	elseif 	eraID == 1 		then
		print("Player belongs to Classical Era. Applying relevant settings")
		preset = getPresetFromID(getClassicalEraPresetSetting())

	elseif	eraID == 2		then
		print("Player belongs to Medieval Era. Applying relevant settings")
		preset = getPresetFromID(getMedievalEraPresetSetting())

	elseif	eraID == 3 		then
		print("Player belongs to Renaissance Era. Applying relevant settings")
		preset = getPresetFromID(getRenaissanceEraPresetSetting())

	elseif 	eraID == 4		then
		print("Player belongs to Industrial Era. Applying relevant settings")
		preset = getPresetFromID(getIndustrialEraPresetSetting())

	elseif 	eraID == 5 		then
		print("Player belongs to Modern Era. Applying relevant settings")
		preset = getPresetFromID(getModernEraPresetSetting())

	elseif 	eraID == 6 		then
		print("Player belongs to Atomic Era. Applying relevant settings")
		preset = getPresetFromID(getAtomicEraPresetSetting())

	elseif 	eraID >= 7 		then
		print("Player belongs to Information Era. Applying relevant settings")
		preset = getPresetFromID(getInformationEraPresetSetting())

	else
		print("applySettingsBasedOnEra: Can't understand eraID")
	end

	if preset then
		print("applySettingsBasedOnEra: Using preset- " .. preset.Description)
	else
		print("applySettingsBasedOnEra: Error. Couldn't find a preset.")
		return
	end

	-- Check if preset is custom

	if preset.Custom then
		local index = getCustomPresetIndexFromID(preset.ID)
		print("applySettingsBasedOnEra: Preset was custom. Accessing save with index: " .. index)
		-- Custom preset. Use SAVE values to apply preset into DIALOG variables
		setNameUnitNumber 		(getCustomPresetNumber(index))
		setNameUnitCombatClass 	(getCustomPresetCombatClass(index))
		setNameUnitContext 		(getCustomPresetContext(index))
		setNameUnitArrangement 	(getCustomPresetArrangement(index))
		setNameFirstConnector 	(getCustomPresetFirstConnector(index))
		setNameSecondConnector 	(getCustomPresetSecondConnector(index))
	else
		-- Not a custom preset. Access values from file
		-- Apply preset values into DIALOG variables
		setNameUnitNumber 		(preset.VALUES.nameUnitNumber);
		setNameUnitCombatClass 	(preset.VALUES.nameCombatClass);
		setNameUnitContext 		(preset.VALUES.nameContext);
		setNameUnitArrangement 	(preset.VALUES.nameArrangement);
		setNameFirstConnector 	(preset.VALUES.nameFirstConnector);
		setNameSecondConnector 	(preset.VALUES.nameSecondConnector);
	end
end

-- Return the new name for the given unit
function getNewName(pPlayer, pUnit, variableName)
	local newName
	local nameArrangement = getNameArrangement()

	-- Getting values for each part of the name
	local numberPart 		= getNameNumber(pPlayer, pUnit, variableName);
	local combatClassPart	= getNameCombatClass(pPlayer, pUnit);
	local contextPart		= getNameContext(pPlayer, pUnit);
	local firstConnector, 	
		  secondConnector 	= getConnectors(getNameFirstConnector(), getNameSecondConnector())

	-- Checking name for null values
	if(not checkName(numberPart, getNameUnitNumber(), combatClassPart, getNameUnitCombatClass(), contextPart, getNameUnitContext())) then 
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

-- Return the number part of the name
function getNameNumber(pPlayer, pUnit, variableName)
	local num
	local nameUnitNumber = getNameUnitNumber()

	if(nameUnitNumber == numberSetting.NONE.ID) then
		return
	elseif(nameUnitNumber == numberSetting.ROMAN.ID) then
		-- NOTE: romanNumber here is a string because covertToRomanNumeral returns a string
		num = GetPersistentProperty(variableName)
		local romanNumber = convertToRomanNumeral(num)

		print("Original Number: " .. num)
		print("Roman Numeral: " .. romanNumber)

		return romanNumber
	else
		num = GetPersistentProperty(variableName)
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

-- Returns the combat class part of the name
function getNameCombatClass(pPlayer, pUnit)
	local nameCombatClass = getNameUnitCombatClass()

	if(nameCombatClass == combatClassSetting.NONE.ID) then
		return

	----------------------------------------------------------
	-- UNIT TYPE
	----------------------------------------------------------
	elseif(nameCombatClass == combatClassSetting.UNIT_TYPE.ID) then
		return Locale.ConvertTextKey(pUnit:GetNameKey())

	----------------------------------------------------------
	-- COMBATCLASS
	----------------------------------------------------------
	elseif(isCombatClassSettingCombatClass(nameCombatClass)) then
		for i=1, combatClassSetting.COMBATCLASS.END - combatClassSetting.COMBATCLASS.START - 1 do
			if(nameCombatClass == combatClassSetting.COMBATCLASS["TYPE" .. i].ID) then
				local unitClassType = Locale.ConvertTextKey(GameInfo.UnitCombatInfos[pUnit:GetUnitCombatType()].Type);

				print("Unit Class found: " .. unitClassType)
				print("Will return: " .. combatClassSetting.COMBATCLASS["TYPE" .. i][unitClassType])

				return combatClassSetting.COMBATCLASS["TYPE" .. i][unitClassType]
			end
		end
	end
end

-- Returns the context part of the name
function getNameContext(pPlayer, pUnit)
	local nameContext = getNameUnitContext()

	if(nameContext == contextSetting.NONE.ID) then
		return

	----------------------------------------------------------
	-- CITY
	----------------------------------------------------------
	elseif(nameContext == contextSetting.CITY.ID) then
		local closestCity = getClosestCity(pPlayer, pUnit)

		if(closestCity) then
			return closestCity:GetName()
		end

	----------------------------------------------------------
	-- CIVILIZATON
	----------------------------------------------------------
	elseif(nameContext == contextSetting.CIV.NORMAL.ID) then
		-- Handling gifted or captured units
		if pPlayer ~= Players[pUnit:GetOriginalOwner()] and Players[pUnit:GetOriginalOwner()]:IsMinorCiv() then
			-- Return the capital city of the player
			print("----------------------------- GIFTED UNIT BY CS -----------------------------")
			return Players[pUnit:GetOriginalOwner()]:GetCivilizationShortDescription()
		end

		return pPlayer:GetCivilizationShortDescription()

	elseif(nameContext == contextSetting.CIV.ADJECTIVE.ID) then
		-- Handling gifted or captured units
		if pPlayer ~= Players[pUnit:GetOriginalOwner()] then
			print("----------------------------- GIFTED UNIT BY CS -----------------------------")
			-- Return the capital city of the player
			return Players[pUnit:GetOriginalOwner()]:GetCivilizationAdjective()
		end

		return pPlayer:GetCivilizationAdjective()

	----------------------------------------------------------
	-- LEADER
	----------------------------------------------------------
	elseif(nameContext == contextSetting.LEADER.ID) then
		-- Handling gifted or captured units
		if pPlayer ~= Players[pUnit:GetOriginalOwner()] and Players[pUnit:GetOriginalOwner()]:IsMinorCiv() then
			print("----------------------------- GIFTED UNIT BY CS -----------------------------")
			-- Return the capital city of the player
			return Players[pUnit:GetOriginalOwner()]:GetName()
		end

		return pPlayer:GetName()

	----------------------------------------------------------
	-- GLORY OF ROME
	----------------------------------------------------------
	elseif(nameContext == contextSetting.ROMAN.ID) then
		print("Checking for Roman Legion Title")
		local closestCity = getClosestCity(pPlayer, pUnit)

		if(closestCity) then
			print("Found closest city")
			return getRomanContext(closestCity:GetName(), pPlayer)
		end	

	----------------------------------------------------------
	-- FIXED
	----------------------------------------------------------
	elseif(isContextSettingFixed(nameContext)) then
		for i=1, contextSetting.FIXED.END - contextSetting.FIXED.START - 1 do
			if(contextSetting.FIXED["TYPE" .. i].ID == nameContext) then
				print("Context that will be returned: " .. contextSetting.FIXED["TYPE" .. i].VALUE)
				return contextSetting.FIXED["TYPE" .. i].VALUE
			end
		end
	end
end

-- Returns the connectors
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

--=================================================================================================================================================================
-- SMALLER FUNCTIONS
--=================================================================================================================================================================

-- Checks if the unitName exists in the saveData, otherwise it creates one
function unitNamingInitialize(pPlayer, pUnit, variableName)
	--printNamingScriptSettings()

	if(not g_SaveData.GetValue(variableName)) then
		print("Setting up save data for " .. variableName)

		SetPersistentProperty(variableName, 1);
	else
		print("Reading previous save data for " .. variableName .. " with value: " .. GetPersistentProperty(variableName))
	end
end

-- Iterates counter of units
function doUnitCounter(pPlayer, pUnit, variableName)
	SetPersistentProperty(variableName, GetPersistentProperty(variableName) + 1)

	-- TO DO: Implement increment of variables of _GLOBAL
end

-- Checks if different parts of the name are ok, and prints any errors out.
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

-- Adds the different parts of the name properly
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

-- Finds the closest city to the given plot
function getClosestCity(pPlayer, pUnit)
	local cityCheckRange = getCityCheckRangeSetting()

	-- Handling gifted or captured units
	if pPlayer ~= Players[pUnit:GetOriginalOwner()] and Players[pUnit:GetOriginalOwner()]:IsMinorCiv() then
		print("----------------------------- GIFTED UNIT BY CS -----------------------------")
		-- Return the capital city of the player
		return Players[pUnit:GetOriginalOwner()]:GetCapitalCity()
	end

	if(pPlayer and pUnit and pPlayer:IsAlive() and not pUnit:IsDead()) then
		local pPlot = pUnit:GetPlot()

		-- First check if the plot is already a city
		if(pPlot and pPlot:IsCity()) then
			local pCity = pPlot:GetPlotCity();
			return pCity
		end

		-- If it reaches here, then the unit did not spawn in a city
		print("Unit did not spawn in city. Checking for city till the range of " .. cityCheckRange)

		if(pPlot) then

			for pAreaPlot in PlotAreaSpiralIterator(pPlot, cityCheckRange, 1, false, false, false) do

				if(pAreaPlot and pAreaPlot:IsCity()) then
					local pCity = pAreaPlot:GetPlotCity();
					return pCity
				end
			end
		end

		-- Exception Handling Code goes here. What to do if no nearby city is found?

	else
		print("Something went wrong")
		return
	end
end

-- Converts the give number into Roman Numeral. Slightly complicated, uses recursion.
-- It works till 1,000+. Kinda overkill. lol
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

-- Gets a legion equivalent of a cityname.
function getRomanContext(cityName, pPlayer)
	print("getRomanContext: Running")

	-- Safe Checks
	if cityName == nil then 
		print("getRomanContext: City Name passed is empty")
		return
	end

	if pPlayer == nil then 
		print("getRomanContext: Player passed is empty")
		return
	end

	local i=0;

	for row in GameInfo.Civilization_CityNames() do
		if row ~= nil then
			if row.CivilizationType and pPlayer:GetCivilizationType() then
				-- print("Comparing " .. row.CivilizationType .. " with " .. pPlayer:GetCivilizationType())

				if (GameInfo.Civilizations[row.CivilizationType].ID == pPlayer:GetCivilizationType()) then
					
					-- Only increment counter if the city belongs to you
					i = i + 1

					if row.CityName == nil then
						print("getRomanContext: Row City Name Empty")
						return
					else
						print("getRomanContext: Found key: " .. row.CityName)
					end

					if Locale.ConvertTextKey(row.CityName) == cityName then
						
						local romanLegionName = contextSetting.ROMAN.VALUES[i]

						if romanLegionName then
							return romanLegionName
						else
							print("getRomanContext: Could not find a Legion Name. Incorrect Index")
							return
						end
					else
						print("getRomanContext: City name did not match")
					end
				end
			end
		else
			print("getRomanContext: Row Empty...")
		end
	end
end

-- Disabled Code

-- -- Converts the given string number to a English format (Example, 1 -> 1st, 2 -> 2nd, 3 -> 3rd, 4 -> 4th)
-- function properNumberFormat(numString)

-- 	-- If the number setting is Dynamic Normal, don't add a suffix
-- 	if(nameUnitNumber == numberSetting.DYNAMIC_BARE.ID) then return end

-- 	local numInt = tonumber(numString)

-- 	-- We have to check the last digit of the number for the appropriate addition. Valid only for numbers <= 10 or number >= 20
-- 	if(numInt <= 10 or numInt >=20) then
-- 		if(numInt % 10 == 1) then
-- 			return numString .. "st"
-- 		elseif(numInt % 10 == 2) then
-- 			return numString .. "nd"
-- 		elseif(numInt % 10 == 3) then
-- 			return numString .. "rd"
-- 		else
-- 			return numString .. "th"
-- 		end
-- 	-- All numbers from 10th - 20th, have "th" as a suffix
-- 	else
-- 		return numString .. "th"
-- 	end
-- end

-- -- Converts the given context name, to a proper format
-- function properContextFormat(contextString, arrangement)

-- 	local string = contextString

-- 	if(string == nil) then return end

-- 	-- If the setting is fixed, context won't have anything suffixed or prefixed
-- 	if(isContextSettingFixed(nameContext)) then
-- 		return string
-- 	end

-- 	if(arrangement == arrangementSetting.NUMBER_COMBATCLASS_CONTEXT) then
-- 		string = "of " .. string
-- 	elseif(arrangement == arrangementSetting.NUMBER_CONTEXT_COMBATCLASS) then
-- 		if(nameContext == contextSetting.CIV.ADJECTIVE.ID) then
-- 			return string
-- 		else
-- 			string = string .. "'s " 
-- 		end
-- 	elseif(arrangement == arrangementSetting.CONTEXT_NUMBER_COMBATCLASS) then
-- 		if(nameContext == contextSetting.CIV.ADJECTIVE.ID) then
-- 			return string
-- 		else
-- 			string = string .. "'s " 
-- 		end
-- 	else
-- 		return string
-- 	end

-- 	return string
-- end

-- -- Converts the given combatClass string to a proper format
-- function properCombatClassFormat(combatClassString)

-- 	-- This function actually does nothing. Its more for consistencty and future modularity
-- 	return combatClassString
-- end

--	Returns the stringName for saveData. Note: THIS IS NOT THE NAME THE UNIT GETS. THIS IS USED TO REFERENCE TO SAVED DATA
function getNameForSaveData(pPlayer, pUnit)
	
	local nameCombatClass 	= getNameUnitCombatClass()
	local nameContext 		= getNameUnitContext()

	if(not pPlayer or not pUnit) then return end

	-- 	Every name will have this part
	local name = "UNITNAME_NUMBER_PLAYER" .. pPlayer:GetID()

	--	If using Context city, add city to the name
	if(nameContext == contextSetting.CITY.ID or nameContext == contextSetting.ROMAN.ID) then
		local closestCity = getClosestCity(pPlayer, pUnit)

		if(closestCity) then
			name = name .. "_" .. string.upper(closestCity:GetName())
		end
	else		
		name = name .. "_GLOBAL"

		if(getNameUnitNumber() == numberSetting.GLOBAL.ID) then return end
	end

	--	Adding the CombatClass part to the name
	if(isCombatClassSettingCombatClass(nameCombatClass)) then
		local combatClassID = pUnit:GetUnitCombatType()

		if(combatClassID) then
			local combatClassName = Locale.ConvertTextKey(GameInfo.UnitCombatInfos[combatClassID].Type)
			name = name .. "_" ..  combatClassName
		end
	elseif(nameCombatClass == combatClassSetting.UNIT_TYPE.ID) then
		local unitTypeID = pUnit:GetUnitType()

		if(unitTypeID) then
			local unitTypeName = Locale.ConvertTextKey(GameInfo.Units[unitTypeID].Type)
			name = name .. "_" ..  unitTypeName
		end
	end

	-- Precautionary conversion to convert name to uppercase
	name = string.upper(name)

	print("Final saveData reference  name: " .. name)

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

-- Does what it says
function getOverallPresetFromID(ID)
	if ID == nil then
		print("getOverallPresetFromID: ID passed nil")
		return
	end

	for _, row in pairs(overallPresetDefines) do
		if row.ID == ID then
			return row
		end
	end
end

-- Does what it says
function getPresetFromID(ID)
	if ID == nil then
		print("getPresetFromID: ID passed is nil")
		return
	end

	for _, row in pairs(presetDefines) do
		if row.ID == ID then
			return row
		end
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


-- -- Refreshes Settings to the current value
-- function doRefreshSetting()
-- 	print("Refreshing Settings")
-- 	print("Before:")
-- 	printNamingScriptSettings()

-- 	nameUnitNumber		=	GetPersistentProperty("UNIT_NAME_NUMBER")
-- 	nameCombatClass 	=	GetPersistentProperty("UNIT_NAME_COMBATCLASS")
-- 	nameContext     	=   GetPersistentProperty("UNIT_NAME_CONTEXT")
-- 	nameArrangement 	=	GetPersistentProperty("UNIT_NAME_ARRANGEMENT")
-- 	nameFirstConnector 	=	GetPersistentProperty("UNIT_NAME_FIRST_CONNECTOR")
-- 	nameSecondConnector	=	GetPersistentProperty("UNIT_NAME_SECOND_CONNECTOR")
	

-- 	cityCheckRange 													= getCityCheckRangeSetting()
-- 	isNamingNonhumanUnits 											= getIsNonhumanNamingSetting()
-- 	isContextualNamingEnabled 										= getIsContextualNamingEnabled()

-- 	print("After:")
-- 	printNamingScriptSettings()
-- end

--------------------------------------------------------------------------
-- Setters for variables (used by dialog)
--------------------------------------------------------------------------

-- function setNameUnitNumber(newValue)
-- 	print("setNameUnitNumber: Original Value: " .. nameUnitNumber)
-- 	nameUnitNumber = newValue
-- 	print("setNameUnitNumber: New Value Set: " .. nameUnitNumber)
-- end

-- function setNameUnitCombatClass(newValue)
-- 	print("setNameUnitCombatClass: Original Value: " .. nameCombatClass)
-- 	nameCombatClass = newValue
-- 	print("setNameUnitCombatClass: New Value Set: " .. nameCombatClass)
-- end

-- function setNameUnitContext(newValue)
-- 	print("setNameUnitContext: Original Value: " .. nameContext)
-- 	nameContext = newValue
-- 	print("setNameUnitContext: New Value Set: " .. nameContext)
-- end

-- function setNameUnitArrangement(newValue)
-- 	print("setNameUnitArrangement: Original Value: " .. nameArrangement)
-- 	nameArrangement = newValue
-- 	print("setNameUnitArrangement: New Value Set: " .. nameArrangement)
-- end

-- function setNameFirstConnector(newValue)
-- 	print("setNameFirstConnector: Original Value: " .. nameFirstConnector)
-- 	nameFirstConnector = newValue
-- 	print("setNameFirstConnector: New Value Set: " .. nameFirstConnector)
-- end

-- function setNameSecondConnector(newValue)
-- 	print("setNameSecondConnector: Original Value: " .. nameSecondConnector)
-- 	nameSecondConnector = newValue
-- 	print("setNameSecondConnector: New Value Set: " .. nameSecondConnector)
-- end

-- function setContextualNamingEnabled(newValue)
-- 	print("setContextualNamingEnabled: Original Value: " .. boolToString(isContextualNamingEnabled))
-- 	isContextualNamingEnabled = newValue	
-- 	print("setContextualNamingEnabled: New Value Set: " .. boolToString(isContextualNamingEnabled))
-- end

--=================================================================================================================================================================
-- DEBUG FUNCTIONS
--=================================================================================================================================================================


-- Print statements to see if settings loaded properly
function printNamingScriptSettings()
	print("---------NamingScript: CURRENT SETTINGS---------")
	
	print("Enabled: " 						.. 	boolToString(	getIsContextualNamingEnabled() 	))
	print("Name Unit Number Setting: " 		.. 					getNameUnitNumber()				)
	print("Name Combat Class Setting: " 	.. 					getNameUnitCombatClass()		)
	print("Name Context Setting: " 			.. 					getNameUnitContext()			)
	print("Name First Connector Setting: "	..					getNameFirstConnector()			)
	print("Name Second Connector Setting: "	..					getNameSecondConnector()		)
	print("Name Arrangement Setting: " 		.. 					getNameArrangement()			)

	print("-------ADVANCED SETTINGS-------")
	print("City Check Range: " 				..					getCityCheckRangeSetting())

	print("----------------END OF SETTINGS----------------")
	print(" ")
end

-- Prints names of all units in the game
-- function printAllUnitsNames(playerID)

-- 	local pPlayer = Players[playerID]

-- 	if(pPlayer and pPlayer:IsAlive()) then

-- 		print("-------------ALL THE UNITS-------------")

-- 		for pUnit in pPlayer:Units() do

-- 			print(" ")
-- 			print(pPlayer:GetName() .. " has a unit with:")
-- 			print("NAME 		: " .. pUnit:GetName())
-- 			print("NAME KEY		: " .. pUnit:GetNameKey())
-- 			print("NAME NO DESC	: " .. pUnit:GetNameNoDesc())
-- 			print(" ")

-- 		end

-- 		print("----------------END----------------")
-- 	end
-- end
-- GameEvents.PlayerDoTurn.Add(printAllUnitsNames)

--=================================================================================================================================================================
-- UTILITY FUNCTIONS
--=================================================================================================================================================================

function GetPersistentProperty(name)
	if (not g_Properties[name]) then

		local val = g_SaveData.GetValue(name)

		if val then
			g_Properties[name] = val
		else
			print("GetPersistentProperty: NO SAVED VALUE AVAILABLE")
		end
	end

	return g_Properties[name]
end

function SetPersistentProperty(name, value)
	if (GetPersistentProperty(name)) == value then 
		return 
	end

	g_SaveData.SetValue(name, value)
	g_Properties[name] = value
end

function addToString(mainString, thingToAdd)
	if mainString then
		return mainString .. thingToAdd
	else
		return thingToAdd
	end
end

-- function ToLuaCode(item)
--    if type(item) == "nil" then return "nil" end
--    if type(item) == "bool" then return tostring(item) end
--    if type(item) == "number" then return tostring(item) end
--    if type(item) == "string" then return "[[" .. item .. "]]" end
--    if type(item) ~= "table" then error("could not serialize an element") end
 
--    local str = "{"
--    for k, v in pairs(item) do
--        str = str .. "[" .. ToLuaCode(k) .. "] = " .. ToLuaCode(v) .. ", "
--    end
--    return str.."}"
-- end
 
-- function SetPersistentTable(name, t)
--     g_SaveData.SetValue(name, ToLuaCode(t))
--     g_Properties[name] = t
-- end
 
-- function GetPersistentTable(name)
--     if not g_Properties[name] then
--         local code = g_SaveData.GetValue(name)
--         g_Properties[name] = loadstring(code)()
--     end
--     return g_Properties[name]
-- end