-- AngkorWatChanges
-- Author: thetr
-- DateCreated: 5/19/2024 2:21:04 AM
--------------------------------------------------------------
function CheckAngorWat(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasAngorWat = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_ANGKOR_WAT"]) > 0) then
				print("AngorWat has AngorWat")
				hasAngorWat = true
				City = pCity
			end
		end
		if (hasAngorWat) then
			local unit = player:GetUnitByID(unitID);
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_ENGINEER"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_ENGINEER"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckAngorWat);