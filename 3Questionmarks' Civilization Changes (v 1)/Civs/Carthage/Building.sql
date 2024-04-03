--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------
INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, Description, 					Civilopedia, 						Help, 									Strategy,									PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, DisplayPosition, AllowsWaterRoutes, MinAreaSize, ConquestProb, GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_COTHON',	BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, 'TXT_KEY_BUILDING_JFD_COTHON', 	'TXT_KEY_CIV5_JFD_COTHON_TEXT', 	'TXT_KEY_BUILDING_JFD_COTHON_HELP', 	'TXT_KEY_BUILDING_JFD_COTHON_STRATEGY',		-15,				 ArtDefineTag,	ArtInfoEraVariation, DisplayPosition, AllowsWaterRoutes, MinAreaSize, ConquestProb, GreatPeopleRateModifier, FreshWater, HurryCostModifier, 1, 				'JFD_CARTHAGE_DIDO_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_HARBOR';	

------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_COTHON',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_HARBOR';	

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,			Flavor)
VALUES	('BUILDING_JFD_COTHON',		'FLAVOR_CULTURE',	20);
------------------------------	
-- Building_SeaResourceYieldChanges
------------------------------	
INSERT INTO Building_SeaResourceYieldChanges
		(BuildingType,				YieldType,			Yield)
VALUES	('BUILDING_JFD_COTHON',		'YIELD_GOLD',		1),
		('BUILDING_JFD_COTHON',		'YIELD_CULTURE',	1);

--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';
UPDATE Units SET Cost = -1, ShowInPedia = 0 WHERE Type = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType,			BuildingClassType,				BuildingType)
SELECT											'CIVILIZATION_CARTHAGE',	'BUILDINGCLASS_HARBOR',			'BUILDING_JFD_COTHON';
--==========================================================================================================================
--==========================================================================================================================