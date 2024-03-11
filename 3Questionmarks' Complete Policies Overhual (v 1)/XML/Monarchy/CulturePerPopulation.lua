-- culturePerPopulation
-- Author: Moriboe
-- DateCreated: 12/28/2011
--------------------------------------------------------------

-- add culture when wonder completed
function CulturePerPop(iPlayer)
  local buildingID, buildingTime;
  local player = Players[iPlayer];
  if IsValidPlayer(player) then
    for pCity in player:Cities() do
      for row in GameInfo.Building_CultureChangePerPop() do
        -- has wonder?
        buildingID = GameInfo.Buildings[row.BuildingType].ID;
        if pCity:IsHasBuilding(buildingID) then
          -- just built?
          buildingTime = pCity:GetBuildingOriginalTime(buildingID);
          if buildingTime == Game:GetGameTurnYear() then
            pCity:ChangeJONSCulturePerTurnFromBuildings(
              math.floor(pCity:GetPopulation() / row.Pop * row.Culture));
          end
        end
      end
    end
  end
end

-- add/remove culture upon population change
function ChangePopCulture(iX, iY, oldPopulation, newPopulation)
  local pCity = Map.GetPlot(iX, iY):GetPlotCity();
  local oldCulture, newCulture, change = 0;
  for row in GameInfo.Building_CultureChangePerPop() do
    if pCity:IsHasBuilding(GameInfo.Buildings[row.BuildingType].ID) then
      oldCulture = math.floor(oldPopulation * row.Culture / row.Pop);
      newCulture = math.floor(newPopulation * row.Culture / row.Pop);
      pCity:ChangeJONSCulturePerTurnFromBuildings(newCulture - oldCulture);
    end
  end
end

-- add culture upon capture
function SetPopCulture(playerID, bCapital, iX, iY, newPlayerID)
  local pCity = Map.GetPlot(iX, iY):GetPlotCity();
  for row in GameInfo.Building_CultureChangePerPop() do
    if pCity:IsHasBuilding(GameInfo.Buildings[row.BuildingType].ID) then
      pCity:ChangeJONSCulturePerTurnFromBuildings(
        math.floor(pCity:GetPopulation() / row.Pop * row.Culture));
    end
  end
end

function IsValidPlayer(player)
  return player ~= nil and player:IsAlive() and not player:IsBarbarian()
end

GameEvents.PlayerDoTurn.Add( CulturePerPop );
GameEvents.SetPopulation.Add( ChangePopCulture );
GameEvents.CityCaptureComplete.Add( SetPopCulture );