print("This is the 'UI - City Expansion' mod script.")

local g_PopupButtonOffset = 0
for row in GameInfo.CustomModOptions{Name = "UI_CITY_EXPANSION_BUTTONPOPUP_MODDER_OFFSET"} do
  g_PopupButtonOffset = row.Value
end
local popupButton = (ButtonPopupTypes.BUTTONPOPUP_MODDER_0 + g_PopupButtonOffset)
print(string.format("City Expansion ButtonPopupType: %i", popupButton))

-- We can't display the City View screen for a specific city directly from the DLL, so we fake it via a modder popup
function OnPopup(popupInfo)
  if (popupInfo.Type ~= popupButton) then
    return
  end
  
  if (popupInfo.Data1 ~= -1) then
    local pPlayer = Players[Game.GetActivePlayer()]
    local pCity = pPlayer:GetCityByID(popupInfo.Data1)
    
    if pCity and not pCity:IsPuppet() then
      -- print(string.format("Opening CityView for %s, forcing buy plots mode", pCity:GetName()))
      LuaEvents.CityViewForceBuyPlotsMode()
      UI.DoSelectCityAtPlot(pCity:Plot())
	end

    -- Dismiss the notification - ideally we'd do this when the player buys a tile
    -- However, if the player doesn't buy a tile, they'll get another notification next turn anyway
    -- print(string.format("Dismiss notification %i", popupInfo.Data2))
    pPlayer:DismissNotification(popupInfo.Data2, false)
  end

  -- Immediately dismiss this pop-up (as the City View screen is now open)  
  Events.SerialEventGameMessagePopupProcessed.CallImmediate(popupButton, 0)
end
Events.SerialEventGameMessagePopup.Add(OnPopup)
