-- PentagonChanges
-- Author: thetr
-- DateCreated: 5/19/2024 2:41:15 PM
--------------------------------------------------------------

function CheckPentagon(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasPentagon = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_PENTAGON"]) > 0) then
				print("Pentagon has Pentagon")
				hasPentagon = true
				City = pCity
			end
		end
		if (hasPentagon) then
			local unit = player:GetUnitByID(unitID);
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_GREAT_GENERAL"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_GREAT_GENERAL"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            elseif unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_GREAT_ADMIRAL"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_GREAT_ADMIRAL"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckPentagon);