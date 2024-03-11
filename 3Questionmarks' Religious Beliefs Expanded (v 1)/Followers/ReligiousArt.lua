-- Religious Art
-- Author: Machiavelli
-- DateCreated: 9/22/2013 9:50:35 PM
--------------------------------------------------------------
function GreatArtistBorn(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local player = Players[playerID];
	local unit = player:GetUnitByID(unitID);
	local plot = unit:GetPlot();
	local city = plot:GetPlotCity();

	-- Only continue if the unit is a great artist, Musician, or Writer
	if((unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_ARTIST"] or unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_MUSICIAN"] or unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_WRITER"]) and plot:IsCity() and city:GetReligiousMajority() >= 1) then
		local eReligion = city:GetReligiousMajority();
		
		-- Determine if the religion the player has founded has the belief
		local hasBelief = false;
		for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
			local belief = GameInfo.Beliefs[v];

			if (belief ~= nil and belief.ID == GameInfoTypes["BELIEF_RELIGIOUS_ART"]) then
				hasBelief = true;
			end
		end

		-- Don't continue if the religion doesn't have the belief
		if(not hasBelief) then
			return;
		end

		-- Give the golden age points
		local bonus = 300;
		player:ChangeGoldenAgeProgressMeter(bonus)

		-- Send a notification to the player
		local text = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_ART_BODY", unit:GetName(), tostring(bonus));
		local header = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_ART_HEADER");
		player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, header);
	end
end
LuaEvents.SerialEventUnitCreatedGood.Add(GreatArtistBorn);