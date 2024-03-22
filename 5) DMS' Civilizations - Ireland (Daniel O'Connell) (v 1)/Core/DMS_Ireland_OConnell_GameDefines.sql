--==========================================================================================================================	
-- BUILDINGCLASSES
--==========================================================================================================================	
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 
		(DefaultBuilding, 								Type, 												Description)
VALUES	('BUILDING_DMS_PRESSURE_FROM_GREATWORKS',		'BUILDINGCLASS_DMS_PRESSURE_FROM_GREATWORKS', 		'TXT_KEY_BUILDING_DMS_PRESSURE_FROM_GREATWORKS'),
		('BUILDING_DMS_CULTURE_FROM_PRESSURE',			'BUILDINGCLASS_DMS_CULTURE_FROM_PRESSURE', 			'TXT_KEY_BUILDING_DMS_CULTURE_FROM_PRESSURE'),
		('BUILDING_DMS_FAITH_FROM_PRESSURE',			'BUILDINGCLASS_DMS_FAITH_FROM_PRESSURE', 			'TXT_KEY_BUILDING_DMS_FAITH_FROM_PRESSURE'),
		('BUILDING_DMS_UNIT_PRODUCTION_FROM_PRESSURE',	'BUILDINGCLASS_DMS_UNIT_PRODUCTION_FROM_PRESSURE', 	'TXT_KEY_BUILDING_DMS_UNIT_PRODUCTION_FROM_PRESSURE');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	Cost,	GoldMaintenance, Happiness,	PrereqTech,           GreatWorkCount,	GreatWorkSlotType,				Description, 								Civilopedia, 								Help, 											Strategy,											ArtDefineTag,	EspionageModifier,	Espionage,	MinAreaSize,	NeverCapture,	HurryCostModifier,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_DMS_FRATERNAL_LODGE'),	BuildingClass,	Cost,	GoldMaintenance, 2        ,	('TECH_SOVEREIGNTY'), 1,				('GREAT_WORK_SLOT_LITERATURE'),	('TXT_KEY_BUILDING_DMS_FRATERNAL_LODGE'),	('TXT_KEY_CIV5_DMS_FRATERNAL_LODGE_TEXT'),	('TXT_KEY_BUILDING_DMS_FRATERNAL_LODGE_HELP'),	('TXT_KEY_BUILDING_DMS_FRATERNAL_LODGE_STRATEGY'),	ArtDefineTag,	EspionageModifier,	Espionage,	MinAreaSize,	NeverCapture,	HurryCostModifier,	3,				'DMS_IRELAND_OCONNELL_ATLAS'
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');

INSERT INTO Buildings
		(Type, 						 					BuildingClass, 										GreatWorkCount,	Cost,	FaithCost,	PrereqTech,	MinAreaSize,	Description, 											Help)
