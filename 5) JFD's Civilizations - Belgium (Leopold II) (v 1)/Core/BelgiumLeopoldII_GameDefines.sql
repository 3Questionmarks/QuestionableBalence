--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 				    Description)
VALUES	('BUILDINGCLASS_JFD_BELGIUM_LEOPOLD_II',   'BUILDING_JFD_BELGIUM_LEOPOLD_II',   'TXT_KEY_BUILDING_JFD_BELGIUM_LEOPOLD_II');
--==========================================================================================================================	
-- RESOURCES
--==========================================================================================================================	
-------------------------------------------------------------------------------------------------------------------------
-- Resources
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 								ResourceClassType, 		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	'Unique', 	IconString, 				PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_JFD_PRALINE',	'TXT_KEY_RESOURCE_JFD_PRALINE',		'TXT_KEY_CIV5_RESOURCE_JFD_PRALINE_TEXT',	'RESOURCECLASS_LUXURY',	4,			10,					2, 				0, 				2, 			'[ICON_RES_JFD_PRALINE]',	5, 				'JFD_BELGIUM_LEOPOLD_II_ICON_ATLAS');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-------------------------------------------------------------------------------------------------------------------------
-- Buildings
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, Cost, GoldMaintenance, SpecialistCount, SpecialistType, PrereqTech, Happiness, Description, 						 Civilopedia, 								Help, 										Strategy,										ArtDefineTag, 	MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_CHOCOLATERIE',	BuildingClass, Cost, GoldMaintenance, SpecialistCount, SpecialistType, PrereqTech, Happiness, 'TXT_KEY_BUILDING_JFD_CHOCOLATERIE',  'TXT_KEY_CIV5_JFD_CHOCOLATERIE_TEXT', 	'TXT_KEY_BUILDING_JFD_CHOCOLATERIE_HELP', 	'TXT_KEY_BUILDING_JFD_CHOCOLATERIE_STRATEGY',	ArtDefineTag,	MinAreaSize, ConquestProb, HurryCostModifier, 4, 			 'JFD_BELGIUM_LEOPOLD_II_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_THEATRE';	
-------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceQuantity
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceQuantity 	
		(BuildingType, 					ResourceType, 			 Quantity)
VALUES	('BUILDING_JFD_CHOCOLATERIE',	'RESOURCE_JFD_PRALINE',  1);	
-------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_JFD_CHOCOLATERIE',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_THEATRE';
-------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_JFD_CHOCOLATERIE',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_THEATRE';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 								Description, 							Help, 										  Sound, 			  FriendlyLandsModifier,	CannotBeChosen, LostWithUpgrade, PortraitIndex,  IconAtlas, 		PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_FORCE_PUBLIQUE',	'TXT_KEY_PROMOTION_JFD_FORCE_PUBLIQUE',	'TXT_KEY_PROMOTION_JFD_FORCE_PUBLIQUE_HELP',  'AS2D_IF_LEVELUP',  20,						1, 				0, 				 59, 			 'ABILITY_ATLAS',   'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_FORCE_PUBLIQUE');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,						CombatClass, PurchaseOnly, PrereqTech,		   Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 						Help, 										Strategy, 									  Civilopedia, 								ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 						UnitFlagAtlas, 								UnitFlagIconOffset,  IconAtlas,								PortraitIndex)
SELECT	'UNIT_JFD_FORCE_PUBLIQUE',	'UNITCLASS_FOREIGNLEGION',	CombatClass, 1,			   'TECH_STEAM_POWER', Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_FORCE_PUBLIQUE',	'TXT_KEY_UNIT_JFD_FORCE_PUBLIQUE_HELP', 	'TXT_KEY_UNIT_JFD_FORCE_PUBLIQUE_STRATEGY',   'TXT_KEY_UNIT_JFD_FORCE_PUBLIQUE_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_FORCE_PUBLIQUE',	'JFD_BELGIUM_LEOPOLD_II_UNIT_FLAG_ATLAS',	0,					 'JFD_BELGIUM_LEOPOLD_II_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_FRENCH_FOREIGNLEGION';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_FORCE_PUBLIQUE',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_FORCE_PUBLIQUE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_FORCE_PUBLIQUE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_FORCE_PUBLIQUE',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
--INSERT INTO Unit_ResourceQuantityRequirements
--		(UnitType, 					ResourceType, Cost)
--SELECT	'UNIT_JFD_FORCE_PUBLIQUE',	ResourceType, Cost
--FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 		
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_FORCE_PUBLIQUE',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions 		
		(UnitType, 						PromotionType)
VALUES	('UNIT_JFD_FORCE_PUBLIQUE',		'PROMOTION_JFD_FORCE_PUBLIQUE'),
		('UNIT_JFD_FORCE_PUBLIQUE',		'PROMOTION_IGNORE_TERRAIN_COST');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 								Civilopedia, 									CivilopediaTag, 										ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 								PortraitIndex)
