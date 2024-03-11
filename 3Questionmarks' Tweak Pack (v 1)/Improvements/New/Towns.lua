-- Dynamic Towns
-- Author: Azaquor
-- Special Thanks: TofuSojo
-- DateCreated: 2/21/2023 5:45:06 PM
--------------------------------------------------------------
local Village = GameInfoTypes.IMPROVEMENT_TRADING_POST
local Town = GameInfoTypes.IMPROVEMENT_TOWN
local LargeTown = GameInfoTypes.IMPROVEMENT_LARGE_TOWN

local VillageStr = "Village"
local TownStr = "Town"
local LargeTownStr = "Large Town"

-- Prereq Techs
local GuildsTech = GameInfoTypes.TECH_GUILDS
local BankingTech = GameInfoTypes.TECH_BANKING
-- Vox Populi Prereq Techs
local TradeTech = GameInfoTypes.TECH_HORSEBACK_RIDING
local CurrencyTech = GameInfoTypes.TECH_CURRENCY

-- XP Tiers by Game Speed
-- iGameSpeed: 0 is Marathon 300%, 1 is Epic 150%, 2 is Standard 100%, and 3 is Quick 66%
local iGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GrowthPercent / 100
local TownXP = math.ceil(7 * iGameSpeed)
print("XP needed for Village --> Town: " .. TownXP + 1)
local LargeTownXP = math.ceil(15 * iGameSpeed)
print("XP needed for Town --> Large Town: " .. LargeTownXP + 1)

-- Mod ID for (2) Vox Populi
local VoxPopGuid = "8411a7a8-dad3-4622-a18e-fcc18324c799"

local Terrain = {
    -- Terrain / Features
    terrainGrass = GameInfoTypes.TERRAIN_GRASS,
    terrainTundra = GameInfoTypes.TERRAIN_TUNDRA,
    terrainDesert = GameInfoTypes.TERRAIN_DESERT,
    featureForest = GameInfoTypes.FEATURE_FOREST,
    featureJungle = GameInfoTypes.FEATURE_JUNGLE,
    featureFloodPlains = GameInfoTypes.FEATURE_FLOOD_PLAINS,
    plotHills = PlotTypes.PLOT_HILLS,
    featureMarsh = GameInfoTypes.FEATURE_MARSH,
    featureOasis = GameInfoTypes.FEATURE_OASIS,
    featureAtoll = GameInfoTypes.FEATURE_ATOLL,
    featureFallout = GameInfoTypes.FEATURE_FALLOUT,
    featureIce = GameInfoTypes.FEATURE_ICE,

    -- Improvements
    Farm = GameInfoTypes.IMPROVEMENT_FARM,
    Pasture = GameInfoTypes.IMPROVEMENT_PASTURE,
    Camp = GameInfoTypes.IMPROVEMENT_CAMP,
    Plantation = GameInfoTypes.IMPROVEMENT_PLANTATION,
    Quarry = GameInfoTypes.IMPROVEMENT_QUARRY,
    Mine = GameInfoTypes.IMPROVEMENT_MINE,
    Mill = GameInfoTypes.IMPROVEMENT_LUMBERMILL,
    FishingBoats = GameInfoTypes.IMPROVEMENT_FISHING_BOATS,
    Well = GameInfoTypes.IMPROVEMENT_WELL,
    OffshorePlatform = GameInfoTypes.IMPROVEMENT_OFFSHORE_PLATFORM,

    -- Bonus Food Resources
    Bananas = GameInfoTypes.RESOURCE_BANANA,
    Wheat = GameInfoTypes.RESOURCE_WHEAT,
    Cattle = GameInfoTypes.RESOURCE_COW,
    Sheep = GameInfoTypes.RESOURCE_SHEEP,
    Bison = GameInfoTypes.RESOURCE_BISON,
    Deer = GameInfoTypes.RESOURCE_DEER,
    Fish = GameInfoTypes.RESOURCE_FISH,

    -- Other Bonus Resources
    Stone = GameInfoTypes.RESOURCE_STONE,

    -- Strategic Resources
    Horses = GameInfoTypes.RESOURCE_HORSE,
    Iron = GameInfoTypes.RESOURCE_IRON,
    Coal = GameInfoTypes.RESOURCE_COAL,
    Oil = GameInfoTypes.RESOURCE_OIL,
    Aluminum = GameInfoTypes.RESOURCE_ALUMINUM,
    Uranium = GameInfoTypes.RESOURCE_URANIUM,

    -- Luxury Resources
    Cotton = GameInfoTypes.RESOURCE_COTTON,
    Spices = GameInfoTypes.RESOURCE_SPICES,
    Sugar = GameInfoTypes.RESOURCE_SUGAR,
    Furs = GameInfoTypes.RESOURCE_FUR,
    Ivory = GameInfoTypes.RESOURCE_IVORY,
    Silk = GameInfoTypes.RESOURCE_SILK,
    Dyes = GameInfoTypes.RESOURCE_DYE,
    Incense = GameInfoTypes.RESOURCE_INCENSE,
    Wine = GameInfoTypes.RESOURCE_WINE,
    Copper = GameInfoTypes.RESOURCE_COPPER,
    Silver = GameInfoTypes.RESOURCE_SILVER,
    Gold = GameInfoTypes.RESOURCE_GOLD,
    Marble = GameInfoTypes.RESOURCE_MARBLE,
    Pearls = GameInfoTypes.RESOURCE_PEARLS,
    Truffles = GameInfoTypes.RESOURCE_TRUFFLES,
    Nutmeg = GameInfoTypes.RESOURCE_NUTMEG,
    Cloves = GameInfoTypes.RESOURCE_CLOVES,
    Pepper = GameInfoTypes.RESOURCE_PEPPER,
    Crab = GameInfoTypes.RESOURCE_CRAB,
    Salt = GameInfoTypes.RESOURCE_SALT,
    Whales = GameInfoTypes.RESOURCE_WHALE,
    Citrus = GameInfoTypes.RESOURCE_CITRUS,
    Cocoa = GameInfoTypes.RESOURCE_COCOA,
    Gems = GameInfoTypes.RESOURCE_GEMS,

    -- Barathor's More Luxuries
    Coffee = GameInfoTypes.RESOURCE_COFFEE,
    Tea = GameInfoTypes.RESOURCE_TEA,
    Tobacco = GameInfoTypes.RESOURCE_TOBACCO,
    Amber = GameInfoTypes.RESOURCE_AMBER,
    Jade = GameInfoTypes.RESOURCE_JADE,
    Olives = GameInfoTypes.RESOURCE_OLIVE,
    Perfume = GameInfoTypes.RESOURCE_PERFUME,
    Coral = GameInfoTypes.RESOURCE_CORAL,
    Lapis = GameInfoTypes.RESOURCE_LAPIS,

    -- Gaia's Resource Compendium Luxuries
    Lavender = GameInfoTypes.RESOURCE_LAVENDER,
    Poppy = GameInfoTypes.RESOURCE_POPPY,
    Coconut = GameInfoTypes.RESOURCE_COCONUT,

    -- Amer-Asian Resources
    AATea = GameInfoTypes.RESOURCE_FA_TEA,
    AATobacco = GameInfoTypes.RESOURCE_FA_TOBACCO,
    AARice = GameInfoTypes.RESOURCE_FA_RICE,
    AAMaize = GameInfoTypes.RESOURCE_FA_MAIZE,

    -- Extra Bonus Food Resources
    Rice = GameInfoTypes.RESOURCE_RICE,
    Maize = GameInfoTypes.RESOURCE_MAIZE,
    Berries = GameInfoTypes.RESOURCE_BERRIES,
    Cactus = GameInfoTypes.RESOURCE_CACTUS,
    Trout = GameInfoTypes.RESOURCE_TROUT,

    -- Major Improvements
    Academy = GameInfoTypes.IMPROVEMENT_ACADEMY,
    Manufactory = GameInfoTypes.IMPROVEMENT_MANUFACTORY,
    CustomsHouse = GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE,
    Citadel = GameInfoTypes.IMPROVEMENT_CITADEL,
    HolySite = GameInfoTypes.IMPROVEMENT_HOLY_SITE,
    Landmark = GameInfoTypes.IMPROVEMENT_LANDMARK,

    -- Relevant Unique Improvements
    --TerraceFarm = GameInfoTypes.IMPROVEMENT_TERRACE_FARM,
    --Polder = GameInfoTypes.IMPROVEMENT_POLDER,
    --Feitoria = GameInfoTypes.IMPROVEMENT_FEITORIA,
    --Chateau = GameInfoTypes.IMPROVEMENT_CHATEAU,
    --Kasbah = GameInfoTypes.IMPROVEMENT_KASBAH,
    --Moai = GameInfoTypes.IMPROVEMENT_MOAI,

    -- Vox Populi
    VPKuna = GameInfoTypes.IMPROVEMENT_KUNA,
    VPSiheyuan = GameInfoTypes.IMPROVEMENT_SIHEYUAN,
    VPHacienda = GameInfoTypes.IMPROVEMENT_SPAIN_HACIENDA,
    VPEncampment = GameInfoTypes.IMPROVEMENT_ENCAMPMENT_SHOSHONE,
    BrazilwoodCamp = GameInfoTypes.IMPROVEMENT_BRAZILWOOD_CAMP
}

if Terrain ~= nil then
    print("Terrain table created")
    if Terrain.Lavender ~= nil then
        print("Gaia's Resource Compendium active")
    elseif Terrain.Coffee ~= nil then
        print("Barathor's More Luxuries active")
    elseif Terrain.AAMaize ~= nil then
        print("Amer-Asian Resources active")
    else
        print("No luxury mods active")
    end
end

-- Civs with relevant Unique Improvements
--local Portugal = GameInfoTypes.CIVILIZATION_PORTUGAL
--local France = GameInfoTypes.CIVILIZATION_FRANCE
--local Morocco = GameInfoTypes.CIVILIZATION_MOROCCO
--local Netherlands = GameInfoTypes.CIVILIZATION_NETHERLANDS
--local Polynesia = GameInfoTypes.CIVILIZATION_POLYNESIA
--local Inca = GameInfoTypes.CIVILIZATION_INCA
-- Vox Populi only
local Brazil = GameInfoTypes.CIVILIZATION_BRAZIL
local China = GameInfoTypes.CIVILIZATION_CHINA
local Shoshone = GameInfoTypes.CIVILIZATION_SHOSHONE
local Spain = GameInfoTypes.CIVILIZATION_SPAIN
local Maya = GameInfoTypes.CIVILIZATION_MAYA

-- Policies
local Liberty = GameInfoTypes.POLICY_BRANCH_LIBERTY
local Tradition = GameInfoTypes.POLICY_BRANCH_TRADITION
local Exploration = GameInfoTypes.POLICY_BRANCH_EXPLORATION
local TraditionMode = 1
local LibertyMode = 2
local TraditionPopPerSuburb = 14

-- Hex directions
local E = DirectionTypes.DIRECTION_EAST
local NE = DirectionTypes.DIRECTION_NORTHEAST
local NW = DirectionTypes.DIRECTION_NORTHWEST
local W = DirectionTypes.DIRECTION_WEST
local SW = DirectionTypes.DIRECTION_SOUTHWEST
local SE = DirectionTypes.DIRECTION_SOUTHEAST

local note = NOTIFICATION_CITY_TILE
local noteGrow = GameInfoTypes.NOTIFICATION_CITY_GROWTH
local noteShrink = GameInfoTypes.NOTIFICATION_STARVING

local BountifulStr = "bountiful"
local ConvenientStr = "convenient"
local DesirableStr = "desirable"
local ImportantStr = "important"
local HistoricStr = "historic"
local WaterfrontStr = "not only a scenic waterfront, but also "
local BadLocationStr = "poorly located"
local AndAlso = " & "
local AndNext = ", "
local AndLast = ", & "

-- Core Variables
local bModActive = false
local bHasGuilds = false
local iPlayer
local pPlayer
local pCity
local pCityPlot
local iTeam
local bIsMinorCiv
local bIsHuman

-- Policy Variables
local iPolicyMode -- core Policy Branch (Tradition or Liberty) that this player finished first
local bExploreMode -- whether Exploration is finished
local iSuburbs -- number of suburbs around the current City (Tradition Mode only)
local iAllowedSuburbs -- number of suburbs allowed near this City (Tradition Mode only)
local bCityHideMsg

-- AI Assist Variables
local bEconResearched -- Economics is required for AI Assist mechanics to engage
local bInAIAssist -- true if last turn this City had too few Large Towns and no XP gained/lost
local AIAssistPop = 8 -- Cities with fewer than 1 Large Town per X pop are eligible for AI Assist
local iLargeTowns -- number of Large Towns this turn near this City
local bXPChanged -- whether any XP was gained or lost this turn near this City
local iAIAssistRate -- how much tentative XP should be gained each turn (based on how far behind)
local AIAssistXP = LargeTownXP
local bTownBoostReady -- true if a hidden hamlet has earned enough XP to become a Town
print("AI Assist: XP needed for Hidden Hamlet --> Town: " .. AIAssistXP + 1)
local iFarms -- number of Farms near this City
local iMines -- number of Mines near this City
local pHamlet -- actively growing hamlet (hidden AI Assist settlement)
local iHamletXP -- current XP of the actively growing hamlet
local pBestVillage -- best Village near this City
local iBestVillageRating -- location rating of the City's best Village
local pBestMillForHamlet -- best Mill for a hamlet near this City
local iBestMillDelta -- Total yield delta of the best Mill for a hamlet
local iBestMillRating -- location rating of the best Mill for a hamlet
local pBestMineForHamlet -- best Mine for a hamlet near this City
local iBestMineDelta -- Total yield delta of the best Mine for a hamlet
local iBestMineRating -- location rating of the best Mine for a hamlet
local pBestFarmForHamlet -- best Farm for a hamlet near this City
local iBestFarmDelta -- Total yield delta of the best Farm for a hamlet
local iBestFarmRating -- location rating of the best Farm for a hamlet
local pBestBonusForHamlet -- best Bonus Resource for a hamlet near this City
local iBestBonusDelta -- total yield delta of the best Bonus Resource for a hamlet
local iBestBonusRating -- location rating of the best Bonus Resource for a hamlet
local iHamletCooldown -- number of turns until the next search for where to found a hamlet


local MapTable = {}
--[[
Dynamic Towns map table containing settlement data for the mod
   key: plot object (indexed by coordinate)
   value: structure containing the following:
   - xp: XP toward the next settlement level
   - cooldown: cooldown before XP can be checked again
   - hideMsg: true to suppress bad location messages
   - bypass: true if this settlement is bypassing Town adjacency rules because it can grow into a Large Town
   - suburb: true if this settlement is a suburb of a City in Tradition Mode (will ignore all adjacency rules)
]]

local PlayerTable = {}
--[[
Dynamic Towns player table containing data on policies
   key: player index
   value: int indicating the first completed core policy branch
   - 0 = neither
   - 1 = Tradition
   - 2 = Liberty
]]

local CityTable = {}
--[[
Dynamic Towns table containing data on Cities
	key: city ID
	value: structure containing the following:
	- numSuburbs: count of suburbs around the City
	- hideMsg: true if messages shouldn't be shown about lack of suburb candidates
	- inAIAssist: true if this City had too few Large Towns and no high-impact XP gained/lost last turn
	- townBoost: true if this City has earned a Town boost from AI Assist
	- cooldown: cooldown before AI Assist can be checked again
	- hamletX: X coordinate of the growing hamlet, if any (hidden AI Assist settlement)
	- hamletY: Y coordinate of the growing hamlet, if any
	- hamletXP: current tentative XP of the growing hamlet
	- aiAssistRate: how much tentative XP can be gained each turn (based on how far behind)
]]


local saveData = Modding.OpenSaveData()

local SaveID = "Aza_Towns_"

local XPTag = "_xp"
local CooldownTag = "_cooldown"
local HideMsgTag = "_hideMsg"
local BypassTag = "_bypass"
local SuburbTag = "_suburb"

local CivPrefix = "civ"
local PolicyModeTag = "_policyMode"

local CityPrefix = "city"
local NumSuburbsTag = "_numSuburbs"
local InAIAssistTag = "_inAIAssist"
local TownBoostTag = "_townBoost"
local HamletXTag = "_hamletX"
local HamletYTag = "_hamletY"
local HamletXPTag = "_hamletXP"
local AIAssistRateTag = "_aiAssistRate"


-- Gets the plot's savegame ID prefix
function GetPlotStr(plot)
	return SaveID .. plot:GetX() .. "_" .. plot:GetY()
end

-- Loads a plot's settlement data from the savegame, initializing it if needed
function LoadPlot(plot)
	local plotStr = GetPlotStr(plot)
	local xp = saveData.GetValue(plotStr .. XPTag)
	if xp == nil then
		-- Initialize plot
		print("Initializing " .. plotStr)
		MapTable[plot] = { xp = 0, cooldown = 0, hideMsg = false, bypass = false, suburb = false }
		saveData.SetValue(GetPlotStr(plot) .. XPTag, 0)
	else
		-- Load remaining data
		print("Loading " .. plotStr)
		local cooldown = saveData.GetValue(plotStr .. CooldownTag)
		if cooldown == nil then cooldown = 0 end
		local hideMsg = saveData.GetValue(plotStr .. HideMsgTag)
		if hideMsg == nil then hideMsg = false end
		local bypass = saveData.GetValue(plotStr .. BypassTag)
		if bypass == nil then bypass = false end
		local suburb = saveData.GetValue(plotStr .. SuburbTag)
		if suburb == nil then suburb = false end
		MapTable[plot] = { xp = xp, cooldown = cooldown, hideMsg = hideMsg, bypass = bypass, suburb = suburb }
	end
end

-- Updates the cache and save with the settlement's current XP
function SetXP(plot, xp, blockAIAssist)
	if blockAIAssist ~= nil and blockAIAssist then
		bXPChanged = true
	end
	MapTable[plot].xp = xp
	saveData.SetValue(GetPlotStr(plot) .. XPTag, xp)
end

-- Updates the cache and save with the settlement's upgrade check cooldown
function SetCooldown(plot, cooldown)
	MapTable[plot].cooldown = cooldown
	saveData.SetValue(GetPlotStr(plot) .. CooldownTag, cooldown)
end

-- Updates the cache and save with whether repetative messages are hidden for this settlement
function SetHideMsg(plot, hideMsg)
	MapTable[plot].hideMsg = hideMsg
	saveData.SetValue(GetPlotStr(plot) .. HideMsgTag, hideMsg)
end

-- Updates the cache and save with whether this settlement is bypassing Town adjacency rules
function SetBypass(plot, bypass)
	MapTable[plot].bypass = bypass
	saveData.SetValue(GetPlotStr(plot) .. BypassTag, bypass)
end

-- Checks if the plot is bypassing Town adjacency rules, ensuring data is loaded from the save
function GetBypass(plot)
	local data = MapTable[plot]
	if data == nil then
		local type = plot:GetImprovementType()
		if type == Village or type == Town or type == LargeTown then
			LoadPlot(plot)
			return MapTable[plot].bypass
		else
			return false
		end
	else
		return data.bypass
	end
end

-- Updates the cache and save with whether this settlement is a suburb of a City in Tradition Mode
function SetSuburb(plot, suburb)
	MapTable[plot].suburb = suburb
	saveData.SetValue(GetPlotStr(plot) .. SuburbTag, suburb)
end

-- Checks if the plot is a suburb of a City in Tradition Mode, ensuring data is loaded from the save
function GetSuburb(plot)
	local data = MapTable[plot]
	if data == nil then
		local type = plot:GetImprovementType()
		if type == Village or type == Town or type == LargeTown then
			LoadPlot(plot)
			return MapTable[plot].suburb
		else
			return false
		end
	else
		return data.suburb
	end
end


-- Gets the player's policy mode savegame ID
function GetPolicyStr()
	return SaveID .. CivPrefix .. iPlayer .. PolicyModeTag
end

-- Loads the player's core policy mode
-- (did they complete Tradition or Liberty first?)
function LoadPolicyMode()
	local policyStr = GetPolicyStr()
	iPolicyMode = saveData.GetValue(policyStr)
	if iPolicyMode == nil then
		-- Initialize player data
		saveData.SetValue(policyStr, 0)
		PlayerTable[iPlayer] = 0
		iPolicyMode = 0
	-- todo: else -- Load remaining data (if any more player data is added)
	end
end

-- Updates iPolicyMode with the player's core policy mode
-- (did they complete Tradition or Liberty first?)
function GetPolicyMode()
	iPolicyMode = PlayerTable[iPlayer]
	if iPolicyMode == nil then
		LoadPolicyMode()
		return PlayerTable[iPlayer]
	end
end

-- Updates iPolicyMode, cache, and save with the player's core policy mode
-- (did they complete Tradition or Liberty first?)
function SetPolicyMode(mode)
	iPolicyMode = mode
	PlayerTable[iPlayer] = mode
	saveData.SetValue(GetPolicyStr(), mode)
end


-- Gets the city's savegame ID
function GetCityStr()
	return SaveID .. CityPrefix .. pCityPlot:GetX() .. "_" .. pCityPlot:GetY()
end

-- Clears variables to prepare for a hamlet search (AI Assist mechanics)
function ClearHamletSearchVars()
	print("Hamlet Search: locals will try to found a hamlet this turn")
	pHamlet = nil
	iFarms = 0
	iMines = 0
	pBestVillage = nil
	pBestMillForHamlet = nil
	pBestMineForHamlet = nil
	pBestFarmForHamlet = nil
	pBestBonusForHamlet = nil
	iBestVillageRating = -1
	iBestMillDelta = nil
	iBestMillRating = -1
	iBestMineDelta = nil
	iBestMineRating = -1
	iBestFarmDelta = nil
	iBestFarmRating = -1
	iBestBonusDelta = nil
	iBestBonusRating = -1
end

-- Loads data for the city, initializing if needed
function LoadCity()
	local data = CityTable[pCityPlot]
	iLargeTowns = 0
	bXPChanged = false
	pHamlet = nil
	if data ~= nil then
		iSuburbs = data.numSuburbs
		bCityHideMsg = data.hideMsg
		bInAIAssist = data.inAIAssist
		bTownBoostReady = data.townBoost
		-- Load AI Assist variables only if in AI Assist
		if bInAIAssist then
			if bTownBoostReady then
				pHamlet = nil
				ClearHamletSearchVars()
			else
				iHamletCooldown = data.cooldown
				if data.hamletX ~= nil and data.hamletY ~= nil then
					pHamlet = Map.GetPlot(data.hamletX, data.hamletY)
				elseif iHamletCooldown < 1 then
					ClearHamletSearchVars()
				end
				iHamletXP = data.hamletXP
				if iHamletXP == nil then
					ClearHamletSearchVars()
				end
				iAIAssistRate = data.aiAssistRate
			end
		end
	else
		local cityStr = GetCityStr()
		iSuburbs = saveData.GetValue(cityStr .. NumSuburbsTag)
		if iSuburbs == nil then
			iSuburbs = 0
		end
		bCityHideMsg = saveData.GetValue(cityStr .. HideMsgTag)
		if bCityHideMsg == nil then
			bCityHideMsg = false
		end
		bInAIAssist = saveData.GetValue(cityStr .. InAIAssistTag)
		if bInAIAssist == nil then
			bInAIAssist = false
		end
		bTownBoostReady = saveData.GetValue(cityStr .. TownBoostTag)
		if bTownBoostReady == nil then
			bTownBoostReady = false
		end
		iHamletCooldown = saveData.GetValue(cityStr .. CooldownTag)
		if iHamletCooldown == nil then
			iHamletCooldown = 0
		end
		-- Load AI Assist variables only if in AI Assist
		if bInAIAssist then
			if bTownBoostReady then
				pHamlet = nil
				ClearHamletSearchVars()
			elseif iHamletCooldown < 1 then
				local x, y
				x = saveData.GetValue(cityStr .. HamletXTag)
				if x ~= nil then
					y = saveData.GetValue(cityStr .. HamletYTag)
					iHamletXP = saveData.GetValue(cityStr .. HamletXPTag)
					if y == nil or iHamletXP == nil then
						ClearHamletSearchVars()
					else
						pHamlet = Map.GetPlot(x, y)
					end
				else
					ClearHamletSearchVars()
				end
				iAIAssistRate = saveData.GetValue(cityStr .. AIAssistRateTag)
				if iAIAssistRate == nil then
					iAIAssistRate = 1
				end
			end
		end
		CityTable[pCityPlot] =
			{ numSuburbs = iSuburbs, hideMsg = bCityHideMsg,
			  inAIAssist = bInAIAssist, townBoost = bTownBoostReady, cooldown = iHamletCooldown,
			  hamletX = iHamletX, hamletY = iHamletY,
			  hamletXP = iHamletXP, aiAssistRate = iAIAssistRate }
	end
end

-- Updates the cache and save with the number of suburbs around this City
function SetNumSuburbs()
	if iSuburbs ~= CityTable[pCityPlot].numSuburbs then
		saveData.SetValue(GetCityStr() .. NumSuburbsTag, iSuburbs)
	end
	CityTable[pCityPlot].numSuburbs = iSuburbs
end

-- Updates the cache and save with whether lack of suburb messages should be shown for this City
function SetCityHideMsg(hideMsg)
	bCityHideMsg = hideMsg
	CityTable[pCityPlot].hideMsg = hideMsg
	saveData.SetValue(GetCityStr() .. HideMsgTag, hideMsg)
end

-- Caches and saves the current values of AI Assist variables
function SaveAIAssistVars()
	local data = CityTable[pCityPlot]
	data.inAIAssist = bInAIAssist
	data.townBoost = bTownBoostReady
	data.cooldown = iHamletCooldown
	if pHamlet ~= nil then
		data.hamletX = pHamlet:GetX()
		data.hamletY = pHamlet:GetY()
		data.hamletXP = iHamletXP
	end
	CityTable[pCityPlot] = data
	if bInAIAssist then
		local cityStr = GetCityStr()
		saveData.SetValue(cityStr .. InAIAssistTag, bInAIAssist)
		saveData.SetValue(cityStr .. TownBoostTag, bTownBoostReady)
		saveData.SetValue(cityStr .. CooldownTag, iHamletCooldown)
		saveData.SetValue(cityStr .. AIAssistRateTag, iAIAssistRate)
		if pHamlet ~= nil then
			saveData.SetValue(cityStr .. HamletXPTag, iHamletXP)
			if (iHamletXP < 2) then
				saveData.SetValue(cityStr .. HamletXTag, pHamlet:GetX())
				saveData.SetValue(cityStr .. HamletYTag, pHamlet:GetY())
			end
		elseif iHamletCooldown < 1 then
			saveData.SetValue(cityStr .. HamletXTag, nil)
		end
	end
end


-- Checks whether Vox Populi is active
function CheckVoxPopActive()
    if bVoxPopActive ~= nil then return end
    print("Checking for Vox Populi...")
    for _, mod in pairs(Modding.GetActivatedMods()) do
        if mod.ID == VoxPopGuid then
            print("Vox Populi is active")
            bVoxPopActive = true
            return
        end
    end
    if bVoxPopActive == nil then bVoxPopActive = false end
end


-- Loop through all plots within a radius of the center plot and call the function for each
function RingwiseLoop(centerPlot, radius, logic)
	local plot = centerPlot
	print("Spiraling out from " .. plot:GetX() .. ", " .. plot:GetY() .. " to radius " .. radius)
	local failed = false
	for ring = 1, radius do
		--print("Ring is now " .. ring)
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot)
		end
		if failed == true then break end
	end
end

-- Loop through all plots within a radius of the center plot
-- until the check fails, an invalid plot is reached, or all plots pass
function RingwiseCheck(centerPlot, radius, check)
	local plot = centerPlot
	local failed = false
	for ring = 1, radius do
		--print("Ring is now " .. ring)
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then failed = true; break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
	end
	return not failed
end

-- Loop through all plots within a radius of the center plot,
-- rating each plot and then returning the max rating and the best rated plot
function RingwiseMax(centerPlot, radius, ratePlot)
	local plot, bestPlot = centerPlot, centerPlot
	local max, rating = -1000, -1000
	for ring = 1, radius do
		--print("Ring is now " .. ring)
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then return max end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
			if plot == nil then return max end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
            rating = ratePlot(plot)
			if rating > max then max = rating; bestPlot = plot end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
			if plot == nil then return max end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
            rating = ratePlot(plot)
			if rating > max then max = rating; bestPlot = plot end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
			if plot == nil then return max end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
            rating = ratePlot(plot)
			if rating > max then max = rating; bestPlot = plot end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
			if plot == nil then return max end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
            rating = ratePlot(plot)
			if rating > max then max = rating; bestPlot = plot end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
			if plot == nil then return max end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
            rating = ratePlot(plot)
			if rating > max then max = rating; bestPlot = plot end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
			if plot == nil then return max end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
            rating = ratePlot(plot)
			if rating > max then max = rating; bestPlot = plot end
		end
	end
	return max, bestPlot
end

-- Loop through all plots within a radius of the center plot and call the function for each,
-- passing it the current ring as an argument
function RingwiseLoopByRing(centerPlot, radius, logic)
	local plot = centerPlot
	print("Spiraling out from " .. plot:GetX() .. ", " .. plot:GetY() .. " to radius " .. radius)
	local failed = false
	for ring = 1, radius do
		--print("Ring is now " .. ring)
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot, ring)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot, ring)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot, ring)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot, ring)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot, ring)
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			logic(plot, ring)
		end
		if failed == true then break end
	end
end

-- Loop through all plots within a radius of the center plot
-- until the check fails, an invalid plot is reached, or all plots pass.
-- The current radius will be passed as an argument to the check
function RingwiseCheckByRing(centerPlot, radius, check)
	local plot = centerPlot
	local failed = false
	for ring = 1, radius do
		--print("Ring is now " .. ring)
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then failed = true; break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot, ring) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot, ring) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot, ring) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot, ring) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot, ring) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
			if plot == nil then failed = true; break end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if not check(plot, ring) then
				print("Check failed at " .. plot:GetX() .. ", " .. plot:GetY())
				failed = true; break
			end
		end
		if failed == true then break end
	end
	return not failed
end

-- Loop through all plots in the ring n tiles away from the center plot,
-- until the check passes, an invalid plot is reached, or all plots fail
function SearchRing(centerPlot, ring, check)
	local plot = centerPlot
	for n = 1, ring do
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then return false end
	end
	for n = 1, ring do
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
		if plot == nil then return false end
		--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
		if check(plot) then
			print("Found at " .. plot:GetX() .. ", " .. plot:GetY())
			return true
		end
	end
	for n = 1, ring do
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
		if plot == nil then return false end
		--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
		if check(plot) then
			print("Found at " .. plot:GetX() .. ", " .. plot:GetY())
			return true
		end
	end
	for n = 1, ring do
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
		if plot == nil then return false end
		--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
		if check(plot) then
			print("Found at " .. plot:GetX() .. ", " .. plot:GetY())
			return true
		end
	end
	for n = 1, ring do
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
		if plot == nil then return false end
		--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
		if check(plot) then
			print("Found at " .. plot:GetX() .. ", " .. plot:GetY())
			return true
		end
	end
	for n = 1, ring do
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then return false end
		--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
		if check(plot) then
			print("Found at " .. plot:GetX() .. ", " .. plot:GetY())
			return true
		end
	end
	for n = 1, ring do
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
		if plot == nil then return false end
		--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
		if check(plot) then
			print("Check passed at " .. plot:GetX() .. ", " .. plot:GetY())
			return true
		end
	end
	return false
end

-- Loop through all plots within a radius of the center plot,
-- counting how many times the check passes
function RingwiseHunt(centerPlot, radius, check)
	local plot = centerPlot
	local found = 0
	for ring = 1, radius do
		--print("Ring is now " .. ring)
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then return false end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				--print("Found one at " .. plot:GetX() .. ", " .. plot:GetY())
				found = found + 1
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				--print("Found one at " .. plot:GetX() .. ", " .. plot:GetY())
				found = found + 1
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				--print("Found one at " .. plot:GetX() .. ", " .. plot:GetY())
				found = found + 1
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				--print("Found one at " .. plot:GetX() .. ", " .. plot:GetY())
				found = found + 1
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				--print("Found one at " .. plot:GetX() .. ", " .. plot:GetY())
				found = found + 1
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				--print("Found one at " .. plot:GetX() .. ", " .. plot:GetY())
				found = found + 1
			end
		end
	end
	return found
end

