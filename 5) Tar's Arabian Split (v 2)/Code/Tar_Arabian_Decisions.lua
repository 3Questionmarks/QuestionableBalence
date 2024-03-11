
--------------------------------------------------------------------------------------------------------------------------
-- Arabia: Found the House of Wisdom
--------------------------------------------------------------------------------------------------------------------------

local Decisions_Tar_ArabiaHouseOfWisdom = {}
	Decisions_Tar_ArabiaHouseOfWisdom.Name = "TXT_KEY_DECISIONS_TAR_ARABIAHOUSEOFWISDOM"
	Decisions_Tar_ArabiaHouseOfWisdom.Desc = "TXT_KEY_DECISIONS_TAR_ARABIAHOUSEOFWISDOM_DESC"
	HookDecisionCivilizationIcon(Decisions_Tar_ArabiaHouseOfWisdom, "CIVILIZATION_TAR_ABBASID")
	Decisions_Tar_ArabiaHouseOfWisdom.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TAR_ABBASID then return false, false end
		if load(pPlayer, "Decisions_Tar_ArabiaHouseOfWisdom") == true then
			Decisions_Tar_ArabiaHouseOfWisdom.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_ARABIAHOUSEOFWISDOM_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(iMod * 800)
		local iNumTrade = 0
		for pUnit in pPlayer:Units() do if pUnit:IsTrade() then iNumTrade = iNumTrade + 1 end end
		local iReward = math.ceil(40 * iMod) * iNumTrade
		Decisions_Tar_ArabiaHouseOfWisdom.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_ARABIAHOUSEOFWISDOM_DESC", iCost, iReward)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUILDS)) and (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_Tar_ArabiaHouseOfWisdom.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(iMod * 800)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		local iNumTrade = 0
		for pUnit in pPlayer:Units() do if pUnit:IsTrade() then iNumTrade = iNumTrade + 1 end end
		local iReward = math.ceil(40 * iMod) * iNumTrade
		LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iReward)
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_ARABIAHOUSEOFWISDOM, true)
		
		save(pPlayer, "Decisions_Tar_ArabiaHouseOfWisdom", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_TAR_ABBASID, "Decisions_Tar_ArabiaHouseOfWisdom", Decisions_Tar_ArabiaHouseOfWisdom)

--------------------------------------------------------------------------------------------------------------------------
-- Arabia: The Rise of Saladin
--------------------------------------------------------------------------------------------------------------------------

local Decisions_Tar_ArabiaSaladin = {}
	Decisions_Tar_ArabiaSaladin.Name = "TXT_KEY_DECISIONS_TAR_ARABIASALADIN"
	Decisions_Tar_ArabiaSaladin.Desc = "TXT_KEY_DECISIONS_TAR_ARABIASALADIN_DESC"
	HookDecisionCivilizationIcon(Decisions_Tar_ArabiaSaladin, "CIVILIZATION_TAR_ABBASID")
	Decisions_Tar_ArabiaSaladin.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TAR_ABBASID then return false, false end
		if load(pPlayer, "Decisions_Tar_ArabiaSaladin") then
			local iXP = load(pPlayer, "Decisions_Tar_ArabiaSaladin")
			local iXP2 =  math.ceil(iXP/3)
			Decisions_Tar_ArabiaSaladin.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_ARABIASALADIN_ENACTED_DESC", iXP2, iXP)
			return false, false, true
		end
	
		local iXP = 0
		local iXP2 = 0
		local sString = ""
		local iUnity = ""
		local iReligion = GetPlayerMajorityReligion(pPlayer)
		if iReligion ~= nil then 
			iUnity = GetReligiousUnity(pPlayer, iReligion)
			iXP = math.ceil(iUnity * 100 / 3)
			iXP2 =  math.ceil(iXP/3)
			sString = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_ARABIASALADIN_NOTE", math.ceil(iUnity * 100))
		end
		Decisions_Tar_ArabiaSaladin.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_ARABIASALADIN_DESC", iXP2, iXP, sString)
		
		if iReligion == nil then return true, false end
		if iUnity < 0.75 then return true, false end
		if pPlayer:GetCurrentEra() ~= GameInfoTypes.ERA_MEDIEVAL then return true, false end
		if (Teams[pPlayer:GetTeam()]:GetAtWarCount(false) < 1) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then 
			return true, false
		else
			return true, true
		end
	end
	)
	
	Decisions_Tar_ArabiaSaladin.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		local iReligion = GetPlayerMajorityReligion(pPlayer)
		local iUnity = GetReligiousUnity(pPlayer, iReligion)
		local iXP = math.ceil(iUnity * 100 / 3)
		local iXP2 =  math.ceil(iXP/3)

		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then
				pUnit:ChangeExperience(iXP2)
			end
		end

		local tGeneral = InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_GENERAL, 1)
		
		save(pPlayer, "Decisions_Tar_ArabiaSaladin", iXP)
	end
	)

	Decisions_Tar_ArabiaSaladin.Monitors = {}
	Decisions_Tar_ArabiaSaladin.Monitors[GameEvents.CityTrained] = (
	function(iPlayer, iCity, iUnit)
		local pPlayer = Players[iPlayer]
		local iXP = load(pPlayer, "Decisions_Tar_ArabiaSaladin")

		if not iXP then return end

		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit:IsCombatUnit() then
			pUnit:ChangeExperience(iXP)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_TAR_ABBASID, "Decisions_Tar_ArabiaSaladin", Decisions_Tar_ArabiaSaladin)

