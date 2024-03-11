--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	AllowsProductionTradeRoutes,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_SALADERO'),		BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_SALADERO'),	('TXT_KEY_CIV5_BUILDING_SENSHI_SALADERO_TEXT'),	('TXT_KEY_BUILDING_SENSHI_SALADERO_HELP'),	('TXT_KEY_BUILDING_SENSHI_SALADERO_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	AllowsProductionTradeRoutes,	'SENSHI_URUGUAY_ATLAS',	4
FROM Buildings WHERE (Type = 'BUILDING_WORKSHOP');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_SALADERO'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_WORKSHOP');

INSERT OR REPLACE INTO Building_Flavors 
		(BuildingType, 					FlavorType,			Flavor)
VALUES	('BUILDING_SENSHI_SALADERO',	'FLAVOR_HAPPINESS',	25);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_SENSHI_SALADERO'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_WORKSHOP');
------------------------------	
-- Building_YieldModifiers
------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_SENSHI_SALADERO'),	YieldType,		Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_WORKSHOP');