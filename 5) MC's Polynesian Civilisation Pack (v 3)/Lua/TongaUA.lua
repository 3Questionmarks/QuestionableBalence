--TongaUA	
--Author: JFD
    function GetRandom(lower, upper)
        return Game.Rand((upper + 1) - lower, "") + lower
    end
     
    function JFD_Tonga(playerMetID, playerID)
            local player = Players[playerID]
            local playerMet = Players[playerMetID]
            local majorsMet = Teams[playerMet:GetTeam()]:GetHasMetCivCount(true)
            local reward
            if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_TONGA"] then
                    if playerMet:IsMinorCiv() then reward = 30 else reward = 60 end
                    if majorsMet == 1 then reward = reward * 2 end
           
                    local random = GetRandom(1, 4)
                    if random == 1 then
                            player:ChangeFaith(reward)

                            
                    elseif random == 2 then
                            player:ChangeJONSCulture(reward)
                           
                            
                    elseif random == 3 then
                            Teams[player:GetTeam()]:GetTeamTechs():ChangeResearchProgress(player:GetCurrentResearch(), reward, playerID)
                            
                            
                    else
                            player:ChangeGold(reward)
                            
                            
                    end
            end
    end
    GameEvents.TeamMeet.Add(JFD_Tonga)

function InitTonga(player)
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		 if player:GetCivilizationType() == GameInfoTypes["POLICY_TONGA_UA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_TONGA_UA"]) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_TONGA_UA"], true)	
			end
			
		end
	end 
end


	Events.LoadScreenClose.Add(InitTonga)
