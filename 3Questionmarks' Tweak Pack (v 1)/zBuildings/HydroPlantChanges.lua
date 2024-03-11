print("This is the 'Buildings - Hydro Plant Near River' mod script.")

local iHydroPlant = GameInfoTypes.BUILDING_HYDRO_PLANT

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

GameEvents.CityCanConstruct.Add(function(iPlayer, iCity, iBuilding) 
  if (iBuilding == iHydroPlant) then
    local pCityPlot = Players[iPlayer]:GetCityByID(iCity):Plot()

    if (pCityPlot:IsRiver()) then
      -- If the city is on a river, it can build a hydro plant
      return true
    else
      -- Or, if the city is adjacent to a river tile, the city can build a hydro plant
      for loop, direction in ipairs(directions) do
        local pPlot = Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), direction)

        if (pPlot ~= nil and iPlayer == pPlot:GetOwner()) then
          if (pPlot:IsRiver()) then
            return true
          end
        end
      end
    end

	  return false
  end

  return true
end)
