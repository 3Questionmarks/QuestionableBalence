--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JFD_SCOTLAND', 	'BUILDING_JFD_SCOTTISH_WRITER_E', 	'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 					GreatWorkCount, GreatWorkSlotType,				BuildingClass, PrereqTech, Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JFD_COLLEGE',	1,				'GREAT_WORK_SLOT_LITERATURE',	BuildingClass, PrereqTech, Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, 'TXT_KEY_BUILDING_JFD_COLLEGE',	'TXT_KEY_CIV5_JFD_COLLEGE_TEXT',	'TXT_KEY_BUILDING_JFD_COLLEGE_HELP',	'TXT_KEY_BUILDING_JFD_COLLEGE_STRATEGY',	ArtDefineTag, 3, 				'JFD_SCOTLAND_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';	

INSERT INTO Buildings 	
		(Type, 						 		BuildingClass, 					SpecialistType, 		GoldenAgeModifier,	GreatPeopleRateChange,	GreatWorkCount, NeverCapture,	Cost, FaithCost, PrereqTech, Description, 								Help)
VALUES	('BUILDING_JFD_SCOTTISH_COLLEGE', 	'BUILDINGCLASS_JFD_SCOTLAND',	null,					10,					0,						-1, 			1,				-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_SCOTTISH_COLLEGE',	'TXT_KEY_BUILDING_JFD_SCOTTISH_COLLEGE_HELP'),
		('BUILDING_JFD_SCOTTISH_WRITER_M', 	'BUILDINGCLASS_JFD_SCOTLAND',	'SPECIALIST_WRITER', 	0,					3,						-1, 			1,				-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS',	'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS_HELP'),
		('BUILDING_JFD_SCOTTISH_WRITER_S', 	'BUILDINGCLASS_JFD_SCOTLAND',	'SPECIALIST_WRITER', 	0,					3,						-1, 			1,				-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS',	'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS_HELP'),
		('BUILDING_JFD_SCOTTISH_WRITER_E', 	'BUILDINGCLASS_JFD_SCOTLAND',	'SPECIALIST_WRITER', 	0,					3,						-1, 			1,				-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS', 	'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS_HELP');
--------------------------------	
-- Building_ClassesNeededInCity
--------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_COLLEGE',		BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_UNIVERSITY';		
--------------------------------	
-- Building_FeatureYieldChanges
--------------------------------	
INSERT INTO Building_FeatureYieldChanges 	
		(BuildingType, 				FeatureType, YieldType, Yield)
SELECT	'BUILDING_JFD_COLLEGE',		FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';	
--------------------------------	
-- Building_YieldModifiers
--------------------------------	
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_COLLEGE',		YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_UNIVERSITY';	
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_COLLEGE',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_UNIVERSITY';

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,				Flavor)
VALUES	('BUILDING_JFD_COLLEGE',	'FLAVOR_CULTURE',		10),
		('BUILDING_JFD_COLLEGE',	'FLAVOR_GREAT_PEOPLE',	10);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JFD_JAMES', 	'TXT_KEY_LEADER_JFD_JAMES', 	'TXT_KEY_LEADER_JFD_JAMES_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_JAMES', 	'James_Scene.xml',	5, 						5, 						5, 							5, 			5, 				7, 				6, 						5, 				6, 			4, 			6, 				4, 			4, 			'JFD_SCOTLAND_ATLAS',	1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_JAMES', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_JFD_JAMES', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_JAMES', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_JAMES', 	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_JFD_JAMES', 	'FLAVOR_RECON', 					5),
		('LEADER_JFD_JAMES', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_JAMES', 	'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_JAMES', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_JAMES', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_JAMES', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_JAMES', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_JAMES', 	'FLAVOR_AIR', 						4),
		('LEADER_JFD_JAMES', 	'FLAVOR_EXPANSION', 				4),
		('LEADER_JFD_JAMES', 	'FLAVOR_GROWTH', 					7),
		('LEADER_JFD_JAMES', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_JAMES', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JFD_JAMES', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_JAMES', 	'FLAVOR_GOLD', 						7),
		('LEADER_JFD_JAMES', 	'FLAVOR_SCIENCE', 					7),
		('LEADER_JFD_JAMES', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JFD_JAMES', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_JAMES', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_JAMES', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_JAMES', 	'FLAVOR_RELIGION', 					7),
		('LEADER_JFD_JAMES', 	'FLAVOR_DIPLOMACY', 				6),
		('LEADER_JFD_JAMES', 	'FLAVOR_SPACESHIP', 				5),
		('LEADER_JFD_JAMES', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_JAMES', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_JAMES', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_JAMES', 	'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_JAMES', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_JAMES', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_JAMES', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_JAMES', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_JAMES', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_JAMES', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_JAMES', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------					
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_JAMES', 	'TRAIT_JFD_SCOTLAND');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_JFD_SCOTLAND', 	'TXT_KEY_TRAIT_JFD_SCOTLAND', 	'TXT_KEY_TRAIT_JFD_SCOTLAND_SHORT');	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								HillsDoubleMove,	Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_SCOTTISH_GP', 		0,					'TXT_KEY_PROMOTION_JFD_SCOTTISH_GP', 	'TXT_KEY_PROMOTION_JFD_SCOTTISH_GP_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SCOTTISH_GP'),
		('PROMOTION_JFD_HIGHLANDER', 		1,					'TXT_KEY_PROMOTION_JFD_HIGHLANDER', 	'TXT_KEY_PROMOTION_JFD_HIGHLANDER_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_HIGHLANDER');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost,  FaithCost, RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_HIGHLANDER', 	Class, PrereqTech, Combat, Cost,  FaithCost, RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_HIGHLANDER', 	'TXT_KEY_CIV5_JFD_HIGHLANDER_TEXT', 'TXT_KEY_UNIT_JFD_HIGHLANDER_STRATEGY', 'TXT_KEY_UNIT_HELP_JFD_HIGHLANDER',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_JFD_HIGHLANDER',	0,					'JFD_UNIT_FLAG_HIGHLANDER_ATLAS',	2, 				'JFD_SCOTLAND_ATLAS'
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_HIGHLANDER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_HIGHLANDER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_HIGHLANDER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT OR REPLACE INTO Unit_FreePromotions 
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_HIGHLANDER', 'PROMOTION_JFD_HIGHLANDER');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_HIGHLANDER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType,                ResourceType, Cost)
VALUES  ('UNIT_JFD_HIGHLANDER',  'RESOURCE_IRON', 1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 							Description, 						ShortDescription, 						Adjective, 								Civilopedia, 					CivilopediaTag, 			DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				AlphaIconAtlas, 			PortraitIndex,	SoundtrackTag, 	MapImage, 					DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CIV_JFD_SCOTLAND_DESC', 	'TXT_KEY_CIV_JFD_SCOTLAND_SHORT_DESC', 	'TXT_KEY_CIV_JFD_SCOTLAND_ADJECTIVE', 	'TXT_KEY_CIV5_SCOTLAND_TEXT_1',	'TXT_KEY_CIV5_SCOTLAND', 	'PLAYERCOLOR_JFD_SCOTLAND',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_SCOTLAND_ATLAS',   'JFD_SCOTLAND_ALPHA_ATLAS', 0, 				'England', 		'MapScotlandJames512.dds',	'TXT_KEY_CIV5_DOM_JFD_JAMES_TEXT', 	'DOM_JamesVI.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ENGLAND';
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_01'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_02'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_03'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_04'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_05'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_06'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_07'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_08'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_09'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_10'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_11'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_12'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_13'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_14'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_15'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_16'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_17'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_18'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_19'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_20'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_21'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_22'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_23'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_24'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_25'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_26'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_27'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_28'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_29'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_30'),	
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_31'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_32'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_33');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JFD_SCOTLAND', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	('CIVILIZATION_JFD_SCOTLAND'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_JFD_SCOTLAND'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_SCOTLAND', 	'LEADER_JFD_JAMES');
--------------------------------
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_SCOTLAND', 	'BUILDINGCLASS_UNIVERSITY', 'BUILDING_JFD_COLLEGE');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_SCOTLAND', 	'UNITCLASS_RIFLEMAN', 		'UNIT_JFD_HIGHLANDER');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_JFD_SCOTLAND',	'RELIGION_PROTESTANTISM');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_0'),	
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_1'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_2'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_3'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_4'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_5'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_6'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_7'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_8'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_9');
--------------------------------
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_JFD_SCOTLAND', 	'REGION_HILLS');
--==========================================================================================================================
--==========================================================================================================================