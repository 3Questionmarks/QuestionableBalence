-- Baptism
-- Author: Machiavelli
-- DateCreated: 4/4/2013 10:07:32 PM
--------------------------------------------------------------
function Baptism(hexX, hexY, population, citySize)
	local plot = Map.GetPlot(ToGridFromHex(hexX, hexY));
	local city = plot:GetPlotCity();
	local player = Players[city:GetOwner()];
	local eReligion = player:GetReligionCreatedByPlayer();

	-- Do not continue if any of the following are true:
	-- (1) Player has not founded a religion
	-- (2) City is not the religion the player has founded
	-- (3) City is not becoming larger than ever before
	if(eReligion <= 0 or eReligion ~= city:GetReligiousMajority() or city:GetHighestPopulation() > population) then
		return;
	end

	-- Determine if the religion the player has founded has the belief
	local hasBelief = false;
	for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
		local belief = GameInfo.Beliefs[v];

		if (belief ~= nil and belief.ID == GameInfoTypes["BELIEF_BAPTISM"]) then
			hasBelief = true;
		end
	end

	-- Don't continue if the religion doesn't have the belief
	if(not hasBelief) then
		return;
	end

	-- Get the number of total cities following this religion
	local totalCities = Game.GetNumCitiesFollowing(eReligion);
	--local domesticCities = 0;
	--local foreignCities = 0;
	-- Count the number of domestic cities that follow eReligion
	--for indexCity in player:Cities() do
	--	if(indexCity:GetReligiousMajority() == eReligion) then
	--		domesticCities = domesticCities + 1;
	--	end
	--end
	--foreignCities = totalCities - domesticCities;

	-- Give the production
	local bonusProduction = 5 * totalCities;
	-- Adjust the size of the bonus based on the game speed
	local speedProductionPercent = GameInfo.GameSpeeds[Game:GetGameSpeedType()].ConstructPercent;
	local adjustedBonusProduction = (bonusProduction * speedProductionPercent) / 100;
	-- Give the bonus production
	if(city:IsProduction()) then
		city:ChangeProduction(adjustedBonusProduction);
	else
		city:SetOverflowProduction(city:GetOverflowProduction() + adjustedBonusProduction);
	end

	-- Send a notification to the player
	local text = Locale.ConvertTextKey("TXT_KEY_BAPTISM_NOTIFICATION_BODY", city:GetName(), tostring(adjustedBonusProduction));
	local header = Locale.ConvertTextKey("TXT_KEY_BAPTISM_NOTIFICATION_HEADING", city:GetName());
	player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, header);
end
Events.SerialEventCityPopulationChanged.Add(Baptism);