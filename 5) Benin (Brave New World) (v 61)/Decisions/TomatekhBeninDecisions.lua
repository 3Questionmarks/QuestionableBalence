--Tomatekh

print("Benin Decisions")

local tMetalCasting = GameInfoTypes.TECH_METAL_CASTING;
local rCopper = GameInfoTypes.RESOURCE_COPPER;
local rIron = GameInfoTypes.RESOURCE_IRON;
local bForge = GameInfoTypes.BUILDING_FORGE;
local bClassWalls = GameInfoTypes.BUILDINGCLASS_WALLS;
local bBeninBronzes = GameInfoTypes.BUILDING_BENIN_DUMMY_BUILDING_DEFENSE;

--Bronzes

local Decisions_BeninBronzes = {}
	Decisions_BeninBronzes.Name = "TXT_KEY_DECISIONS_TOMATEKH_BENIN_BRONZES"
	Decisions_BeninBronzes.Desc = "TXT_KEY_DECISIONS_TOMATEKH_BENIN_BRONZES_DESC"
	HookDecisionCivilizationIcon(Decisions_BeninBronzes, "CIVILIZATION_BENIN_MOD")
	Decisions_BeninBronzes.Weight = nil
	Decisions_BeninBronzes.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_BENIN_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_BeninBronzes") == true then
			Decisions_BeninBronzes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_BENIN_BRONZES_ENACTED_DESC")
			return false, false, true
		end		

		local iCost = math.ceil(250 * iMod)
		Decisions_BeninBronzes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_BENIN_BRONZES_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if ((pPlayer:GetNumResourceTotal(rCopper, false) <= 0) and (pPlayer:GetNumResourceTotal(rIron, false) <= 0)) then return true, false end
		if not (Teams[pPlayer:GetTeam()]:IsHasTech(tMetalCasting)) then return true, false end	
		return true, true
	end
	)
	
	Decisions_BeninBronzes.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		local iCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iCost);

		local pcCity = pPlayer:GetCapitalCity();
		if not (pcCity:IsHasBuilding(bForge)) then
			pcCity:SetNumRealBuilding(bForge, 1);
		elseif (pcCity:IsHasBuilding(bForge)) then
			for pCity in pPlayer:Cities() do
				if not (pCity:IsHasBuilding(bForge)) then
					pCity:SetNumRealBuilding(bForge, 1);
					break
				end
			end
		end

		for pCity in pPlayer:Cities() do
			if not (pCity:IsHasBuilding(bBeninBronzes)) then
				pCity:SetNumRealBuilding(bBeninBronzes, 1);
			end
		end

		save(pPlayer, "Decisions_BeninBronzes", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BENIN_MOD"], "Decisions_BeninBronzes", Decisions_BeninBronzes)

--Earthwork

local Decisions_BeninEarthwork = {}
	Decisions_BeninEarthwork.Name = "TXT_KEY_DECISIONS_TOMATEKH_BENIN_EARTHWORK"
	Decisions_BeninEarthwork.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_BENIN_EARTHWORK_DESC")
	HookDecisionCivilizationIcon(Decisions_BeninEarthwork, "CIVILIZATION_BENIN_MOD")
	Decisions_BeninEarthwork.Weight = nil
	Decisions_BeninEarthwork.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_BENIN_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_BeninEarthwork") == true then
			Decisions_BeninEarthwork.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_BENIN_EARTHWORK_ENACTED_DESC")
			return false, false, true
		end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if pPlayer:GetCurrentEra() < GameInfoTypes["ERA_MODERN"] then return true, false end
		local cBeninWalls = pPlayer:GetBuildingClassCount(bClassWalls)
		if cBeninWalls < 3 then return true, false end
		return true, true
	end
	)
	
	Decisions_BeninEarthwork.DoFunc = (
	function(pPlayer)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_BENIN_EARTHWORK_MOD"], true)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_BeninEarthwork", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BENIN_MOD"], "Decisions_BeninEarthwork", Decisions_BeninEarthwork)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_BENIN_MOD"]) then
			if load(pPlayer, "Decisions_BeninBronzes") == true then
				for pCity in pPlayer:Cities() do
					if not (pCity:IsHasBuilding(bBeninBronzes)) then
						pCity:SetNumRealBuilding(bBeninBronzes, 1);
					end
				end
			end
		end
	end
end)