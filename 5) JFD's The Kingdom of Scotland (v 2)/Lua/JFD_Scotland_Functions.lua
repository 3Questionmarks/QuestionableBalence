-- JFD_ScotlandFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- MOD CHECKS
------------------------------------------------------------------------------------------------------------------------
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

-- JFD_IsCPDLL
function JFD_IsCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsCPDLL()
--------------------------------------------------------------
-- UTILS
--------------------------------------------------------------
-- JFD_AddBuilding
function JFD_AddBuilding(city, buildingID)
	if (not city:IsHasBuilding(buildingID)) then
		city:SetNumRealBuilding(buildingID, 1) 
	end
end	

-- JFD_RemoveBuilding
function JFD_RemoveBuilding(city, buildingID)
	if city:IsHasBuilding(buildingID) then
		city:SetNumRealBuilding(buildingID, 0) 
	end
end	
--=======================================================================================================================
-- UNIQUE FUNCTIONS	
--=======================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilizationID		= GameInfoTypes["CIVILIZATION_JFD_SCOTLAND"]
local isScotlandCivActive	= JFD_IsCivilisationActive(civilizationID)
local mathCeil				= math.ceil
local mathMin				= math.min
if isScotlandCivActive then
	print("King James VI is in this game")
end
------------------------------------------------------------------------------------------------------------------------
-- REULIS AND CAUTELIS
------------------------------------------------------------------------------------------------------------------------
-- JFD_Scotland_SpecialistWriters
local buildingWriter1ID		= GameInfoTypes["BUILDING_JFD_SCOTTISH_WRITER_E"]
local buildingWriter2ID		= GameInfoTypes["BUILDING_JFD_SCOTTISH_WRITER_M"]
local buildingWriter3ID		= GameInfoTypes["BUILDING_JFD_SCOTTISH_WRITER_S"]
local specialistEngineerID	= GameInfoTypes["SPECIALIST_ENGINEER"]
local specialistMerchantID	= GameInfoTypes["SPECIALIST_MERCHANT"]
local specialistScientistID = GameInfoTypes["SPECIALIST_SCIENTIST"]
function JFD_Scotland_SpecialistWriters(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			if player:IsGoldenAge() then
				if city:GetSpecialistCount(specialistScientistID) > 0 then
					JFD_AddBuilding(city, buildingWriter3ID)
				end
				if city:GetSpecialistCount(specialistEngineerID) > 0 then
					JFD_AddBuilding(city, buildingWriter1ID)
				end
				if city:GetSpecialistCount(specialistMerchantID) > 0 then
					JFD_AddBuilding(city, buildingWriter2ID)
				end
			else
				JFD_RemoveBuilding(city, buildingWriter3ID)
				JFD_RemoveBuilding(city, buildingWriter1ID)
				JFD_RemoveBuilding(city, buildingWriter2ID)
			end
		end
	end
end
if isScotlandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Scotland_SpecialistWriters)
end

-- JFD_Scotland_GreatPeopleGoldenAge
local unitPromotionGreatPeopleID = GameInfoTypes["PROMOTION_JFD_SCOTTISH_GP"]
function JFD_Scotland_GreatPeopleGoldenAge(playerID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		local unit = player:GetUnitByID(unitID)
		print(unit:GetName())
       	if unit:IsGreatPerson() and (not unit:IsHasPromotion(unitPromotionGreatPeopleID)) then	
			local goldenAgeBoost = mathCeil((player:GetGoldenAgeProgressThreshold()*20)/100)
			player:ChangeGoldenAgeProgressMeter(goldenAgeBoost)
			if player:IsHuman() then
				local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_MSG", goldenAgeBoost)
				Events.GameplayAlertMessage(alertmessage)
			end
			if (not isUsingCPDLL) then
				unit:SetHasPromotion(unitPromotionGreatPeopleID, true)
			end
		end
    end
end
if isScotlandCivActive then
	if isUsingCPDLL then
		GameEvents.UnitCreated.Add(JFD_Scotland_GreatPeopleGoldenAge)
	else
		Events.SerialEventUnitCreated.Add(JFD_Scotland_GreatPeopleGoldenAge)
	end
end
------------------------------------------------------------------------------------------------------------------------
-- COLLEGE
------------------------------------------------------------------------------------------------------------------------
-- JFD_Scotland_College
local buildingClassUniversityID = GameInfoTypes["BUILDINGCLASS_UNIVERSITY"]
local buildingCollegeID = GameInfoTypes["BUILDING_JFD_COLLEGE"]
local buildingCollegeGAModID	= GameInfoTypes["BUILDING_JFD_SCOTTISH_COLLEGE"]
function JFD_Scotland_College(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			if (city:IsHasBuilding(buildingCollegeID) and city:GetNumGreatWorksInBuilding(buildingClassUniversityID) > 0) then
				if player:CountNumBuildings(buildingCollegeGAModID) < 4 then
					JFD_AddBuilding(city, buildingCollegeGAModID)
				end
			else
				JFD_RemoveBuilding(city, buildingCollegeGAModID)
			end
		end
	end
end
if isScotlandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Scotland_College)
end
------------------------------------------------------------------------------------------------------------------------
-- HIGHLANDER
------------------------------------------------------------------------------------------------------------------------
-- JFD_Scotland_Highlander
local greatWorkLiteratureID = GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"]
local unitHighlanderID		= GameInfoTypes["UNIT_JFD_HIGHLANDER"]
function JFD_Scotland_Highlander(playerID, cityID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		local unit = player:GetUnitByID(unitID)
       	if unit:GetUnitType() == unitHighlanderID then
			local city = player:GetCityByID(cityID)
			local numGreatWorks = mathMin(city:GetNumGreatWorks(greatWorkLiteratureID)*7, 30)
			if numGreatWorks > 0 then
				unit:ChangeExperience(numGreatWorks)
			end
		end
    end
end
if isScotlandCivActive then
	GameEvents.CityTrained.Add(JFD_Scotland_Highlander)
end
--==========================================================================================================================
--==========================================================================================================================