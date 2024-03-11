print("This is the 'Global - XP For Scouting' mod script.")

--[[
  This is an example, it could just as easily be used to give culture from revealed tiles
  or faith from religious units in foreign lands, or gold from resources, or xp for ships from ice, or ...
]]--

-- How many scouting XPs in a real XP
local iScoutingXpDivisor = 20

-- Scouting XP awarded for being the first to reveal a tile
local iScoutingXpForTile = 1

-- Scouting XP awarded for being the first to reveal a Natural Wonder
local iScoutingXpForNW = iScoutingXpDivisor * 5

-- How many scouting XPs we have to accumulate before real XPs are awarded, this should be a multiple of iScoutingXpDivisor
local iScoutingXpAccumulated = iScoutingXpDivisor * 2

-- XP limit for scouting
local iScoutingXpLimit = 9999


--
-- Nothing below this line should need changing
--

local iXpForScoutingPromotion = GameInfoTypes.PROMOTION_XP_FOR_SCOUTING
local iMaxMajor = GameDefines.MAX_MAJOR_CIVS-1


--
-- Scouting XP cache helpers
--

local modDB = Modding.OpenSaveData()
local cachedScoutingXp = {}

function GetKey(iPlayer, iUnit)
	return string.format("SCOUTING_XP_%i_%i", iPlayer, iUnit)
end

function GetScoutingXp(iPlayer, iUnit)
	if (cachedScoutingXp[iPlayer] == nil) then
		cachedScoutingXp[iPlayer] = {}
	end
	
	if (cachedScoutingXp[iPlayer][iUnit] == nil) then
		cachedScoutingXp[iPlayer][iUnit] = (modDB.GetValue(GetKey(iPlayer, iUnit)) or 0)
	end
	
	return cachedScoutingXp[iPlayer][iUnit]
end

function SetScoutingXp(iPlayer, iUnit, iXp, bCommit)
	cachedScoutingXp[iPlayer][iUnit] = iXp
	
	if (bCommit) then
		-- Calls to modDB are expensive,
		-- so we save them all up to the movement onto the tile
		-- as opposed to when every tile is revealed
		modDB.SetValue(GetKey(iPlayer, iUnit), iXp)
	end
end

function ChangeScoutingXp(iPlayer, iUnit, iXp)
	SetScoutingXp(iPlayer, iUnit, GetScoutingXp(iPlayer, iUnit) + iXp, false)
end

function UpdateScoutingXp(iPlayer, iUnit)
	local iScoutingXp = GetScoutingXp(iPlayer, iUnit)
	
	if (iScoutingXp >= iScoutingXpAccumulated) then
		local pUnit = Players[iPlayer]:GetUnitByID(iUnit)
		local iRealXp = math.floor(iScoutingXp / iScoutingXpDivisor)
		
		pUnit:ChangeExperience(math.max(0, math.min(iRealXp, iScoutingXpLimit - pUnit:GetExperience())))
		
		if (pUnit:GetExperience() >= iScoutingXpLimit) then
			pUnit:SetHasPromotion(iXpForScoutingPromotion, false)
			iScoutingXp = 0
		else
			iScoutingXp = iScoutingXp - (iRealXp * iScoutingXpDivisor)
		end
	end
	
	SetScoutingXp(iPlayer, iUnit, iScoutingXp, true)
end

function OnUnitSetXY(iPlayer, iUnit, iX, iY)
	if (iPlayer >= 0 and iPlayer <= iMaxMajor) then
		if (Players[iPlayer]:GetUnitByID(iUnit):IsHasPromotion(iXpForScoutingPromotion)) then
			UpdateScoutingXp(iPlayer, iUnit)
		end
	end
end
GameEvents.UnitSetXY.Add(OnUnitSetXY)

function OnUnitPrekill(iPlayer, iUnit, _, _, _, bDelay, _)
	if (not bDelay and GetScoutingXp(iPlayer, iUnit) ~= 0) then
		SetScoutingXp(iPlayer, iUnit, 0, true)
	end
end
GameEvents.UnitPrekill.Add(OnUnitPrekill)


--
-- Tile reveal event handlers
--

function OnTileRevealed(iPlotX, iPlotY, iTeam, iFromTeam, bFirst, iPlayer, iUnit)
	-- if (bFirst and iPlayer >= 0 and iPlayer <= iMaxMajor) then
	if (iPlayer >= 0 and iPlayer <= iMaxMajor) then
		if (Players[iPlayer]:GetUnitByID(iUnit):IsHasPromotion(iXpForScoutingPromotion)) then
			local pPlot = Map.GetPlot(iPlotX, iPlotY)
			
			-- Only land or lakes, but not NWs (as they are handled below)
			if (((not pPlot:IsWater()) or pPlot:IsLake()) and (not pPlot:IsNaturalWonder())) then
				ChangeScoutingXp(iPlayer, iUnit, iScoutingXpForTile)
			end
		end
	end
end
GameEvents.TileRevealed.Add(OnTileRevealed)

function OnNaturalWonderDiscovered(iTeam, iFeature, iX, iY, bFirst, iPlayer, iUnit)
	if (bFirst and iPlayer >= 0 and iPlayer <= iMaxMajor) then
		if (Players[iPlayer]:GetUnitByID(iUnit):IsHasPromotion(iXpForScoutingPromotion)) then
			ChangeScoutingXp(iPlayer, iUnit, iScoutingXpForNW)
		end
	end
end
GameEvents.NaturalWonderDiscovered.Add(OnNaturalWonderDiscovered)
