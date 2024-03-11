
INSERT INTO BuildingClasses
		(Type,											DefaultBuilding,						Description)
VALUES	('BUILDINGCLASS_SENSHI_URUGUAY_SPECIALISTS',	'BUILDING_SENSHI_URUGUAY_SPECIALISTS',	'TXT_KEY_BUILDING_SENSHI_URUGUAY_SPECIALISTS');

INSERT INTO Buildings
		(Type,										BuildingClass,								Description,									Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	NeverCapture,	NukeImmune,	IconAtlas,		PortraitIndex)
VALUES	('BUILDING_SENSHI_URUGUAY_SPECIALISTS',		'BUILDINGCLASS_SENSHI_URUGUAY_SPECIALISTS',	'TXT_KEY_BUILDING_SENSHI_URUGUAY_SPECIALISTS',	-1,		-1,			-1,				NULL,		1,				1,			'BW_ATLAS_1',	13);
		
INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,								SpecialistType,		YieldType,		Yield)
SELECT	'BUILDING_SENSHI_URUGUAY_SPECIALISTS',		SpecialistType, 	YieldType, 		(ABS(Yield) / Yield)
FROM SpecialistYields WHERE SpecialistType != 'SPECIALIST_CITIZEN';

INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,								SpecialistType,		YieldType,			Yield)
SELECT	'BUILDING_SENSHI_URUGUAY_SPECIALISTS',		Type,				'YIELD_CULTURE',	(ABS(CulturePerTurn) / CulturePerTurn)
FROM Specialists WHERE CulturePerTurn != 0 AND NOT EXISTS (SELECT 1 FROM Building_SpecialistYieldChanges WHERE SpecialistType = Type AND YieldType = 'YIELD_CULTURE' and BuildingType = 'BUILDING_SENSHI_URUGUAY_SPECIALISTS');

CREATE TRIGGER IF NOT EXISTS C15_Senshi_UruguayHandlingUnifiedYields
BEFORE INSERT ON SpecialistYields
WHEN NEW.YieldType = 'YIELD_CULTURE' AND NEW.Yield = (SELECT CulturePerTurn FROM Specialists WHERE Type = NEW.SpecialistType)
BEGIN
	DELETE FROM Building_SpecialistYieldChanges WHERE BuildingType = 'BUILDING_SENSHI_URUGUAY_SPECIALISTS' AND SpecialistType = NEW.SpecialistType AND YieldType = NEW.YieldType;
END;

CREATE TRIGGER IF NOT EXISTS C15_Senshi_UruguaySpecialistsAdd
AFTER INSERT ON SpecialistYields
WHEN NEW.SpecialistType != 'SPECIALIST_CITIZEN'
BEGIN
	INSERT INTO Building_SpecialistYieldChanges
			(BuildingType,								SpecialistType,			YieldType,			Yield)
	VALUES	('BUILDING_SENSHI_URUGUAY_SPECIALISTS',		NEW.SpecialistType, 	NEW.YieldType, 		(ABS(NEW.Yield) / NEW.Yield));
END;

CREATE TRIGGER IF NOT EXISTS C15_Senshi_UruguaySpecialistsUpdate
AFTER UPDATE ON SpecialistYields
WHEN NEW.SpecialistType != 'SPECIALIST_CITIZEN' -- If someone changes an existing row to a Slacker then fukem tbh
BEGIN
	DELETE FROM Building_SpecialistYieldChanges 
	WHERE BuildingType = 'BUILDING_SENSHI_URUGUAY_SPECIALISTS' AND SpecialistType = OLD.SpecialistType AND YieldType = OLD.YieldType
	AND NOT EXISTS (SELECT 1 FROM SpecialistYields WHERE SpecialistType = OLD.SpecialistType AND YieldType = OLD.YieldType);
	
	INSERT INTO Building_SpecialistYieldChanges
			(BuildingType,							SpecialistType,			YieldType,		Yield)
	SELECT	'BUILDING_SENSHI_URUGUAY_SPECIALISTS',	NEW.SpecialistType,		NEW.YieldType,	(ABS(NEW.Yield) / NEW.Yield)
	WHERE NOT EXISTS (SELECT 1 FROM Building_SpecialistYieldChanges WHERE SpecialistType = NEW.SpecialistType AND YieldType = NEW.YieldType AND BuildingType = 'BUILDING_SENSHI_URUGUAY_SPECIALISTS');
END;

