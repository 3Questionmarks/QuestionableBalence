-- Defender Faith
-- Author: Machiavelli
-- DateCreated: 4/7/2013 1:17:47 PM
--------------------------------------------------------------

-- KNOWN LIMITATION:  Settlers that already exist when the religion is founded will not be given the healing promotion
function ReligiousSettle(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local player = Players[playerID];
	local unit = player:GetUnitByID(unitID);
	local eReligion = player:GetReligionCreatedByPlayer();

	-- Do not continue if the player has not founded a religion
	if(eReligion <= 0) then
		return;
	end
	-- Do not continue if this unit is not a Missionary or Inquisitor
	if(unit:GetUnitClassType() ~= GameInfoTypes["UNITCLASS_SETTLER"] and unit:GetUnitClassType() ~= GameInfoTypes["UNITCLASS_PIONEER"] and unit:GetUnitClassType() ~= GameInfoTypes["UNITCLASS_COLONIST"] and unit:GetUnitClassType() ~= GameInfoTypes["UNITCLASS_CONQUISTADOR"]) then
		return;
	end

	-- Determine if the religion the player has founded has the belief
	local hasBelief = false;
	for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
		local belief = GameInfo.Beliefs[v];

		if (belief ~= nil and belief.ID == GameInfoTypes["BELIEF_RELIGIOUS_SETTLEMENTS"]) then
			hasBelief = true;
		end
	end

	-- Don't continue if the religion doesn't have the belief
	if(not hasBelief) then
		return;
	end

	-- Give the great prophet the promotion
	unit:SetHasPromotion(GameInfoTypes["PROMOTION_RELIGIOUS_SETTLEMENTS"], true);
end
LuaEvents.SerialEventUnitCreatedGood.Add(ReligiousSettle);