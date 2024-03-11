--------------------------------------------------------------------------------------------------
--Traits
--------------------------------------------------------------------------------------------------
ALTER TABLE Traits ADD COLUMN FreeLandlockedBuilding text DEFAULT null;
ALTER TABLE Traits ADD COLUMN FaithToScienceTech text DEFAULT null;

INSERT INTO Traits (Type,	LuaToInclude,			RequiresExpansion,	FreeBuilding,	FreeLandlockedBuilding,		FaithToScienceTech,		Description,				ShortDescription) 
SELECT 'TRAIT_FA_ASKIA',	'Askia_Chronicle.lua',	1,					NULL,			'BUILDING_MINT',			'TECH_EDUCATION',		'TXT_KEY_TRAIT_FA_ASKIA',	'TXT_KEY_TRAIT_FA_ASKIA_SHORT';

--------------------------------------------------------------------------------------------------
UPDATE Leader_Traits SET TraitType = 'TRAIT_FA_ASKIA' WHERE LeaderType = 'LEADER_ASKIA';

--------------------------------------------------------------------------------------------------
--Leader Flavors
--------------------------------------------------------------------------------------------------
DELETE FROM Leader_Flavors WHERE LeaderType = 'LEADER_ASKIA';

INSERT INTO Leader_Flavors  (LeaderType,	FlavorType,							Flavor)
SELECT 'LEADER_ASKIA',					'FLAVOR_OFFENSE',					7 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_DEFENSE',					4 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_CITY_DEFENSE',				4 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_MILITARY_TRAINING',			6 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_RECON',						8 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_RANGED',					2 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_MOBILE',					5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_NAVAL',						2 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_NAVAL_RECON',				2 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_NAVAL_GROWTH',				2 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_NAVAL_TILE_IMPROVEMENT',	5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_AIR',						5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_EXPANSION',					6 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_GROWTH',					4 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_TILE_IMPROVEMENT',			6 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_INFRASTRUCTURE',			5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_PRODUCTION',				4 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_GOLD',						8 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_SCIENCE',					6 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_CULTURE',					4 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_HAPPINESS',					4 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_GREAT_PEOPLE',				6 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_WONDER',					3 UNION ALL

SELECT 'LEADER_ASKIA',					'FLAVOR_RELIGION',					8 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_DIPLOMACY',					3 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_SPACESHIP',					3 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_WATER_CONNECTION',			2 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_NUKE',						5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_USE_NUKE',					5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_ESPIONAGE',					6 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_ANTIAIR',					5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_AIR_CARRIER',				5 UNION ALL

SELECT 'LEADER_ASKIA',					'FLAVOR_ARCHAEOLOGY',				4 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_I_LAND_TRADE_ROUTE',		9 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_I_SEA_TRADE_ROUTE',			3 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_I_TRADE_ORIGIN',			5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_I_TRADE_DESTINATION',		5 UNION ALL
SELECT 'LEADER_ASKIA',					'FLAVOR_AIRLIFT',					5;

--------------------------------------------------------------------------------------------------
-- JFD_TopPanelAdditions
--------------------------------------------------------------------------------------------------
INSERT INTO JFD_TopPanelIncludes(FileName) 
SELECT 'UA_Functions.lua';

INSERT INTO JFD_TopPanelAdditions(CivilizationType,	YieldType,			YieldSourcefunction,				YieldSourceToolTip)
SELECT 'CIVILIZATION_SONGHAI',						'YIELD_SCIENCE',	'GetAskiaCapitalFaithToScience',   'TXT_KEY_ASKIA_CAPITAL_FAITH_SCIENCE';

--------------------------------------------------------------------------------------------------
--Expansion Changes
--------------------------------------------------------------------------------------------------