local _rftA, _rftARing, _rftADist, _rftB, _rftBRing, _rftBDist
local _rftC, _rftCRing, _rftCDist, _rftD, _rftDRing, _rftDDist
-- Floods hexes in a spiral within the radius to find if there is a direct path from start to goal,
-- where all hexes on the path pass the check (goalPlot doesn't need to pass).
-- DON'T use for a radius > 3 without testing performance
function RingwiseFloodTrace(startPlot, goalPlot, radius, check)
	local plot, dist = startPlot, 0
	--local plot, a, aRing = startPlot, startPlot, 0
	_rftA, _rftARing = plot, 0
	--local b, c, d, dist, bDist, cDist, dDist, bRing, cRing, dRing
	_rftADist = Map.PlotDistance(plot:GetX(), plot:GetY(), goalPlot:GetX(), goalPlot:GetY())
	local pathInRing, plotDone = false, false
	for ring = 1, radius do
		print("Ring is now " .. ring)
		plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
		if plot == nil then return false end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				dist = Map.PlotDistance(plot:GetX(), plot:GetY(), goalPlot:GetX(), goalPlot:GetY())
				if dist == 1 then
                    plotDone = Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1
                    plotDone = plotDone or (_rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1)
                    plotDone = plotDone or (_rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1)
                    plotDone = plotDone or (_rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1)
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                end
                if Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1 then
                    if dist < _rftADist then
                        print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftADist or ring == 1 then
                        if _rftB == nil or ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1 then
                    if dist < _rftBDist then
                        print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftBDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1 then
                    if dist < _rftCDist then
                        print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftCDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
				end
				if not plotDone and _rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1 then
                    if dist < _rftDDist then
                        print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true
                    elseif dist == _rftDDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true
                        elseif ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true
                        end
                    end
				end
                plotDone = false
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				dist = Map.PlotDistance(plot:GetX(), plot:GetY(), goalPlot:GetX(), goalPlot:GetY())
				if dist == 1 then
                    plotDone = Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1
                    plotDone = plotDone or (_rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1)
                    plotDone = plotDone or (_rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1)
                    plotDone = plotDone or (_rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1)
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                end
                if Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1 then
                    if dist < _rftADist then
                        print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftADist or ring == 1 then
                        if _rftB == nil or ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1 then
                    if dist < _rftBDist then
                        print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftBDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1 then
                    if dist < _rftCDist then
                        print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftCDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
				end
				if not plotDone and _rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1 then
                    if dist < _rftDDist then
                        print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true
                    elseif dist == _rftDDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true
                        elseif ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true
                        end
                    end
				end
                plotDone = false
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				dist = Map.PlotDistance(plot:GetX(), plot:GetY(), goalPlot:GetX(), goalPlot:GetY())
				if dist == 1 then
                    plotDone = Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1
                    plotDone = plotDone or (_rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1)
                    plotDone = plotDone or (_rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1)
                    plotDone = plotDone or (_rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1)
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                end
                if Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1 then
                    if dist < _rftADist then
                        print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftADist or ring == 1 then
                        if _rftB == nil or ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1 then
                    if dist < _rftBDist then
                        print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftBDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1 then
                    if dist < _rftCDist then
                        print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftCDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
				end
				if not plotDone and _rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1 then
                    if dist < _rftDDist then
                        print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true
                    elseif dist == _rftDDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true
                        elseif ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true
                        end
                    end
				end
                plotDone = false
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				dist = Map.PlotDistance(plot:GetX(), plot:GetY(), goalPlot:GetX(), goalPlot:GetY())
				if dist == 1 then
                    plotDone = Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1
                    plotDone = plotDone or (_rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1)
                    plotDone = plotDone or (_rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1)
                    plotDone = plotDone or (_rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1)
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                end
                if Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1 then
                    if dist < _rftADist then
                        print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftADist or ring == 1 then
                        if _rftB == nil or ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1 then
                    if dist < _rftBDist then
                        print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftBDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1 then
                    if dist < _rftCDist then
                        print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftCDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
				end
				if not plotDone and _rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1 then
                    if dist < _rftDDist then
                        print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true
                    elseif dist == _rftDDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true
                        elseif ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true
                        end
                    end
				end
                plotDone = false
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				dist = Map.PlotDistance(plot:GetX(), plot:GetY(), goalPlot:GetX(), goalPlot:GetY())
				if dist == 1 then
                    plotDone = Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1
                    plotDone = plotDone or (_rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1)
                    plotDone = plotDone or (_rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1)
                    plotDone = plotDone or (_rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1)
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                end
                if Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1 then
                    if dist < _rftADist then
                        print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftADist or ring == 1 then
                        if _rftB == nil or ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1 then
                    if dist < _rftBDist then
                        print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftBDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1 then
                    if dist < _rftCDist then
                        print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftCDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
				end
				if not plotDone and _rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1 then
                    if dist < _rftDDist then
                        print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true
                    elseif dist == _rftDDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true
                        elseif ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true
                        end
                    end
				end
                plotDone = false
			end
		end
		for n = 1, ring do
			plot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
			if plot == nil then return false end
			--print("Plot: " .. plot:GetX() .. ", " .. plot:GetY())
			if check(plot) then
				dist = Map.PlotDistance(plot:GetX(), plot:GetY(), goalPlot:GetX(), goalPlot:GetY())
				if dist == 1 then
                    plotDone = Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1
                    plotDone = plotDone or (_rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1)
                    plotDone = plotDone or (_rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1)
                    plotDone = plotDone or (_rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1)
                    if plotDone then
                        print("... path completed by " .. plot:GetX() .. ", " .. plot:GetY())
                        return true
                    end
                end
                if Map.PlotDistance(plot:GetX(), plot:GetY(), _rftA:GetX(), _rftA:GetY()) == 1 then
                    if dist < _rftADist then
                        print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftADist or ring == 1 then
                        if _rftB == nil or ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftB ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftB:GetX(), _rftB:GetY()) == 1 then
                    if dist < _rftBDist then
                        print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftBDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif _rftC == nil or ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
                end
				if not plotDone and _rftC ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftC:GetX(), _rftC:GetY()) == 1 then
                    if dist < _rftCDist then
                        print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true; plotDone = true
                    elseif dist == _rftCDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true; plotDone = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true; plotDone = true
                        elseif _rftD == nil or ring - _rftDRing > 1 then
                            print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true; plotDone = true
                        end
                    end
				end
				if not plotDone and _rftD ~= nil and Map.PlotDistance(plot:GetX(), plot:GetY(), _rftD:GetX(), _rftD:GetY()) == 1 then
                    if dist < _rftDDist then
                        print("Closest plot D is now " .. plot:GetX() .. ", " .. plot:GetY())
                        _rftD = plot; _rftDDist = dist; _rftDRing = ring; pathInRing = true
                    elseif dist == _rftDDist or ring == 1 then
                        if ring - _rftARing > 1 then
                            print("Closest plot A is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftA = plot; _rftADist = dist; _rftARing = ring; pathInRing = true
                        elseif ring - _rftBRing > 1 then
                            print("Closest plot B is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftB = plot; _rftBDist = dist; _rftBRing = ring; pathInRing = true
                        elseif ring - _rftCRing > 1 then
                            print("Closest plot C is now " .. plot:GetX() .. ", " .. plot:GetY())
                            _rftC = plot; _rftCDist = dist; _rftCRing = ring; pathInRing = true
                        end
                    end
				end
                plotDone = false
			end
		end
		if not pathInRing then
			return false
		end
		pathInRing = false
	end
	return false
end


-- Checks whether this plot is on good terrain for a bustling Town
function IsGoodTerrain(plot)
	local terrain = plot:GetTerrainType()
	local feature = plot:GetFeatureType()
	if (terrain == Terrain.terrainGrass) then
		print("Bountiful terrain: Grassland")
		return true
	elseif (feature == Terrain.featureJungle) then
		print("Bountiful terrain: Jungle")
		return true
	elseif (feature == Terrain.featureFloodPlains) then
		print("Bountiful terrain: Flood Plains")
		return true
	else
		print("Not bountiful terrain")
		return false
	end
end

-- Checks if the owner of this plot has open borders to the active player
-- (makes this tile count toward bountiful)
function IsPlotFriendly(plot)
	local iOwner = plot:GetOwner()
	local pOwner = nil
	if iOwner == -1 then
		return true
	elseif iOwner == iPlayer then
		return true
	else
		pOwner = Players[iOwner]
	end
	if pOwner:IsPlayerHasOpenBorders(iPlayer) then
		return true
	elseif pOwner:GetMinorCivFriendshipLevelWithMajor(iPlayer) > 0 then
		return true
	elseif pOwner:GetTeam() == iTeam then
		return true
	else return false
	end
end

-- Checks if the owner of this plot is allied with the active player
-- (makes this tile count toward desirable, important, & historic)
function IsPlotAllied(plot)
	local iOwner = plot:GetOwner()
	local pOwner = nil
	if iOwner == -1 then
		return true
	elseif iOwner == iPlayer then
		return true
	else
		pOwner = Players[iOwner]
	end
	if pOwner:GetMinorCivFriendshipLevelWithMajor(iPlayer) > 1 then
		return true
	elseif pOwner:GetTeam() == iTeam then
		return true
	else return false
	end
end

-- Checks if this plot is a road or railroad in friendly territory
function IsFriendlyRoute(plot)
	return plot:IsRoute() and IsPlotFriendly(plot)
end

-- Checks if this plot has a direct road to the working City through friendly territory
function HasDirectFriendlyRoute(plot)
	if Map.PlotDistance(plot:GetX(), plot:GetY(), pCityPlot:GetX(), pCityPlot:GetY()) == 1 then
		print("Conveniently next to the City")
		return true
	end
	print("Checking for direct road...")
	if RingwiseFloodTrace(pCityPlot, plot, 3, IsFriendlyRoute) then
		print("Direct road through friendly territory")
		return true
	else
		print("No direct road through friendly territory")
		return false
	end
end

-- Checks if this plot is an oasis, lake, or convenient improvement
-- (to be used when checking adjacent plots)
function IsOasisOrLake(plot)
	if plot:IsLake() then
		print("Next to a lake")
		return true
	elseif plot:GetFeatureType() == Terrain.featureOasis then
		print("Next to an oasis")
		return true
    elseif bVoxPopActive then
        local improvement = plot:GetImprovementType()
        if improvement == Terrain.VPEncampment then
            return true
        elseif improvement == Terrain.VPHacienda then
            return true
        elseif improvement == Terrain.VPSiheyuan then
            return true
        else return false
        end
	else return false
	end
end

-- Checks whether this plot is on a river or coast
function IsRiverOrCoast(plot)
	if plot:IsRiverSide() then
		print("On a river")
		return true
	elseif plot:IsCoastalLand() then
		print("On a coast")
		return true
	else
		return false
	end
end

-- Checks whether this plot is adjacent to an existing Town
-- (Tradition Mode: ignores suburbs)
function IsAdjacentToTown(plot)
	local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
	if adjPlot ~= nil then
		if (adjPlot:GetImprovementType() == Town and not (iPolicyMode == TraditionMode and GetSuburb(adjPlot))) then
			print("Adjacent to a Town")
			return true
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
	if adjPlot ~= nil then
		if (adjPlot:GetImprovementType() == Town and not (iPolicyMode == TraditionMode and GetSuburb(adjPlot))) then
			print("Adjacent to a Town")
			return true
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
	if adjPlot ~= nil then
		if (adjPlot:GetImprovementType() == Town and not (iPolicyMode == TraditionMode and GetSuburb(adjPlot))) then
			print("Adjacent to a Town")
			return true
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
	if adjPlot ~= nil then
		if (adjPlot:GetImprovementType() == Town and not (iPolicyMode == TraditionMode and GetSuburb(adjPlot))) then
			print("Adjacent to a Town")
			return true
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
	if adjPlot ~= nil then
		if (adjPlot:GetImprovementType() == Town and not (iPolicyMode == TraditionMode and GetSuburb(adjPlot))) then
			print("Adjacent to a Town")
			return true
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
	if adjPlot ~= nil then
		if (adjPlot:GetImprovementType() == Town and not (iPolicyMode == TraditionMode and GetSuburb(adjPlot))) then
			print("Adjacent to a Town")
			return true
		end
	end
end

-- Checks whether this plot is a Great Person improvement, or a Feitoria
-- (or, in Vox Populi, a Brazilwood Camp)
function IsPlotImportant(plot)
	if not IsPlotAllied(plot) then
		return false
	end
	local improvement = plot:GetImprovementType()
	if improvement == Terrain.Academy then
		return true
	elseif improvement == Terrain.Manufactory then
		return true
	elseif improvement == Terrain.CustomsHouse then
		return true
	elseif improvement == Terrain.Citadel then
		return true
	elseif improvement == Terrain.HolySite then
		return true
	elseif improvement == Terrain.Feitoria then
		return true
    elseif bVoxPopActive and improvement == Terrain.BrazilwoodCamp then
        return true
	else return false
	end
end

-- Checks whether this plot is a Natural Wonder, Landmark, Chateau, Kasbah, or Moai
function IsPlotHistoric(plot)
	local improvement = plot:GetImprovementType()
	local feature = plot:GetFeatureType()
	if improvement == Terrain.Landmark then
		return IsPlotAllied(plot)
	elseif improvement == Terrain.Chateau then
		return IsPlotAllied(plot)
	elseif improvement == Terrain.Kasbah then
		return IsPlotAllied(plot)
	elseif improvement == Terrain.Moai then
		return IsPlotAllied(plot)
    elseif improvement == Terrain.VPKuna then
        return IsPlotAllied(plot)
	elseif feature == -1 then
		return false
	elseif feature == Terrain.featureForest then
		return false
	elseif feature == Terrain.featureJungle then
		return false
	elseif feature == Terrain.featureFloodPlains then
		return false
	elseif feature == Terrain.featureMarsh then
		return false
	elseif feature == Terrain.featureIce then
		return false
	elseif feature == Terrain.featureOasis then
		return false
	elseif feature == Terrain.featureAtoll then
		return false
	elseif feature == Terrain.featureFallout then
		return false
	else return true
	end
end

-- Checks if this plot has a discovered & improved Strategic Resource
function IsStrategicResourceAvailable(plot)
	if not IsPlotAllied(plot) then
		return false
	end
	local resource = plot:GetResourceType(Game.GetActiveTeam())
	local improvement = plot:GetImprovementType()
	if resource == Terrain.Horses then
		return IsPlotImportant() or improvement == Terrain.Pasture
	elseif resource == Terrain.Iron then
		return IsPlotImportant() or improvement == Terrain.Mine
	elseif resource == Terrain.Coal then
		return IsPlotImportant() or improvement == Terrain.Mine
	elseif resource == Terrain.Oil then
		return IsPlotImportant() or improvement == Terrain.Well or improvement == Terrain.OffshorePlatform
	elseif resource == Terrain.Aluminum then
		return IsPlotImportant() or improvement == Terrain.Mine
	elseif resource == Terrain.Uranium then
		return IsPlotImportant() or improvement == Terrain.Mine
	else return false
	end
end

-- Checks if this plot is a land tile with an appropriate Bonus Resource for a Hidden Hamlet
function IsBonusLandResource(plot)
	local resource = plot:GetResourceType(-1)
	if resource == Terrain.Bananas then
		return plot:GetImprovementType() ~= Terrain.Plantation
	elseif resource == Terrain.Wheat then
		return true
	elseif resource == Terrain.Cattle then
		return true
	elseif resource == Terrain.Sheep then
		return true
	elseif resource == Terrain.Bison then
		return true
	elseif resource == Terrain.Deer then
		return true
	elseif resource == Terrain.Stone then
		return true
    -- Vox Populi / Gaia's Resource Compendium
    elseif Terrain.Rice ~= nil then
        if resource == Terrain.Rice then
            return improvement == Terrain.Farm
        elseif resource == Terrain.Maize then
            return improvement == Terrain.Farm
        elseif resource == Terrain.Berries then
            return improvement == Terrain.Plantation
        elseif resource == Terrain.Cactus then
            return improvement == Terrain.Plantation
        elseif resource == Terrain.Trout then
            return improvement == Terrain.FishingBoats
        else return false
        end
    -- Amer-Asian Resources
    elseif Terrain.AARice ~= nil then
        if resource == Terrain.AARice then
            return improvement == Terrain.Plantation
        elseif resource == Terrain.AAMaize then
            return improvement == Terrain.Plantation
        else return false
        end
	else return false
	end
end

-- Checks if this plot is a land tile with a Bonus Food Resource
function IsFoodResource(plot)
	local resource = plot:GetResourceType(-1)
	if resource == Terrain.Bananas then
		return true
	elseif resource == Terrain.Wheat then
		return true
	elseif resource == Terrain.Cattle then
		return true
	elseif resource == Terrain.Sheep then
		return true
	elseif resource == Terrain.Bison then
		return true
	elseif resource == Terrain.Deer then
		return true
    -- Vox Populi / Gaia's Resource Compendium
    elseif Terrain.Rice ~= nil then
        if resource == Terrain.Rice then
            return true
        elseif resource == Terrain.Maize then
            return true
        elseif resource == Terrain.Berries then
            return true
        elseif resource == Terrain.Cactus then
            return true
        elseif resource == Terrain.Trout then
            return true
        else return false
        end
    -- Amer-Asian Resources
    elseif Terrain.AARice ~= nil then
        if resource == Terrain.AARice then
            return true
        elseif resource == Terrain.AAMaize then
            return true
        else return false
        end
	else return false
	end
end

-- Checks if this plot has an improved Bonus Food Resource or a Terrace Farm
-- (Bananas don't need to be improved)
function IsFoodResourceAvailable(plot)
	if not IsPlotFriendly(plot) then
		return false
	end
	local resource = plot:GetResourceType(-1)
	local improvement = plot:GetImprovementType()
	if resource == Terrain.Bananas then
		return true
	elseif resource == Terrain.Wheat then
		return improvement == Terrain.Farm
	elseif resource == Terrain.Cattle then
		return improvement == Terrain.Pasture
	elseif resource == Terrain.Sheep then
		return improvement == Terrain.Pasture
	elseif resource == Terrain.Bison then
		return improvement == Terrain.Camp
	elseif resource == Terrain.Deer then
		return improvement == Terrain.Camp
	elseif resource == Terrain.Fish then
		return improvement == Terrain.FishingBoats
	elseif improvement == Terrain.TerraceFarm then
		return true
    -- Vox Populi / Gaia's Resource Compendium
    elseif Terrain.Rice ~= nil then
        if resource == Terrain.Rice then
            return improvement == Terrain.Farm
        elseif resource == Terrain.Maize then
            return improvement == Terrain.Farm
        elseif resource == Terrain.Berries then
            return improvement == Terrain.Plantation
        elseif resource == Terrain.Cactus then
            return improvement == Terrain.Plantation
        elseif resource == Terrain.Trout then
            return improvement == Terrain.FishingBoats
        else return false
        end
    -- Amer-Asian Resources
    elseif Terrain.AARice ~= nil then
        if resource == Terrain.AARice then
            return improvement == Terrain.Plantation
        elseif resource == Terrain.AAMaize then
            return improvement == Terrain.Plantation
        else return false
        end
	else return false
	end
end

-- Checks if this plot is a bountiful location
function IsBountifulLocation(plot)
    if IsFoodResource(plot) then
        print("On Bonus Food")
        return true
    end
	local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
	if adjPlot ~= nil then
		if IsFoodResourceAvailable(adjPlot) then
            print("Next to Bonus Food")
            return true
        end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
	if adjPlot ~= nil then
		if IsFoodResourceAvailable(adjPlot) then
            print("Next to Bonus Food")
            return true
        end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
	if adjPlot ~= nil then
		if IsFoodResourceAvailable(adjPlot) then
            print("Next to Bonus Food")
            return true
        end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
	if adjPlot ~= nil then
		if IsFoodResourceAvailable(adjPlot) then
            print("Next to Bonus Food")
            return true
        end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
	if adjPlot ~= nil then
		if IsFoodResourceAvailable(adjPlot) then
            print("Next to Bonus Food")
            return true
        end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
	if adjPlot ~= nil then
		if IsFoodResourceAvailable(adjPlot) then
            print("Next to Bonus Food")
            return true
        end
	end
	return false
end

-- Checks if this plot has an improved Luxury Resource
function IsLuxuryResourceAvailable(plot)
	if not IsPlotAllied(plot) then
		return false
	end
	local resource = plot:GetResourceType(-1)
	local improvement = plot:GetImprovementType()
	if resource == Terrain.Cotton then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Spices then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Sugar then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Furs then
		return plot:IsCity() or improvement == Terrain.Camp
	elseif resource == Terrain.Ivory then
		return plot:IsCity() or improvement == Terrain.Camp
	elseif resource == Terrain.Silk then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Dyes then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Incense then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Wine then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Copper then
		return plot:IsCity() or improvement == Terrain.Mine
	elseif resource == Terrain.Silver then
		return plot:IsCity() or improvement == Terrain.Mine
	elseif resource == Terrain.Gold then
		return plot:IsCity() or improvement == Terrain.Mine
	elseif resource == Terrain.Marble then
		return plot:IsCity() or improvement == Terrain.Quarry
	elseif resource == Terrain.Pearls then
		return plot:IsCity() or improvement == Terrain.FishingBoats
	elseif resource == Terrain.Truffles then
		return plot:IsCity() or improvement == Terrain.Camp
	elseif resource == Terrain.Crab then
		return plot:IsCity() or improvement == Terrain.FishingBoats
	elseif resource == Terrain.Salt then
		return plot:IsCity() or improvement == Terrain.Mine
	elseif resource == Terrain.Whales then
		return plot:IsCity() or improvement == Terrain.FishingBoats
	elseif resource == Terrain.Citrus then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Cocoa then
		return plot:IsCity() or improvement == Terrain.Plantation
	elseif resource == Terrain.Gems then
		return plot:IsCity() or improvement == Terrain.Mine
	elseif improvement == Terrain.Polder then
		return true
	elseif resource == Terrain.Nutmeg then
		return true
	elseif resource == Terrain.Cloves then
		return true
	elseif resource == Terrain.Pepper then
		return true
    -- Vox Populi
    elseif bVoxPopActive then
        if resource == Terrain.Coffee then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Tea then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Tobacco then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Amber then
            return plot:IsCity() or improvement == Terrain.Quarry
        elseif resource == Terrain.Jade then
            return plot:IsCity() or improvement == Terrain.Quarry
        elseif resource == Terrain.Olives then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Perfume then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Coral then
            return plot:IsCity() or improvement == Terrain.FishingBoats
        elseif resource == Terrain.Lapis then
            return plot:IsCity() or improvement == Terrain.Quarry
        else return false
        end
    -- Gaia's Resource Compendium
    elseif Terrain.Lavender ~= nil then
        if resource == Terrain.Coffee then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Tea then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Tobacco then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Amber then
            return plot:IsCity() or improvement == Terrain.Mine
        elseif resource == Terrain.Jade then
            return plot:IsCity() or improvement == Terrain.Quarry
        elseif resource == Terrain.Olives then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Perfume then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Coral then
            return plot:IsCity() or improvement == Terrain.FishingBoats
        elseif resource == Terrain.Lapis then
            return plot:IsCity() or improvement == Terrain.Quarry
        elseif resource == Terrain.Lavender then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Poppy then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Coconut then
            return plot:IsCity() or improvement == Terrain.Plantation
        else return false
        end
    -- Barathor's More Luxuries
    elseif Terrain.Coffee ~= nil then
        if resource == Terrain.Coffee then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Tea then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Tobacco then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Amber then
            return plot:IsCity() or improvement == Terrain.Mine
        elseif resource == Terrain.Jade then
            return plot:IsCity() or improvement == Terrain.Mine
        elseif resource == Terrain.Olives then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Perfume then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.Coral then
            return plot:IsCity() or improvement == Terrain.FishingBoats
        elseif resource == Terrain.Lapis then
            return plot:IsCity() or improvement == Terrain.Mine
        else return false
        end
    -- Amer-Asian Resources
    elseif Terrain.AATea ~= nil then
        if resource == Terrain.AATea then
            return plot:IsCity() or improvement == Terrain.Plantation
        elseif resource == Terrain.AATobacco then
            return plot:IsCity() or improvement == Terrain.Plantation
        else return false
        end
	else return false
	end
end

-- Logs any good location factors to the console (convenient logged elsewhere)
function LogAdjacentGoodFactors(bountiful, desirable, important, historic, waterfront)
	if bountiful then
		print("Next to available Bonus Food")
	end
	if desirable then
		print("Next to an available Luxury")
	end
	if important then
		print("Next to an important site")
	end
	if historic then
		print("Next to a historic site")
	end
	if waterfront then
		print("Exploration Mode: on the water")
	end
end

-- Logs any great location factors to the console (convenient logged elsewhere)
function LogAdjacentGreatFactors(desirable, important, historic, waterfront)
	if desirable then
		print("Next to an available Luxury")
	end
	if important then
		print("Next to an important site")
	end
	if historic then
		print("Next to a historic site")
	end
	if waterfront then
		print("Exploration Mode: on the water")
	end
end

local _waterTiles = 0
-- Checks which good location factors this plot gets from adjacent plots
function CheckAdjacentGoodLocationFactors(plot)
	local bountiful = false
	local convenient = false
	local desirable = false
	local important = false
	local historic = false
	local byRoad = false
	local waterfront = false
	local _waterTiles = 0
	local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
	if adjPlot ~= nil then
		bountiful = IsFoodResourceAvailable(adjPlot)
		convenient = IsOasisOrLake(adjPlot)
		desirable = IsLuxuryResourceAvailable(adjPlot)
		important = IsPlotImportant(adjPlot)
		historic = IsPlotHistoric(adjPlot)
		byRoad = adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
	if adjPlot ~= nil then
		bountiful = bountiful or IsFoodResourceAvailable(adjPlot)
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
	if adjPlot ~= nil then
		bountiful = bountiful or IsFoodResourceAvailable(adjPlot)
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
	if adjPlot ~= nil then
		bountiful = bountiful or IsFoodResourceAvailable(adjPlot)
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
	if adjPlot ~= nil then
		bountiful = bountiful or IsFoodResourceAvailable(adjPlot)
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
	if adjPlot ~= nil then
		bountiful = bountiful or IsFoodResourceAvailable(adjPlot)
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	convenient = convenient or IsRiverOrCoast(plot)
	waterfront = _waterTiles >= 4
	LogAdjacentGoodFactors(bountiful, desirable, important, historic, waterfront)
	return bountiful, convenient, desirable, important, historic, byRoad, waterfront
end

-- Checks which great location factors this plot gets from adjacent plots
function CheckAdjacentGreatLocationFactors(plot)
	local convenient = false
	local desirable = false
	local important = false
	local historic = false
	local byRoad = false
	local waterfront = false
	_waterTiles = 0
	local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), E)
	if adjPlot ~= nil then
		convenient = IsOasisOrLake(adjPlot)
		desirable = IsLuxuryResourceAvailable(adjPlot)
		important = IsPlotImportant(adjPlot)
		historic = IsPlotHistoric(adjPlot)
		byRoad = adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), NE)
	if adjPlot ~= nil then
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), NW)
	if adjPlot ~= nil then
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), W)
	if adjPlot ~= nil then
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), SW)
	if adjPlot ~= nil then
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), SE)
	if adjPlot ~= nil then
		convenient = convenient or IsOasisOrLake(adjPlot)
		desirable = desirable or IsLuxuryResourceAvailable(adjPlot)
		important = important or IsPlotImportant(adjPlot)
		historic = historic or IsPlotHistoric(adjPlot)
		byRoad = byRoad or adjPlot:IsRoute()
		if bExploreMode and adjPlot:IsWater() then
			_waterTiles = _waterTiles + 1
		end
	end
	convenient = convenient or IsRiverOrCoast(plot)
	waterfront = _waterTiles >= 4
	LogAdjacentGreatFactors(desirable, important, historic, waterfront)
	return convenient, desirable, important, historic, byRoad, waterfront
