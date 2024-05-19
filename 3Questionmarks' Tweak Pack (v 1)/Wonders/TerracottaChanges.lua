-- TerracottaChanges
-- Author: thetr
-- DateCreated: 5/17/2024 6:23:24 PM
--------------------------------------------------------------
function CheckTerracotta(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasTerracotta = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_TERRACOTTA_ARMY"]) > 0) then
				print("Terracotta has Terracotta")
				hasTerracotta = true
			end
		end
		if (hasTerracotta) then
			local unit = player:GetUnitByID(unitID);
            if (unit:GetDomainType() == DomainTypes["DOMAIN_LAND"]) and (unit:GetBaseCombatStrength()  >= 1)  then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					local unitType = unit:GetUnitType()
					local unitInfo = GameInfo.Units[unitType]
					local prereqTech = unitInfo.PrereqTech
					if prereqTech then
						local techInfo = GameInfo.Technologies[prereqTech]
						local era = techInfo.Era
						if era == "ERA_ANCIENT" or era == "ERA_CLASSICAL" or era == "ERA_MEDIEVAL" then
							print("Unit built from Ancient, Classical, or Medieval era tech")
							local city = player:GetCityByID(cityID)
							if city then
								unit2 = player:InitUnit(unit:GetUnitType(), city:GetX(), city:GetY())
								unit2:SetHasPromotion(promotionID, true)
								local xp = unit:GetExperience()
								unit2:SetExperience(xp)
							end
						end
					else
						print("Unit built with no prerequisite tech")
						local city = player:GetCityByID(cityID)
						if city then
							unit2 = player:InitUnit(unit:GetUnitType(), city:GetX(), city:GetY())
							unit2:SetHasPromotion(promotionID, true)
							local xp = unit:GetExperience()
							unit2:SetExperience(xp)
						end
					end
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckTerracotta);