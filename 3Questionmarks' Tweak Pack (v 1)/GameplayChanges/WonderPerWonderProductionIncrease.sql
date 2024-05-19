-- Insert SQL Rules Here
-- Increase wonder production by 5% for every wonder owned
UPDATE Buildings
SET WonderProductionModifier = COALESCE(WonderProductionModifier, 0) - 5
WHERE BuildingClass IN (
    SELECT Type
    FROM BuildingClasses
    WHERE MaxGlobalInstances = 1
);