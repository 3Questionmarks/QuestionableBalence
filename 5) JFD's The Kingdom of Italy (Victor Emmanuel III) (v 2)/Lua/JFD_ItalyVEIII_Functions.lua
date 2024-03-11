-- JFD_ItalyVEIII_Functions
-- Author: JFD
-- DateCreated: 4/13/2016 10:07:44 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
-- IsCPDLL
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()

-- HasTrait
function HasTrait(player, traitID)
	if isCPDLL then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBAL
----------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
----------------------------------------------------------------------------------------------------------------------------
-- MARCH OF ORDINANCE
----------------------------------------------------------------------------------------------------------------------------
local traitItalyVEIIIID = GameInfoTypes["TRAIT_JFD_ITALY_V_E_III"]

-- JFD_ItalyVEIII_MarchOfOrdinancePreKill
function JFD_ItalyVEIII_MarchOfOrdinance_PreKill(killedPlayerID, unitID, unitType, plotX, plotY, isDelay, killingPlayerID)
	if killingPlayerID == -1 then return end
	if killingPlayerID == killedPlayerID then return end
	local player = Players[killingPlayerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitItalyVEIIIID)) then return end
	local plot = Map.GetPlot(plotX, plotY)
	if plot:GetOwner() == killingPlayerID then
		for unit in player:Units() do
			local cultureReward = mathCeil(unit:GetBaseCombatStrength()/3)
			unit:ChangeDamage(-10)
			player:ChangeJONSCulture(cultureReward)
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_CULTURE_STORED]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", cultureReward), true)
			end
		end
	end
end
GameEvents.UnitPrekill.Add(JFD_ItalyVEIII_MarchOfOrdinance_PreKill)
		
-- JFD_ItalyVEIII_MarchOfOrdinance_CityFounded
local buildingItalyVEIIIID = GameInfoTypes["BUILDING_JFD_ITALY_V_E_III"]
function JFD_ItalyVEIII_MarchOfOrdinance_CityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitItalyVEIIIID)) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if city:IsCoastal() then
		city:SetNumRealBuilding(buildingItalyVEIIIID, 1, true)
	end
end
GameEvents.PlayerCityFounded.Add(JFD_ItalyVEIII_MarchOfOrdinance_CityFounded)	

-- JFD_ItalyVEIII_MarchOfOrdinance_DoTurn
local buildingItalyVEIIIID = GameInfoTypes["BUILDING_JFD_ITALY_V_E_III"]
function JFD_ItalyVEIII_MarchOfOrdinance_DoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitItalyVEIIIID)) then return end
	for city in player:Cities() do
		if (not city:IsHasBuilding(buildingItalyVEIIIID)) then 
			city:SetNumRealBuilding(buildingItalyVEIIIID, 1, true)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_ItalyVEIII_MarchOfOrdinance_DoTurn)	
----------------------------------------------------------------------------------------------------------------------------
-- ANDREA DORIA 
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ItalyVEIII_AndreaDoria
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local unitPromotionAndreaDoriaID     = GameInfoTypes["PROMOTION_JFD_ANDREA_DORIA"]
local unitPromotionAndreaDoriaInfoID = GameInfoTypes["PROMOTION_JFD_ANDREA_DORIA_INFO"]
function JFD_ItalyVEIII_AndreaDoria(playerID)
	local player = Players[playerID]
	if player:IsAlive() then	
		for unit in player:Units() do
			if unit:GetDomainType() == domainSeaID then
				local isNearbyAndreaDoria = false
				if isCPDLL then
					isNearbyAndreaDoria = unit:IsWithinDistanceOfUnitPromotion(unitPromotionAndreaDoriaID, 2, false, true)
				else
					local unitPlot = unit:GetPlot()
					if unitPlot then
						for loopPlot in PlotAreaSpiralIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							local loopUnit = loopPlot:GetUnit()
							print(loopUnit:GetName(), loopUnit:IsHasPromotion(unitPromotionAndreaDoriaID), loopUnit:GetOwner())
							if loopUnit and (loopUnit:GetOwner() ~= playerID and loopUnit:IsHasPromotion(unitPromotionAndreaDoriaID)) then
								isNearbyAndreaDoria = true
								break
							end
						end
					end 
				end
				if isNearbyAndreaDoria then
					unit:ChangeMoves(-120)	
					if (not unit:IsHasPromotion(unitPromotionAndreaDoriaInfoID)) then
						unit:SetHasPromotion(unitPromotionAndreaDoriaInfoID, true)
					end	
				else
					if unit:IsHasPromotion(unitPromotionAndreaDoriaInfoID) then
						unit:SetHasPromotion(unitPromotionAndreaDoriaInfoID, false)
					end	
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_ItalyVEIII_AndreaDoria)
--==========================================================================================================================
--==========================================================================================================================