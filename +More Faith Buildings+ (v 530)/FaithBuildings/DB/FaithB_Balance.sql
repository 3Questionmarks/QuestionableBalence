--=======================================================================================================================	
-- BALANCE
--=======================================================================================================================	
Update Buildings SET Happiness = 1 WHERE Type IN ('BUILDING_CATHEDRAL', 'BUILDING_MOSQUE', 'BUILDING_PAGODA');
Update Buildings SET FaithCost = 240 WHERE Type IN ('BUILDING_CATHEDRAL', 'BUILDING_MOSQUE', 'BUILDING_PAGODA');
Update Buildings SET ReligiousPressureModifier = 20 WHERE Type IN ('BUILDING_CATHEDRAL', 'BUILDING_MOSQUE', 'BUILDING_PAGODA');
--Update Buildings SET ConversionModifier = -10 WHERE Type IN ('BUILDING_CATHEDRAL', 'BUILDING_MOSQUE', 'BUILDING_PAGODA');

-- Cathedral
UPDATE Buildings
	SET GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', Strategy = 'TXT_KEY_BUILDING_GAIA_CATHEDRAL_STRATEGY'
	WHERE Type = 'BUILDING_CATHEDRAL';
UPDATE Building_YieldChanges
	SET Yield = 2
	WHERE BuildingType = 'BUILDING_CATHEDRAL' AND YieldType = 'YIELD_CULTURE';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
	('BUILDING_CATHEDRAL', 'YIELD_GOLD', 1);
UPDATE Buildings 
	SET Help = 'TXT_KEY_BUILDING_CATHEDRAL_HELP'
	WHERE Type = 'BUILDING_CATHEDRAL';

-- Mosque
UPDATE Buildings
	SET GreatWorkCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', Strategy = 'TXT_KEY_BUILDING_GAIA_MOSQUE_STRATEGY'
	WHERE Type = 'BUILDING_MOSQUE';
UPDATE Building_YieldChanges
	SET Yield = 2
	WHERE BuildingType = 'BUILDING_MOSQUE' AND YieldType = 'YIELD_FAITH';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
	('BUILDING_MOSQUE', 'YIELD_SCIENCE', 1);
UPDATE Buildings 
	SET Help = 'TXT_KEY_BUILDING_MOSQUE_HELP'
	WHERE Type = 'BUILDING_MOSQUE';

-- Pagoda
UPDATE Buildings
	SET GreatWorkCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', Strategy = 'TXT_KEY_BUILDING_GAIA_PAGODA_STRATEGY'
	WHERE Type = 'BUILDING_PAGODA';
UPDATE Buildings 
	SET Help = 'TXT_KEY_BUILDING_PAGODA_HELP'
	WHERE Type = 'BUILDING_PAGODA';

--=======================================================================================================================	
-- BELIEFS TOOLTIPS
--=======================================================================================================================	
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_CHURCH_TOOLTIP' 		WHERE Type = 'BELIEF_STAVE_CHURCH';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_DAOGUAN_TOOLTIP' 	WHERE Type = 'BELIEF_DAOGUAN';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_DAR_E_MEHR_TOOLTIP' 	WHERE Type = 'BELIEF_DAR_E_MEHR';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_GURDWARA_TOOLTIP' 	WHERE Type = 'BELIEF_GURDWARA';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_JINJA_TOOLTIP' 		WHERE Type = 'BELIEF_JINJA';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_MANDIR_TOOLTIP' 		WHERE Type = 'BELIEF_MANDIR';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_SYNAGOGUE_TOOLTIP' 	WHERE Type = 'BELIEF_SYNAGOGUE';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_STUPA_TOOLTIP' 		WHERE Type = 'BELIEF_STUPA';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_TEOCALLI_TOOLTIP' 	WHERE Type = 'BELIEF_TEOCALLI';

--=======================================================================================================================	
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'FaithB_Balance';