VALUES	('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II',	'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_BELGIUM_LEOPOLD_II', 	'JFD_BelgiumLeopoldII_Scene.xml',   8, 						3, 						5, 							9, 			5, 				6, 				5, 						5, 				5, 			5, 			6, 				5, 			4, 			'JFD_BELGIUM_LEOPOLD_II_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MAJOR_CIV_APPROACH_AFRAID', 		6),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_RECON', 					7),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_NAVAL', 					6),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_GOLD', 						8),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'TRAIT_JFD_BELGIUM_LEOPOLD_II');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_JFD_BELGIUM_LEOPOLD_II', 	'TXT_KEY_TRAIT_JFD_BELGIUM_LEOPOLD_II',		'TXT_KEY_TRAIT_JFD_BELGIUM_LEOPOLD_II_SHORT');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 										BuildingClass,							GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,									Help, 												NeverCapture)
VALUES	('BUILDING_JFD_BELGIUM_LEOPOLD_II_GOLD',	'BUILDINGCLASS_JFD_BELGIUM_LEOPOLD_II',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_BELGIUM_LEOPOLD_II_GOLD',	'TXT_KEY_BUILDING_JFD_BELGIUM_LEOPOLD_II_GOLD_HELP',	1);
------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_BuildingClassYieldChanges 	
		(BuildingType, 								BuildingClassType,		YieldType,		YieldChange)
VALUES	('BUILDING_JFD_BELGIUM_LEOPOLD_II_GOLD',	'BUILDINGCLASS_PALACE', 'YIELD_GOLD',	1);	
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses																												 
		(LeaderType, 						ResponseType, 								Response, 																 Bias)
VALUES 	('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_DENOUNCE_FRIEND%', 				 500),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_ATTACKED_HOSTILE%', 				 500),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_DEFEATED%', 						 500),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_DOW_GENERIC%', 					 500),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_FIRSTGREETING%', 				 500),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 	'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_RESPONSE_TO_BEING_DENOUNCED%',    500),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_DENOUNCE%', 						 500),
		('LEADER_JFD_BELGIUM_LEOPOLD_II', 	'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_JFD_BELGIUM_LEOPOLD_II_DEC_FRIENDSHIP%', 				 500);
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations
--------------------------------------------------------------------------------------------------------------------------			
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_ANDORRA_LA_VELLA_TEXT_1'
WHERE Type = 'MINOR_CIV_BRUSSELS';

UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_VADUZ_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_VADUZ_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_VADUZ_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_VADUZ_TEXT_1'
WHERE Type = 'MINOR_CIV_ANTWERP';
--------------------------------------------------------------------------------------------------------------------------		
-- MinorCivilization_CityNames
--------------------------------------------------------------------------------------------------------------------------			
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_DESC'
WHERE MinorCivType = 'MINOR_CIV_BRUSSELS';

UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_VADUZ_DESC'
WHERE MinorCivType = 'MINOR_CIV_ANTWERP';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,					 Description,								ShortDescription,									Adjective,										Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,								PortraitIndex,	AlphaIconAtlas,							SoundtrackTag,  MapImage, 							 DawnOfManQuote, 									 DawnOfManImage)
SELECT	'CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',	'TXT_KEY_CIV_JFD_BELGIUM_DESC',	 'TXT_KEY_CIV_JFD_BELGIUM_LEOPOLD_II_DESC',	'TXT_KEY_CIV_JFD_BELGIUM_LEOPOLD_II_SHORT_DESC',	'TXT_KEY_CIV_JFD_BELGIUM_LEOPOLD_II_ADJECTIVE',	'TXT_KEY_CIV5_JFD_BELGIUM_LEOPOLD_II_TEXT_1',  'TXT_KEY_CIV5_JFD_BELGIUM_LEOPOLD_II',	'PLAYERCOLOR_JFD_BELGIUM_LEOPOLD_II',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_BELGIUM_LEOPOLD_II_ICON_ATLAS',	0,				'JFD_BELGIUM_LEOPOLD_II_ALPHA_ATLAS',	'Netherlands', 	'JFD_MapBelgiumLeopoldII512.dds',	 'TXT_KEY_CIV5_DAWN_JFD_BELGIUM_LEOPOLD_II_TEXT',	 'JFD_DOM_BelgiumLeopoldII.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_NETHERLANDS';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						 CityName)
VALUES	('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_01'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_02'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_03'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_04'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_05'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_06'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_07'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_08'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_09'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_10'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_11'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_12'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_13'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_14'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_15'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_16'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_17'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_18'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_19'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_20'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_21'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_22'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_23'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',  'TXT_KEY_CITY_NAME_JFD_BELGIUM_LEOPOLD_II_24');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_NETHERLANDS';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_NETHERLANDS';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_NETHERLANDS';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',	'LEADER_JFD_BELGIUM_LEOPOLD_II');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',	'UNITCLASS_FOREIGNLEGION',  'UNIT_JFD_FORCE_PUBLIQUE');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 		 BuildingType)
VALUES	('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'BUILDINGCLASS_THEATRE', 'BUILDING_JFD_CHOCOLATERIE');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II',	'RELIGION_CHRISTIANITY');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_0'),	
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_1'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_2'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_3'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_4'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_5'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_6'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_7'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_8'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_9'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_10'),
		('CIVILIZATION_JFD_BELGIUM_LEOPOLD_II', 'TXT_KEY_SPY_NAME_JFD_BELGIUM_LEOPOLD_II_11');
--==========================================================================================================================
--==========================================================================================================================