end

-- Checks whether this plot has any location factor
function IsGoodLocation(plot)
	local rating = 0
	local bountiful, convenient, desirable, important, historic, byRoad, waterfront = CheckAdjacentGoodLocationFactors(plot)
	-- Exploration Mode: Waterfront
	if waterfront then
		print("Exploration Mode: on the water")
		return true
	end
	-- Bountiful
	if bountiful or IsGoodTerrain(plot) or IsFoodResource(plot) then
		rating = 1
	end
	-- Convenient
	if convenient or (byRoad and HasDirectFriendlyRoute(plot)) then
		rating = rating + 1
	end
	-- Desirable
	if desirable then
		rating = rating + 1
	end
	-- Important
	if important then
		rating = rating + 1
	end
	-- Historic
	if historic then
		rating = rating + 1
	end
	print("Good location rating: " .. rating)
	return rating > 0
end

-- Counts this plot's location factors excluding Bountiful
function GetGreatLocationRating(plot)
	local rating = 0
	local convenient, desirable, important, historic, byRoad, waterfront = CheckAdjacentGreatLocationFactors(plot)
	-- Convenient
	if convenient then
		rating = 1
	end
	-- Desirable
	if desirable then
		rating = rating + 1
	end
	-- Important
	if important then
		rating = rating + 1
	end
	-- Historic
	if historic then
		rating = rating + 1
	end
	-- Exploration Mode: Waterfront
	if waterfront then
		rating = rating + 1
	end
	print("Great location rating: " .. rating)
	return rating, (not convenient and byRoad)
end

-- Gets a friendly string listing the plot's location factors
function GetLocationFactorList(plot, countBountiful)
	local rating = 0
	local bountiful, convenient, desirable, important, historic, byRoad, waterfront = CheckAdjacentGoodLocationFactors(plot)
	bountiful = countBountiful and (bountiful or IsGoodTerrain(plot) or IsFoodResource(plot))
	convenient = convenient or (byRoad and HasDirectFriendlyRoute(plot))
	if bountiful then rating = 1 end
	if convenient then rating = rating + 1 end
	if desirable then rating = rating + 1 end
	if important then rating = rating + 1 end
	if historic then rating = rating + 1 end
	local result = ""
	if waterfront then
		result = WaterfrontStr
	end
	if rating < 1 then return BadLocationStr
	elseif rating < 2 then
		if bountiful then return BountifulStr
		elseif convenient then return result .. ConvenientStr
		elseif desirable then return DesirableStr
		elseif important then return ImportantStr
		else return HistoricStr
		end
	elseif rating < 3 then
		if bountiful then
			if convenient then return result .. ConvenientStr .. AndAlso .. BountifulStr
			elseif desirable then return DesirableStr .. AndAlso .. BountifulStr
			elseif important then return ImportantStr .. AndAlso .. BountifulStr
			else return HistoricStr .. AndAlso .. BountifulStr
			end
		elseif convenient then
			if desirable then return result .. DesirableStr .. AndAlso .. ConvenientStr
			elseif important then return result .. ImportantStr .. AndAlso .. ConvenientStr
			else return result .. HistoricStr .. AndAlso .. ConvenientStr
			end
		elseif desirable then
			if important then return DesirableStr .. AndAlso .. ImportantStr
			else return DesirableStr .. AndAlso .. HistoricStr
			end
		else return ImportantStr .. AndAlso .. HistoricStr
		end
	else
		if desirable then
			result = result .. DesirableStr
            if bountiful then
                if important then result = result .. AndNext .. ImportantStr end
                if historic then result = result .. AndNext .. HistoricStr end
                if convenient then result = result .. AndNext .. ConvenientStr end
                return result .. AndLast .. BountifulStr
            elseif convenient then
                if important then result = result .. AndNext .. ImportantStr end
                if historic then result = result .. AndNext .. HistoricStr end
                return result .. AndLast .. ConvenientStr
            else return result .. AndNext .. ImportantStr .. AndLast .. HistoricStr
            end
        elseif important then
            result = result .. ImportantStr
            if bountiful then
                if historic then result = result .. AndNext .. HistoricStr end
                if convenient then result = result .. AndNext .. ConvenientStr end
                return result .. AndLast .. BountifulStr
            else return result .. AndNext .. HistoricStr .. AndLast .. ConvenientStr
            end
        else return result .. HistoricStr .. AndNext .. ConvenientStr .. AndLast .. BountifulStr
        end
	end
end

-- Gets a hint explaining how to improve a plot's surroundings so it becomes a great location
function GetLocationFixHint(plot, countBountiful)
	print("Building a hint about how to improve this location...")
	local convenientTip = "make it [COLOR_POSITIVE_TEXT]convenient[ENDCOLOR] with a direct road to the City where people work"
	local desirableTip = "make it [COLOR_POSITIVE_TEXT]desirable[ENDCOLOR] with an improved Luxury"
	local importantTip = "make it [COLOR_POSITIVE_TEXT]important[ENDCOLOR] with a Great Person improvement"
	local historicTip = "make it [COLOR_POSITIVE_TEXT]historic[ENDCOLOR] with a Landmark"
    local bountifulTip
	local andThen = "[NEWLINE][ICON_BULLET] "
	local civ = pPlayer:GetCivilizationType()
	if civ == Netherlands then
		desirableTip = "make it [COLOR_POSITIVE_TEXT]desirable[ENDCOLOR] with a Polder or an improved Luxury"
	elseif civ == Portugal then
		importantTip = "make it [COLOR_POSITIVE_TEXT]important[ENDCOLOR] with a Great Person improvement or a Feitoria"
	elseif civ == France then
		historicTip = "make it [COLOR_POSITIVE_TEXT]historic[ENDCOLOR] with a Chateau or a Landmark"
	elseif civ == Morocco then
		historicTip = "make it [COLOR_POSITIVE_TEXT]historic[ENDCOLOR] with a Kasbah or a Landmark"
    elseif civ == Polynesia then
        historicTip = "make it [COLOR_POSITIVE_TEXT]historic[ENDCOLOR] with a Moai or a Landmark"
    elseif civ == Inca then
        bountifulTip = "make it [COLOR_POSITIVE_TEXT]bountiful[ENDCOLOR] with a Terrace Farm"
    elseif bVoxPopActive then
        if civ == Brazil then
            importantTip = "make it [COLOR_POSITIVE_TEXT]important[ENDCOLOR] with a Brazilwood Camp or a Great Person improvement"
        elseif civ == Maya then
            historicTip = "make it [COLOR_POSITIVE_TEXT]historic[ENDCOLOR] with a Kuna or a Landmark"
        elseif civ == China then
            convenientTip = "make it [COLOR_POSITIVE_TEXT]convenient[ENDCOLOR] with a Siheyuan or a direct road to the City where people work"
        elseif civ == Spain then
            convenientTip = "make it [COLOR_POSITIVE_TEXT]convenient[ENDCOLOR] with a Hacienda or a direct road to the City where people work"
        elseif civ == Shoshone then
            convenientTip = "make it [COLOR_POSITIVE_TEXT]convenient[ENDCOLOR] with an Encampment or a direct road to the City where people work"
        end
	end
	local convenient, desirable, important, historic, byRoad, waterfront = CheckAdjacentGreatLocationFactors(plot)
	convenient = convenient or (byRoad and HasDirectFriendlyRoute(plot))
	if countBountiful then
        if civ == Inca then
            return "[COLOR_POSITIVE_TEXT]ANY[ENDCOLOR] of the following:" .. andThen .. bountifulTip .. andThen .. convenientTip .. andThen .. desirableTip .. andThen .. importantTip .. andThen .. historicTip
        else
		    return "[COLOR_POSITIVE_TEXT]ANY[ENDCOLOR] of the following:" .. andThen .. convenientTip .. andThen .. desirableTip .. andThen .. importantTip .. andThen .. historicTip
        end
    elseif convenient then
		return "[COLOR_POSITIVE_TEXT]ANY[ENDCOLOR] of the following:" .. andThen .. desirableTip .. andThen .. importantTip .. andThen .. historicTip
	elseif desirable then
		return "[COLOR_POSITIVE_TEXT]ANY[ENDCOLOR] of the following:" .. andThen .. convenientTip .. andThen .. importantTip .. andThen .. historicTip
	elseif important then
		return "[COLOR_POSITIVE_TEXT]ANY[ENDCOLOR] of the following:" .. andThen .. convenientTip .. andThen .. desirableTip .. andThen .. historicTip
	elseif historic then
		return "[COLOR_POSITIVE_TEXT]ANY[ENDCOLOR] of the following:" .. andThen .. convenientTip .. andThen .. desirableTip .. andThen .. importantTip
	else
		return "[COLOR_POSITIVE_TEXT]TWO[ENDCOLOR] of the following:" .. andThen .. convenientTip .. andThen .. desirableTip .. andThen .. importantTip .. andThen .. historicTip
	end
end

-- Checks that this plot isn't a City or Large Town
function IsntCityOrLargeTown(plot)
	return (not plot:IsCity()) and (plot:GetImprovementType() ~= LargeTown)
end

-- Checks for a plot that's bypassing Town adjacency rules,
-- or is already a City or Large Town
function IsntBypassOrCityOrLargeTown(plot)
	return (not GetBypass(plot)) and (not plot:IsCity()) and (plot:GetImprovementType() ~= LargeTown)
end

-- Liberty Mode: checks that this plot isn't a Large Town or an adjacent City
function IsntLargeTownOrAdjacentCity(plot, ring)
	if ring > 1 then
		return plot:GetImprovementType() ~= LargeTown
	else
		return (not plot:IsCity()) and (plot:GetImprovementType() ~= LargeTown)
	end
end

-- Liberty Mode: checks for a plot that's bypassing Town adjacency rules,
-- or is already a Large Town. Cities are ignored unless they're adjacent
function IsntBypassOrLargeTownOrAdjacentCity(plot, ring)
    if ring > 1 then
	    return (not GetBypass(plot)) and (plot:GetImprovementType() ~= LargeTown)
    else
        return (not GetBypass(plot)) and (not plot:IsCity()) and (plot:GetImprovementType() ~= LargeTown)
    end
end

-- Tradition Mode: checks that this plot isn't a City or a Large Town (ignoring suburbs)
function IsntCityOrNonSuburb(plot)
	return (not plot:IsCity()) and (plot:GetImprovementType() ~= LargeTown or GetSuburb(plot))
end

-- Tradition Mode: checks for a plot that's bypassing Town adjacency rules,
-- or is already a City or a Large Town other than a suburb
function IsntBypassOrCityOrNonSuburb(plot)
	return (not GetBypass(plot)) and (not plot:IsCity()) and (plot:GetImprovementType() ~= LargeTown or GetSuburb(plot))
end

-- Tradition Mode: checks if the plot is still a suburb
function CheckSuburb(plot)
	if GetSuburb(plot) then
		local improvement = plot:GetImprovementType()
		if improvement == Village or improvement == Town or improvement == LargeTown then
			return true
		else
			SetSuburb(plot, false)
		end
	end
	return false
end

