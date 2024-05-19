-- GlobeTheatreChanges
-- Author: thetr
-- DateCreated: 5/19/2024 12:56:56 PM
--------------------------------------------------------------
function CheckGlobeTheatre(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasGlobeTheatre = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_GLOBE_THEATER"]) > 0) then
				print("GlobeTheatre has GlobeTheatre")
				hasGlobeTheatre = true
				City = pCity
			end
		end
		if (hasGlobeTheatre) then
			local unit = player:GetUnitByID(unitID);
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_WRITER"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_WRITER"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckGlobeTheatre);