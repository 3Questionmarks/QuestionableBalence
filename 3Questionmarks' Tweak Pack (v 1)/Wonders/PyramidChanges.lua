-- PyramidChanges
-- Author: thetr
-- DateCreated: 5/16/2024 8:58:58 PM
--------------------------------------------------------------
function CheckPyramid(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasPyramid = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_PYRAMID"]) > 0) then
				print("Pyramid has pyramid")
				hasPyramid = true
			end
		end
		if (hasPyramid) then
			local unit = player:GetUnitByID(unitID)
			for unit in player:Units() do
				if unit and unit:GetUnitType() == GameInfoTypes["UNIT_WORKER"] then
					print("pyramid adding mobility")
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_MOBILITY"], true)
					unit:ChangeMoves(1)
				end
            end
		end
	end
end
GameEvents.CityConstructed.Add(CheckPyramid);

LuaEvents.SerialEventUnitCreatedGood.Add(CheckPyramid);