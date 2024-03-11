-- Prasat_Effect
-- Author: Sukritact
--=======================================================================================================================

print("loaded")

--=======================================================================================================================
-- Main Code
--=======================================================================================================================

local iPrasat		= GameInfoTypes.BUILDING_KHMER_PRASAT
local iPrasatEffect	= GameInfoTypes.BUILDING_KHMER_PRASAT_EFFECT

function PrasatEffect(iPlayer, pPlayer)
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iPrasat) and pCity:GetNumWorldWonders() > 0 then
			pCity:SetNumRealBuilding(iPrasatEffect, 1)
		else
			pCity:SetNumRealBuilding(iPrasatEffect, 0)
		end
	end
end

local iCiv = GameInfoTypes.CIVILIZATION_KHMER
local iBaray = GameInfoTypes.BUILDING_KHMER_BARAY_EFFECT

function BarayEffect(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= iCiv then
		return
	end
	local iCityNum = 0
	for pCity in pPlayer:Cities() do
		iCityNum = iCityNum + 1
		if iCityNum < 5 then
			pCity:SetNumRealBuilding(iBaray, 1)
		else
			pCity:SetNumRealBuilding(iBaray, 0)
		end		
	end
end

--=======================================================================================================================
-- Triggers
--=======================================================================================================================

function PrasatEffectTrigger1(iPlayer)
	local pPlayer = Players[iPlayer]
	PrasatEffect(iPlayer, pPlayer)
end

function PrasatEffectTrigger2()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		PrasatEffect(iPlayer, pPlayer)
	end
end

GameEvents.PlayerDoTurn.Add(PrasatEffectTrigger1)
Events.SerialEventGameDataDirty.Add(PrasatEffectTrigger2)

GameEvents.CityCaptureComplete.Add(function(iOldOwner, bIsCapital, iCityX, iCityY, iOwner, iPop, bConquest)
		BarayEffect(iOwner)
		BarayEffect(iOldOwner)
	end
)
GameEvents.PlayerCityFounded.Add(BarayEffect)