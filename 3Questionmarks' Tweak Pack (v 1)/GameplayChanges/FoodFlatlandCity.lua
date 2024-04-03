-- Food for flatland cities
-- Author: Machiavelli
-- DateCreated: 9/26/2013 6:50:23 PM
--------------------------------------------------------------
function FoodForFlatlandCities(playerID, iX, iY)
	local plot = Map.GetPlot(iX, iY);
	-- If the city is on flat land, give it the building
	if(plot:IsCity() and not plot:IsHills()) then
		plot:GetPlotCity():SetNumRealBuilding(GameInfoTypes["BUILDING_FLATLAND_CITY"], 1)
	end
end
GameEvents.PlayerCityFounded.Add(FoodForFlatlandCities);