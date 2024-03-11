-- Khmer UA
-- Author: Sukritact
--=======================================================================================================================

print("Khmer UA: loaded")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "Khmer_UA";
include("IconSupport")

--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
-- GetRandom
-------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive: Thanks to JFD for this one!
-------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
ButtonPopupTypes.BUTTONPOPUP_KHMERUA = "BUTTONPOPUP_KHMERUA"
g_PopupInfo = {["Type"] = ButtonPopupTypes.BUTTONPOPUP_KHMERUA}
--=======================================================================================================================
-- Open/Close Functions
--=======================================================================================================================
function ShowHideHandler(bIsHide, bInitState)
    if(not bInitState) then
       if(not bIsHide) then
        	UI.incTurnTimerSemaphore()
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo)
        else
            UI.decTurnTimerSemaphore()
            if(g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0)
			end
        end
    end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
--=======================================================================================================================
-- Initial Functions
--=======================================================================================================================
local sSave = "GAME"
local iCostMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local iCiv = GameInfoTypes.CIVILIZATION_KHMER

if JFD_IsCivilisationActive(iCiv) then
	tBuildings = {}
	for Building in GameInfo.Buildings() do
		local iBuilding = Building.ID
		tBuildings[iBuilding] = iBuilding
		
		if (GameInfo.BuildingClasses[GameInfo.Buildings[iBuilding].BuildingClass].MaxGlobalInstances == (-1)) then
			tBuildings[iBuilding] = nil
		elseif (GameInfo.Buildings[iBuilding].Cost <= 0) then
			tBuildings[iBuilding] = nil
		elseif (GameInfo.Buildings[iBuilding].PrereqTech == nil) then
			tBuildings[iBuilding] = nil
		elseif load(sSave, iBuilding) == true then
			tBuildings[iBuilding] = nil
		end
	end
end
--=======================================================================================================================
-- Main Code
--=======================================================================================================================
local tWonders = {}
	
function TrackWonders(iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsMinorCiv()) or (pPlayer:IsBarbarian()) then
		return
	end
	
	local bKhmer = (pPlayer:GetCivilizationType() == iCiv )
	
	for pCity in pPlayer:Cities() do
		local iCity = pCity:GetID()
		for iKey, iBuilding in pairs(tBuildings) do
			if (pCity:IsHasBuilding(iBuilding)) then
				if load(sSave, iBuilding) ~= true then
					if bKhmer then
					
						tWonders[iBuilding] = {}
						tWonders[iBuilding].City = iCity
						tWonders[iBuilding].ID = iBuilding
						
						--Define Rewards
						local iCost = (GameInfo.Buildings[iBuilding].Cost)*iCostMod
						local iEra = GameInfo.Eras[GameInfo.Technologies[GameInfo.Buildings[iBuilding].PrereqTech].Era].ID
						if iEra < 1 then iEra = 1 end
						tWonders[iBuilding].Food = math.floor(iCost* (0.20 + 0.05 * iEra))
						tWonders[iBuilding].Faith = math.floor(iCost* (0.27 + 0.06 * iEra))
						
					end
					
					save(sSave, iBuilding, true)
					tBuildings[iBuilding] = nil
				end
			end
		end
	end
	if bKhmer then
		KhmerUA(pPlayer)
	end
end



function KhmerUA (pPlayer)
	-- Human Player
	if pPlayer:IsHuman() then
		for iBuilding, tInfo in pairs(tWonders) do
			KhmerPopup(pPlayer:GetID(), tInfo)
			return
		end
	-- AI Player
	else
		for iBuilding, tInfo in pairs(tWonders) do
			local iRandom = math.random(1,2)
			if iRandom == 1 then
				local pCity = pPlayer:GetCityByID(tInfo.City)
				pCity:ChangeFood(tInfo.Food)
			elseif iRandom == 2 then
				pPlayer:ChangeFaith(tInfo.Faith)
			end
		end
	end
	
	tWonders = {} -- Empty the Table
end

--=======================================================================================================================
-- Responses
--=======================================================================================================================

g_tCurrentWonder = nil
g_pCurrentPlayer = nil
function KhmerPopup(iPlayer, tInfo)

	local pPlayer = Players[iPlayer]
	local tBuilding = GameInfo.Buildings[tInfo.ID]
	g_tCurrentWonder = tInfo
	g_pCurrentPlayer = pPlayer
	
	--Localise and hookup icons
	Controls.Message:LocalizeAndSetText("TXT_KEY_KHMER_DIALOG", tBuilding.Description)
	Controls.Food:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_KHMER_FOOD_TOOLTIP", tostring(tInfo.Food)))
	Controls.Faith:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_KHMER_FAITH_TOOLTIP", tostring(tInfo.Faith)))
	IconHookup(tBuilding.PortraitIndex, 128, tBuilding.IconAtlas, Controls.WonderIcon)
	CivIconHookup(iPlayer, 64, Controls.Icon, Controls.CivIconBG, Controls.CivIconShadow, false, true )
	
	UIManager:QueuePopup(ContextPtr, PopupPriority.WonderPopup)
	tBuilding = nil
end

Controls.Food:RegisterCallback(Mouse.eLClick, 
	function()
		local pPlayer = g_pCurrentPlayer
		local pCity = pPlayer:GetCityByID(g_tCurrentWonder.City)
		
		UIManager:DequeuePopup(ContextPtr)
		pCity:ChangeFood(g_tCurrentWonder.Food)
		
		tWonders[g_tCurrentWonder.ID] = nil
		g_tCurrentWonder = nil
		g_pCurrentPlayer = nil
		
		KhmerUA(pPlayer)
	end
)

Controls.Faith:RegisterCallback(Mouse.eLClick, 
	function()
		local pPlayer = g_pCurrentPlayer
		
		UIManager:DequeuePopup(ContextPtr)
		pPlayer:ChangeFaith(g_tCurrentWonder.Faith)
		
		tWonders[g_tCurrentWonder.ID] = nil
		
		g_tCurrentWonder = nil
		g_pCurrentPlayer = nil

		KhmerUA(pPlayer)
	end
)
--=======================================================================================================================
-- Initialise
--=======================================================================================================================
UIManager:QueuePopup(ContextPtr, PopupPriority.WonderPopup)
UIManager:DequeuePopup(ContextPtr)

function OnEnterGame()
	if JFD_IsCivilisationActive(iCiv) then 
		GameEvents.PlayerDoTurn.Add(TrackWonders)
		TrackWonders(Game.GetActivePlayer())
	end
end
Events.LoadScreenClose.Add(OnEnterGame)
--=======================================================================================================================
--=======================================================================================================================