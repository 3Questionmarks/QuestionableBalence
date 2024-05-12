-- UA_Functions
-- Author: FramedArchitecture
-- DateCreated: 5/1/2014
--------------------------------------------------------------------
include("Serializer.lua");
include("PlotIterators.lua");
include("FLuaVector");
--------------------------------------------------------------------
g_IsGnK			= ContentManager.IsActive("0E3751A1-F840-4e1b-9706-519BF484E59D", ContentType.GAMEPLAY);
g_IsBNW			= ContentManager.IsActive("6DA07636-4123-4018-B643-6575B4EC336B", ContentType.GAMEPLAY); 
g_Properties	= {}
--------------------------------------------------------------------
--JFD_TopPanelIncludes
--------------------------------------------------------------------
function GetAskiaCapitalFaithToScience(playerID)
	local bonus = 0
	local capital = Players[playerID]:GetCapitalCity()
	if capital then
		bonus = capital:GetFaithPerTurn()
	end
	return bonus
end
--------------------------------------------------------------------
function GetDidoTradeResourceGold(playerID)
	local bonus = 0
	local player = Players[playerID]
	local trait = GetTraitInfo(player)
	if trait and (trait.TradedResourceGoldPerTurn > 0) then
		local rate = trait.TradedResourceGoldPerTurn
		for row in GameInfo.Resources() do
			local resourceID = row.ID;
			if (player:GetResourceExport(resourceID) > 0) then
				bonus = bonus + rate
			end
			if (player:GetResourceImport(resourceID) > 0) then
				bonus = bonus + rate
			end
		end
	end
	return bonus
end
--------------------------------------------------------------------
function GetDidoTradeResourceCulture(playerID)
	local bonus = 0
	local player = Players[playerID]
	for row in GameInfo.Resources() do
		local resourceID = row.ID;
		if (player:GetResourceExport(resourceID) > 0) then
			bonus = bonus + 1
		end
		if (player:GetResourceImport(resourceID) > 0) then
			bonus = bonus + 1
		end
	end
	return bonus
end
--------------------------------------------------------------------
function GetGlorianaGoldenAgePoints(playerID)
	local bonus = 0
	local player = Players[playerID]
	local buildingID01 = GameInfoTypes["BUILDING_FA_GLORIANA01"]
	local buildingID02 = GameInfoTypes["BUILDING_FA_GLORIANA02"]
	local GetGAPoints = function(buildingID)
		return GameInfo.Buildings[buildingID].GAPointsPerTurn
	end
	for city in player:Cities() do
		if city:IsHasBuilding(buildingID01) then
			bonus = bonus + GetGAPoints(buildingID01)
		elseif city:IsHasBuilding(buildingID02) then
			bonus = bonus + GetGAPoints(buildingID02)
		end
	end
	return bonus
end
--------------------------------------------------------------------
function GetGlorianaGoldenAgeTooltip()
	return Locale.ConvertTextKey("TXT_KEY_GLORIANA_GOLDEN_AGE_TT")
end
--------------------------------------------------------------------
function GetSakokuInternalTradeScience(playerID)
	local bonus = 0
	for _,v in ipairs(Players[playerID]:GetTradeRoutes()) do
		if (v.ToProduction > 0) then
			bonus = bonus + v.ToProduction
		elseif (v.ToFood > 0) then
			bonus = bonus + v.ToFood
		end
	end
	if (bonus > 0) then
		bonus = math.floor(bonus / 100)
	end
	return bonus
end
--------------------------------------------------------------------
-- player
--------------------------------------------------------------------
function IsTraitPlayer(player)
	return not player:IsBarbarian() and not player:IsMinorCiv() and player:IsAlive()
end
--------------------------------------------------------------------
function GetTraitInfo(player)
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type;
	for row in GameInfo.Leader_Traits( "LeaderType ='" .. leaderType .. "'" ) do
		return GameInfo.Traits[row.TraitType]
	end
	return nil;
end
--------------------------------------------------------------------
function GetTraitType(player)
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type;
	for row in GameInfo.Leader_Traits( "LeaderType ='" .. leaderType .. "'" ) do
		return row.TraitType
	end
	return nil;
end
--------------------------------------------------------------------
function IsPlayerHasTech(player,techType)
	return Teams[player:GetTeam()]:IsHasTech(GameInfoTypes[techType])
end
--------------------------------------------------------------------
function GetCivID(civType)
	local civInfo = GameInfo.Civilizations[civType];
	if civInfo then
		return civInfo.ID;
	else
		return -1;
	end
end
--------------------------------------------------------------------
-- team
--------------------------------------------------------------------
function GetPlayerIDsFromTeamID(teamID)
	local playerIDs = {}
	for i = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local player = Players[i]
		if player and (player:GetTeam() == teamID) then
			playerIDs[i] = true;
		end
	end
	return playerIDs;
end
--------------------------------------------------------------------
-- plot
--------------------------------------------------------------------
function RevealPlotAndAdjacent(plot, teamID)
	plot:SetRevealed(teamID, true);
	local x, y = plot:GetX(), plot:GetY()
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(x, y, i);
		if adjPlot then
			adjPlot:SetRevealed(teamID, true);
		end
	end
end
--------------------------------------------------------------------
function DoCityClaimResources(playerID, cityplot, radius)
	local teamID = Players[playerID]:GetTeam()
	local cityID = cityplot:GetPlotCity():GetID()
	for plot in PlotAreaSpiralIterator(cityplot, radius, SECTOR_NORTH, true, false, false) do
		if (plot:GetOwner() == -1) then
			if (plot:GetResourceType(teamID) >= 0) then
				plot:SetOwner(playerID, cityID, false, true)
			end
		end
	end
end
--------------------------------------------------------------------
function DoCityClaimFeatures(playerID, cityplot, featureID)
	local teamID = Players[playerID]:GetTeam()
	local cityID = cityplot:GetPlotCity():GetID()
	for plot in PlotAreaSpiralIterator(cityplot, 3, SECTOR_NORTH, true, false, false) do
		if (plot:GetOwner() == -1) then
			if (plot:GetFeatureType() == featureID) and plot:IsAdjacentOwned() then
				plot:SetOwner(playerID, cityID, false, true)
			end
		end
	end
end
--------------------------------------------------------------------
function EventPlotHighlight(plot)
	Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY())), true, Vector4( 1.0, 1.0, 0.0, 1.0 ))
end
--------------------------------------------------------------------
-- savedata
--------------------------------------------------------------------
local saveData	= Modding.OpenSaveData();
--------------------------------------------------------------------
function GetPersistentTable(name)
	if (g_Properties[name] == nil) then
		local code = saveData.GetValue(name);
		if code then
			g_Properties[name] = loadstring(code)();
		else
			g_Properties[name] = {}
		end
	end
	return g_Properties[name];
end
--------------------------------------------------------------------
function SetPersistentTable(name, t)
    saveData.SetValue(name, serialize(t))
	g_Properties[name] = t;
end
--------------------------------------------------------------------
function GetPersistentProperty(name)
	if (g_Properties[name] == nil) then
		g_Properties[name] = saveData.GetValue(name);
	end
	return g_Properties[name];
end
--------------------------------------------------------------------
function SetPersistentProperty(name, value)
	saveData.SetValue(name, value);
	g_Properties[name] = value;
end
--------------------------------------------------------------------