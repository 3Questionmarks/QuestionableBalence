-- Religious Converts
-- Author: Machiavelli
-- DateCreated: 6/7/2013 7:34:18 PM
--------------------------------------------------------------
function ReligiousConverts(iOwner, iX, iY, eOldReligion, eNewReligion, bFirstConversion)
	-- If this isn't the first conversion, don't continue
	if(not bFirstConversion) then
		return;
	end

	local plot = Map.GetPlot(iX, iY);
	local city = plot:GetPlotCity();

	-- Does the new religion of the city have the belief
	local hasBelief = false;
	for i,v in ipairs(Game.GetBeliefsInReligion(eNewReligion)) do
		local belief = GameInfo.Beliefs[v];

		if (belief ~= nil and belief.ID == GameInfoTypes["BELIEF_INITIATION_RITES"]) then
			hasBelief = true;
		end
	end

	-- Don't continue if the religion doesn't have the belief
	if(not hasBelief) then
		return;
	end

	-- Find the founding player
	local founderID = Game.GetFounder(eNewReligion, -1);
	local founder = Players[founderID];

	-- Error checks
	if(founder == nil or not founder:IsAlive()) then
		return;
	end
	
	-- If the founder of the religion owns the city, give the extra pop in the city, otherwise give the extra pop in the capital
	if(founderID == iOwner) then
		-- Give population
		city:ChangePopulation(1, true);

		-- Send notification
		local header = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_CONVERTS_HEADER", city:GetName());
		local text = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_CONVERTS_BODY", city:GetName());

		founder:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, header);
	elseif(founderID ~= iOwner and founder:GetCapitalCity() ~= nil) then
		-- Give population
		founder:GetCapitalCity():ChangePopulation(1, true);

		-- Send notification
		local header = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_CONVERTS_HEADER", founder:GetCapitalCity():GetName());
		local text = Locale.ConvertTextKey("TXT_KEY_RELIGIOUS_CONVERTS_BODY_CAPITAL", city:GetName());

		founder:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, header);
	end
end
LuaEvents.CityAdoptsReligionEvent.Add(ReligiousConverts);