-- Tradition Mode: counts suburbs next to the current City
-- (called for all Cities in case they were in Tradition Mode before conquest)
function CountSuburbs()
	if iSuburbs == 0 and iPolicyMode ~= TraditionMode then
		return
	else
		iSuburbs = 0
	end
	local x, y = pCityPlot:GetX(), pCityPlot:GetY()
	local adjPlot = Map.PlotDirection(x, y, E)
	if adjPlot ~= nil then
		if CheckSuburb(adjPlot) then
			print("Suburb to the E")
			iSuburbs = 1
		end
	end
	adjPlot = Map.PlotDirection(x, y, NE)
	if adjPlot ~= nil then
		if CheckSuburb(adjPlot) then
			print("Suburb to the NE")
			iSuburbs = iSuburbs + 1
		end
	end
	adjPlot = Map.PlotDirection(x, y, NW)
	if adjPlot ~= nil then
		if CheckSuburb(adjPlot) then
			print("Suburb to the NW")
			iSuburbs = iSuburbs + 1
		end
	end
	adjPlot = Map.PlotDirection(x, y, W)
	if adjPlot ~= nil then
		if CheckSuburb(adjPlot) then
			print("Suburb to the W")
			iSuburbs = iSuburbs + 1
		end
	end
	adjPlot = Map.PlotDirection(x, y, SW)
	if adjPlot ~= nil then
		if CheckSuburb(adjPlot) then
			print("Suburb to the SW")
			iSuburbs = iSuburbs + 1
		end
	end
	adjPlot = Map.PlotDirection(x, y, SE)
	if adjPlot ~= nil then
		if CheckSuburb(adjPlot) then
			print("Suburb to the SE")
			iSuburbs = iSuburbs + 1
		end
	end
	print("City has " .. iSuburbs .. " suburbs")
	SetNumSuburbs()
end

-- If the plot is a suburb, increases the suburb counter for this City
function CheckAndAddSuburb(plot)
    if CheckSuburb(plot) then
        iSuburbs = iSuburbs + 1
    end
end

-- Tradition Mode + Vox Populi: counts suburbs within 2 rings of the current City
-- (called for all Cities in case they were in Tradition Mode before conquest)
function CountSuburbsVP()
    RingwiseLoop(pCityPlot, 2, CheckAndAddSuburb)
end

-- Tradition Mode: Gets the number of suburbs allowed next to this City based on its Population
function GetAllowedSuburbs()
	iAllowedSuburbs = pCity:GetPopulation() / TraditionPopPerSuburb
end

-- Tradition Mode: Rates the plot as a candidate for a new suburb
function RateSuburbCandidate(plot)
	if plot == nil or GetSuburb(plot) then
		return -1
	else
		local improvement = plot:GetImprovementType()
		if improvement == Town then
			local rating, needsRoadCheck = GetGreatLocationRating(plot)
			if needsRoadCheck then
				rating = rating + 1
				print("+1 for easy commute")
				print("Great location rating: " .. rating)
			end
			if rating > 1 then
				-- An eligible Town beats an equally eligible Village
				return rating + 1
			else
				return rating
			end
		elseif improvement == Village then
			local rating, needsRoadCheck = GetGreatLocationRating(plot)
			if needsRoadCheck then
				rating = rating + 1
				print("+1 for easy commute")
				print("Great location rating: " .. rating)
			end
			return rating
		else
			return -1
		end
	end
end

-- Tradition Mode + Vox Populi + China: Rates the plot as a candidate for a new suburb
function RateSuburbCandidateForVPChina(plot)
    local x, y = pCityPlot:GetX(), pCityPlot:GetY()
	local adjPlot = Map.PlotDirection(x, y, E)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.VPSiheyuan then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, NE)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.VPSiheyuan then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, NW)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.VPSiheyuan then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, W)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.VPSiheyuan then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, SW)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.VPSiheyuan then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, SE)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.VPSiheyuan then
			return RateSuburbCandidate(plot)
		end
	end
    return -1
end

-- Tradition Mode + Vox Populi + Morocco: Rates the plot as a candidate for a new suburb
function RateSuburbCandidateForVPMorocco(plot)
    local x, y = pCityPlot:GetX(), pCityPlot:GetY()
	local adjPlot = Map.PlotDirection(x, y, E)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.Kasbah then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, NE)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.Kasbah then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, NW)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.Kasbah then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, W)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.Kasbah then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, SW)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.Kasbah then
			return RateSuburbCandidate(plot)
		end
	end
	adjPlot = Map.PlotDirection(x, y, SE)
	if adjPlot ~= nil then
		if adjPlot:IsCity() or adjPlot:GetImprovementType() == Terrain.Kasbah then
			return RateSuburbCandidate(plot)
		end
	end
    return -1
end

-- Tradition Mode: Checks if this City has enough Population to support a new suburb
function IsNewSuburbAllowed()
	local diff = iAllowedSuburbs - iSuburbs
	local thresh = 1 - (0.5 / TraditionPopPerSuburb)
	return diff > thresh
end

-- Tradition Mode: Checks if an additional settlement can be marked as a suburb
function CheckForNewSuburb()
	if IsNewSuburbAllowed() then
        local plot
        local civ = pPlayer:GetCivilizationType()
        if bVoxPopActive and civ == China or civ == Morocco then
            local bestRating
            if civ == China then
                bestRating, plot = RingwiseMax(pCityPlot, 2, RateSuburbCandidateForVPChina)
            elseif civ == Morocco then
                bestRating, plot = RingwiseMax(pCityPlot, 2, RateSuburbCandidateForVPMorocco)
            end
            if bestRating > 1 then
                print("Tradition Mode + Vox Populi: Plot at " .. plot:GetX() .. ", " .. plot:GetY() .. " marked for suburb development")
            else
                plot = nil
            end
        else
            print("Checking for new suburb")
            -- Get all candidates
            local rateE = RateSuburbCandidate(Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), E))
            local rateNE = RateSuburbCandidate(Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), NE))
            local rateNW = RateSuburbCandidate(Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), NW))
            local rateW = RateSuburbCandidate(Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), W))
            local rateSW = RateSuburbCandidate(Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), SW))
            local rateSE = RateSuburbCandidate(Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), SE))
            local bestDirection = E
            local bestRating = rateE
            if rateNE > bestRating then
                bestDirection = NE
                bestRating = rateNE
            end
            if rateNW > bestRating then
                bestDirection = NW
                bestRating = rateNW
            end
            if rateW > bestRating then
                bestDirection = W
                bestRating = rateW
            end
            if rateSW > bestRating then
                bestDirection = SW
                bestRating = rateSW
            end
            if rateSE > bestRating then
                bestDirection = SE
                bestRating = rateSE
            end
            print("Best direction: " .. bestDirection .. " with rating " .. bestRating)
            if bestRating > 1 then
                print("Tradition Mode: Plot to the " .. bestDirection .. " marked for suburb development")
                plot = Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), bestDirection)
            end
        end
        if plot ~= nil then
			SetSuburb(plot, true)
            SetCityHideMsg(false)
			if bIsHuman then
				local settlementStr
				local improvement = plot:GetImprovementType()
				if plot:GetImprovementType() == Village then
					settlementStr = VillageStr
				else
					settlementStr = TownStr
				end
				local cityName = pCity:GetName()
				pPlayer:AddNotification(noteGrow, "Wealthy citizens of " .. cityName .. " have started buying up real estate in a " .. settlementStr .. " nearby, making it a [COLOR_POSITIVE_TEXT]suburb[ENDCOLOR] of " .. cityName .. ". If worked, it will eventually grow into a Large Town.", "A Suburb of " .. cityName, plot:GetX(), plot:GetY())
			end
		else
			print("Tradition Mode: No candidate for a new suburb despite high enough population")
			if bIsHuman and not CityTable[pCityPlot].hideMsg then
				local cityName = pCity:GetName()
                if civ == China and bVoxPopActive then
                    pPlayer:AddNotification(note, "Wealthy citizens of " .. cityName .. " are looking for housing in a great location nearby, where they can buy spacious homes and commute into the city. Improve a tile - either adjacent, or 2 tiles away and next to a Siheyuan - with a Village or a Town in a great location, and it will soon become a suburb.", cityName .. "'s Suburbs Can Expand", pCityPlot:GetX(), pCityPlot:GetY())
				elseif civ == Morocco and bVoxPopActive then
                    pPlayer:AddNotification(note, "Wealthy citizens of " .. cityName .. " are looking for housing in a great location nearby, where they can buy spacious homes and commute into the city. Improve a tile - either adjacent, or 2 tiles away and next to a Kasbah - with a Village or a Town in a great location, and it will soon become a suburb.", cityName .. "'s Suburbs Can Expand", pCityPlot:GetX(), pCityPlot:GetY())
				else
				    pPlayer:AddNotification(note, "Wealthy citizens of " .. cityName .. " are looking for housing in a great location nearby, where they can buy spacious homes and commute into the city. Improve an adjacent tile with a Village or a Town in a great location, and it will soon become a suburb.", cityName .. "'s Suburbs Can Expand", pCityPlot:GetX(), pCityPlot:GetY())
				end
                SetCityHideMsg(true)
			end
		end
	end
end

-- Checks if this city's population has dropped too low to sustain its suburbs
function CheckForPopCrash()
	if iSuburbs < 1 then return end
	local crash = false
	local x, y = pCityPlot:GetX(), pCityPlot:GetY()
	if iPolicyMode == TraditionMode then
		crash = iAllowedSuburbs - iSuburbs < -1
	elseif iSuburbs > 0 then
		crash = pCity:GetHighestPopulation() - pCity:GetPopulation() > TraditionPopPerSuburb
	end
	if crash then
		print("!! Population has crashed! Collapsing suburbs")
		if bIsHuman then
			pPlayer:AddNotification(noteShrink, "[COLOR_NEGATIVE_TEXT]Suburban Population Crash[ENDCOLOR][NEWLINE]" .. pCity:GetName() .. "'s populace has been devastated, and its suburbs have collapsed!", "[COLOR_NEGATIVE_TEXT]Suburban Population Crash[ENDCOLOR]", pCityPlot:GetX(), pCityPlot:GetY())
		end
		local adjPlot = Map.PlotDirection(x, y, E)
		if adjPlot ~= nil then
			SetSuburb(adjPlot, false)
			if adjPlot:GetImprovementType() == LargeTown then
				adjPlot:SetImprovementType(Town)
			end
		end
		adjPlot = Map.PlotDirection(x, y, NE)
		if adjPlot ~= nil then
			SetSuburb(adjPlot, false)
			if adjPlot:GetImprovementType() == LargeTown then
				adjPlot:SetImprovementType(Town)
			end
		end
		adjPlot = Map.PlotDirection(x, y, NW)
		if adjPlot ~= nil then
			SetSuburb(adjPlot, false)
			if adjPlot:GetImprovementType() == LargeTown then
				adjPlot:SetImprovementType(Town)
			end
		end
		adjPlot = Map.PlotDirection(x, y, W)
		if adjPlot ~= nil then
			SetSuburb(adjPlot, false)
			if adjPlot:GetImprovementType() == LargeTown then
				adjPlot:SetImprovementType(Town)
			end
		end
		adjPlot = Map.PlotDirection(x, y, SW)
		if adjPlot ~= nil then
			SetSuburb(adjPlot, false)
			if adjPlot:GetImprovementType() == LargeTown then
				adjPlot:SetImprovementType(Town)
			end
		end
		adjPlot = Map.PlotDirection(x, y, SE)
		if adjPlot ~= nil then
			SetSuburb(adjPlot, false)
			if adjPlot:GetImprovementType() == LargeTown then
				adjPlot:SetImprovementType(Town)
			end
		end
		CountSuburbs()
	end
end

-- Checks whether this plot is a Large Town
function IsNonSuburbLargeTown(plot)
	return plot:GetImprovementType() == LargeTown and not GetSuburb(plot)
end

-- Checks whether this plot is within 2 tiles of a City or Large Town
-- (Liberty Mode: ignores non-adjacent Cities)
-- (Tradition Mode: allows suburbs next to Cities depending on City Population)
function IsNearLargeTown(plot)
	if iPolicyMode == LibertyMode then
		print("Liberty Mode: checking if near existing Large Town or adjacent City")
		return not RingwiseCheckByRing(plot, 2, IsntLargeTownOrAdjacentCity)
	elseif iPolicyMode == TraditionMode then
		if GetSuburb(plot) then
			print("Tradition Mode: ignoring adjacency rules for suburb")
			return false
		else
			print("Tradition Mode: checking if near existing non-suburb Large Town")
			return not RingwiseCheck(plot, 2, IsntCityOrNonSuburb)
		end
	else
		print("Checking if near existing City or Large Town")
		return not RingwiseCheck(plot, 2, IsntCityOrLargeTown)
	end
end

-- Checks whether this plot is within 2 tiles of a settlement that's already bypassing adjacency rules
-- normal mode: as well as Cities or Large Towns
-- Liberty mode: as well as Large Towns
-- Tradition mode: as well as Cities or Large Towns other than suburbs
function IsNearBypassOrLargeTown(plot)
	if iPolicyMode == LibertyMode then
		print("Liberty Mode: checking if near Large Town, adjacent City, or settlement already bypassing adjacency rules")
		return not RingwiseCheckByRing(plot, 2, IsntBypassOrLargeTownOrAdjacentCity)
	elseif iPolicyMode == TraditionMode then
        if GetSuburb(plot) then
            print("Tradition Mode: ignoring adjacency rules for suburb")
            return false
        else
            print("Tradition Mode: checking if near non-suburb Large Town, City, or settlement already bypassing adjacency rules")
            return not RingwiseCheck(plot, 2, IsntBypassOrCityOrNonSuburb)
        end
	else
		print("Checking if near Large Town, City, or settlement already bypassing adjacency rules")
		return not RingwiseCheck(plot, 2, IsntBypassOrCityOrLargeTown)
	end
end

-- People leave a Town that no longer has a good location
-- (adjacency rules are ignored)
function IsTownDowngrading(plot)
	return not IsGoodLocation(plot)
end

-- People leave a Large Town that no longer has a great location
-- (adjacency rules are ignored)
function IsLargeTownDowngrading(plot)
	local rating, needsRoadCheck = GetGreatLocationRating(plot)
	if rating < 1 then
		return true
	elseif rating < 2 then
		if needsRoadCheck then
			if GetSuburb(plot) then
				print("Is suburb: easy commute")
				return false
			elseif HasDirectFriendlyRoute(plot) then
				return false
			end
		end
		return true
	end
	return false
end

-- Clears the settlement data for a removed settlement
function ClearData(plot)
	print("Settlement no longer present at " .. plot:GetX() .. ", " .. plot:GetY())
	SetXP(plot, nil)
	SetCooldown(plot, nil)
	SetHideMsg(plot, nil)
	SetBypass(plot, nil)
	MapTable[plot] = nil
end

-- Levels up the Village into a Town
function LevelUpVillage(plot)
	plot:SetImprovementType(Town)
	SetXP(plot, 0)
	SetHideMsg(plot, false)
	print("!! Village upgraded to Town (imp. #" .. Town .. ")")
	if bIsHuman then
		if GetSuburb(plot) then
			local cityName = pCity:GetName()
			pPlayer:AddNotification(noteGrow, "A [COLOR_POSITIVE_TEXT]bustling suburb of " .. cityName .. "[ENDCOLOR] has grown! Many successful citizens of " .. cityName .. " now live here, spending some of their wealth in the local shops and restaurants.", "[COLOR_POSITIVE_TEXT]A Suburb has grown![ENDCOLOR]", plot:GetX(), plot:GetY())
		else
			pPlayer:AddNotification(noteGrow, "A bustling Village has [COLOR_POSITIVE_TEXT]grown into a Town[ENDCOLOR]! The streets are packed with townsfolk milling about as they frequent the shops and stalls.", "[COLOR_POSITIVE_TEXT]A Village has grown![ENDCOLOR]", plot:GetX(), plot:GetY())
		end
	end
end

