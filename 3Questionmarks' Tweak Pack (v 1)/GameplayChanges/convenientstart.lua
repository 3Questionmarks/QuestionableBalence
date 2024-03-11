
function RemoveSuperSettlers(iPlayer)
	local turn = Game.GetElapsedGameTurns()
	if (turn == 1) then
		local pPlayer = Players[iPlayer]
		for unit in pPlayer:Units() do
			if (unit:GetUnitType() == GameInfoTypes["UNIT_SUPERSETTLER"]) then
				pSettler = pPlayer:InitUnit(GameInfoTypes["UNIT_SETTLER"], unit:GetX(), unit:GetY(), GameInfoTypes["UNITAI_SETTLE"], unit:GetFacingDirection())
                pSettler:SetEmbarked(unit:IsEmbarked())
				unit:Kill(false, -1)
			end
		end
	else
		if (turn > 1) then
			GameEvents.PlayerDoTurn.Remove(RemoveSuperSettlers)
		end
	end
end
GameEvents.PlayerDoTurn.Add(RemoveSuperSettlers)