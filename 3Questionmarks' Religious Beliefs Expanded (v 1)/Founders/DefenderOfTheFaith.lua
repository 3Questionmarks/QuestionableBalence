-- Defender Faith
-- Author: Machiavelli
-- DateCreated: 4/7/2013 1:17:47 PM
--------------------------------------------------------------

-- KNOWN LIMITATION:  Missionaries that already exist when the religion is founded will not be given the healing promotion (but it shouldn't be possible to get any missionaries before)
function DefenderFaith(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local player = Players[playerID];
	local unit = player:GetUnitByID(unitID);
	local eReligion = player:GetReligionCreatedByPlayer();

	-- Do not continue if the player has not founded a religion
	if(eReligion <= 0) then
		return;
	end
	-- Do not continue if this unit is not a Missionary, Inquisitor or Prophet
	if(unit:GetUnitClassType() ~= GameInfoTypes["UNITCLASS_MISSIONARY"] and unit:GetUnitClassType() ~= GameInfoTypes["UNITCLASS_INQUISITOR"] and unit:GetUnitClassType() ~= GameInfoTypes["UNITCLASS_PROPHET"]) then
		return;
	end

	-- Determine if the religion the player has founded has the belief
	local hasBelief = false;
	for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
		local belief = GameInfo.Beliefs[v];

		if (belief ~= nil and belief.ID == GameInfoTypes["BELIEF_DEFENDER_FAITH"]) then
			hasBelief = true;
		end
	end

	-- Don't continue if the religion doesn't have the belief
	if(not hasBelief) then
		return;
	end

	-- Give the great prophet the promotion
	unit:SetHasPromotion(GameInfoTypes["PROMOTION_DEFENDER_FAITH"], true);
end
LuaEvents.SerialEventUnitCreatedGood.Add(DefenderFaith);