-- Check whether this Village can gain XP (or lose XP)
function CheckVillageXP(plot, allowTownBypass)
	print("-> Village at " .. plot:GetX() .. ", " .. plot:GetY())
	if MapTable[plot] == nil then
		-- Load/initialize
		LoadPlot(plot, Village)
	end
	if plot:IsImprovementPillaged() then
		if iPolicyMode ~= TraditionMode and GetSuburb(plot) then
			print("!! Pillaged! Village lost grandfathered suburb privileges")
			SetSuburb(plot, false)
		end
		print("-- Pillaged! Lost 1 XP")
		local xp = MapTable[plot].xp - 1
		if xp == -1 then
			pPlayer:AddNotification(noteShrink, "A Village has been ransacked, and its population is fleeing! Restore it within " .. TownXP .. " turns before it is destroyed.", "Village Ransacked!", plot:GetX(), plot:GetY())
			SetHideMsg(plot, false)
			SetXP(plot, xp, true)
			print("XP is now " .. xp)
		elseif xp < -TownXP then
			-- Too many residents have fled
			plot:SetImprovementType(-1)
			ClearData(plot)
			pPlayer:AddNotification(noteShrink, "[COLOR_NEGATIVE_TEXT]Village Burned Down[ENDCOLOR][NEWLINE]Where once was a Village lies only smoldering rubble.", "[COLOR_NEGATIVE_TEXT]Village Burned Down![ENDCOLOR]", plot:GetX(), plot:GetY())
		else
			SetXP(plot, xp, true)
			print("XP is now " .. xp)
		end
	else
		print("Is not pillaged")
		if plot:IsBeingWorked() then
			print("Is being worked")
			if MapTable[plot].cooldown > 0 then
				print("On cooldown for " .. MapTable[plot].cooldown .. " turns")
				SetCooldown(plot, MapTable[plot].cooldown - 1)
			else

				-- Check location rating
				local greatRating, needsRoadCheck = GetGreatLocationRating(plot)
				if GetSuburb(plot) then
					if needsRoadCheck then
						greatRating = greatRating + 1
						print("+1 for easy commute")
						print("Great location rating: " .. greatRating)
					end
					if greatRating >= 2 then
						print("Suburban Village is growing quickly")
						local xp = MapTable[plot].xp + 2
						print("++ XP is now " .. xp)
						if xp > TownXP then
							LevelUpVillage(plot)
						else
							SetXP(plot, xp, true)
						end
					else
						SetSuburb(plot, false)
						pPlayer:AddNotification(note, "A Village is no longer a favored suburb of " .. pCity:GetName(), "Suburban Growth Stalls", plot:GetX(), plot:GetY())
					end
				else
                    if greatRating < 1 and not IsGoodTerrain(plot) and not IsBountifulLocation(plot) then
                        if needsRoadCheck and HasDirectFriendlyRoute(plot) then
                            greatRating = greatRating + 1
                            needsRoadCheck = false
                        else
                            print("Bad location for a Town (cooldown started)")
                            if bIsHuman and (MapTable[plot].hideMsg == false) then
                                if IsAdjacentToTown(plot) then
                                    pPlayer:AddNotification(note, "An impoverished Village can't grow into a Town, since it's in a poor location near another Town.", "An Impoverished Village", plot:GetX(), plot:GetY())
                                else
                                    local fixHint = GetLocationFixHint(plot, true)
                                    pPlayer:AddNotification(note, "A backwater Village isn't on bountiful terrain or a convenient water feature. To help it grow, you can improve adjacent tiles with " .. fixHint, "A Backwater Village", plot:GetX(), plot:GetY())
                                end
                                SetHideMsg(plot, true)
                            end
                            SetCooldown(plot, 3)
                            return
                        end
                    end
                    if IsAdjacentToTown(plot) then
                        local bypass = false
                        if allowTownBypass == true then
                            if GetBypass(plot) then bypass = true
                            else
                                if greatRating >= 1 and not IsNearBypassOrLargeTown(plot) then
                                    if greatRating == 1 and needsRoadCheck and HasDirectFriendlyRoute(plot) then
                                        greatRating = greatRating + 1
										print("Great location rating: " .. greatRating)
                                        needsRoadCheck = false
                                    end
                                    if greatRating >= 2 then
                                        bypass = true
                                        SetBypass(plot, true)
                                        SetHideMsg(plot, false)
                                        if bIsHuman then
                                            pPlayer:AddNotification(noteGrow, "A burgeoning Village is growing rapidly! Its location is " .. GetLocationFactorList(plot, false) .. ". If worked, it may soon grow to surpass its neighbors.", "A Burgeoning Village", plot:GetX(), plot:GetY())
                                        end
                                    end
                                end
                            end
                            if bypass then
                                print("Bypassing Town adjacency for a Village in a great location")
                                local xp = MapTable[plot].xp + 2
                                print("++ XP is now " .. xp)
                                if xp > TownXP then
                                    LevelUpVillage(plot)
                                else
                                    SetXP(plot, xp)
                                end
                            end
                        end
                        if not bypass then
                            print("Village can't grow because it's next to a Town (cooldown started)")
                            if bIsHuman and (MapTable[plot].hideMsg == false) then
                                pPlayer:AddNotification(note, "A Village has become a quiet neighborhood near a Town, and can't grow into a Town of its own.", "A Quiet Neighborhood", plot:GetX(), plot:GetY())
                                SetHideMsg(plot, true)
                            end
                            SetCooldown(plot, 3)
                        end
                    else
                        print("Good location for a Town")
                        local xp = MapTable[plot].xp + 1
                        SetHideMsg(plot, false)
                        if xp == 1 then
                            pPlayer:AddNotification(noteGrow, "A bustling Village is growing! Its location is " .. GetLocationFactorList(plot, true) .. ". If worked, it will grow into a Town in " .. TownXP .. " turns.", "A Bustling Village", plot:GetX(), plot:GetY())
                        end
                        print("++ XP is now " .. xp)
                        if xp > TownXP then
                            LevelUpVillage(plot)
                        else
                            SetXP(plot, xp)
                        end
                    end
                end

			end
		end
	end
end

-- Shrinks the Town to a Village
function ShrinkTown(plot)
	if plot:IsImprovementPillaged() then
		pPlayer:AddNotification(noteShrink, "[COLOR_NEGATIVE_TEXT]Town Ransacked[ENDCOLOR]Once a bustling Town, so many have fled that only a Village remains here.", "[COLOR_NEGATIVE_TEXT]Town Ransacked[ENDCOLOR]", plot:GetX(), plot:GetY())
	else
		pPlayer:AddNotification(noteShrink, "[COLOR_NEGATIVE_TEXT]A Ghost Town[ENDCOLOR][NEWLINE]Once a bustling Town, so many have left that only a Village remains here.", "[COLOR_NEGATIVE_TEXT]A Ghost Town[ENDCOLOR]", plot:GetX(), plot:GetY())
	end
	plot:SetImprovementType(Village)
	SetXP(plot, 0)
	SetCooldown(plot, 0)
	SetHideMsg(plot, false)
	print("!! Town downgraded to Village (imp. #" .. Village .. ")")
end

function CollapseSuburbanTown(plot)
	print("!! Pillaged and collapsed! Grandfathered suburb no longer in Tradition Mode")
	pPlayer:AddNotification(noteShrink, "[COLOR_NEGATIVE_TEXT]Suburban Collapse[ENDCOLOR][NEWLINE]A Town has been pillaged! Once a flourishing suburb, its supply chain has collapsed!", "[COLOR_NEGATIVE_TEXT]Suburban Collapse![ENCOLOR]", plot:GetX(), plot:GetY())
	plot:SetImprovementType(Village)
	SetXP(plot, 0, true)
	SetHideMsg(plot, false)
	SetSuburb(plot, false)
end

-- Restores 1 negative XP to a Town
function HealTown(plot)
	print("++ Emigrants return: +1 XP from negative")
	local xp = MapTable[plot].xp + 1
	SetXP(plot, xp)
	print("XP is now " .. xp)
	if xp == 0 then
		SetHideMsg(plot, false)
	elseif MapTable[plot].hideMsg == false then
		pPlayer:AddNotification(note, "Conditions in a Town have improved, and the population is returning!", "Townsfolk returning", plot:GetX(), plot:GetY())
		SetHideMsg(plot, true)
	end
end

-- Restores 1 negative XP to a Large Town
function HealLargeTown(plot)
	print("++ Emigrants return: +1 XP from negative")
	local xp = MapTable[plot].xp + 1
	SetXP(plot, xp)
	print("XP is now " .. xp)
	if xp == 0 then
		SetHideMsg(plot, false)
	elseif MapTable[plot].hideMsg == false then
		pPlayer:AddNotification(note, "Conditions in a Large Town have improved, and the population is returning!", "Townsfolk returning", plot:GetX(), plot:GetY())
		SetHideMsg(plot, true)
	end
end

-- Checks whether this Town needs to lose XP
function CheckTownLostXP(plot)
	print("-> Town at " .. plot:GetX() .. ", " .. plot:GetY() .. " (can only lose XP)")
	if MapTable[plot] == nil then
		-- Load/initialize
		LoadPlot(plot)
	end
	if plot:IsImprovementPillaged() then
		if iPolicyMode ~= TraditionMode and GetSuburb(plot) then
			CollapseSuburbanTown(plot)
		else
			print("-- Pillaged! Lost 1 XP")
			local xp = MapTable[plot].xp - 1
			if xp == -1 then
				pPlayer:AddNotification(noteShrink, "A Town has been pillaged, and its population is fleeing! Restore it within " .. TownXP .. " turns before it shrinks to a Village.", "Refugees flee Town", plot:GetX(), plot:GetY())
				SetHideMsg(plot, false)
				SetXP(plot, xp, true)
				print("XP is now " .. xp)
			elseif xp < -TownXP then
				-- Too many residents have fled
				ShrinkTown(plot)
			else
				SetXP(plot, xp, true)
				print("XP is now " .. xp)
			end
		end
	elseif IsTownDowngrading(plot) then
		print("-- Emigration! Lost 1 XP")
		local xp = MapTable[plot].xp - 1
		if xp == -1 then
			pPlayer:AddNotification(noteShrink, "A Town's economy is faltering, and its population is dwindling! Improve its surroundings within " .. TownXP .. " turns or it will shrink to a Village.", "Migrants leave Town", plot:GetX(), plot:GetY())
			SetHideMsg(plot, false)
			SetXP(plot, xp)
			print("XP is now " .. xp)
		elseif xp < -TownXP then
			-- Too many residents have left
			ShrinkTown(plot)
		else
			SetXP(plot, xp)
			print("XP is now " .. xp)
		end
	elseif MapTable[plot].xp < 0 then
		HealTown(plot)
	end
end

-- Collapses a Town that was bypassing adjacency rules, but can no longer grow into a Large Town
function CollapseTownBypassingAdjacency(plot, lostGreatLocation)
	if (not IsAdjacentToTown(plot)) then
		SetBypass(plot, false)
	else
		print("!! Town was bypassing adjacency but can't grow into a Large Town anymore! Instantly shrunk to a Village!")
		plot:SetImprovementType(Village)
		SetXP(plot, 0)
		SetBypass(plot, false)
		SetHideMsg(plot, true)
		if lostGreatLocation == true then
			pPlayer:AddNotification(noteShrink, "Seemingly overnight, a Town's economy collapsed! Many of the townsfolk have left in search of better prospects.", "[COLOR_NEGATIVE_TEXT]Town Economic Collapse[ENDCOLOR]", plot:GetX(), plot:GetY())
		else
			pPlayer:AddNotification(noteShrink, "A Town was eclipsed by another settlement in the region! Many of the local merchants have closed shop and moved away.", "[COLOR_NEGATIVE_TEXT]Merchants leave Town[ENDCOLOR]", plot:GetX(), plot:GetY())
		end
	end
end

-- Check whether this Town can gain XP (or lose XP)
function CheckTownXP(plot)
	print("-> Town at " .. plot:GetX() .. ", " .. plot:GetY())
	if MapTable[plot] == nil then
		-- Load/initialize
		LoadPlot(plot)
	end
	if plot:IsImprovementPillaged() then
		if iPolicyMode ~= TraditionMode and GetSuburb(plot) then
			CollapseSuburbanTown(plot)
		else
			print("-- Pillaged! Lost 1 XP")
			local xp = MapTable[plot].xp - 1
			if xp == -1 then
				pPlayer:AddNotification(noteShrink, "[COLOR_NEGATIVE_TEXT]Refugees flee Town[ENDCOLOR][NEWLINE]A Town has been pillaged, and its population is fleeing! Restore it within " .. TownXP .. " turns before it shrinks to a Village.", "[COLOR_NEGATIVE_TEXT]Refugees flee Town[ENDCOLOR]", plot:GetX(), plot:GetY())
				SetHideMsg(plot, false)
				SetXP(plot, xp, true)
				print("XP is now " .. xp)
			elseif xp < -TownXP then
				-- Too many residents have fled
				ShrinkTown(plot)
			else
				SetXP(plot, xp, true)
				print("XP is now " .. xp)
			end
		end
	else
		print("Is not pillaged")

		-- Check location rating
		local rating, needsRoadCheck = GetGreatLocationRating(plot)
		if rating < 1 then
			if not IsGoodTerrain(plot) and not IsBountifulLocation(plot) then
                if needsRoadCheck and HasDirectFriendlyRoute(plot) then
                    rating = rating + 1
                    print("Great location rating: " .. rating)
                    needsRoadCheck = false
                end
                if rating < 1 then
                    print("-- Emigration! Lost 1 XP")
                    local xp = MapTable[plot].xp - 1
                    if xp == -1 then
                        pPlayer:AddNotification(noteShrink, "[COLOR_NEGATIVE_TEXT]Migrants leave Town[ENDCOLOR][NEWLINE]A Town's economy is faltering, and its population is dwindling! Improve its surroundings within " .. TownXP .. " turns or it will shrink to a Village.", "[COLOR_NEGATIVE_TEXT]Migrants leave Town[ENDCOLOR]", plot:GetX(), plot:GetY())
                        SetHideMsg(plot, false)
                        SetXP(plot, xp)
                        print("XP is now " .. xp)
                    elseif xp < -TownXP then
                        -- Too many residents have left
                        ShrinkTown(plot)
                    else
                        SetXP(plot, xp)
                        print("XP is now " .. xp)
                    end
                    return
                end
			end
        end
		if MapTable[plot].xp < 0 then
			HealTown(plot)
		elseif MapTable[plot].cooldown > 0 then
			print("On cooldown for " .. MapTable[plot].cooldown .. " turns")
			SetCooldown(plot, MapTable[plot].cooldown - 1)
		elseif not plot:IsBeingWorked() then
			print("Isn't currently worked")
		else
            local crowded, checkedRoom = false, false
            if rating < 2 then
                if rating == 1 and needsRoadCheck then
                    checkedRoom = true
                    if IsNearLargeTown(plot) then
                        crowded = true
                    elseif HasDirectFriendlyRoute(plot) then
                        rating = rating + 1
                        print("Great location rating: " .. rating)
                        needsRoadCheck = false
                    end
                end
                if rating < 2 then
                    print("Bad location for a Large Town")
                    if MapTable[plot].bypass == true then
                        CollapseTownBypassingAdjacency(plot, true)
                    elseif bIsHuman and (MapTable[plot].hideMsg == false) then
                        if (checkedRoom and crowded) or (not checkedRoom and IsNearLargeTown(plot)) then
                            pPlayer:AddNotification(note, "A boring Town can't grow any further. The populace is set in their ways, and the brightest young minds are drawn to larger settlements in the region.", "A Boring Town", plot:GetX(), plot:GetY())
                        else
                            local fixHint = GetLocationFixHint(plot, false)
                            pPlayer:AddNotification(note, "A Town's economy is stagnant. To help it grow into a Large Town, you can improve adjacent tiles with " .. fixHint, "A Stagnant Town", plot:GetX(), plot:GetY())
                        end
                        SetHideMsg(plot, true)
                    end
                    return
                end
            end
            if (checkedRoom and crowded) or (not checkedRoom and IsNearLargeTown(plot)) then
                print("Town can't grow because it's near a City or Large Town (cooldown started)")
                if MapTable[plot].bypass == true then
                    CollapseTownBypassingAdjacency(plot, false)
                elseif bIsHuman and (MapTable[plot].hideMsg == false) then
                    pPlayer:AddNotification(note, "A pleasant Town happens to be in a great location, but its residents are content to live in the shadow of larger settlements in the region.", "A Pleasant Town", plot:GetX(), plot:GetY())
                    SetHideMsg(plot, true)
                end
                SetCooldown(plot, 3)
            else
                print("Great location for a Large Town")
                local xp = MapTable[plot].xp + 1
                SetHideMsg(plot, false)
                print("++ XP is now " .. xp)
                if xp == 1 then
                    if bIsHuman then
                        if GetSuburb(plot) then
                            local cityName = pCity:GetName()
                            pPlayer:AddNotification(noteGrow, "A prosperous suburb of " .. cityName .. " is growing! If worked, it will finish developing in " .. LargeTownXP .. " turns.", "A Prosperous Suburb of " .. cityName, plot:GetX(), plot:GetY())
                        else
                            pPlayer:AddNotification(noteGrow, "A prosperous Town is growing! It's in a great location - " .. GetLocationFactorList(plot, false) .. ". If worked, it will grow into a Large Town in " .. LargeTownXP .. " turns.", "A Prosperous Town", plot:GetX(), plot:GetY())
                        end
                    end
                    SetXP(plot, xp, true)
                elseif xp == LargeTownXP - TownXP + 1 then
                    if bIsHuman then
                        if GetSuburb(plot) then
                            local cityName = pCity:GetName()
                            pPlayer:AddNotification(noteGrow, "A flourishing suburb of " .. cityName .. " has been growing for a while. If worked, it will finish developing in " .. LargeTownXP - (LargeTownXP - TownXP) .. " turns.", "A Flourishing Suburb of " .. cityName, plot:GetX(), plot:GetY())
                        else
                            pPlayer:AddNotification(noteGrow, "A flourishing Town has been growing for a while. If worked, it will grow into a Large Town in " .. LargeTownXP - (LargeTownXP - TownXP) .. " turns.", "A Flourishing Town", plot:GetX(), plot:GetY())
                        end
                    end
                    SetXP(plot, xp, true)
                elseif xp > LargeTownXP then
                    plot:SetImprovementType(LargeTown)
                    SetXP(plot, 0, true)
                    SetBypass(plot, false)
                    print("!! Town upgraded to Large Town (imp. #" .. LargeTown .. ")")
                    if bIsHuman then
                        if GetSuburb(plot) then
                            local cityName = pCity:GetName()
                            pPlayer:AddNotification(noteGrow, "An [COLOR_POSITIVE_TEXT]upscale suburb of " .. cityName .. "[ENDCOLOR] has grown into a proper district of the city. Wealthy socialites can be seen strolling the tree-lined avenues and luxurious parks, and dining at the finest restaurants.", "[COLOR_POSITIVE_TEXT]An Upscale Suburb of " .. cityName .. "[ENDCOLOR]", plot:GetX(), plot:GetY())
                        else
                            pPlayer:AddNotification(noteGrow, "A flourishing Town has [COLOR_POSITIVE_TEXT]grown into a Large Town[ENDCOLOR]! The shops are thronged with people, and business is booming.", "[COLOR_POSITIVE_TEXT]A Town has grown![ENDCOLOR]", plot:GetX(), plot:GetY())
                        end
                    end
                else
                    SetXP(plot, xp, true)
                end
            end
        end

	end
end

