-- LouvreChanges
-- Author: thetr
-- DateCreated: 5/19/2024 1:09:56 PM
--------------------------------------------------------------
function CheckLouvre(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasLouvre = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_LOUVRE"]) > 0) then
				print("Louvre has Louvre")
				hasLouvre = true
				City = pCity
			end
		end
		if (hasLouvre) then
			local unit = player:GetUnitByID(unitID);
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_ARTIST"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_ARTIST"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckLouvre);