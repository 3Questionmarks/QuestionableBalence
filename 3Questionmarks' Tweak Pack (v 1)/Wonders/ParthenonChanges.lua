-- ParthenonChanges
-- Author: thetr
-- DateCreated: 5/19/2024 3:22:09 PM
--------------------------------------------------------------
print("Great Works of Art Check Script loaded")

--[[
function dontloadthisParthenonCheckArt(playerID)
	print("Parthenon Function loaded")
    local player = Players[playerID]
	local hasParthenon = false
	for pCity in player:Cities() do
		if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_PARTHENON"]) > 0) then
			print("Parthenon hasParthenon")
			hasParthenon = true
		end
	end

	-- Don't continue if they dont have Parthenon
	if(not hasParthenon) then
		print("Parthenon doesn't have parthenon")
		return;
	end
		
	local ParthenonGreatWorksOfArtCount = 0
	
	-- Loop through all the cities of the player
	for pCity in player:Cities() do
		ParthenonGreatWorksOfArtCount = 0
        -- Loop through all the slots in the city
        for building in GameInfo.Buildings() do
			if building.GreatWorkSlotType == "GREAT_WORK_SLOT_ART_ARTIFACT" then
				local buildingClassID = GameInfoTypes[building.BuildingClass]
				local numPGreatWorks = pCity:GetNumGreatWorksInBuilding(buildingClassID)
				print("Player " .. playerID .. " has " .. numPGreatWorks .. " great works in a building.")
				ParthenonGreatWorksOfArtCount = ParthenonGreatWorksOfArtCount + numPGreatWorks
				print("Player " .. playerID .. " has " .. ParthenonGreatWorksOfArtCount .. " total great works in buildings.")
			end
		end
	end
	
	-- Calculate the number of extra trade route slots to grant
	local numExtraParthenonTradeRoutes = math.floor(ParthenonGreatWorksOfArtCount / 2)
	
	-- Cap the number of extra trade routes at 5
	numExtraParthenonTradeRoutes = math.min(numExtraParthenonTradeRoutes, 5)
	
	print("Player " .. playerID .. " has " .. numExtraParthenonTradeRoutes .. " extra trade slots from great work of art.")
	
	local capitalCity = player:GetCapitalCity()
	if capitalCity then
		for i = 1, 5 do
			local buildingType = GameInfoTypes["BUILDING_PARTHENON_TRADE_DUMMY_" .. i]
			if i <= numExtraParthenonTradeRoutes then
				if capitalCity:GetNumRealBuilding(buildingType) == 0 then
					capitalCity:SetNumRealBuilding(buildingType, 1)
				end
			else
				if capitalCity:GetNumRealBuilding(buildingType) > 0 then
					capitalCity:SetNumRealBuilding(buildingType, 0)
                end
            end
        end
    end
end

--GameEvents.PlayerDoTurn.Add(dontloadthisParthenonCheckArt);

--]]

local lastTurn = -1

function ParthenonCheckArt(playerID)
    local turn = Game:GetGameTurn()
    if lastTurn < turn then
        print("Parthenon Function loaded")
        local player = Players[playerID]

        if not player then
            return
        end

        local hasParthenon = false
        for pCity in player:Cities() do
            if pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_PARTHENON"]) > 0 then
                print("Parthenon hasParthenon")
                hasParthenon = true
                break
            end
        end

        -- Don't continue if they don't have Parthenon
        if not hasParthenon then
            print("Parthenon doesn't have Parthenon")
            return
        end

        local ParthenonGreatWorksOfArtCount = 0

        -- Loop through all the cities of the player
        for pCity in player:Cities() do
			-- there is a odd glich where a Palace with its slot filled will increment the check by 5 instead of 1, idk why this is happening but a messy fix is to subject 4 from the count
			if pCity:IsCapital() then
                local palaceBuildingClassID = GameInfoTypes["BUILDINGCLASS_PALACE"]
                local palaceGreatWorks = pCity:GetNumGreatWorksInBuilding(palaceBuildingClassID)
                if palaceGreatWorks > 0 then
                    ParthenonGreatWorksOfArtCount = ParthenonGreatWorksOfArtCount + palaceGreatWorks
                    -- Adjust the count by removing 5 from the total if the Palace has a slot filled
                    ParthenonGreatWorksOfArtCount = ParthenonGreatWorksOfArtCount - 5
                    print("Palace has great works, adjusting count by -5")
                end
            end
            -- Loop through all the slots in the city
            for building in GameInfo.Buildings() do
                if building.GreatWorkSlotType == "GREAT_WORK_SLOT_ART_ARTIFACT" then
                    local buildingClassID = GameInfoTypes[building.BuildingClass]
                    local numPGreatWorks = pCity:GetNumGreatWorksInBuilding(buildingClassID)
                    print("Player " .. playerID .. " has " .. numPGreatWorks .. " great works in a " .. buildingClassID)
                    ParthenonGreatWorksOfArtCount = ParthenonGreatWorksOfArtCount + numPGreatWorks
                end
            end
        end
		-- Check if the Palace has a great work slot filled
        

        -- Print the number of Great Works of Art for debugging
        print("Player " .. playerID .. " has " .. ParthenonGreatWorksOfArtCount .. " total great works in buildings.")

        -- Calculate the number of extra trade route slots to grant
        local numExtraParthenonTradeRoutes = math.floor(ParthenonGreatWorksOfArtCount / 2)

        -- Cap the number of extra trade routes at 5
        numExtraParthenonTradeRoutes = math.min(numExtraParthenonTradeRoutes, 5)

        print("Player " .. playerID .. " has " .. numExtraParthenonTradeRoutes .. " extra trade slots from great works of art.")

        local capitalCity = player:GetCapitalCity()
        if capitalCity then
            for i = 1, 5 do
                local buildingType = GameInfoTypes["BUILDING_PARTHENON_TRADE_DUMMY_" .. i]
                if i <= numExtraParthenonTradeRoutes then
                    if capitalCity:GetNumRealBuilding(buildingType) == 0 then
                        capitalCity:SetNumRealBuilding(buildingType, 1)
                    end
                else
                    if capitalCity:GetNumRealBuilding(buildingType) > 0 then
                        capitalCity:SetNumRealBuilding(buildingType, 0)
                    end
                end
            end
        end
        lastTurn = turn
    end
end

GameEvents.PlayerDoTurn.Add(ParthenonCheckArt)