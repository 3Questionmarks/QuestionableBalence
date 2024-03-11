
local iAquaculture = GameInfoTypes.IMPROVEMENT_AQUACULTURE;
local iFishingBoats = GameInfoTypes.IMPROVEMENT_FISHING_BOATS;
local iFish = GameInfoTypes.RESOURCE_FISH;

function MakeFish(pPlot)
	if (pPlot:GetResourceType() == -1) then
		pPlot:SetResourceType(iFish, 1);
		pPlot:SetImprovementType(iFishingBoats);
	end
end

Events.SerialEventImprovementCreated.Add(function(HexX, HexY, continent1, continent2, iPlayer, iImprovement)
	local pPlot = Map.GetPlot(ToGridFromHex(HexX, HexY))
	if (pPlot:GetImprovementType() == iAquaculture) then
		MakeFish(pPlot)
	end
end)