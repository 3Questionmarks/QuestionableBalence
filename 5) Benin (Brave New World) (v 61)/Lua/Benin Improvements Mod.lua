print("Benin Scripts")

--Iya Heal
local IYA = GameInfoTypes.IMPROVEMENT_BENIN_MOD_IYA;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_BENIN_MOD) then
			for pUnit in pPlayer:Units() do
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) then
					if pUnit:IsCombatUnit() and not pUnit:IsEmbarked() then 
						local uPlot = pUnit:GetPlot()
						local uIya = 0;
						if (uPlot:GetImprovementType() == IYA) then
							uIya = 1;
						end
						for loop, direction in ipairs(directions) do
							local adjPlot = Map.PlotDirection(uPlot:GetX(), uPlot:GetY(), direction);
							if adjPlot then
								if (adjPlot:GetImprovementType() == IYA) then
									uIya = 1;
									break
								end
							end
						end
						if uIya >= 1 then
							if (pUnit:GetOwner() == uPlot:GetOwner()) then
								pUnit:ChangeDamage(-1 * math.min(pUnit:GetDamage(), 8));
							end
						end
					end
				end
			end
		end
	end
end)

-- Dummy Policy
local pBeninDefense = GameInfoTypes.POLICY_WALLS_OF_BENIN;

local iTechConstructrion = GameInfo.Technologies["TECH_CONSTRUCTION"].ID
local GRASS = GameInfoTypes.TERRAIN_GRASS
local PLAINS = GameInfoTypes.TERRAIN_PLAINS
local TUNDRA = GameInfoTypes.TERRAIN_TUNDRA

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_BENIN_MOD"]) then
			if pCity:IsCapital() then
				if not pPlayer:HasPolicy(pBeninDefense) then
					pPlayer:SetNumFreePolicies(1)
					pPlayer:SetNumFreePolicies(0)
					pPlayer:SetHasPolicy(pBeninDefense, true);
				end
			end
			-- AI Handicap
			if not (pPlayer:IsHuman()) then
				local pTeam = pPlayer:GetTeam();
				if Teams[pTeam]:IsHasTech(iTechConstructrion) then
					for loop, direction in ipairs(directions) do
						local cAdjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
						if cAdjPlot then
							if (Players[cAdjPlot:GetOwner()] == pPlayer) then
								if (cAdjPlot:GetImprovementType() == -1) and (cAdjPlot:GetFeatureType() == -1) and (cAdjPlot:GetResourceType() == -1) and not (cAdjPlot:IsHills()) and not (cAdjPlot:IsMountain()) and not (cAdjPlot:IsImpassable()) and not (cAdjPlot:IsWater()) then
									if (cAdjPlot:GetTerrainType() == PLAINS) or (cAdjPlot:GetTerrainType() == GRASS) or (cAdjPlot:GetTerrainType() == TUNDRA) then 
										cAdjPlot:SetImprovementType(IYA);
										break
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

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_BENIN_MOD"]) then
			if not pPlayer:HasPolicy(pBeninDefense) then
				pPlayer:SetNumFreePolicies(1)
				pPlayer:SetNumFreePolicies(0)
				pPlayer:SetHasPolicy(pBeninDefense, true);
			end
		end
	end
end)

--
GameEvents.TeamSetHasTech.Add(
function(iTeam, iTech, bAdopted) 
	if (iTech == iTechConstructrion) then
		local gPlayer = 0;
		local pTeam = 999;
		for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local pPlayer = Players[iPlayer]
			if (pPlayer:IsAlive()) then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_BENIN_MOD) and not (pPlayer:IsHuman()) then
					gPlayer = pPlayer;
					pTeam = pPlayer:GetTeam();
				end
			end
		end
		if pTeam == iTeam then
			if gPlayer ~= 0 then
				if Teams[pTeam]:GetAtWarCount(true) == 0 then
					local gcCity = gPlayer:GetCapitalCity();
					local AIIya = 2;
					local iRange = 2;
					for iDX = -iRange, iRange do
						for iDY = -iRange, iRange do
							local pTargetPlot = Map.PlotXYWithRangeCheck(gcCity:GetX(), gcCity:GetY(), iDX, iDY, iRange);
							if pTargetPlot then
								if (Players[pTargetPlot:GetOwner()] == gPlayer) then
									if (pTargetPlot:GetImprovementType() == -1) and (pTargetPlot:GetFeatureType() == -1) and (pTargetPlot:GetResourceType() == -1) and not (pTargetPlot:IsHills()) and not (pTargetPlot:IsMountain()) and not (pTargetPlot:IsImpassable()) and not (pTargetPlot:IsWater()) then
										if (pTargetPlot:GetTerrainType() == PLAINS) or (pTargetPlot:GetTerrainType() == GRASS) or (pTargetPlot:GetTerrainType() == TUNDRA) then 
											if AIIya > 0 then
												AIIya = AIIya - 1;		
												pTargetPlot:SetImprovementType(IYA);
											end
										end
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

--
local iFort = GameInfoTypes.IMPROVEMENT_FORT;

local fForest = GameInfoTypes.FEATURE_FOREST;
local fJungle = GameInfoTypes.FEATURE_JUNGLE;
local fMarsh = GameInfoTypes.FEATURE_MARSH;

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(x, y);
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_BENIN_MOD) and not (pPlayer:IsHuman()) then
		if eImprovement == iFort then
			if pPlot:GetOwner() == iPlayer then
				if (pPlot:GetTerrainType() == PLAINS) or (pPlot:GetTerrainType() == GRASS) or (pPlot:GetTerrainType() == TUNDRA) then 
					if not pPlot:IsHills() and not pPlot:IsMountain() and not pPlot:IsImpassable() and not pPlot:IsWater() and not pPlot:IsCity() then
						pPlot:SetImprovementType(-1);
						pPlot:SetImprovementType(IYA);
						if (pPlot:GetFeatureType() == fForest) or (pPlot:GetFeatureType() == fJungle) or (pPlot:GetFeatureType() == fMarsh) then
							pPlot:SetFeatureType(-1);
						end
					end
				end
			end
		end
	end
end)