local Decisions_Tar_Umayyad_Coins = {}
	Decisions_Tar_Umayyad_Coins.Name = "TXT_KEY_DECISIONS_TAR_UMAYYAD_COINS"
	Decisions_Tar_Umayyad_Coins.Desc = "TXT_KEY_DECISIONS_TAR_UMAYYAD_COINS_DESC"
	HookDecisionCivilizationIcon(Decisions_Tar_Umayyad_Coins, "CIVILIZATION_TAR_UMAYYAD")
	Decisions_Tar_Umayyad_Coins.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TAR_UMAYYAD"]) then return false, false end
		if load(pPlayer, "Decisions_Tar_Umayyad_Coins") == true then
			Decisions_Tar_Umayyad_Coins.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_UMAYYAD_COINS_ENACTED_DESC")
			return false, false, true
		end
		local value = pPlayer:GetGold()
		Decisions_Tar_Umayyad_Coins.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_UMAYYAD_COINS_DESC", value)
		if pPlayer:GetReligionCreatedByPlayer() == -1 then return true, false end

		return true, true
	end
	)

	Decisions_Tar_Umayyad_Coins.DoFunc = (
	function(pPlayer)
		local value = pPlayer:GetGold()
		pPlayer:ChangeGold(-value)
		pPlayer:ChangeFaith(value)
		save(pPlayer, "Decisions_Tar_Umayyad_Coins", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TAR_UMAYYAD"], "Decisions_Tar_Umayyad_Coins", Decisions_Tar_Umayyad_Coins)


local Decisions_Tar_Umayyad_Qays = {}
	Decisions_Tar_Umayyad_Qays.Name = "TXT_KEY_DECISIONS_TAR_UMAYYAD_QAYS"
	Decisions_Tar_Umayyad_Qays.Desc = "TXT_KEY_DECISIONS_TAR_UMAYYAD_QAYS_DESC"
	HookDecisionCivilizationIcon(Decisions_Tar_Umayyad_Qays, "CIVILIZATION_TAR_UMAYYAD")
	Decisions_Tar_Umayyad_Qays.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TAR_UMAYYAD"]) then return false, false end
		if load(pPlayer, "Decisions_Tar_Umayyad_Qays") == true then
			Decisions_Tar_Umayyad_Qays.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_UMAYYAD_QAYS_ENACTED_DESC")
			return false, false, true
		end
		local culture = math.ceil(150 * iMod)
		local gold = 50 + math.ceil(pPlayer:GetUnitClassCount(GameInfoTypes["UNITCLASS_PIKEMAN"]) * 50) 
		Decisions_Tar_Umayyad_Qays.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_UMAYYAD_QAYS_DESC", culture, gold)
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE)) then return true, false end
		if (pPlayer:GetJONSCulture() < culture) then return true, false end
		
		return true, true
	end
	)
       
	Decisions_Tar_Umayyad_Qays.DoFunc = (
	function(pPlayer)
		local culture = math.ceil(150 * iMod)
		local gold = 50 + math.ceil(pPlayer:GetUnitClassCount(GameInfoTypes["UNITCLASS_PIKEMAN"]) * 50) 
		pPlayer:ChangeJONSCulture(-culture)
		pPlayer:ChangeGold(gold)
		for unit in pPlayer:Units() do
			if unit:GetUnitType() == GameInfoTypes["UNIT_TAR_YAMANI"] then
				local type = GameInfoTypes["UNIT_CROSSBOWMAN"]
				if pPlayer:GetNumResourceAvailable(GameInfoTypes["RESOURCE_IRON"], true) > 0 then type = GameInfoTypes["UNIT_LONGSWORDSMAN"] end
				newUnit = pPlayer:InitUnit(type, unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
			end
		end
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TAR_QAYS"], true)	

		save(pPlayer, "Decisions_Tar_Umayyad_Qays", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TAR_UMAYYAD"], "Decisions_Tar_Umayyad_Qays", Decisions_Tar_Umayyad_Qays)


local Decisions_Tar_Rashidun_House_of_Wealth = {}
	Decisions_Tar_Rashidun_House_of_Wealth.Name = "TXT_KEY_DECISIONS_TAR_RASHIDUN_HOUSE_OF_WEALTH"
	Decisions_Tar_Rashidun_House_of_Wealth.Desc = "TXT_KEY_DECISIONS_TAR_RASHIDUN_HOUSE_OF_WEALTH_DESC"
	HookDecisionCivilizationIcon(Decisions_Tar_Rashidun_House_of_Wealth, "CIVILIZATION_TAR_RASHIDUN")
	Decisions_Tar_Rashidun_House_of_Wealth.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TAR_RASHIDUN"]) then return false, false end
		if load(pPlayer, "Decisions_Tar_Rashidun_House_of_Wealth") == true then
			Decisions_Tar_Rashidun_House_of_Wealth.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_RASHIDUN_HOUSE_OF_WEALTH_ENACTED_DESC")
			return false, false, true
		end
		local gold = math.ceil(1000 * iMod)
		Decisions_Tar_Rashidun_House_of_Wealth.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_RASHIDUN_HOUSE_OF_WEALTH_DESC", gold)
		if (pPlayer:GetGold() < gold) then return true, false end
		if (pPlayer:GetCurrentEra() > GameInfoTypes.ERA_MEDIEVAL) then return true, false end
		
		return true, true
	end
	)
       
	Decisions_Tar_Rashidun_House_of_Wealth.DoFunc = (
	function(pPlayer)
		local gold = math.ceil(1000 * iMod)
		pPlayer:ChangeGold(-gold)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TAR_HOUSE_OF_WEALTH"], true)	

		save(pPlayer, "Decisions_Tar_Rashidun_House_of_Wealth", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TAR_RASHIDUN"], "Decisions_Tar_Rashidun_House_of_Wealth", Decisions_Tar_Rashidun_House_of_Wealth)


local Decisions_Tar_Rashidun_Mosque = {}
	Decisions_Tar_Rashidun_Mosque.Name = "TXT_KEY_DECISIONS_TAR_RASHIDUN_MOSQUE"
	Decisions_Tar_Rashidun_Mosque.Desc = "TXT_KEY_DECISIONS_TAR_RASHIDUN_MOSQUE_DESC"
	HookDecisionCivilizationIcon(Decisions_Tar_Rashidun_Mosque, "CIVILIZATION_TAR_RASHIDUN")
	Decisions_Tar_Rashidun_Mosque.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TAR_RASHIDUN"]) then return false, false end
		if load(pPlayer, "Decisions_Tar_Rashidun_Mosque") == true then
			Decisions_Tar_Rashidun_Mosque.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_RASHIDUN_MOSQUE_ENACTED_DESC")
			return false, false, true
		end
		local faith = math.ceil(250 * iMod)
		Decisions_Tar_Rashidun_Mosque.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAR_RASHIDUN_MOSQUE_DESC", faith)
		if (pPlayer:GetFaith() < faith) then return true, false end
		if pPlayer:GetReligionCreatedByPlayer() == -1 then return true, false end
		
		return true, true
	end
	)
       
	Decisions_Tar_Rashidun_Mosque.DoFunc = (
	function(pPlayer)
		local faith = math.ceil(250 * iMod)
		pPlayer:ChangeFaith(-faith)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TAR_MOSQUE"], true)	

		save(pPlayer, "Decisions_Tar_Rashidun_Mosque", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TAR_RASHIDUN"], "Decisions_Tar_Rashidun_Mosque", Decisions_Tar_Rashidun_Mosque)

