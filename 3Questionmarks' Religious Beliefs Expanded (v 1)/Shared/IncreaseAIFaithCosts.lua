-- IncreaseAIFaithCosts
-- Author: ???
-- DateCreated: 2/25/2024 12:23:46 PM
--------------------------------------------------------------

function GrantAI_faith_policy()
	if Game.GetElapsedGameTurns() == 0 then
		for iPlayer=0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local pPlayer = Players[iPlayer];
			if pPlayer:IsEverAlive() then 
				if (not pPlayer:IsHuman()) then
					pPlayer:SetNumFreePolicies(1)
					pPlayer:SetNumFreePolicies(0)
					pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DUMMY_AI_FAITHCOSTS, true)
				end
			end
		end
	end
end

Events.ActivePlayerTurnEnd.Add(GrantAI_faith_policy)