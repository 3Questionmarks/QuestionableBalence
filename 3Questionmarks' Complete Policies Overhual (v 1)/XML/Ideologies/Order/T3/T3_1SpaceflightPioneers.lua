-- T3_4WarHeros
-- Author: thetr
-- DateCreated: 5/11/2024 5:01:15 PM
--------------------------------------------------------------
function CreateGreatPeopleScientistEngineer(playerID, unitID, unitType, plotX, plotY, isCiv)
    local player = Players[playerID]
    if player and player:IsAlive() then
        local policyID = GameInfoTypes["POLICY_SPACEFLIGHT_PIONEERS"]
        if player:HasPolicy(policyID) then
			local unit = player:GetUnitByID(unitID);
			local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SCIENTIST"] and not unit:IsHasPromotion(promotionID) then
                local capital = player:GetCapitalCity()
                if capital then
                    unit2 = player:InitUnit(GameInfoTypes["UNIT_ENGINEER"], capital:GetX(), capital:GetY())
					unit2:SetHasPromotion(promotionID, true)
                end
			elseif unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_ENGINEER"] and not unit:IsHasPromotion(promotionID) then
                local capital = player:GetCapitalCity()
                if capital then
                    unit2 = player:InitUnit(GameInfoTypes["UNIT_SCIENTIST"], capital:GetX(), capital:GetY())
					unit2:SetHasPromotion(promotionID, true)
                end
            end
        end
    end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CreateGreatPeopleScientistEngineer)
