-- BigBenChanges
-- Author: thetr
-- DateCreated: 5/19/2024 2:16:28 PM
--------------------------------------------------------------
function CheckBigBen(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasBigBen = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_BIG_BEN"]) > 0) then
				print("BigBen has BigBen")
				hasBigBen = true
				City = pCity
			end
		end
		if (hasBigBen) then
			local unit = player:GetUnitByID(unitID);
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_MERCHANT"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_MERCHANT"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckBigBen);