-- Warrior Monks
-- Author: Machiavelli
-- DateCreated: 4/7/2013 1:39:54 PM
--------------------------------------------------------------

-- KNOWN LIMITATION:  units that already exist will not be given the promotion because there is no easy non-polling way to detect when a religion is founded or enhanced
-- Give the promotion to newly produced military units
function WarriorMonks(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local player = Players[playerID];
	local unit = player:GetUnitByID(unitID);
	local plot = unit:GetPlot();

	-- Do not continue if the unit is not a military unit
	if(unit:GetBaseCombatStrength() <= 0) then
		return;
	end

	-- Do not continue if the plot the unit is on is not a city
	if(not plot:IsCity()) then
		return;
	end
	local city = plot:GetPlotCity();
	-- Only continue if the city has a majority religion
	if(city:GetReligiousMajority() <= 0) then
		return;
	end
	local eReligion = city:GetReligiousMajority();

	-- Determine if the religion has the belief
	local hasBelief = false;
	for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
		local belief = GameInfo.Beliefs[v];

		if (belief ~= nil and belief.ID == GameInfoTypes["BELIEF_HOLY_WARRIORS"]) then
			hasBelief = true;
		end
	end

	-- Don't continue if the religion doesn't have the belief
	if(not hasBelief) then
		return;
	end

	-- Give the unit the promotion
	unit:SetHasPromotion(GameInfoTypes["PROMOTION_WARRIOR_MONKS"], true);
end
LuaEvents.SerialEventUnitCreatedGood.Add(WarriorMonks);