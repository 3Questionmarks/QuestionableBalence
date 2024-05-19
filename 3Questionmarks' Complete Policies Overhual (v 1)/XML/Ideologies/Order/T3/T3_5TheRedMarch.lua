-- T3_5TheRedMarch
-- Author: thetr
-- DateCreated: 5/12/2024 4:55:39 AM
--------------------------------------------------------------
function DoubleCreateUnits(playerID, unitID, unitType, plotX, plotY, isCiv)
    local player = Players[playerID]
    if player and player:IsAlive() then
        local policyID = GameInfoTypes["POLICY_THE_RED_MARCH"]
        if player:HasPolicy(policyID) then
			local unit = player:GetUnitByID(unitID);
            if (unit:GetDomainType() == DomainTypes["DOMAIN_LAND"]) and (unit:GetBaseCombatStrength()  >= 1)  then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					local city = player:GetCityByID(cityID)
					if city then
						unit2 = player:InitUnit(unit:GetUnitType(), city:GetX(), city:GetY())
						unit2:SetHasPromotion(promotionID, true)
						local xp = unit:GetExperience()
						local halfxp = math.floor(xp / 2)
                        unit:SetExperience(halfxp)
						unit2:SetExperience(halfxp)
					end
				end
            end
        end
    end
end

LuaEvents.SerialEventUnitCreatedGood.Add(DoubleCreateUnits)