-- Check whether this Large Town needs to lose XP
function CheckLargeTownXP(plot)
	print("> Large Town at " .. plot:GetX() .. ", " .. plot:GetY())
	if MapTable[plot] == nil then
		-- Load/initialize
		LoadPlot(plot)
	end
	if plot:IsImprovementPillaged() then
		if iPolicyMode ~= TraditionMode and GetSuburb(plot) then
			print("!! Pillaged and collapsed! Grandfathered suburb no longer in Tradition Mode")
			pPlayer:AddNotification(noteShrink, "[COLOR_NEGATIVE_TEXT]Suburban Collapse[ENDCOLOR][NEWLINE]A Large Town has been pillaged! Once an affluent suburb, its supply chain has collapsed!", "[COLOR_NEGATIVE_TEXT]Suburban Collapse[ENDCOLOR]", plot:GetX(), plot:GetY())
			plot:SetImprovementType(Village)
			SetXP(plot, 0, true)
			SetHideMsg(plot, false)
			SetSuburb(plot, false)
		else
			print("-- Pillaged! Lost 1 XP")
			local xp = MapTable[plot].xp - 1
			if xp == -1 then
				pPlayer:AddNotification(noteShrink, "A Large Town has been pillaged, and its population is fleeing. Restore it within " .. LargeTownXP .. " turns or will shrink to a Town.", "Refugees flee a Large Town", plot:GetX(), plot:GetY())
				SetXP(plot, xp, true)
				print("XP is now " .. xp)
			elseif xp < -LargeTownXP then
				-- Too many residents have fled
				plot:SetImprovementType(Town)
				SetXP(plot, 0, true)
				SetCooldown(plot, 0)
				SetHideMsg(plot, false)
				print("!! Large Town downgraded to Town (imp. #" .. Town .. ")")
				pPlayer:AddNotification(noteShrink, "Once a thriving Large Town, so many have fled that only a smaller Town remains here.", "Wreckage of a Large Town", plot:GetX(), plot:GetY())
			else
				SetXP(plot, xp, true)
				print("XP is now " .. xp)
			end
		end
	elseif IsLargeTownDowngrading(plot) then
		print("-- Emigration! Lost 1 XP")
		local xp = MapTable[plot].xp - 1
		if xp == -1 then
			pPlayer:AddNotification(noteShrink, "This Large Town's economy is faltering, and its population is dwindling. Improve its surroundings within " .. LargeTownXP .. " turns or it will shrink to a Town.", "Migrants leave a Large Town", plot:GetX(), plot:GetY())
			SetXP(plot, xp)
			print("XP is now " .. xp)
		elseif xp < -LargeTownXP then
			-- Too many residents have left
			plot:SetImprovementType(Town)
			SetXP(plot, 0)
			SetCooldown(plot, 0)
			SetHideMsg(plot, false)
			print("!! Large Town downgraded to Town (imp. #" .. Town .. ")")
			pPlayer:AddNotification(noteShrink, "Once a thriving Large Town, so many have left that only a small Town remains here.", "Ghost of a Large Town", plot:GetX(), plot:GetY())
		else
			SetXP(plot, xp)
			print("XP is now " .. xp)
		end
	elseif MapTable[plot].xp < 0 then
		HealLargeTown(plot)
	end
end

-- AI Assist: Increases bonus XP for the hidden hamlet
function GrowHiddenHamlet()
	local improvement = pHamlet:GetImprovementType()
	local hamletStr = "Hidden Hamlet at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY()
	if improvement == Village then
		hamletStr = "Village / " .. hamletStr
	end
	iHamletXP = iHamletXP + iAIAssistRate
	print("++ " .. hamletStr .. ": tentative XP is now " .. iHamletXP)
	if iHamletXP > AIAssistXP then
		print("!! Town Boost ready!")
		bTownBoostReady = true
	end
end

-- AI Assist: gets a hamlet search rating bonus based on City ring and Policy Mode
function GetHamletSearchBonus(plot, ring)
    local civ = pPlayer:GetCivilizationType()
    if iPolicyMode == TraditionMode then
        if ring == 1 then
            if IsNewSuburbAllowed() then
                if bVoxPopActive and civ == China or civ == Morocco then
                    print("Ring 1 Suburb spot for VP China / Morocco: ok")
                    return 0
                else
                    print("Ring 1 Suburb spot: very strongly preferred")
                    return 5
                end
            else
                print("Ring 1: not enough Population to support a new Suburb")
                return -1
            end
        end
        if ring == 2 then
            if bVoxPopActive and civ == China or civ == Morocco then
                if civ == China and RateSuburbCandidateForVPChina(plot) > 1 then
                    print("Ring 2 Suburb spot for VP China: very strongly preferred")
                    return 5
                elseif civ == Morocco and RateSuburbCandidateForVPMorocco(plot) > 1 then
                    print("Ring 2 Suburb spot for VP Morocco: very strongly preferred")
                    return 5
                else
                    print("Ring 2: no adjacent Siheyuan / Kasbah to support a new Suburb")
                    return -1
                end
            else
                print("Ring 2: barred in Tradition Mode")
                return -1
            end
        end
    elseif iPolicyMode == LibertyMode then
		if ring == 2 then
			print("Ring 2: preferred for Burgs")
			return 1
		elseif ring == 1 then
			print("Ring 1: barred in Liberty Mode")
			return -1
		end
	elseif ring < 3 then
		print("Ring " .. ring .. ": barred in Basic Mode")
		return -1
	end
	return 0
end

-- AI Assist: finds an adjusted hamlet search rating based on settlement distance
function AdjustHamletSearchRating(plot, rating, ring)
	if ring ~= 1 and SearchRing(plot, 3, IsNonSuburbLargeTown) then
		print("3 tiles away from a Large Town: strongly preferred")
		rating = rating + 3
	end
    return rating
end

-- Calculates the total yield change to a plot if a certain improvement is placed there
function CalculateTotalYieldChange(improvement, plot)
    -- Food and Production
    local result = plot:CalculateImprovementYieldChange(improvement, 0) + plot:CalculateImprovementYieldChange(improvement, 1)
    -- Gold and Science
    result = result + plot:CalculateImprovementYieldChange(improvement, 2) + plot:CalculateImprovementYieldChange(improvement, 3)
    -- Culture and Faith count double
    result = result + (2 * (plot:CalculateImprovementYieldChange(improvement, 4) + plot:CalculateImprovementYieldChange(improvement, 5)))
    print("Total yield delta: " .. result)
    return result
end

-- AI Assist: Checks a Village to see if it's better than the current hamlet candidate Village
function DoHamletSearchAtVillage(plot, ring)
	if plot:IsImprovementPillaged() then
		return
    elseif plot:GetResourceType(Game.GetActiveTeam()) ~= -1 then
        if not IsBonusLandResource(plot) then
            return
        end
	end
	print("< Hamlet Search: Village at " .. plot:GetX() .. ", " .. plot:GetY())
    local bonus = GetHamletSearchBonus(plot, ring)
    if bonus < 0 then return end
	local rating, needsRoadCheck = GetGreatLocationRating(plot)
    local room, checkedRoom = true, false
    if ring == 1 then
        checkedRoom = true
        if needsRoadCheck then
            print("Suburb spot: +1 for easy commute")
            rating = rating + 1
            needsRoadCheck = false
        end
    end
    if rating == 1 and needsRoadCheck then
        checkedRoom = true
        if IsNearLargeTown(plot) then
            room = false
        elseif HasDirectFriendlyRoute(plot) then
            rating = rating + 1
            print("Great location rating: " .. rating)
            needsRoadCheck = false
        end
    end
	if rating >= 2 then
		rating = AdjustHamletSearchRating(plot, rating, ring) + bonus
		if rating >= iBestVillageRating then
            if not checkedRoom then
                room = not IsNearLargeTown(plot)
            end
            if room and needsRoadCheck and HasDirectFriendlyRoute(plot) then
                rating = rating + 1
                print("Adjusted rating: " .. rating)
            end
            if room and rating > iBestVillageRating then
                print("<< best Village at " .. plot:GetX() .. ", " .. plot:GetY() .. " w/ rating " .. rating .. ", ring " .. ring)
                pBestVillage = plot
                iBestVillageRating = rating
            end
        end
	end
end

-- AI Assist: Checks a Mill to see if it's better than the current hamlet candidate Mill
function DoHamletSearchAtMill(plot, ring)
	iMines = iMines + 1 -- Mills count as Mines for Mine vs Farm purposes
	if plot:GetResourceType(Game.GetActiveTeam()) ~= -1 or plot:IsImprovementPillaged() then
		return
	end
	print("< Hamlet Search: Mill at " .. plot:GetX() .. ", " .. plot:GetY())
    local bonus = GetHamletSearchBonus(plot, ring)
    if bonus < 0 then return end
	local rating, needsRoadCheck = GetGreatLocationRating(plot)
    local room, checkedRoom = true, false
    if ring == 1 then
        checkedRoom = true
        if needsRoadCheck then
            print("Suburb spot: +1 for easy commute")
            rating = rating + 1
            needsRoadCheck = false
        end
    end
    if rating == 1 and needsRoadCheck then
        checkedRoom = true
        if IsNearLargeTown(plot) then
            room = false
        elseif HasDirectFriendlyRoute(plot) then
            rating = rating + 1
            print("Great location rating: " .. rating)
            needsRoadCheck = false
        end
    end
	if rating >= 2 then
		rating = AdjustHamletSearchRating(plot, rating, ring) + bonus
		local goal, yieldDelta = iBestMillRating, CalculateTotalYieldChange(LargeTown, plot)
        if iBestMillDelta ~= nil then
            goal = goal + (iBestMillDelta - yieldDelta)
        end
		if rating >= goal then
            if not checkedRoom then
                room = not IsNearLargeTown(plot)
            end
            if room and needsRoadCheck and HasDirectFriendlyRoute(plot) then
                rating = rating + 1
                print("Adjusted rating: " .. rating)
            end
            if room and rating > goal then
                print("<< best Mill at " .. plot:GetX() .. ", " .. plot:GetY() .. " w/ rating " .. rating .. ", ring " .. ring .. ", delta " .. yieldDelta)
                pBestMillForHamlet = plot
                iBestMillRating = rating
                iBestMillDelta = yieldDelta
            end
		end
	end
end

-- AI Assist: Checks a Mine to see if it's better than the current hamlet candidate Mine
function DoHamletSearchAtMine(plot, ring)
	iMines = iMines + 1
	if plot:GetResourceType(Game.GetActiveTeam()) ~= -1 or plot:IsImprovementPillaged() then
		return
	end
	print("< Hamlet Search: Mine at " .. plot:GetX() .. ", " .. plot:GetY())
    local bonus = GetHamletSearchBonus(plot, ring)
    if bonus < 0 then return end
	local rating, needsRoadCheck = GetGreatLocationRating(plot)
    local room, checkedRoom = true, false
    if ring == 1 then
        checkedRoom = true
        if needsRoadCheck then
            print("Suburb spot: +1 for easy commute")
            rating = rating + 1
            needsRoadCheck = false
        end
    end
    if rating == 1 and needsRoadCheck then
        checkedRoom = true
        if IsNearLargeTown(plot) then
            room = false
        elseif HasDirectFriendlyRoute(plot) then
            rating = rating + 1
            print("Great location rating: " .. rating)
            needsRoadCheck = false
        end
    end
	if rating >= 2 then
		rating = AdjustHamletSearchRating(plot, rating, ring) + bonus
        local goal, yieldDelta = iBestMineRating, CalculateTotalYieldChange(LargeTown, plot)
        if iBestMineDelta ~= nil then
            goal = goal + (yieldDelta - iBestMineDelta)
        end
		if rating >= goal then
            if not checkedRoom then
                room = not IsNearLargeTown(plot)
            end
            if room and needsRoadCheck and HasDirectFriendlyRoute(plot) then
                rating = rating + 1
                print("Adjusted rating: " .. rating)
            end
            if room and rating > goal then
                print("<< best Mine at " .. plot:GetX() .. ", " .. plot:GetY() .. " w/ rating " .. rating .. ", ring " .. ring .. ", delta " .. yieldDelta)
                pBestMineForHamlet = plot
                iBestMineRating = rating
                iBestMineDelta = yieldDelta
            end
		end
	end
end

-- AI Assist: Checks a Farm to see if it's better than the current hamlet candidate Farm
function DoHamletSearchAtFarm(plot, ring)
	iFarms = iFarms + 1
	if plot:GetResourceType(Game.GetActiveTeam()) ~= -1 or plot:IsImprovementPillaged() then
		return
	end
	print("< Hamlet Search: Farm at " .. plot:GetX() .. ", " .. plot:GetY())
    local bonus = GetHamletSearchBonus(plot, ring)
    if bonus < 0 then return end
	local rating, needsRoadCheck = GetGreatLocationRating(plot)
    local room, checkedRoom = true, false
    if ring == 1 then
        checkedRoom = true
        if needsRoadCheck then
            print("Suburb spot: +1 for easy commute")
            rating = rating + 1
            needsRoadCheck = false
        end
    end
    if rating == 1 and needsRoadCheck then
        checkedRoom = true
        if IsNearLargeTown(plot) then
            room = false
        elseif HasDirectFriendlyRoute(plot) then
            rating = rating + 1
            print("Great location rating: " .. rating)
            needsRoadCheck = false
        end
    end
	if rating >= 2 then
		rating = AdjustHamletSearchRating(plot, rating, ring) + bonus
        local goal, yieldDelta = iBestFarmRating, CalculateTotalYieldChange(LargeTown, plot)
        if iBestFarmDelta ~= nil then
            goal = goal + (yieldDelta - iBestFarmDelta)
        end
		if rating >= goal then
            if not checkedRoom then
                room = not IsNearLargeTown(plot)
            end
            if room and needsRoadCheck and HasDirectFriendlyRoute(plot) then
                rating = rating + 1
                print("Adjusted rating: " .. rating)
            end
            if room and rating > goal then
                print("<< best Farm at " .. plot:GetX() .. ", " .. plot:GetY() .. " w/ rating " .. rating .. ", ring " .. ring .. ", delta " .. yieldDelta)
                pBestFarmForHamlet = plot
                iBestFarmRating = rating
                iBestFarmDelta = yieldDelta
            end
		end
	end
end

-- AI Assist: Checks a Bonus Resource to see if it's better than the current hamlet candidate Bonus Resource
function DoHamletSearchAtBonusResource(plot, ring)
	if plot:IsImprovementPillaged() or plot:GetImprovementType() == -1 then
		return
	end
	print("< Hamlet Search: Bonus Resource at " .. plot:GetX() .. ", " .. plot:GetY())
    local bonus = GetHamletSearchBonus(plot, ring)
    if bonus < 0 then return end
	local rating, needsRoadCheck = GetGreatLocationRating(plot)
    local room, checkedRoom = true, false
    if ring == 1 then
        checkedRoom = true
        if needsRoadCheck then
            print("Suburb spot: +1 for easy commute")
            rating = rating + 1
            needsRoadCheck = false
        end
    end
    if rating == 1 and needsRoadCheck then
        checkedRoom = true
        if IsNearLargeTown(plot) then
            room = false
        elseif HasDirectFriendlyRoute(plot) then
            rating = rating + 1
            print("Great location rating: " .. rating)
            needsRoadCheck = false
        end
    end
	if rating >= 2 then
		rating = AdjustHamletSearchRating(plot, rating, ring) + bonus
        local goal, yieldDelta = iBestBonusRating, CalculateTotalYieldChange(LargeTown, plot)
        if iBestBonusDelta ~= nil then
            goal = goal + (yieldDelta - iBestBonusDelta)
        end
		if rating >= goal then
            if not checkedRoom then
                room = not IsNearLargeTown(plot)
            end
            if room and needsRoadCheck and HasDirectFriendlyRoute(plot) then
                rating = rating + 1
                print("Adjusted rating: " .. rating)
            end
            if room and rating > goal then
                print("<< best Bonus Resource at " .. plot:GetX() .. ", " .. plot:GetY() .. " w/ rating " .. rating .. ", ring " .. ring .. ", yield " .. yieldDelta)
                pBestBonusForHamlet = plot
                iBestBonusRating = rating
                iBestBonusDelta = yieldDelta
            end
		end
	end
end

-- Checks Towns and Large Towns for lost XP
function CheckBeforeGuilds(plot)
	if pCity:CanWork(plot) then
		-- Check captured advanced cities for lost XP
		local improvement = plot:GetImprovementType()
		if improvement == Town then
			CheckTownLostXP(plot)
		elseif improvement == LargeTown then
			CheckLargeTownXP(plot)
		elseif improvement ~= Village and MapTable[plot] ~= nil then
			ClearData(plot)
		end
	end
end

-- Checks Villages for lost/gained XP, and Towns for lost XP
function CheckBeforeBanking(plot)
	if pCity:CanWork(plot) then
		local improvement = plot:GetImprovementType()
		if improvement == Village then
			CheckVillageXP(plot, false)
		elseif improvement == Town then
			CheckTownLostXP(plot)
		elseif improvement == LargeTown then
			CheckLargeTownXP(plot) -- for captured advanced cities
		elseif MapTable[plot] ~= nil then
			ClearData(plot)
		end
	end
end

-- Checks Villages and Towns for lost/gained XP, and Large Towns for lost XP
function CheckAfterBanking(plot)
	if pCity:CanWork(plot) then
		local improvement = plot:GetImprovementType()
		if improvement == Village then
			CheckVillageXP(plot, true)
		elseif improvement == Town then
			CheckTownXP(plot)
		elseif improvement == LargeTown then
			iLargeTowns = iLargeTowns + 1
			CheckLargeTownXP(plot)
		elseif MapTable[plot] ~= nil then
			ClearData(plot)
		end
	end
end

-- Checks Villages and Towns for lost/gained XP, and Large Towns for lost XP.
-- AI Assist: Also searches Mills, Mines, & Farms for a place to put a new hidden hamlet
function CheckAndDoHamletSearch(plot, ring)
	if pCity:CanWork(plot) then
		local improvement = plot:GetImprovementType()
		if improvement == Village then
			CheckVillageXP(plot, true)
			if not bXPChanged then
				DoHamletSearchAtVillage(plot, ring)
			end
		elseif improvement == Town then
			CheckTownXP(plot)
		elseif improvement == LargeTown then
			iLargeTowns = iLargeTowns + 1
			CheckLargeTownXP(plot)
		elseif MapTable[plot] ~= nil then
			ClearData(plot)
		elseif improvement == Terrain.Mill then
			DoHamletSearchAtMill(plot, ring)
		elseif improvement == Terrain.Mine then
			DoHamletSearchAtMine(plot, ring)
		elseif improvement == Terrain.Farm then
			DoHamletSearchAtFarm(plot, ring)
		elseif IsBonusLandResource(plot) then
			DoHamletSearchAtBonusResource(plot, ring)
		end
	end
end

-- AI Assist: Gets the rate at which a hidden hamlet can gain XP per turn
function GetAIAssistRate()
	local pop = pCity:GetPopulation()
	iAIAssistRate = (pop / AIAssistPop) - iLargeTowns
	print("Potential AI Assist XP / turn: (" .. pop .. " / " .. AIAssistPop .. ") - " .. iLargeTowns .. " = " .. iAIAssistRate)
