-- TajMahalChanges
-- Author: thetr
-- DateCreated: 5/19/2024 1:23:31 PM
--------------------------------------------------------------
function CheckTajMahal(playerID, unitID, unitType, civID)
	local player = Players[playerID];
	local unit = player:GetUnitByID(unitID);
	-- Only continue if the unit is a great artist, Musician, or Writer
	 -- Only continue if the unit is a great person
    if unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_ARTIST"] or 
       unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_MUSICIAN"] or 
       unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_WRITER"] or 
       unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SCIENTIST"] or 
       unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_MERCHANT"] or 
       unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_ENGINEER"] or 
       unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_GREAT_GENERAL"] or 
       unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_GREAT_ADMIRAL"] or 
       unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_PROPHET"] then
		print("TajMahal is a great person")
		-- Determine if player has the TajMahal
		local hasTajMahal = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_TAJ_MAHAL"]) > 0) then
				print("Player has the Taj Mahal")
				hasTajMahal = true
			end
		end

		-- Don't continue if they dont have Tajmahal
		if(not hasTajMahal) then
			print("Player doesn't have the Taj Mahal")
			return;
		end

		-- Give the golden age points
		print("Giving player taj mahal golden age points")
		local bonus = 200;
		player:ChangeGoldenAgeProgressMeter(bonus)

		-- Send a notification to the player
		local text = Locale.ConvertTextKey("TXT_KEY_TAJ_MAHAL_GP_BODY", unit:GetName(), tostring(bonus));
		local header = Locale.ConvertTextKey("TXT_KEY_TAJ_MAHAL_GP_HEADER");
		player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, header);
	end
end
LuaEvents.SerialEventUnitCreatedGood.Add(CheckTajMahal)