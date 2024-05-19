-- BroadwayChanges
-- Author: thetr
-- DateCreated: 5/19/2024 2:28:56 PM
--------------------------------------------------------------
function CheckBroadway(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasBroadway = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_BROADWAY"]) > 0) then
				print("Broadway has Broadway")
				hasBroadway = true
				City = pCity
			end
		end
		if (hasBroadway) then
			local unit = player:GetUnitByID(unitID);
            if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_MUSICIAN"] then
				local promotionID = GameInfoTypes["PROMOTION_LUA_SPAWNED_UNIT_FLAG"]
				if not unit:IsHasPromotion(promotionID) then
					unit2 = player:InitUnit(GameInfoTypes["UNIT_MUSICIAN"], City:GetX(), City:GetY())
					unit2:SetHasPromotion(promotionID, true)
				end
            end
		end
	end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CheckBroadway);