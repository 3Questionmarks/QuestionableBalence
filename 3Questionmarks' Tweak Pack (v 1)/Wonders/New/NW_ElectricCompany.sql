--------------------------------------------------------------------------------------------------
--Building Classes
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,			DefaultBuilding,				MaxPlayerInstances,	Description)
SELECT 'BUILDINGCLASS_FA_ELECTRIC_CO',		'BUILDING_FA_ELECTRIC_CO',		1,					'TXT_KEY_BUILDING_FA_ELECTRIC_CO' UNION ALL
SELECT 'BUILDINGCLASS_FA_ELECTRIC_POWER',	'BUILDING_FA_ELECTRIC_POWER',	-1,					'TXT_KEY_BUILDING_FA_ELECTRIC_POWER';

--------------------------------------------------------------------------------------------------
--Civilization Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,					BuildingType)
SELECT 'CIVILIZATION_MINOR',											'BUILDINGCLASS_FA_ELECTRIC_CO',		NULL;

--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
ALTER TABLE Buildings ADD COLUMN FreeBuildingThisContinent text DEFAULT null;

INSERT INTO Buildings (Type,				BuildingClass,							PrereqTech,			Happiness,	Cost,	NumCityCostMod,	FreeBuildingThisContinent,		River,	GoldMaintenance,	NukeImmune,	NeverCapture,	HurryCostModifier,	IconAtlas,		PortraitIndex,	Description,							Help,										Strategy,										Civilopedia,									ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_FA_ELECTRIC_CO',			'BUILDINGCLASS_FA_ELECTRIC_CO',			'TECH_ELECTRONICS',	0,			500,	20,				'BUILDING_FA_ELECTRIC_POWER',	1,		5,					1,			1,				-1,					'FA_NW_ATLAS',	3,				'TXT_KEY_BUILDING_FA_ELECTRIC_CO',		'TXT_KEY_BUILDING_FA_ELECTRIC_CO_HELP',		'TXT_KEY_BUILDING_FA_ELECTRIC_CO_STRATEGY',		'TXT_KEY_BUILDING_FA_ELECTRIC_CO_PEDIA',		'ART_DEF_BUILDING_IRONWORKS',	-1 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_POWER',		'BUILDINGCLASS_FA_ELECTRIC_POWER',		NULL,				3,			-1,		0,				NULL,							0,		0,					1,			1,				-1,					'FA_NW_ATLAS',	6,				'TXT_KEY_BUILDING_FA_ELECTRIC_POWER',	'TXT_KEY_BUILDING_FA_ELECTRIC_POWER_HELP',	'TXT_KEY_BUILDING_FA_ELECTRIC_POWER_STRATEGY',	'TXT_KEY_BUILDING_FA_ELECTRIC_POWER_PEDIA',		'ART_DEF_BUILDING_IRONWORKS',	-1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_ELECTRIC_CO',					'YIELD_CULTURE',		1 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_POWER',					'YIELD_CULTURE',	3;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_ELECTRIC_POWER',				'YIELD_GOLD',			3 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_POWER',				'YIELD_SCIENCE',		3 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_POWER',				'YIELD_PRODUCTION',		3;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,						Flavor)
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_GOLD',					20 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_PRODUCTION',			30 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_SCIENCE',				30 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_HAPPINESS',				30 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_GROWTH',				20 UNION ALL
SELECT 'BUILDING_FA_ELECTRIC_CO',				'FLAVOR_WONDER',				20;
