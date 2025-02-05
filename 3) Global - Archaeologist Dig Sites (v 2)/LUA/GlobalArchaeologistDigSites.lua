print("This is the 'Global - Archaeologist Dig Sites' mod script.")

local iArchaeologist = GameInfoTypes.UNIT_ARCHAEOLOGIST
local iExplorationFinisher = GameInfoTypes.POLICY_EXPLORATION_FINISHER
local iSiteDig = GameInfoTypes.RESOURCE_ARTIFACTS
local iHiddenDig = GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS

local bDigSites = false

function ClearDigSites()
  if (bDigSites) then
    Events.ClearHexHighlights()
    bDigSites = false
  end
end

function ShowDigSites(pPlayer, bShowHidden)
  ClearDigSites()
  
  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

	if (pPlot:GetResourceType() == iSiteDig or (bShowHidden and pPlot:GetResourceType() == iHiddenDig)) then
      Events.SerialEventHexHighlight(ToHexFromGrid({x=pPlot:GetX(), y=pPlot:GetY()}), true, GetDigSiteColour(pPlayer, pPlot))
	end
  end

  bDigSites = true
end

function GetDigSiteColour(pPlayer, pPlot)
  for pUnit in pPlayer:Units() do
    if (pUnit:GetUnitType() == iArchaeologist) then
      local pMissionPlot = pUnit:LastMissionPlot()

      if (pPlot:GetX() == pMissionPlot:GetX() and pPlot:GetY() == pMissionPlot:GetY()) then
        return {x=0, y=1, z=0, w=1} -- Green
      end
    end
  end
	
  return {x=1, y=0, z=1, w=1} -- Magenta
end

function OnUnitSelectionChange(iPlayer, iUnit, iHexX, iHexY, _, bSelected)
  if (bSelected) then
    local pPlayer = Players[iPlayer]
    local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if (pUnit ~= nil) then
  	  if (pUnit:GetUnitType() == iArchaeologist) then
	    ShowDigSites(pPlayer, pPlayer:HasPolicy(iExplorationFinisher))
	  end
	end
  else
    ClearDigSites()
  end
end
Events.UnitSelectionChanged.Add(OnUnitSelectionChange)

function OnUnitSelectionCleared()
  ClearDigSites()
end
Events.UnitSelectionCleared.Add(OnUnitSelectionCleared)

function OnUnitDestroyed(iPlayer, iUnit)
  ClearDigSites()
end
Events.SerialEventUnitDestroyed.Add(OnUnitDestroyed)
