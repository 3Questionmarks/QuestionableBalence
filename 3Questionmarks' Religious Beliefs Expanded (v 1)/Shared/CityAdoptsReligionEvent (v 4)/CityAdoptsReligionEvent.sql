-- Add the current religion building classes
INSERT INTO BuildingClasses(Type, DefaultBuilding, Description, MaxGlobalInstances, MaxTeamInstances, ExtraPlayerInstances, MaxPlayerInstances, NoLimit, Monument)
	SELECT 'BUILDINGCLASS_'||Type, 'BUILDING_'||Type, Description, -1, -1, -1, 0, 0, 0
	FROM Religions;

-- Add the current religion building type
INSERT INTO Buildings(Type, BuildingClass, Description, NukeImmune, ConquestProb, Cost, FaithCost, PrereqTech, GreatWorkCount)
	SELECT 'BUILDING_'||Type, 'BUILDINGCLASS_'||Type, Description, 1, 100, -1, -1, NULL, -1
	FROM Religions;

-- Add the has-ever-been religion building classes
INSERT INTO BuildingClasses(Type, DefaultBuilding, Description, MaxGlobalInstances, MaxTeamInstances, ExtraPlayerInstances, MaxPlayerInstances, NoLimit, Monument)
	SELECT 'BUILDINGCLASS_HAS_BEEN_'||Type, 'BUILDING_HAS_BEEN_'||Type, Description, -1, -1, -1, 0, 0, 0
	FROM Religions;

-- Add the has-ever-been religion building type
INSERT INTO Buildings(Type, BuildingClass, Description, NukeImmune, ConquestProb, Cost, FaithCost, PrereqTech, GreatWorkCount)
	SELECT 'BUILDING_HAS_BEEN_'||Type, 'BUILDINGCLASS_HAS_BEEN_'||Type, Description, 1, 100, -1, -1, NULL, -1
	FROM Religions;

-----------------------
-- DATABASE TRIGGERS --
-----------------------
-- A new religion is inserted and needs to have "is" and "has been" buildings created for it
CREATE TRIGGER IF NOT EXISTS ReligionInserted_CreateBuildings
AFTER INSERT ON Religions
BEGIN
	INSERT INTO BuildingClasses(Type, DefaultBuilding, Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, ExtraPlayerInstances, NoLimit, Monument)
	VALUES('BUILDINGCLASS_'||NEW.Type, 'BUILDING_'||NEW.Type, NEW.Description, -1, -1, -1, 0, 0, 0);

	INSERT INTO Buildings(Type, BuildingClass, Description, NukeImmune, ConquestProb, Cost, FaithCost, PrereqTech, GreatWorkCount)
	VALUES('BUILDING_'||NEW.Type, 'BUILDINGCLASS_'||NEW.Type, NEW.Description, 1, 100, -1, -1, NULL, -1);

	INSERT INTO BuildingClasses(Type, DefaultBuilding, Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, ExtraPlayerInstances, NoLimit, Monument)
	VALUES('BUILDINGCLASS_HAS_BEEN_'||NEW.Type, 'BUILDING_HAS_BEEN_'||NEW.Type, NEW.Description, -1, -1, -1, 0, 0, 0);

	INSERT INTO Buildings(Type, BuildingClass, Description, NukeImmune, ConquestProb, Cost, FaithCost, PrereqTech, GreatWorkCount)
	VALUES('BUILDING_HAS_BEEN_'||NEW.Type, 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type, NEW.Description, 1, 100, -1, -1, NULL, -1);
END;

CREATE TRIGGER IF NOT EXISTS ReligionUpdated_ChangeBuildings
AFTER UPDATE OF Type ON Religions
BEGIN
	UPDATE BuildingClasses SET Type = 'BUILDINGCLASS_'||NEW.Type, DefaultBuilding = 'BUILDING_'||NEW.Type
	WHERE Type = 'BUILDINGCLASS_'||OLD.Type;

	UPDATE Buildings SET Type = 'BUILDING_'||NEW.Type, BuildingClass = 'BUILDINGCLASS_'||NEW.Type
	WHERE Type = 'BUILDING_'||OLD.Type;

	UPDATE BuildingClasses SET Type = 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type, DefaultBuilding = 'BUILDING_HAS_BEEN_'||NEW.Type
	WHERE Type = 'BUILDINGCLASS_HAS_BEEN_'||OLD.Type;

	UPDATE Buildings SET Type = 'BUILDING_HAS_BEEN_'||NEW.Type, BuildingClass = 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type
	WHERE Type = 'BUILDING_HAS_BEEN_'||OLD.Type;
END;

CREATE TRIGGER IF NOT EXISTS ReligionDeleted_DeleteBuildings
AFTER DELETE ON Religions
BEGIN
	DELETE FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_'||OLD.Type;
	DELETE FROM Buildings WHERE Type = 'BUILDING_'||OLD.Type;

	DELETE FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_HAS_BEEN_'||OLD.Type;
	DELETE FROM Buildings WHERE Type = 'BUILDING_HAS_BEEN_'||OLD.Type;
END;