--------------------------------------------------------------------------------------------------
--Traits
--------------------------------------------------------------------------------------------------

ALTER TABLE Traits ADD COLUMN TradedResourceGoldPerTurn integer DEFAULT 0;

INSERT INTO Traits (Type,	LuaToInclude,			RequiresExpansion,		TradedResourceGoldPerTurn,	FreeBuilding,		Description,				ShortDescription) 
SELECT 'TRAIT_FA_DIDO',		'Dido_Commerce.lua',	1,						2,							'BUILDING_CARTHAGEDUMMYBUILDING',	'TXT_KEY_TRAIT_FA_DIDO',	'TXT_KEY_TRAIT_FA_DIDO_SHORT';

--------------------------------------------------------------------------------------------------
UPDATE Leader_Traits SET TraitType = 'TRAIT_FA_DIDO' WHERE LeaderType = 'LEADER_DIDO';

--------------------------------------------------------------------------------------------------
--Leader Flavors
--------------------------------------------------------------------------------------------------
DELETE FROM Leader_Flavors WHERE LeaderType = 'LEADER_DIDO';

INSERT INTO Leader_Flavors  (LeaderType,	FlavorType,							Flavor)
SELECT 'LEADER_DIDO',						'FLAVOR_OFFENSE',					5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_DEFENSE',					5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_CITY_DEFENSE',				6 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_MILITARY_TRAINING',			5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_RECON',						4 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_RANGED',					6 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_MOBILE',					4 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_NAVAL',						8 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_NAVAL_RECON',				9 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_NAVAL_GROWTH',				9 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_NAVAL_TILE_IMPROVEMENT',	9 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_AIR',						7 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_EXPANSION',					8 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_GROWTH',					4 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_TILE_IMPROVEMENT',			4 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_INFRASTRUCTURE',			5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_PRODUCTION',				5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_GOLD',						7 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_SCIENCE',					5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_CULTURE',					6 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_HAPPINESS',					6 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_GREAT_PEOPLE',				7 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_WONDER',					4 UNION ALL

SELECT 'LEADER_DIDO',						'FLAVOR_RELIGION',					4 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_DIPLOMACY',					7 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_SPACESHIP',					5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_WATER_CONNECTION',			9 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_NUKE',						5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_USE_NUKE',					5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_ESPIONAGE',					5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_ANTIAIR',					5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_AIR_CARRIER',				9 UNION ALL

SELECT 'LEADER_DIDO',						'FLAVOR_ARCHAEOLOGY',				4 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_I_LAND_TRADE_ROUTE',		5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_I_SEA_TRADE_ROUTE',			9 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_I_TRADE_ORIGIN',			5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_I_TRADE_DESTINATION',		5 UNION ALL
SELECT 'LEADER_DIDO',						'FLAVOR_AIRLIFT',					5;

--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
------------------------------
INSERT INTO Resources 
		(Type,							Description,						Civilopedia, 								TechCityTrade, 	ResourceClassType, 		Happiness,  CivilizationType,			AITradeModifier, 	AIObjective,	'Unique', 	IconString, 				ArtDefineTag,						PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_JFD_SHELLFISH',		'TXT_KEY_RESOURCE_JFD_SHELLFISH',	'TXT_KEY_CIV5_RESOURCE_JFD_SHELLFISH_TEXT',	'TECH_SAILING',	'RESOURCECLASS_LUXURY',	4,			'CIVILIZATION_CARTHAGE',	20,					0, 				2, 			'[ICON_RES_JFD_SHELLFISH]',	'ART_DEF_RESOURCE_JFD_SHELLFISH',	2, 				'JFD_CARTHAGE_DIDO_ATLAS');
------------------------------
-- Resource_YieldChanges
------------------------------
INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 			Yield)
VALUES	('RESOURCE_JFD_SHELLFISH',		'YIELD_GOLD',		2);
------------------------------
-- Resource_Flavors
------------------------------
INSERT INTO Resource_Flavors 	
		(ResourceType, 					FlavorType, 		Flavor)
VALUES	('RESOURCE_JFD_SHELLFISH', 		'FLAVOR_HAPPINESS', 10);
------------------------------
-- Resource_TerrainBooleans
------------------------------
INSERT INTO Resource_TerrainBooleans 	
		(ResourceType, 					TerrainType)
VALUES	('RESOURCE_JFD_SHELLFISH', 		'TERRAIN_COAST');
------------------------------
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
		(ResourceType, 					ImprovementType)
VALUES	('RESOURCE_JFD_SHELLFISH',		'IMPROVEMENT_FISHING_BOATS');
------------------------------
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 					ImprovementType,				YieldType,			Yield)
VALUES	('RESOURCE_JFD_SHELLFISH',		'IMPROVEMENT_FISHING_BOATS',	'YIELD_GOLD',		1),
		('RESOURCE_JFD_SHELLFISH',		'IMPROVEMENT_FISHING_BOATS',	'YIELD_CULTURE',	1),
		('RESOURCE_JFD_SHELLFISH',		'IMPROVEMENT_FISHING_BOATS',	'YIELD_FOOD',		1);
		
			
--------------------------------------------------------------------------------------------------
-- JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------
INSERT INTO JFD_TopPanelIncludes(FileName) 
SELECT 'UA_Functions.lua';

INSERT INTO JFD_TopPanelAdditions(CivilizationType,	YieldType,			YieldSourcefunction,			YieldSourceToolTip)
SELECT 'CIVILIZATION_CARTHAGE',						'YIELD_CULTURE',	'GetDidoTradeResourceCulture',	'TXT_KEY_DIDO_TRADE_RESOURCE_CULTURE' UNION ALL
SELECT 'CIVILIZATION_CARTHAGE',						'YIELD_GOLD',		'GetDidoTradeResourceGold',		'TXT_KEY_DIDO_TRADE_RESOURCE_GOLD';