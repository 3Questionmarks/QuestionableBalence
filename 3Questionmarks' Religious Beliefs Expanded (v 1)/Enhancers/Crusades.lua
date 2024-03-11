-- Crusades
-- Author: Machiavelli
-- DateCreated: 8/14/2012 6:59:10 PM
--------------------------------------------------------------
function Crusades(hexPos, playerID, cityID, newPlayerID)
	local player = Players[newPlayerID];
	local eReligion = player:GetReligionCreatedByPlayer();
	local plot = Map.GetPlot(ToGridFromHex(hexPos.x, hexPos.y));
	local city = plot:GetPlotCity();
	
	if(eReligion < 1) then
		return;
	end

	-- Does the new religion have the belief
	local hasBelief = false;

	for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
		local belief = GameInfo.Beliefs[v];

		if (belief ~= nil and belief.ID == GameInfoTypes["BELIEF_JUST_WAR"]) then
			hasBelief = true;
		end
	end

	-- Only run this if the player's enhancer belief is crusades, the city has a religion, and the city is of a different religion
	if (hasBelief and plot:IsCity() and 0 < city:GetReligiousMajority() and eReligion ~= city:GetReligiousMajority()) then
		-- Convert the heathens
		city:ConvertPercentFollowers(eReligion, city:GetReligiousMajority(), 75);

		-- Give bonus Faith
		local bonusFaith = 250;
		local adjustedBonusFaith = (bonusFaith * GameInfo.GameSpeeds[Game:GetGameSpeedType()].FaithPercent) / 100; -- Adjust the size of the bonus based on the game speed
		player:ChangeFaith(adjustedBonusFaith);

		-- Send a notification to the player
		local text = Locale.ConvertTextKey("TXT_KEY_CRUSADE_NOTIFICATION_BODY", tostring(adjustedBonusFaith), city:GetName());
		local header = Locale.ConvertTextKey("TXT_KEY_CRUSADE_NOTIFICATION_HEADING");
		player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, header);
	end
end
Events.SerialEventCityCaptured.Add(Crusades);