end

-- AI Assist: Checks if AI Assist is currently allowed for this City
function IsAIAssistAllowed()
	GetAIAssistRate()
	if iLargeTowns > 0 then
		return iAIAssistRate > 1 / (iLargeTowns + 1)
	end
	return iAIAssistRate >= 1
end

-- AI Assist: Adjusts hamlet search ratings to help choose between improvement types
function AdjustHamletRatings()
	-- Note that iMines counts Mines + Mills
	if iMines < 4 then
		if iBestVillageRating >= 2 then
			print("Very few Mills/Mines: Village rating " .. iBestVillageRating .. " -> " .. iBestVillageRating + 2)
			iBestVillageRating = iBestVillageRating + 2
		end
		if iBestFarmRating >= 2 then
			print("Very few Mills/Mines: Farm rating " .. iBestFarmRating .. " -> " .. iBestFarmRating + 2)
			iBestFarmRating = iBestFarmRating + 2
		end
        if iBestBonusRating >= 2 then
            print("Very few Mills/Mines: Bonus Resource rating " .. iBestBonusRating .. " -> " .. iBestBonusRating + 2)
            iBestBonusRating = iBestBonusRating + 2
        end
	elseif iMines < 8 then
		if iBestVillageRating >= 2 then
			print("Few Mills/Mines: Village rating " .. iBestVillageRating .. " -> " .. iBestVillageRating + 1)
			iBestVillageRating = iBestVillageRating + 1
		end
		if iBestFarmRating >= 2 then
			print("Few Mills/Mines: Farm rating " .. iBestFarmRating .. " -> " .. iBestFarmRating + 1)
			iBestFarmRating = iBestFarmRating + 1
		end
        if iBestBonusRating >= 2 then
            print("Few Mills/Mines: Bonus Resource rating " .. iBestBonusRating .. " -> " .. iBestBonusRating + 1)
            iBestBonusRating = iBestBonusRating + 1
        end
	end
	if iFarms < 7 then
		if iBestVillageRating >= 2 then
			print("Very few Farms: Village rating " .. iBestVillageRating .. " -> " .. iBestVillageRating + 2)
			iBestVillageRating = iBestVillageRating + 2
		end
		if iBestMillRating >= 2 then
			print("Very few Farms: Mill rating " .. iBestMillRating .. " -> " .. iBestMillRating + 2)
			iBestMillRating = iBestMillRating + 2
		end
		if iBestMineRating >= 2 then
			print("Very few Farms: Mine rating " .. iBestMineRating .. " -> " .. iBestMineRating + 2)
			iBestMineRating = iBestMineRating + 2
		end
        if iBestBonusRating >= 2 then
            print("Very few Farms: Bonus Resource rating " .. iBestBonusRating .. " -> " .. iBestBonusRating + 2)
            iBestBonusRating = iBestBonusRating + 2
        end
	elseif iFarms < 13 then
		if iBestVillageRating >= 2 then
			print("Few Farms: Village rating " .. iBestVillageRating .. " -> " .. iBestVillageRating + 1)
			iBestVillageRating = iBestVillageRating + 1
		end
		if iBestMillRating >= 2 then
			print("Few Farms: Mill rating " .. iBestMillRating .. " -> " .. iBestMillRating + 1)
			iBestMillRating = iBestMillRating + 1
		end
		if iBestMineRating >= 2 then
			print("Few Farms: Mine rating " .. iBestMineRating .. " -> " .. iBestMineRating + 1)
			iBestMineRating = iBestMineRating + 1
		end
        if iBestBonusRating >= 2 then
            print("Few Farms: Bonus Resource rating " .. iBestBonusRating .. " -> " .. iBestBonusRating + 1)
            iBestBonusRating = iBestBonusRating + 1
        end
	end
end

-- AI Assist: Puts a new hidden hamlet at the best-rated Village
function PutHamletAtVillage(isLevelUp)
	pHamlet = pBestVillage
	if isLevelUp then
		print("!! Town Boost: Village at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " is now a Town!")
		LoadPlot(pHamlet)
		print(MapTable[pHamlet].xp .. " XP conserved from upgrading a Village")
		iHamletXP = MapTable[pHamlet].xp
		SetXP(pHamlet, 0)
		pHamlet:SetImprovementType(Town)
		pHamlet = nil
		bInAIAssist = false
		bTownBoostReady = false
	else
		print("!! Hamlet Search: Village at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " now holds a Hidden Hamlet!")
		if iHamletXP == nil then
			iHamletXP = 0
		end
		iHamletXP = iHamletXP + iAIAssistRate
	end
end

-- AI Assist: Puts a new hidden hamlet at the best-rated Mill
function PutHamletAtMill(isLevelUp)
	pHamlet = pBestMillForHamlet
	if isLevelUp then
		print("!! Town Boost: Mill at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " is now a Town!")
		pHamlet:SetImprovementType(Town)
		pHamlet = nil
		iHamletXP = 0
		bInAIAssist = false
		bTownBoostReady = false
	else
		print("!! Hamlet Search: Mill at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " now holds a Hidden Hamlet!")
		if iHamletXP == nil then
			iHamletXP = 0
		end
		iHamletXP = iHamletXP + iAIAssistRate
	end
end

-- AI Assist: Puts a new hidden hamlet at the best-rated Mine
function PutHamletAtMine(isLevelUp)
	pHamlet = pBestMineForHamlet
	if isLevelUp then
		print("!! Town Boost: Mine at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " is now a Town!")
		pHamlet:SetImprovementType(Town)
		pHamlet = nil
		iHamletXP = 0
		bInAIAssist = false
		bTownBoostReady = false
	else
		print("!! Hamlet Search: Mine at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " now holds a Hidden Hamlet!")
		if iHamletXP == nil then
			iHamletXP = 0
		end
		iHamletXP = iHamletXP + iAIAssistRate
	end
end

-- AI Assist: Puts a new hidden hamlet at the best-rated Farm
function PutHamletAtFarm(isLevelUp)
	pHamlet = pBestFarmForHamlet
	if isLevelUp then
		print("!! Town Boost: Farm at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " is now a Town!")
		pHamlet:SetImprovementType(Town)
		pHamlet = nil
		iHamletXP = 0
		bInAIAssist = false
		bTownBoostReady = false
	else
		print("!! Hamlet Search: Farm at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " now holds a Hidden Hamlet!")
		if iHamletXP == nil then
			iHamletXP = 0
		end
		iHamletXP = iHamletXP + iAIAssistRate
	end
end

-- AI Assist: Puts a new hidden hamlet at the best-rated Bonus Resource
function PutHamletAtBonusResource(isLevelUp)
	pHamlet = pBestBonusForHamlet
	if isLevelUp then
		print("!! Town Boost: Bonus Resource at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " now holds a Town!")
		pHamlet:SetImprovementType(Town)
		pHamlet = nil
		iHamletXP = 0
		bInAIAssist = false
		bTownBoostReady = false
	else
		print("!! Hamlet Search: Bonus Resource at " .. pHamlet:GetX() .. ", " .. pHamlet:GetY() .. " now holds a Hidden Hamlet!")
		if iHamletXP == nil then
			iHamletXP = 0
		end
		iHamletXP = iHamletXP + iAIAssistRate
	end
end

-- AI Assist: Finishes the search for a new hidden hamlet
function FinishHamletSearch(isLevelUp)
	if bXPChanged then
		print("!! AI Assist disabled due to high-impact XP gain/loss!")
		bInAIAssist = false
	elseif not IsAIAssistAllowed() then
		print("!! AI Assist disabled!")
		bInAIAssist = false
	else
		-- Compare the best choices by improvement type
		AdjustHamletRatings()
        if iBestVillageRating >= 2 then
            iBestVillageRating = iBestVillageRating + CalculateTotalYieldChange(LargeTown, pBestVillage)
			print("Village rating + delta = " .. iBestVillageRating)
        else iBestVillageRating = -100
        end
        if iBestMillRating >= 2 then
            iBestMillRating = iBestMillRating + iBestMillDelta
			print("Mill rating + delta = " .. iBestMillRating)
        else iBestMillRating = -100
        end
        if iBestMineRating >= 2 then
            iBestMineRating = iBestMineRating + iBestMineDelta
			print("Mine rating + delta = " .. iBestMineRating)
        else iBestMineRating = -100
        end
        if iBestBonusRating >= 2 then
            iBestBonusRating = iBestBonusRating + iBestBonusDelta
			print("Bonus Resource rating + delta = " .. iBestBonusRating)
        else iBestBonusRating = -100
        end
        if iBestFarmRating >= 2 then
            iBestFarmRating = iBestFarmRating + iBestFarmDelta
			print("Farm rating + delta = " .. iBestFarmRating)
        else iBestFarmRating = -100
        end
		if iBestVillageRating > -100 then
			if iBestVillageRating >= iBestMillRating then
				if iBestVillageRating >= iBestMineRating then
                    if iBestVillageRating >= iBestBonusRating then
                        if iBestVillageRating >= iBestFarmRating then
                            PutHamletAtVillage(isLevelUp)
                        else PutHamletAtFarm(isLevelUp)
                        end
                    elseif iBestBonusRating >= iBestFarmRating then
                        PutHamletAtBonusResource(isLevelUp)
                    else PutHamletAtFarm(isLevelUp)
                    end
				elseif iBestMineRating >= iBestBonusRating then
                    if iBestMineRating >= iBestFarmRating then
                        PutHamletAtMine(isLevelUp)
                    else PutHamletAtFarm(isLevelUp)
                    end
                elseif iBestBonusRating >= iBestFarmRating then
                    PutHamletAtBonusResource(isLevelUp)
                else PutHamletAtFarm(isLevelUp)
                end
			elseif iBestMillRating >= iBestMineRating then
                if iBestMillRating >= iBestBonusRating then
                    if iBestMillRating >= iBestFarmRating then
                        PutHamletAtMill(isLevelUp)
                    else PutHamletAtFarm(isLevelUp)
                    end
                elseif iBestBonusRating >= iBestFarmRating then
                    PutHamletAtBonusResource(isLevelUp)
                else PutHamletAtFarm(isLevelUp)
                end
			elseif iBestMineRating >= iBestBonusRating then
                if iBestMineRating >= iBestFarmRating then
                    PutHamletAtMine(isLevelUp)
                else PutHamletAtFarm(isLevelUp)
                end
            elseif iBestBonusRating >= iBestFarmRating then
                PutHamletAtBonusResource(isLevelUp)
            else PutHamletAtFarm(isLevelUp)
            end
		elseif iBestMillRating > -100 then
			if iBestMillRating >= iBestMineRating then
                if iBestMillRating >= iBestBonusRating then
                    if iBestMillRating >= iBestFarmRating then
                        PutHamletAtMill(isLevelUp)
                    else PutHamletAtFarm(isLevelUp)
                    end
                elseif iBestBonusRating >= iBestFarmRating then
                    PutHamletAtBonusResource(isLevelUp)
                else PutHamletAtFarm(isLevelUp)
                end
			elseif iBestMineRating >= iBestBonusRating then
                if iBestMineRating >= iBestFarmRating then
                    PutHamletAtMine(isLevelUp)
                else PutHamletAtFarm(isLevelUp)
                end
            elseif iBestBonusRating >= iBestFarmRating then
                PutHamletAtBonusResource(isLevelUp)
            else PutHamletAtFarm(isLevelUp)
            end
		elseif iBestMineRating > -100 then
            if iBestMineRating >= iBestBonusRating then
                if iBestMineRating >= iBestFarmRating then
                    PutHamletAtMine(isLevelUp)
                else PutHamletAtFarm(isLevelUp)
                end
            elseif iBestBonusRating >= iBestFarmRating then
                PutHamletAtBonusResource(isLevelUp)
            else PutHamletAtFarm(isLevelUp)
            end
        elseif iBestBonusRating > -100 then
            if iBestBonusRating >= iBestFarmRating then
                PutHamletAtBonusResource(isLevelUp)
            else PutHamletAtFarm(isLevelUp)
            end
		elseif iBestFarmRating > -100 then
			PutHamletAtFarm(isLevelUp)
		else
			print("Hamlet Search: No suitable Village, Mill, Mine, Farm, or appropriate Bonus Resource")
			iHamletCooldown = 10
		end
	end
	SaveAIAssistVars()
end

-- Debug function that allows all messages to be shown again
function ShowAllMessages()
	local width, height = Map.GetGridSize()
	for x = 0, width - 1 do
		for y = 0, height - 1 do
			if MapTable[plot] ~= nil then
				SetHideMsg(plot, false)
			end
		end
	end
end

-- Check XP for all the player's settlements
function CheckAllSettlementsXP(PlayerID)
	iPlayer = PlayerID
	pPlayer = Players[PlayerID]
	iTeam = pPlayer:GetTeam()
	bIsHuman = pPlayer:IsHuman()

	print("-----------------------------------------------------------------------------")
	print(pPlayer:GetName() .. "'s turn (ID = " .. PlayerID .. ")")

	if (pPlayer:IsBarbarian()) then
		print("Skipping barbarians")
		return
	end

	local pTechs = Teams[iTeam]:GetTeamTechs()
    print("iTeam: " .. iTeam)
    if bVoxPopActive then print("Vox Populi active")
    else print("Vox Populi not active")
    end

	-- Check core Policy Mode (was Tradition or Liberty finished first?)
	if pPlayer:IsMinorCiv() then
		bIsMinorCiv = true
		iPolicyMode = 0
	else
		bIsMinorCiv = false
		GetPolicyMode()
		print("Core Policy Mode: " .. iPolicyMode .. " (" .. TraditionMode .. " = Tradition, " .. LibertyMode .. " = Liberty)")
		-- Check if a core Policy Branch was just finished
		if iPolicyMode == 0 then
			if pPlayer:IsPolicyBranchFinished(Tradition) then
				print("Tradition Mode activated")
				SetPolicyMode(TraditionMode)
			elseif pPlayer:IsPolicyBranchFinished(Liberty) then
				print("Liberty Mode activated")
				SetPolicyMode(LibertyMode)
			end
		end
		bExploreMode = pPlayer:IsPolicyBranchFinished(Exploration)
	end

	-- Check the player's tech level
	local logic
    local TownsTech = GuildsTech
    local LargeTownsTech = BankingTech
    if bVoxPopActive then
        TownsTech = CurrencyTech
        LargeTownsTech = GuildsTech
    end
	if pTechs:HasTech(LargeTownsTech) then
		-- XP checks only allow Large Towns after Banking (VP: Guilds)
		print("Large Town prereq already researched")
		bModActive = true
		bHasGuilds = true
		logic = CheckAfterBanking
	elseif pTechs:HasTech(TownsTech) then
		-- XP checks allow Towns after Guilds (VP: Currency)
		print("Town prereq already researched")
		bModActive = true
		bHasGuilds = true
		logic = CheckBeforeBanking
	else
		-- earlier XP checks are for lost XP only (needed for conquered cities)
		print("Town prereq not yet researched")
		bHasGuilds = false
		logic = CheckBeforeGuilds
	end

	if not bModActive then
		return
	end

	-- AI Assist mechanics enabled once Banking is researched
	if pTechs:HasTech(BankingTech) then
		bHasAIAssistTech = true
	else
		bHasAIAssistTech = false
	end

	-- Loop through the player's cities
	for city in pPlayer:Cities() do
		print(">>> Checking near " .. city:GetName())
		pCity = city
		pCityPlot = city:Plot()
		if not bIsMinorCiv then
			LoadCity()
			-- Check suburbs (need to check all majors for conquered suburbs)
            if not bVoxPopActive then
			    CountSuburbs()
            else CountSuburbsVP()
            end
			if iPolicyMode == TraditionMode then
				-- Tradition Mode: check if another settlement can be marked as a suburb
				GetAllowedSuburbs()
				CheckForPopCrash()
				if bHasGuilds then
					CheckForNewSuburb()
				end
			else
				CheckForPopCrash()
			end
		end

		-- Check all plots in a 3-tile radius of the city
		if bIsHuman or bIsMinorCiv then
			RingwiseLoop(pCityPlot, 3, logic)
		elseif not bInAIAssist then
			RingwiseLoop(pCityPlot, 3, logic)

			-- Should AI Assist engage?
			if bHasAIAssistTech and not bXPChanged and IsAIAssistAllowed() then
				print("!! AI Assist enabled! Rate set at " .. iAIAssistRate)
				bInAIAssist = true
				iHamletCooldown = 0
				SaveAIAssistVars()
			end
		elseif bTownBoostReady then
			-- AI Assist is engaged, and a Town Boost is ready
			print("AI Assist: ready for a Town Boost")
			RingwiseLoopByRing(pCityPlot, 3, CheckAndDoHamletSearch)
			FinishHamletSearch(true)
		elseif iHamletCooldown > 0 then
			-- AI Assist is engaged, but the cooldown is active
			print("AI Assist: waiting for cooldown")
			RingwiseLoop(pCityPlot, 3, logic)
			print("AI Assist: on cooldown for " .. iHamletCooldown .. " turns")
			iHamletCooldown = iHamletCooldown - 1
			if iHamletCooldown == 0 then
				GetAIAssistRate()
			end
			SaveAIAssistVars()
		elseif pHamlet ~= nil then
			-- AI Assist is engaged, and there is an actively growing hidden hamlet
			print("AI Assist: Hidden Hamlet is growing here")
			RingwiseLoop(pCityPlot, 3, logic)
			if bXPChanged then
				print("!! AI Assist: disabled due to high-impact XP gain/loss!")
				bInAIAssist = false
			elseif not IsAIAssistAllowed() then
				print("!! AI Assist disabled!")
				bInAIAssist = false
			else
				GrowHiddenHamlet()
			end
			SaveAIAssistVars()
		else
			-- AI Assist is engaged, and the search for a new hamlet is on
			RingwiseLoopByRing(pCityPlot, 3, CheckAndDoHamletSearch)
			FinishHamletSearch(false)
		end
	end
end
GameEvents.PlayerDoTurn.Add(CheckAllSettlementsXP)

CheckVoxPopActive()

print("Dynamic Towns loaded")