--------------------------------------------------------------------------------------------------
--Traits
--------------------------------------------------------------------------------------------------

ALTER TABLE Traits ADD COLUMN ClaimFoundedResources integer DEFAULT 0;
ALTER TABLE Traits ADD COLUMN TradedResourceGoldPerTurn integer DEFAULT 0;

INSERT INTO Traits (Type,	LuaToInclude,			RequiresExpansion,	ClaimFoundedResources,	TradedResourceGoldPerTurn,	FreeBuilding,		Description,				ShortDescription) 
SELECT 'TRAIT_FA_DIDO',		'Dido_Commerce.lua',	1,					2,						2,							'BUILDING_HARBOR',	'TXT_KEY_TRAIT_FA_DIDO',	'TXT_KEY_TRAIT_FA_DIDO_SHORT';

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
	
--------------------------------------------------------------------------------------------------
-- JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------
INSERT INTO JFD_TopPanelIncludes(FileName) 
SELECT 'UA_Functions.lua';

INSERT INTO JFD_TopPanelAdditions(CivilizationType,	YieldType,			YieldSourcefunction,			YieldSourceToolTip)
SELECT 'CIVILIZATION_CARTHAGE',						'YIELD_CULTURE',	'GetDidoTradeResourceCulture',	'TXT_KEY_DIDO_TRADE_RESOURCE_CULTURE' UNION ALL
SELECT 'CIVILIZATION_CARTHAGE',						'YIELD_GOLD',		'GetDidoTradeResourceGold',		'TXT_KEY_DIDO_TRADE_RESOURCE_GOLD';