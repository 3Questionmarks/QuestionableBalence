-- VolunteerArmy
-- Author: thetr
-- DateCreated: 5/12/2024 12:35:55 AM
--------------------------------------------------------------

function VolunteerArmyAdopted(playerID, policyID)
	local player = Players[playerID]
	if (policyID == GameInfo.Policies["POLICY_THEIR_FINEST_HOUR"].ID) then
		VolunteerArmySpawn(playerID)
	end
end
GameEvents.PlayerAdoptPolicy.Add(VolunteerArmyAdopted)

function VolunteerArmySpawn(playerID)
    local player = Players[playerID]
    if player and player:IsAlive() then
		local currentEra = player:GetCurrentEra()
        local unitType = nil
		if currentEra == GameInfoTypes["ERA_ANCIENT"] then
            unitType = GameInfoTypes["UNIT_SPEARMAN"]
        elseif currentEra == GameInfoTypes["ERA_CLASSICAL"] then
            unitType = GameInfoTypes["UNIT_SWORDSMAN"]
        elseif currentEra == GameInfoTypes["ERA_MEDIEVAL"] then
            unitType = GameInfoTypes["UNIT_GERMAN_LANDSKNECHT"]
        elseif currentEra == GameInfoTypes["ERA_RENAISSANCE"] then
            unitType = GameInfoTypes["UNIT_FORRIEGN_BATTALION"]
        elseif currentEra == GameInfoTypes["ERA_INDUSTRIAL"] then
            unitType = GameInfoTypes["UNIT_RIFLEMAN"]
        elseif currentEra == GameInfoTypes["ERA_MODERN"] then
            unitType = GameInfoTypes["UNIT_FRENCH_FOREIGNLEGION"]
		elseif currentEra == GameInfoTypes["ERA_POSTMODERN"] then
            unitType = GameInfoTypes["UNIT_MARINE"]
		elseif currentEra == GameInfoTypes["ERA_FUTURE"] then
            unitType = GameInfoTypes["UNIT_SPECIAL_FORCES"]
		end

		if unitType then
			for city in player:Cities() do
				local unit = player:InitUnit(unitType, city:GetX(), city:GetY())
			end
        end
    end
end