CREATE TRIGGER IF NOT EXISTS C15_Senshi_UruguaySpecialistsDelete
AFTER DELETE ON SpecialistYields
WHEN OLD.SpecialistType != 'SPECIALIST_CITIZEN'
BEGIN
	DELETE FROM Building_SpecialistYieldChanges 
	WHERE BuildingType = 'BUILDING_SENSHI_URUGUAY_SPECIALISTS' AND SpecialistType = OLD.SpecialistType AND YieldType = OLD.YieldType
	AND NOT EXISTS (SELECT 1 FROM SpecialistYields WHERE SpecialistType = OLD.SpecialistType AND YieldType = OLD.YieldType);
END;

-- Unit

INSERT INTO UnitPromotions
		(Type,											Description,									Help,												Sound,				PortraitIndex,			IconAtlas,				PediaType,				PediaEntry,										CannotBeChosen,			LostWithUpgrade,		CombatPercent)
VALUES	('PROMOTION_SENSHI_URUGUAY_UU_CITY_BUFF_1',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_1',	'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_1_HELP',	'AS2D_IF_LEVELUP',	59,						'ABILITY_ATLAS',		'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_1',	1,						1,						1),
		('PROMOTION_SENSHI_URUGUAY_UU_CITY_BUFF_2',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_2',	'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_2_HELP',	'AS2D_IF_LEVELUP',	59,						'ABILITY_ATLAS',		'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_2',	1,						1,						2),
		('PROMOTION_SENSHI_URUGUAY_UU_CITY_BUFF_4',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_4',	'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_4_HELP',	'AS2D_IF_LEVELUP',	59,						'ABILITY_ATLAS',		'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_4',	1,						1,						4),
		('PROMOTION_SENSHI_URUGUAY_UU_CITY_BUFF_8',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_8',	'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_8_HELP',	'AS2D_IF_LEVELUP',	59,						'ABILITY_ATLAS',		'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_8',	1,						1,						8),
		('PROMOTION_SENSHI_URUGUAY_UU_CITY_BUFF_16',	'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_16',	'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_16_HELP',	'AS2D_IF_LEVELUP',	59,						'ABILITY_ATLAS',		'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_URUGUAY_UU_CITY_16',	1,						1,						16);	

INSERT INTO BuildingClasses
		(Type,											DefaultBuilding,						Description)
VALUES	('BUILDINGCLASS_SENSHI_URUGUAY_UBDUMMY',		'BUILDING_SENSHI_URUGUAY_UBDUMMY',		'TXT_KEY_BUILDING_SENSHI_URUGUAY_UBDUMMY'),
		('BUILDINGCLASS_SENSHI_URUGUAY_UBHAPPINESS',	'BUILDING_SENSHI_URUGUAY_UBHAPPINESS',	'TXT_KEY_BUILDING_SENSHI_URUGUAY_HAPPINESS');

INSERT INTO Buildings
		(Type,									BuildingClass,								Description,									Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	ConquestProb,	NukeImmune,	IconAtlas,		PortraitIndex)
VALUES	('BUILDING_SENSHI_URUGUAY_UBDUMMY',		'BUILDINGCLASS_SENSHI_URUGUAY_UBDUMMY',		'TXT_KEY_BUILDING_SENSHI_URUGUAY_UBDUMMY',		-1,		-1,			-1,				NULL,		100,			1,			'BW_ATLAS_1',	13),
		('BUILDING_SENSHI_URUGUAY_UBHAPPINESS',	'BUILDINGCLASS_SENSHI_URUGUAY_UBHAPPINESS',	'TXT_KEY_BUILDING_SENSHI_URUGUAY_HAPPINESS',	-1,		-1,			-1,				NULL,		0,				1,			'BW_ATLAS_1',	13);

UPDATE Buildings
SET Happiness = 1
WHERE Type = 'BUILDING_SENSHI_URUGUAY_UBHAPPINESS';
		
INSERT INTO Language_en_US
		(Tag,											Text)
VALUES	('TXT_KEY_BUILDING_SENSHI_URUGUAY_SPECIALISTS',	'Since Senshi isnt gonna bother doing it'),
		('TXT_KEY_SENSHI_URUGUAY_PRODUCTION_PER_CITY',	''),
		('TXT_KEY_BUILDING_SENSHI_URUGUAY_UBDUMMY',		'UB Marker'),
		('TXT_KEY_BUILDING_SENSHI_URUGUAY_HAPPINESS',	'Happiness Dummy');
		