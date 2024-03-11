print ("Benin Check")

local BeninID = GameInfoTypes.CIVILIZATION_BENIN_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == BeninID then
			include("Benin Improvements Mod")
			break;
		end
	end
end

-- Isienmwenro

local uBeninUU = GameInfoTypes.UNIT_BENIN_QUEEN_MOD;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then
		if Teams[pTeam]:GetAtWarCount(true) ~= 0 then
			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitType() == uBeninUU then
					local uPlot = pUnit:GetPlot();
					for loop, direction in ipairs(directions) do
						local adjPlot = Map.PlotDirection(uPlot:GetX(), uPlot:GetY(), direction);
						if adjPlot:IsUnit() then
							local adjUnit = adjPlot:GetUnit(i);
							local adjPlayer = Players[adjUnit:GetOwner()];
							local adjTeam = adjPlayer:GetTeam();
							if (adjUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) then
								if adjUnit:IsCombatUnit() and not adjUnit:IsEmbarked() then 
									if Teams[pTeam]:IsAtWar(adjTeam) then
										local max = pUnit:MaxMoves();
										pUnit:SetMoves(max + 60);
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)