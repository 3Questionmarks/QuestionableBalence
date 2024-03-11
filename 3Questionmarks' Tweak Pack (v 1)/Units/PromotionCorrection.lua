local RangedP = {GameInfoTypes.PROMOTION_BARRAGE_1, GameInfoTypes.PROMOTION_BARRAGE_2, GameInfoTypes.PROMOTION_BARRAGE_3, GameInfoTypes.PROMOTION_ACCURACY_1, GameInfoTypes.PROMOTION_ACCURACY_2, GameInfoTypes.PROMOTION_ACCURACY_3, GameInfoTypes.PROMOTION_RANGE, GameInfoTypes.PROMOTION_INDIRECT_FIRE }
local MeleeP = {GameInfoTypes.PROMOTION_DRILL_1, GameInfoTypes.PROMOTION_DRILL_2, GameInfoTypes.PROMOTION_DRILL_3, GameInfoTypes.PROMOTION_SHOCK_1, GameInfoTypes.PROMOTION_SHOCK_2, GameInfoTypes.PROMOTION_SHOCK_3, GameInfoTypes.PROMOTION_EFLANK, GameInfoTypes.PROMOTION_BRIBE_M }
local numP = 7;
local UCmelee = {}
UCmelee[GameInfoTypes.UNITCOMBAT_MELEE] = true;
UCmelee[GameInfoTypes.UNITCOMBAT_ARMOR] = true;
UCmelee[GameInfoTypes.UNITCOMBAT_MOUNTED] = true;
UCmelee[GameInfoTypes.UNITCOMBAT_GUN] = true;
local UCranged = {}
UCranged[GameInfoTypes.UNITCOMBAT_ARCHER] = true;
UCranged[GameInfoTypes.UNITCOMBAT_SIEGE] = true;

Events.SerialEventUnitCreated.Add(function(player, unit, hexVec, unitType)
	local bUnit = Players[player]:GetUnitByID(unit);
	if bUnit then
		DoValidPromotion(bUnit, bUnit:GetUnitCombatType())
	end
end)

function DoValidPromotion(iUnit, cType)
	if UCranged[cType] then
		for i = 1, numP do
			if iUnit:IsHasPromotion(MeleeP[i]) then
				iUnit:SetHasPromotion(MeleeP[i], false);
				iUnit:SetHasPromotion(RangedP[i], true);
			end
		end
	elseif UCmelee[cType] then
		for i = 1, numP do
			if iUnit:IsHasPromotion(RangedP[i]) then
				iUnit:SetHasPromotion(RangedP[i], false);
				iUnit:SetHasPromotion(MeleeP[i], true);
			end
		end
	end
end