--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,	BuildingClass,			PrereqTech,			FreeStartEra,		NeverCapture,	Cost,	CultureRateModifier, PlotCultureCostModifier,	SpecialistType,			SpecialistCount,	HurryCostModifier,	IconAtlas,		PortraitIndex,	Description,					Help,								Strategy,							Civilopedia,							ArtDefineTag,				MinAreaSize) 
SELECT 'BUILDING_FA_FORUM',		'BUILDINGCLASS_MARKET',	'TECH_CURRENCY',	'ERA_INDUSTRIAL',	1,				100,	25,					-25,						'SPECIALIST_MERCHANT',	1,					25,					'FA_UB_ATLAS',	15,				'TXT_KEY_BUILDING_FA_FORUM',	'TXT_KEY_BUILDING_FA_FORUM_HELP',	'TXT_KEY_BUILDING_MARKET_STRATEGY',	'TXT_KEY_CIV5_BUILDINGS_MARKET_TEXT',	'ART_DEF_BUILDING_MARKET',	-1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_FORUM',							'YIELD_GOLD',			2 UNION ALL
SELECT 'BUILDING_FA_FORUM',							'YIELD_CULTURE',		2;

--------------------------------------------------------------------------------------------------
--Building, City Yield Modifiers
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_FORUM',							'YIELD_GOLD',			25; --UNION ALL
--SELECT 'BUILDING_FA_FORUM',							'YIELD_CULTURE',		25;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,					Flavor)
SELECT 'BUILDING_FA_FORUM',						'FLAVOR_EXPANSION',			8 UNION ALL
SELECT 'BUILDING_FA_FORUM',						'FLAVOR_GREAT_PEOPLE',		2 UNION ALL
SELECT 'BUILDING_FA_FORUM',						'FLAVOR_GOLD',				50 UNION ALL
SELECT 'BUILDING_FA_FORUM',						'FLAVOR_CULTURE',			6;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,				BuildingType)
SELECT 'CIVILIZATION_ROME',												'BUILDINGCLASS_MARKET',			'BUILDING_FA_FORUM';

--------------------------------------------------------------------------------------------------
--Delete Unique Units
--------------------------------------------------------------------------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_ROMAN_BALLISTA';
UPDATE Units SET Cost = -1, ShowInPedia = 0 WHERE Type = 'UNIT_ROMAN_BALLISTA';



