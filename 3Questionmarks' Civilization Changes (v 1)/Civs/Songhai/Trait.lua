-- Askia_Chronicle
-- Author: FramedArchitecture
-- DateCreated: 6/2014
--------------------------------------------------------------------
include("UA_Functions.lua")
--------------------------------------------------------------------
local bGnK = g_IsGnK
local bBNW = g_IsBNW
local oceanMin = GameDefines["LAKE_MAX_AREA_SIZE"] + 1
local askiaID = -1
local askiaTeamID = -1
--------------------------------------------------------------------
function OnPlayerDoTurn(playerID)
	if playerID ~= askiaID then return end

	local player = Players[playerID]
	local trait = GetTraitInfo(player)
	if trait and trait.FaithToScienceTech then
		if IsPlayerHasTech(player, trait.FaithToScienceTech) then
			if bGnK or bBNW then
				ConvertCapitalFaithToScience(playerID)
			end
		end
	end
end
--------------------------------------------------------------------
function OnCityFounded(playerID, x, y)
	if playerID ~= askiaID then return end
	
	local player = Players[playerID]
	local trait = GetTraitInfo(player)
	if trait and trait.FreeLandlockedBuilding then
		local city = Map.GetPlot(x, y):GetPlotCity()
		if city and not city:IsCoastal(oceanMin) then
			city:SetNumRealBuilding(GameInfoTypes[trait.FreeLandlockedBuilding], 1);
		end
	end
end
--------------------------------------------------------------------
function ConvertCapitalFaithToScience(playerID)
	local player = Players[playerID]
	local techID = player:GetCurrentResearch()
	if techID ~= -1 then
		local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
		local bonus = GetAskiaCapitalFaithToScience(playerID)
		if (bonus > 0) then
			teamTechs:ChangeResearchProgress(techID, bonus, playerID)
		end
	end
end
--------------------------------------------------------------------
function Init()
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local player = Players[i]
		if player and (GetTraitType(player) == "TRAIT_FA_ASKIA") then
			askiaID = i
			askiaTeamID = player:GetTeam()
			
			GameEvents.PlayerDoTurn.Add(OnPlayerDoTurn)
			GameEvents.PlayerCityFounded.Add(OnCityFounded)

			print("Askia_Chronicle loaded")
			break;
		end
	end
end
--------------------------------------------------------------------
Init();

