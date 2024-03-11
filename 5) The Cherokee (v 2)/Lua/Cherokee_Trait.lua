-- Cherokee_Trait
-- Author: User
-- DateCreated: 6/19/2015 1:59:46 PM
--------------------------------------------------------------


--------------------------------------------------------------
-- Gain Great Writer Points from Science Specialists
--------------------------------------------------------------
function DJSH_CherokeeGWPScientists(playerID)
        local player = Players[playerID]
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RCHEROKEE"] and player:IsAlive() then
                for city in player:Cities() do
                        local scientistAmount = city:GetSpecialistCount(GameInfoTypes["SPECIALIST_SCIENTIST"])
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_1"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_1"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_2"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_2"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_3"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_3"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_WRITER_DUMMY_4"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_4"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_5"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_5"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_6"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_6"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_7"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_7"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_8"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_8"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_9"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_9"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_10"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_10"], 0)
                        end
                        if scientistAmount >= 1 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_1"], 1)
                        end
                        if scientistAmount >= 2 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_2"], 2)
                        end
                        if scientistAmount >= 3 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_3"], 3)
                        end
                        if scientistAmount >= 4 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_4"], 4)
                        end
                        if scientistAmount >= 5 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_5"], 5)
                        end
                        if scientistAmount >= 6 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_6"], 6)
                        end
                        if scientistAmount >= 7 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_7"], 7)
                        end
                        if scientistAmount >= 8 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_8"], 8)
                        end
                        if scientistAmount >= 9 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_9"], 9)
                        end
                        if scientistAmount >= 10 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITER_RCHEROKEE_DUMMY_10"], 10)
                        end
                end
        end
end
GameEvents.PlayerDoTurn.Add(DJSH_CherokeeGWPScientists)

--------------------------------------------------------------
-- +10% GP Generation per outgoing Trade Route (max. 30%)
--------------------------------------------------------------
function DJSH_CherokeeGetNumTradeRoutesLeavingThisCity(playerID, city)
        local player = Players[playerID]
        local tradeRoutes = player:GetTradeRoutes()
        local numTradeRoutes = 0
        for i, v in ipairs(tradeRoutes) do
                local originatingCity = v.FromCity
                if originatingCity:GetID() == city:GetID() then
                        numTradeRoutes = numTradeRoutes + 1
                end
        end
       
        return numTradeRoutes
end
 
function DJSH_CherokeeTradeGpGeneration(playerID)
local player = Players[playerID]
         if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RCHEROKEE"] then
                for city in player:Cities() do
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_SYLLABARY_SCHOOL"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_2"], DJSH_CherokeeGetNumTradeRoutesLeavingThisCity(playerID, city))
                        else
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_2"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_2"]) > 3 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_2"], 3)
                        end
                end
        end
end
GameEvents.PlayerDoTurn.Add(DJSH_CherokeeTradeGpGeneration)
--------------------------------------------------------------
-- +10% of Science of Target City added to Originating City
--------------------------------------------------------------
function DJSH_GetNumCherokeeScienceFromConnectedTRs(playerID, city)
        local player = Players[playerID]
        local tradeRoutes = player:GetTradeRoutes()
        local numCherokeeScience = 0
        for i, v in ipairs(tradeRoutes) do
                local targetCity = v.ToCity
                local originatingCity = v.FromCity
                if originatingCity:GetID() == city:GetID() then
                        numCherokeeScience = numCherokeeScience + math.floor(targetCity:GetYieldRate(YieldTypes.YIELD_SCIENCE) * 10/100)
                end
        end
 
        return numCherokeeScience
end
 
function DJSH_CherokeeTradeScience(playerID)
local player = Players[playerID]
         if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RCHEROKEE"] then
                for city in player:Cities() do
                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_RCHEROKEE_DUMMY_3"], DJSH_GetNumCherokeeScienceFromConnectedTRs(playerID, city))
                end
        end
end
GameEvents.PlayerDoTurn.Add(DJSH_CherokeeTradeScience)

function DJSH_ScienceGreatWorkWritingOld(playerID)
        local player = Players[playerID]
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RCHEROKEE"] and player:IsAlive() then
                for city in player:Cities() do
                        local scienceBonus = math.floor(city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_AMPHITHEATER"]) + city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_NATIONAL_EPIC"]) + city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_HEROIC_EPIC"]) + city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_GLOBE_THEATER"]) + city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_OXFORD_UNIVERSITY"]) + city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_GREAT_LIBRARY"]) + city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_PUBLIC_SCHOOL"]))
                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITING_SCIENCE_DUMMY"], scienceBonus)
                end
        end
end

function DJSH_ScienceGreatWorkWriting(playerID)
        local player = Players[playerID]
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RCHEROKEE"] and player:IsAlive() then
            for city in player:Cities() do
                local scienceBonus = 0
                for building in GameInfo.Buildings() do
                    if building.GreatWorkSlotType == "GREAT_WORK_SLOT_LITERATURE" then
                        local buildingClassID = GameInfoTypes[building.BuildingClass]
                        local numGreatWorks = city:GetNumGreatWorksInBuilding(buildingClassID)
                        scienceBonus = scienceBonus + numGreatWorks
                    end
                end
                city:SetNumRealBuilding(GameInfoTypes["BUILDING_WRITING_SCIENCE_DUMMY"], scienceBonus)
            end
        end
    end
GameEvents.PlayerDoTurn.Add(DJSH_ScienceGreatWorkWriting)