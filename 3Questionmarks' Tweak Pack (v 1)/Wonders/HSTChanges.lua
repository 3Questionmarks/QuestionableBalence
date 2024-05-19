-- HSTChanges
-- Author: thetr
-- DateCreated: 5/19/2024 2:50:26 PM
--------------------------------------------------------------
function CheckHST(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasHST = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_HUBBLE"]) > 0) then
				print("HST has HST")
				hasHST = true
				City = pCity
			end
		end
		if (hasHST) then
			local unit = player:GetUnitByID(unitID);
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SCIENTIST"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_SCIENTIST"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckHST);