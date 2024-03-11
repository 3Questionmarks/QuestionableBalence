--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_MC_CALUSA_UA', 	'BUILDING_MC_CALUSA_UA', 				'TXT_KEY_BUILDING_MC_CALUSA_UA'),
		('BUILDINGCLASS_MC_CALUSA', 	'BUILDING_MC_TIDALTRAP_DUMMY', 			'TXT_KEY_BUILDING_MC_TIDALTRAP_DUMMY');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 							AllowsFoodTradeRoutes, HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, Description, 							Civilopedia, 							Help, 										Strategy,										ArtDefineTag, PortraitIndex,	IconAtlas)
SELECT		('BUILDING_MC_TIDALTRAP'),		AllowsFoodTradeRoutes, HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, ('TXT_KEY_BUILDING_MC_TIDALTRAP'),	('TXT_KEY_CIV5_MC_TIDALTRAP_TEXT'),	('TXT_KEY_BUILDING_MC_TIDALTRAP_HELP'),	('TXT_KEY_BUILDING_MC_TIDALTRAP_STRATEGY'),	ArtDefineTag, 3, 				('MC_CALUSA_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_GRANARY';
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 								BuildingClass, 					Description,							Help,											GreatWorkCount,	Cost,	FaithCost,	PrereqTech, 	NeverCapture)
VALUES		('BUILDING_MC_TIDALTRAP_DUMMY', 	'BUILDINGCLASS_MC_CALUSA',		'TXT_KEY_BUILDING_MC_TIDALTRAP_DUMMY',	'TXT_KEY_BUILDING_MC_TIDALTRAP_DUMMY_HELP',	-1, 			-1,   		-1,		null,			1),
			('BUILDING_MC_CALUSA_UA', 		'BUILDINGCLASS_MC_CALUSA_UA',	'TXT_KEY_BUILDING_MC_CALUSA_UA',		'TXT_KEY_BUILDING_MC_CALUSA_UA_HELP',	-1, 			-1,   		-1,		null,			1);
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_MC_TIDALTRAP'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GRANARY';
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================	
INSERT INTO Building_YieldModifiers
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_MC_TIDALTRAP'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GRANARY';
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================
INSERT INTO Building_ResourceYieldChanges
			(BuildingType, 						ResourceType, YieldType,		Yield)
SELECT		('BUILDING_MC_TIDALTRAP_DUMMY'),	ResourceType, ('YIELD_FOOD'),	1
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS';
--==========================================================================================================================	
-- Building_FeatureYieldChanges
--==========================================================================================================================	
INSERT INTO Building_FeatureYieldChanges
			(BuildingType, 					FeatureType,		YieldType, 			Yield)
VALUES		('BUILDING_MC_CALUSA_UA',		'FEATURE_MARSH',	'YIELD_FOOD',		2),
			('BUILDING_MC_CALUSA_UA',		'FEATURE_MARSH',	'YIELD_CULTURE',	2);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 				FlavorType, Flavor)
SELECT		('BUILDING_MC_TIDALTRAP'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';
--==========================================================================================================================	
--==========================================================================================================================	