-- Units
-- Author: thetr
-- DateCreated: 3/1/2024 9:16:03 PM
--------------------------------------------------------------
--[[
function CrossMountainPromotion(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
    local player = Players[playerID]
    if player and player:IsAlive() then
        local traitID = GameInfoTypes["TRAIT_GREAT_ANDEAN_ROAD"]
        if player:GetTraitInfo().Type == traitID then
            local unit = player:GetUnitByID(unitID)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_MAY_CROSS_MOUNTAINS"], true)
        end
    end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CrossMountainPromotion)
--]]

function IncaTraitFreePromotion(playerID, unitID)
	local promotionID = GameInfoTypes["PROMOTION_CAN_CROSS_MOUNTAINS"]
	local civilizationID = GameInfoTypes["CIVILIZATION_INCA"]
    local pPlayer = Players[playerID]
    if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
        local unit = pPlayer:GetUnitByID(unitID)
		if unit:GetUnitType() ~= nul then
            unit:SetHasPromotion(promotionID, true)
        end
    end
end
LuaEvents.SerialEventUnitCreatedGood.Add(IncaTraitFreePromotion)