-- Denmark
-- Author: FramedArchitecture
-- DateCreated: 4/2014
--------------------------------------------------------------------
local vikingID = -1;
local oceanID = -1;
--------------------------------------------------------------------
function OnUnitCreated(playerID, unitID)
	if (vikingID == -1) then return end
	local unit = Players[playerID]:GetUnitByID(unitID);
	if unit and unit:IsHasPromotion(vikingID) then
		unit:SetHasPromotion(oceanID, false);
	end
end
Events.SerialEventUnitCreated.Add( OnUnitCreated )
--------------------------------------------------------------------
local viking = GameInfo.UnitPromotions["PROMOTION_VIKING_HERITAGE"]
if viking then
	local ocean = GameInfo.UnitPromotions["PROMOTION_OCEAN_IMPASSABLE"]
	if ocean then
		vikingID = viking.ID
		oceanID = ocean.ID
		print("Script loaded...")
	end
end
--------------------------------------------------------------------