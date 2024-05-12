-- Lua Script1
-- Author: thetr
-- DateCreated: 5/11/2024 3:58:47 PM
--------------------------------------------------------------
local function GrantScienceOnUnitKill(iKillingPlayer, iKilledPlayer, iUnitType)
    local pKillingPlayer = Players[iKillingPlayer]
    if pKillingPlayer:HasPolicy(GameInfoTypes["POLICY_IRON_FIST"]) then -- Added a closing parenthesis here
        local iTech = pKillingPlayer:GetCurrentResearch()
        if iTech > -1 then -- run only when something is being researched
            local iReward = GameInfo.Units[iUnitType].Combat
            iReward = math.floor(iReward * 2)
            local pTeamTech = Teams[pKillingPlayer:GetTeam()]:GetTeamTechs()
            pTeamTech:ChangeResearchProgress(iTech, iReward, pKillingPlayer:GetID())
			print("Iron Fist Science Gained:", iReward)
        end
    end
end

GameEvents.UnitKilledInCombat.Add(GrantScienceOnUnitKill)
