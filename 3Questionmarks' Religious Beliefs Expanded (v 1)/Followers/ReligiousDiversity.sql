-- Adds +1 Food
INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	SELECT 'BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||Type, 'YIELD_FOOD', 2
	FROM Religions;

-- +1 Production
INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	SELECT 'BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||Type, 'YIELD_PRODUCTION', 2
	FROM Religions;

-- +1 Gold
INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	SELECT 'BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||Type, 'YIELD_GOLD', 2
	FROM Religions;

-- +1 Science
INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	SELECT 'BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||Type, 'YIELD_SCIENCE', 2
	FROM Religions;

-- +1 Culture
INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	SELECT 'BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||Type, 'YIELD_CULTURE', 2
	FROM Religions;

-- +1 Faith
INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	SELECT 'BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||Type, 'YIELD_FAITH', 2
	FROM Religions;

-----------------------
-- DATABASE TRIGGERS --
-----------------------
CREATE TRIGGER IF NOT EXISTS ReligiousDiversity_InsertedReligion
AFTER INSERT ON Religions
BEGIN
	INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	VALUES('BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type, 'YIELD_FOOD', 2);
	INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	VALUES('BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type, 'YIELD_PRODUCTION', 2);
	INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	VALUES('BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type, 'YIELD_GOLD', 2);
	INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	VALUES('BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type, 'YIELD_SCIENCE', 2);
	INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	VALUES('BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type, 'YIELD_CULTURE', 2);
	INSERT INTO Belief_BuildingClassYieldChanges(BeliefType, BuildingClassType, YieldType, YieldChange)
	VALUES('BELIEF_MESSENGER_GODS', 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type, 'YIELD_FAITH', 2);
END;

CREATE TRIGGER IF NOT EXISTS ReligiousDiversity_UpdatedReligion
AFTER UPDATE OF Type ON Religions
BEGIN
	UPDATE Belief_BuildingClassYieldChanges SET BuildingClassType = 'BUILDINGCLASS_HAS_BEEN_'||NEW.Type
	WHERE BuildingClassType = 'BUILDINGCLASS_HAS_BEEN_'||OLD.Type AND BeliefType = 'BELIEF_MESSENGER_GODS';
END;

CREATE TRIGGER IF NOT EXISTS ReligiousDiversity_DeletedReligion
AFTER DELETE ON Religions
BEGIN
	DELETE FROM Belief_BuildingClassYieldChanges
	WHERE BuildingClassType = 'BUILDINGCLASS_HAS_BEEN_'||OLD.Type AND BeliefType = 'BELIEF_MESSENGER_GODS';
END;
--TODO: test update and delete triggers.