-- Fort Training
-- Author: Labby
-- DateCreated: 7/16/2014 7:52:11 PM
--------------------------------------------------------------
function FortTraining(PlayerID)
	local pPlayer = Players[PlayerID]
	--local fortXP = 0
	--if Teams[pPlayer:GetTeam()]:GetTeamTechs():HasTech(GameInfoTypes.TECH_BRONZE_WORKING) then fortXP = fortXP + 15 end
	--if Teams[pPlayer:GetTeam()]:GetTeamTechs():HasTech(GameInfoTypes.TECH_STEEL) then fortXP = fortXP + 15 end
	--if Teams[pPlayer:GetTeam()]:GetTeamTechs():HasTech(GameInfoTypes.TECH_MILITARY_SCIENCE) then fortXP = fortXP + 15 end
	--if pPlayer:HasPolicy(GameInfoTypes.POLICY_TOTAL_WAR) then fortXP = fortXP + 15 end
	--for pCity in pPlayer:Cities() do
	--	if pCity:IsHasBuilding(GameInfoTypes.BUILDING_BRANDENBURG_GATE) then fortXP = fortXP +15 end
	--end
  	for pUnit in pPlayer:Units() do
		local pPlot = pUnit:GetPlot()
		if  pUnit:GetBaseCombatStrength() ~= 0 
			--and pUnit:GetExperience() < fortXP
			and not pPlot:IsImprovementPillaged() 
			and pPlot:GetOwner() == pUnit:GetOwner() 
			and pPlot:IsBeingWorked() then
			if Game.GetGameSpeedType() > 1 or Game.GetElapsedGameTurns() % 2 == 0 then
				if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FORT then
					pUnit:ChangeExperience(3)
				elseif pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_KASBAH then
					pUnit:ChangeExperience(3)
				elseif pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CL_KALLE then
					pUnit:ChangeExperience(3)
				elseif pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_DZONG then
					pUnit:ChangeExperience(3)
				elseif pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_DZONG2 then
					pUnit:ChangeExperience(6)
				elseif pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_BENIN_MOD_IYA then
					pUnit:ChangeExperience(6)
				elseif pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_MC_MAORI_PA then
					pUnit:ChangeExperience(6)
				elseif pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CITADEL then
					pUnit:ChangeExperience(6)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FortTraining)