VALUES	('BUILDING_DMS_PRESSURE_FROM_GREATWORKS',		'BUILDINGCLASS_DMS_PRESSURE_FROM_GREATWORKS',		-1,				-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_PRESSURE_FROM_GREATWORKS',		'TXT_KEY_BUILDING_DMS_PRESSURE_FROM_GREATWORKS_HELP'),
		('BUILDING_DMS_CULTURE_FROM_PRESSURE',			'BUILDINGCLASS_DMS_CULTURE_FROM_PRESSURE',			-1,				-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_CULTURE_FROM_PRESSURE',			'TXT_KEY_BUILDING_DMS_CULTURE_FROM_PRESSURE_HELP'),
		('BUILDING_DMS_FAITH_FROM_PRESSURE',			'BUILDINGCLASS_DMS_FAITH_FROM_PRESSURE',			-1,				-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_FAITH_FROM_PRESSURE',				'TXT_KEY_BUILDING_DMS_FAITH_FROM_PRESSURE_HELP'),
		('BUILDING_DMS_UNIT_PRODUCTION_FROM_PRESSURE',	'BUILDINGCLASS_DMS_UNIT_PRODUCTION_FROM_PRESSURE',	-1,				-1,		-1,			null,		-1,				'TXT_KEY_BUILDING_DMS_UNIT_PRODUCTION_FROM_PRESSURE',	'TXT_KEY_BUILDING_DMS_UNIT_PRODUCTION_FROM_PRESSURE_HELP');

UPDATE Buildings Set ReligiousPressureModifier = 6 WHERE Type IS 'BUILDING_DMS_PRESSURE_FROM_GREATWORKS';		
------------------------------
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,				Flavor)
SELECT	('BUILDING_DMS_FRATERNAL_LODGE'),		FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');

INSERT INTO Building_Flavors
		(BuildingType, 							FlavorType,				Flavor)
VALUES	('BUILDING_DMS_FRATERNAL_LODGE',		'FLAVOR_ESPIONAGE',		10),
		('BUILDING_DMS_FRATERNAL_LODGE',		'FLAVOR_RELIGION',		10),
		('BUILDING_DMS_FRATERNAL_LODGE',		'FLAVOR_GREAT_PEOPLE',	15);
------------------------------
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges
		(BuildingType, 							YieldType,				Yield)
VALUES	('BUILDING_DMS_CULTURE_FROM_PRESSURE',	'YIELD_CULTURE',		1),
		('BUILDING_DMS_FAITH_FROM_PRESSURE',	'YIELD_FAITH',			1);
------------------------------
-- Building_UnitCombatProductionModifiers
------------------------------	
INSERT INTO Building_UnitCombatProductionModifiers
		(BuildingType, 									UnitCombatType,				Modifier)
VALUES	('BUILDING_DMS_UNIT_PRODUCTION_FROM_PRESSURE',	'UNITCOMBAT_GUN',			1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 		
		(Type, 						Class, 	PrereqTech,	Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost, CombatLimit, Pillage,	XPValueAttack,	XPValueDefense,	Conscription,	UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT	('UNIT_DMS_DEVILS_OWN'),	Class,	PrereqTech, Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_DMS_DEVILS_OWN'),	('TXT_KEY_CIV5_DMS_DEVILS_OWN_TEXT'),	('TXT_KEY_UNIT_DMS_DEVILS_OWN_STRATEGY'),	('TXT_KEY_UNIT_DMS_DEVILS_OWN_HELP'),	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost, CombatLimit, Pillage,	XPValueAttack,	XPValueDefense,	Conscription,	UnitArtInfoEraVariation, UnitArtInfo, 	0,					'DMS_DEVILS_OWN_FLAG_ART_ATLAS',	2,				'DMS_IRELAND_OCONNELL_ATLAS'
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_DEVILS_OWN'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MUSKETMAN');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	('UNIT_DMS_DEVILS_OWN'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSKETMAN');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,			Flavor)
SELECT	('UNIT_DMS_DEVILS_OWN'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSKETMAN');

INSERT INTO Unit_Flavors
		(UnitType, 				FlavorType,				Flavor)
VALUES	('UNIT_DMS_DEVILS_OWN',	'FLAVOR_OFFENSE',		20);

--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType,                ResourceType, Cost)
VALUES  ('UNIT_DMS_DEVILS_OWN',  'RESOURCE_IRON', 1);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	('UNIT_DMS_DEVILS_OWN'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_MUSKETMAN');

INSERT INTO Unit_FreePromotions
		(UnitType,					PromotionType)
VALUES	('UNIT_DMS_DEVILS_OWN',		'PROMOTION_DMS_DEVILS_OWN_ABILITY');			
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	('UNIT_DMS_DEVILS_OWN'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions 
		(Type,										Sound,				CannotBeChosen,	LostWithUpgrade,	OrderPriority,	PortraitIndex,	IconAtlas,		PediaType,		Description,										Help, 													PediaEntry)
VALUES	('PROMOTION_DMS_DEVILS_OWN_ABILITY',		'AS2D_IF_LEVELUP',	1,				0,					1,				59,				'ABILITY_ATLAS','PEDIA_SHARED',	'TXT_KEY_PROMOTION_DMS_DEVILS_OWN_ABILITY',			'TXT_KEY_PROMOTION_DMS_DEVILS_OWN_ABILITY_HELP',		'TXT_KEY_PROMOTION_DMS_DEVILS_OWN_ABILITY_HELP'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','AS2D_IF_LEVELUP',	1,				0,					1,				59,				'ABILITY_ATLAS','PEDIA_SHARED',	'TXT_KEY_PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH',	'TXT_KEY_PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH_HELP','TXT_KEY_PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH_HELP');

UPDATE UnitPromotions SET CombatPercent = 15 WHERE Type IS 'PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH';
--------------------------------	
-- UnitPromotions_UnitCombats
--------------------------------	
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,								UnitCombatType)
VALUES	('PROMOTION_DMS_DEVILS_OWN_ABILITY',		'UNITCOMBAT_GUN'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_NAVALRANGED'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_SUBMARINE'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_CARRIER'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_NAVALMELEE'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_ARMOR'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_HELICOPTER'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_SIEGE'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_MOUNTED'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_GUN'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_MELEE'),
		('PROMOTION_DMS_DEVILS_OWN_COMBAT_STRENGTH','UNITCOMBAT_ARCHER');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 								Civilopedia, 										CivilopediaTag, 												ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_DMS_DANIEL_O_CONNELL', 	'TXT_KEY_LEADER_DMS_DANIEL_O_CONNELL', 		'TXT_KEY_LEADER_DMS_DANIEL_O_CONNELL_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_LEADER_DMS_DANIEL_O_CONNELL', 		'DMS_DanielOConnell_Scene.xml',	6, 						4, 						5, 							6, 			8, 				6, 				7, 						7, 				6, 			6, 			6, 				7, 			4, 			'DMS_IRELAND_OCONNELL_ATLAS',	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 							MajorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_DANIEL_O_CONNELL', 		'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 							MinorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_DANIEL_O_CONNELL', 		'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 							FlavorType, 						Flavor)
VALUES	('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_OFFENSE', 					5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_DEFENSE', 					6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_RECON', 					6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_RANGED', 					5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_MOBILE', 					5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_NAVAL', 					5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_AIR', 						5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_EXPANSION', 				5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_GROWTH', 					6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_GOLD', 						5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_SCIENCE', 					6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_CULTURE', 					7),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_HAPPINESS', 				6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_WONDER', 					4),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_RELIGION', 					7),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_DIPLOMACY', 				7),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_SPACESHIP', 				4),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_NUKE', 						5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_USE_NUKE', 					5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_ESPIONAGE', 				6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_ARCHAEOLOGY', 				6),
		('LEADER_DMS_DANIEL_O_CONNELL', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_DMS_DANIEL_O_CONNELL', 	'TRAIT_DMS_TWILIGHT_OF_THE_GAELS');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 									Description, 								ShortDescription)
VALUES	('TRAIT_DMS_TWILIGHT_OF_THE_GAELS', 	'TXT_KEY_TRAIT_DMS_TWILIGHT_OF_THE_GAELS', 	'TXT_KEY_TRAIT_DMS_TWILIGHT_OF_THE_GAELS_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 									Description, 									ShortDescription,										Adjective,													CivilopediaTag,													DefaultPlayerColor,						ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,							AlphaIconAtlas,								SoundtrackTag, 	MapImage,						DawnOfManQuote,										DawnOfManImage)
SELECT	('CIVILIZATION_DMS_IRELAND_OCONNELL'), 	('TXT_KEY_CIVILIZATION_DMS_IRELAND_OCONNELL'), 	('TXT_KEY_CIVILIZATION_DMS_IRELAND_OCONNELL_SHORT'),	('TXT_KEY_CIVILIZATION_DMS_IRELAND_OCONNELL_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_DMS_IRELAND_OCONNELL'),		('PLAYERCOLOR_DMS_IRELAND_OCONNELL'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('DMS_IRELAND_OCONNELL_ATLAS'),		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS'),		('England'), 	('IrelandOConnellMap512.dds'),	('TXT_KEY_CIV5_DAWN_DMS_IRELAND_OCONNELL_TEXT'),	('DanielOConnell_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,					CityName)
VALUES	('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_1'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_2'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_3'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_4'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_5'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_6'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_7'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_8'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_9'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_10'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_11'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_12'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_13'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_14'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_15'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_16'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_17'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_18'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_19'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_20'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_21'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_22'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_23'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_24'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_25'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_26'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_27'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_28'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_29'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_30'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_31'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_32'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_33'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_34'),
        ('CIVILIZATION_DMS_IRELAND_OCONNELL',   'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_IRELAND_OCONNELL_35');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 							BuildingClassType)
SELECT	('CIVILIZATION_DMS_IRELAND_OCONNELL'),		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 							TechType)
SELECT	('CIVILIZATION_DMS_IRELAND_OCONNELL'),		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_DMS_IRELAND_OCONNELL'),		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_DMS_IRELAND_OCONNELL',		'LEADER_DMS_DANIEL_O_CONNELL');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 							UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'UNITCLASS_MUSKETMAN',	'UNIT_DMS_DEVILS_OWN');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'BUILDINGCLASS_CONSTABLE', 		'BUILDING_DMS_FRATERNAL_LODGE');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 							ReligionType)
SELECT	('CIVILIZATION_DMS_IRELAND_OCONNELL'), 		ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
VALUES	('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_0'),	
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_1'),
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_2'),
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_3'),
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_4'),
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_5'),
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_6'),
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_7'),
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_8'),
		('CIVILIZATION_DMS_IRELAND_OCONNELL', 		'TXT_KEY_SPY_NAME_DMS_IRELAND_OCONNELL_9');
--==========================================================================================================================
-- Civilization_Start_Along_Ocean
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 								StartAlongOcean)
VALUES	('CIVILIZATION_DMS_IRELAND_OCONNELL', 			1);
--==========================================================================================================================
--==========================================================================================================================