-- Dido_Commerce
-- Author: FramedArchitecture
-- DateCreated: 6/2014

--------------------------------------------------------------------
include("UA_Functions.lua")
--------------------------------------------------------------------
local bGnK = g_IsGnK
local bBNW = g_IsBNW
local didoID = -1
local didoTeamID = -1
--------------------------------------------------------------------
function OnPlayerDoTurn(playerID)
	if playerID ~= didoID then return end
	local player = Players[playerID]
	local gold = GetDidoTradeResourceGold(playerID)
	local culture = GetDidoTradeResourceCulture(playerID)
	if (gold > 0) then
		player:ChangeGold(bonus)
	end
	if (culture > 0) then
		player:ChangeJONSCulture(culture)
	end
end
--------------------------------------------------------------------
function OnCityFounded(playerID, x, y)
	if playerID ~= didoID then return end
	local player = Players[playerID]
	local trait = GetTraitInfo(player)
	if player and (GetTraitType(player) == "TRAIT_FA_DIDO") then
		local plot = Map.GetPlot(x, y)
		if plot and plot:IsCoastalLand() then
			DoCityClaimResources(playerID, plot, trait.ClaimFoundedResources)
		end
	end
end
--------------------------------------------------------------------
function Init()
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local player = Players[i]
		if player and (GetTraitType(player) == "TRAIT_FA_DIDO") then
			didoID = i
			didoTeamID = player:GetTeam()
			
			GameEvents.PlayerDoTurn.Add(OnPlayerDoTurn)
			GameEvents.PlayerCityFounded.Add(OnCityFounded)

			print("Dido_Commerce loaded")
			break;
		end
	end
end
--------------------------------------------------------------------
Init();


