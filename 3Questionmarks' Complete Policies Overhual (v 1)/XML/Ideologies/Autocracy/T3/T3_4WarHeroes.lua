-- T3_4WarHeros
-- Author: thetr
-- DateCreated: 5/11/2024 5:01:15 PM
--------------------------------------------------------------
function CreateGreatPeopleOnGreatPersonEarned(playerID, unitID, unitType, plotX, plotY, isCiv)
    local player = Players[playerID]
    if player and player:IsAlive() then
        local policyID = GameInfoTypes["POLICY_WAR_HEROES"]
        if player:HasPolicy(policyID) then
			local unit = player:GetUnitByID(unitID);
            if(unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_GREAT_ADMIRAL"] or unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_GREAT_GENERAL"]) then
                local capital = player:GetCapitalCity()
                if capital then
                    player:InitUnit(GameInfoTypes["UNIT_ARTIST"], capital:GetX(), capital:GetY())
                    player:InitUnit(GameInfoTypes["UNIT_WRITER"], capital:GetX(), capital:GetY())
                    player:InitUnit(GameInfoTypes["UNIT_MUSICIAN"], capital:GetX(), capital:GetY())
                end
            end
        end
    end
end

LuaEvents.SerialEventUnitCreatedGood.Add(CreateGreatPeopleOnGreatPersonEarned)

