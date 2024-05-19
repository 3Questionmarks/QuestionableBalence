-- HagiaSophiaChanges
-- Author: thetr
-- DateCreated: 5/18/2024 6:43:12 PM
--------------------------------------------------------------
function CheckHagia(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasHagia = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_HAGIA_SOPHIA"]) > 0) then
				print("Hagia has Hagia")
				hasHagia = true
				City = pCity
			end
		end
		if (hasHagia) then
			local unit = player:GetUnitByID(unitID);
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_PROPHET"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_PROPHET"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckHagia);