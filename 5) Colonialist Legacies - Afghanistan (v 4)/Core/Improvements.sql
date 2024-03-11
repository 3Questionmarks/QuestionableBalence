--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,								SpecificCivRequired,	UpgradeTime,	CivilizationType,				GoldMaintenance,	NoTwoAdjacent,	Description,							Civilopedia,										ArtDefineTag,						DestroyedWhenPillaged,	Permanent,	PillageGold,	BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_CL_KALLE',			1,						50,				'CIVILIZATION_CL_AFGHANISTAN',	0,					1,				'TXT_KEY_IMPROVEMENT_CL_KALLE',			'TXT_KEY_IMPROVEMENT_CL_KALLE_PEDIA',				'ART_DEF_IMPROVEMENT_CL_KALLE', 	1,						1,			100,			1,						4,				'CL_AFGHANISTAN_ATLAS');
--==========================================================================================================================
-- Improvement_ValidTerrains
--==========================================================================================================================
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,				TerrainType)
VALUES		('IMPROVEMENT_CL_KALLE',	'TERRAIN_DESERT'),
			('IMPROVEMENT_CL_KALLE',	'TERRAIN_PLAINS'),
			('IMPROVEMENT_CL_KALLE',	'TERRAIN_TUNDRA'),
			('IMPROVEMENT_CL_KALLE',	'TERRAIN_SNOW'),
			('IMPROVEMENT_CL_KALLE',	'TERRAIN_GRASS');
--==========================================================================================================================
-- Improvement_Yields
--==========================================================================================================================
INSERT INTO Improvement_Yields
			(ImprovementType,					YieldType,		Yield)
VALUES		('IMPROVEMENT_CL_KALLE',			'YIELD_GOLD',	1),
			('IMPROVEMENT_CL_KALLE',			'YIELD_FOOD',	1);
--==========================================================================================================================
-- Improvement_AdjacentMountainYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_AdjacentMountainYieldChanges
			(ImprovementType,					YieldType,		Yield)
VALUES		('IMPROVEMENT_CL_KALLE',			'YIELD_GOLD',	1),
			('IMPROVEMENT_CL_KALLE',			'YIELD_FOOD',	1);
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,				PrereqTech,					Time,			ImprovementType,			Description,					Help,									Recommendation,					EntityEvent,				HotKey, OrderPriority,	CtrlDown,	IconIndex,	IconAtlas)
VALUES		('BUILD_CL_KALLE',	'TECH_MATHEMATICS',			700,            'IMPROVEMENT_CL_KALLE',		'TXT_KEY_BUILD_CL_KALLE',		'TXT_KEY_BUILD_CL_KALLE_HELP',			'TXT_KEY_BUILD_CL_KALLE_REC',	'ENTITY_EVENT_CHOP',		'K',		96,				1,			0,		'CL_BUILD_KALLE_ATLAS');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds
			(UnitType,		BuildType)
VALUES		('UNIT_WORKER',	'BUILD_CL_KALLE');
--==========================================================================================================================
--==========================================================================================================================