
local iCiv = GameInfoTypes["CIVILIZATION_SENSHI_URUGUAY"]
local iSpecialistDummy = GameInfoTypes["BUILDING_SENSHI_URUGUAY_SPECIALISTS"]
local iUU = GameInfoTypes["UNIT_SENSHI_BLANDENGUE"]
local iUUClass = GameInfoTypes[GameInfo.Units[iUU].Class]
local iSaltyMeat = GameInfoTypes["RESOURCE_SENSHI_CHARQUE"]
local iUB = GameInfoTypes["BUILDING_SENSHI_SALADERO"]
local iPasture = GameInfoTypes["IMPROVEMENT_PASTURE"]
local iDoneDummy = GameInfoTypes["BUILDING_SENSHI_URUGUAY_UBDUMMY"]
local iHappinessDummy = GameInfoTypes["BUILDING_SENSHI_URUGUAY_UBHAPPINESS"]

local tUUPromotions = {}
local iMaxVal = 0
for row in DB.Query("SELECT ID, CombatPercent FROM UnitPromotions WHERE Type LIKE 'PROMOTION_SENSHI_URUGUAY_UU_CITY_BUFF_%' ORDER BY CombatPercent") do
	table.insert(tUUPromotions, row.ID)
	iMaxVal = iMaxVal + row.CombatPercent
end

local tResources = {}
for row in DB.Query("SELECT ID, ResourceUsage FROM Resources WHERE Type IN (SELECT ResourceType FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PASTURE')") do
	tResources[row.ID] = row.ResourceUsage
end

local tTeams = {}

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function C15_Senshi_LoadScreen()
	for k, v in pairs(Players) do
		if v and v:IsEverAlive() then
			local iTeam = v:GetTeam()
			if not tTeams[iTeam] then
				tTeams[iTeam] = {}
			end
			table.insert(tTeams[iTeam], v)
		end
	end
end

Events.LoadScreenClose.Add(C15_Senshi_LoadScreen)

function DMS_toBits(iNum)
    tBits={}
    while iNum > 0 do
        local iRest = math.fmod(iNum, 2)
        tBits[#tBits + 1] = iRest
        iNum = (iNum - iRest) / 2
    end
    return tBits
end

-- More efficient to integrate
--[[function C15_HandleCapitalDummy(pPlayer, iDummy) 
	if pPlayer:CountNumBuildings(iDummy) ~= 1 or (not pPlayer:GetCapitalCity():IsHasBuilding(iDummy)) then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iDummy, (pCity:IsCapital() and 1) or 0)
		end
	end
end]]

function C15_Senshi_HandleResources(pPlayer, pCity)
	if pCity:IsHasBuilding(iDoneDummy) then return end
	local tPlots = {}
	for i = 0, pCity:GetNumCityPlots() - 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if pPlot:GetImprovementType() == iPasture then
			local iResource = pPlot:GetResourceType()
			local iType = tResources[iResource]
			if iType then
				table.insert(tPlots, {pPlot = pPlot, iResource = iResource, iType = iType})
			end
		end
	end
	for k, v in pairs(tPlots) do
		for i = 1, (2 - v.iType), 1 do
			table.insert(tPlots, {pPlot = v.pPlot, iResource = v.iResource, iType = 2})
		end
	end
	local tChosen = tPlots[JFD_GetRandom(1, #tPlots)]
	tChosen.pPlot:SetImprovementType(-1)
	tChosen.pPlot:SetResourceType(iSaltyMeat, 1)
    tChosen.pPlot:SetImprovementType(iPasture)
    pCity:SetNumRealBuilding(iDoneDummy, 1)
end	

function C15_Senshi_Uruguay_DoTurn(playerID)
    local pPlayer = Players[playerID]
    if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iCiv then
        local iHappiness = math.max(pPlayer:GetHappiness() - pPlayer:GetUnhappiness(), 0)
        local iHappinessSplit = iHappiness / 2
		local iPerCity = iHappinessSplit / pPlayer:GetNumCities()
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iSpecialistDummy, ((iHappiness > 0 and pCity:IsCapital()) and 1) or 0)
			if iHappiness > 0 then
				pCity:ChangeProduction(iPerCity)
				if pPlayer:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_SENSHI_URUGUAY_PRODUCTION_PER_CITY", iPerCity))
				end
			end
		end
	end
	for k, v in pairs(pPlayer:GetTradeRoutes()) do
		if v.FromCity:IsHasBuilding(iUB) or v.ToCity:IsHasBuilding(iUB) then -- Seems too simple, so I probably missed something
			v.FromCity:SetNumRealBuilding(iHappinessDummy, 1)
			v.ToCity:SetNumRealBuilding(iHappinessDummy, 1)
		else
			v.FromCity:SetNumRealBuilding(iHappinessDummy, 0)
			v.ToCity:SetNumRealBuilding(iHappinessDummy, 0)
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_Senshi_Uruguay_DoTurn)

function C15_Senshi_HandleUU(pUnit, iDiff)
	local tBits = DMS_toBits(iDiff)
	for k, v in pairs(tUUPromotions) do
		pUnit:SetHasPromotion(v, tBits[k] and tBits[k] == 1)
	end
end

function C15_Senshi_Unit_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetUnitClassCount(iUUClass) > 0 then
		local iTeam = pPlayer:GetTeam()
		local pTeam = Teams[iTeam]
		local iCityCount = pTeam:GetAtWarCount() -- include minors bc why not
		if iCityCount > 0 then
			for k, v in pairs(Teams) do
				if k ~= iTeam and pTeam:IsAtWar(k) then
					for k2, v2 in pairs(tTeams[k]) do
						iCityCount = iCityCount + v2:GetNumCities()
					end
				end
			end
		end
		
		local iCityDiff = math.max(0, iCityCount - pPlayer:GetNumCities()) * 5
		
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iUU then
				C15_Senshi_HandleUU(pUnit, iCityDiff)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_Senshi_Unit_DoTurn)

function C15_Senshi_Unit_CityCapture(oldID, bCap, iX, iY, newID)
	C15_Senshi_Unit_DoTurn(oldID)
	C15_Senshi_Unit_DoTurn(newID)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(iUB) then -- Doesn't work idk why
		C15_Senshi_HandleResources(Players[newID], pCity)
	end
end

GameEvents.CityCaptureComplete.Add(C15_Senshi_Unit_DoTurn)

function C15_Senshi_Unit_DeclareWar(iTeam1, iTeam2)
	for k, v in pairs({iTeam1, iTeam2}) do
		for k2, v2 in pairs(tTeams[v]) do
			C15_Senshi_Unit_DoTurn(v2)
		end
	end
end

GameEvents.DeclareWar.Add(C15_Senshi_Unit_DoTurn)

function C15_Senshi_CityConstructed(playerID, cityID, buildingID)
	if buildingID == iUB then
		local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		C15_Senshi_HandleResources(pPlayer, pCity)
	end
end

GameEvents.CityConstructed.Add(C15_Senshi_CityConstructed)