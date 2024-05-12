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
        for city in player:Cities() do
            local unit = player:InitUnit(GameInfoTypes["UNIT_FRENCH_FOREIGNLEGION"], city:GetX(), city:GetY())
        end
    end
end