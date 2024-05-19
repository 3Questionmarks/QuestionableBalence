-- StonehengeChanges
-- Author: thetr
-- DateCreated: 5/17/2024 1:07:32 AM
--------------------------------------------------------------
function GrantFaithFromStonehenge(iPlayer, unitID)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		local hasStonehenge = false
		for pCity in player:Cities() do
			if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_STONEHENGE"]) > 0) then
				if (pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_STONEHENGE_FAITH_ADDED"]) < 1) then
					print("Stonehenge hasStonehenge")
					hasStonehenge = true
					local buildingID = GameInfoTypes.BUILDING_STONEHENGE_FAITH_ADDED
					pCity:SetNumRealBuilding(buildingID, 1)
				end
			end
		end
		if (hasStonehenge) then
			local faithAmount = 100
			if Game.GetGameSpeedType() == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
				faithAmount = 150
			elseif Game.GetGameSpeedType() == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
				faithAmount = 225
			elseif Game.GetGameSpeedType() == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
				faithAmount = 450
			end
			player:ChangeFaith(faithAmount)
			print("Stonehenge  " .. faithAmount .. " faith to player " .. playerID)
			GameEvents.PlayerDoTurn.Remove(GrantFaithFromStonehenge);
		end
	end
end
-- GameEvents.CityConstructed.Add(GrantFaithFromStonehenge);
GameEvents.PlayerDoTurn.Add(GrantFaithFromStonehenge);