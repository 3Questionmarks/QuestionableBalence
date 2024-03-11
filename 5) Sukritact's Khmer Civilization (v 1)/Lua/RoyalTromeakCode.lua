-- Royal_Tromeak
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include("IconSupport")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "Royal_Tromeak";

--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
function GetNumDomesticTradeRoutes(pCity)

	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	
	local iNumRoutes = 0
	for i,v in pairs(tTradeRoutes) do
		if (v.FromID == iPlayer) and (v.FromID == v.ToID) and ((v.FromCity:GetID() == pCity:GetID()) or (v.ToCity:GetID() == pCity:GetID())) then
			iNumRoutes = iNumRoutes + 1
		end
	end
	
	return iNumRoutes
end
--=======================================================================================================================
-- Inital Defines
--=======================================================================================================================
local iTromeak = GameInfoTypes.UNIT_KHMER_TROMEAK
local iProduction = GameInfoTypes.YIELD_PRODUCTION
local iModifier = 3

g_RoyalTromeakTooltip = {}
TTManager:GetTypeControlTable("MC_RoyalTromeak", g_RoyalTromeakTooltip)
--=======================================================================================================================
-- Sukritact's Modular City Info Stack Support
--=======================================================================================================================
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "MC_Royal_Tromeak", ["SortOrder"] = 1})
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(sKey, pInstance)
	if sKey ~= "MC_Royal_Tromeak" then return end
	ProcessCityScreen(pInstance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(pInstance)
	-- Ensure City Selected
	local pCity = UI.GetHeadSelectedCity()
	if not(pCity) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	
	-- Ensure City has a Tromeak garrisoned
	local iPlayer =	pCity:GetOwner()
	local pPlot = pCity:Plot()
	local bTromeak = false
	for iVal = 0,(pPlot:GetNumUnits() - 1) do
		local pUnit = pPlot:GetUnit(iVal)
		if (pUnit:GetUnitType() == iTromeak) and (pUnit:GetOwner() == iPlayer) then
			bTromeak = true
			break
		end
	end
	if not(bTromeak) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	
	local tTromeak = GameInfo.Units[iTromeak]
	pInstance.IconFrame:SetToolTipType("MC_RoyalTromeak")
	IconHookup(tTromeak.PortraitIndex, 64, tTromeak.IconAtlas, pInstance.IconImage)
	
	local iBonus = GetNumDomesticTradeRoutes(pCity)
	iBonus = iBonus * iModifier
	
	local sTitle = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_UNIT_KHMER_TROMEAK")) .. "[ENDCOLOR]"
	local sText = Locale.ConvertTextKey("TXT_KEY_CIV5_KHMER_TROMEAK_MCIS", iBonus)
	g_RoyalTromeakTooltip.Heading:SetText(sTitle)
	g_RoyalTromeakTooltip.Body:SetText(sText)
	g_RoyalTromeakTooltip.Box:DoAutoSize()
	pInstance.IconFrame:SetHide(false)
end
--=======================================================================================================================
-- Main Code
--=======================================================================================================================
function RoyalTromeakCode(pCity)
	
	local iPlayer =	pCity:GetOwner()
	local pPlayer = Players[iPlayer]
	local iCity = pCity:GetID()
	local strSave = ("C" .. iCity .. "Y" .. iProduction)

	local pPlot = pCity:Plot()
	local bTromeak = false
	for iVal = 0,(pPlot:GetNumUnits() - 1) do
		local pUnit = pPlot:GetUnit(iVal)
		if (pUnit:GetUnitType() == iTromeak) and (pUnit:GetOwner() == iPlayer) then
			bTromeak = true
			break
		end
	end
	
	local iNumTradeRoutes = 0
	if bTromeak then
		iNumTradeRoutes = GetNumDomesticTradeRoutes(pCity)
	end
	
	local iDelta = iNumTradeRoutes*iModifier
	local iOldDelta = load(pPlayer, strSave)
	save(pPlayer, strSave, iDelta)
	if iOldDelta == nil then
		pCity:ChangeBaseYieldRateFromMisc(iProduction, iDelta)
	else
		pCity:ChangeBaseYieldRateFromMisc(iProduction, iDelta - iOldDelta)
	end
end
--=======================================================================================================================
-- Triggers
--=======================================================================================================================
function RoyalTromeakCodeStartTrigger(iPlayer)
	local pPlayer = Players[iPlayer]
	for pCity in pPlayer:Cities() do
		RoyalTromeakCode(pCity)
	end
end

function RoyalTromeakCodeMoveTrigger(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:GetUnitType() == iTromeak then
		for pCity in pPlayer:Cities() do
			RoyalTromeakCode(pCity)
		end
	end
end

function RoyalTromeakCodeTradeTrigger()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		RoyalTromeakCodeStartTrigger(iPlayer)
	end
end

function RoyalTromeakInitialTrigger(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:GetUnitType() == iTromeak then
		print("Tromeak code activated")
		--Adding other Trigger functions
		GameEvents.PlayerDoTurn.Add(RoyalTromeakCodeStartTrigger)
		GameEvents.UnitSetXY.Add(RoyalTromeakCodeMoveTrigger)
		Events.SerialEventGameDataDirty.Add(RoyalTromeakCodeTradeTrigger)
		--Removing the Initial Trigger function
		GameEvents.UnitSetXY.Remove(RoyalTromeakInitialTrigger)
		save("GAME", "bInitalised", true)
		--Trigger the regular effect
		for pCity in pPlayer:Cities() do
			RoyalTromeakCode(pCity)
		end
	end
end

if load("GAME", "bInitalised") == true then
	print("Tromeak code activated")
	GameEvents.PlayerDoTurn.Add(RoyalTromeakCodeStartTrigger)
	GameEvents.UnitSetXY.Add(RoyalTromeakCodeMoveTrigger)
	Events.SerialEventGameDataDirty.Add(RoyalTromeakCodeTradeTrigger)
else
	GameEvents.UnitSetXY.Add(RoyalTromeakInitialTrigger)
end
--=======================================================================================================================
--=======================================================================================================================