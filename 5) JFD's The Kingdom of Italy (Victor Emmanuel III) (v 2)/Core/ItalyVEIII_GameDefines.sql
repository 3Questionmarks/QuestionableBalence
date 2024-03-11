--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 		 	DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_JFD_ITALY_V_E_III', 	'BUILDING_JFD_ITALY_V_E_III', 	'TXT_KEY_BUILDING_JFD_ITALY_V_E_III');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						 			MilitaryProductionModifier,		BuildingClass, 						GreatWorkCount, Cost, FaithCost, Description, 								Help)
VALUES	('BUILDING_JFD_ITALY_V_E_III',			100,								'BUILDINGCLASS_JFD_ITALY_V_E_III', 	-1, 			-1,   -1, 		 'TXT_KEY_BUILDING_JFD_ITALY_V_E_III', 		'TXT_KEY_BUILDING_JFD_ITALY_V_E_III_HELP');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 											Description, 											Help, 														Sound, 				FriendlyLandsModifier,	CanMoveImpassable,	IgnoreTerrainCost,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_ALPINI', 						'TXT_KEY_PROMOTION_JFD_ALPINI',							'TXT_KEY_PROMOTION_JFD_ALPINI_HELP', 						'AS2D_IF_LEVELUP', 	0,						1,					1,					0,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ALPINI'),
		('PROMOTION_JFD_ANDREA_DORIA', 					'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA',					'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA_HELP', 					'AS2D_IF_LEVELUP', 	0,						0,					0,					1,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA'),
		('PROMOTION_JFD_ANDREA_DORIA_INFO', 			'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA_INFO',				'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA_INFO_HELP', 			'AS2D_IF_LEVELUP', 	0,						0,					0,					0,					1, 				57, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA'),
		('PROMOTION_JFD_ANDREA_DORIA_FRIENDLY_LANDS', 	'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA_FRIENDLY_LANDS',	'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA_FRIENDLY_LANDS_HELP', 	'AS2D_IF_LEVELUP', 	15,						0,					0,					0,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ANDREA_DORIA_FRIENDLY_LANDS');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						PrereqTech, Class, Combat, RangedCombat, Range, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 						Civilopedia, 							Help, 									Strategy,									ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_ALPINI',			PrereqTech, Class, Combat+5, RangedCombat, Range, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI,  'TXT_KEY_UNIT_JFD_ALPINI',			'TXT_KEY_CIV5_JFD_ALPINI_TEXT', 		'TXT_KEY_UNIT_JFD_ALPINI_HELP', 		'TXT_KEY_UNIT_JFD_ALPINI_STRATEGY', 		ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, 'ART_DEF_UNIT_JFD_ALPINI',			0,					'JFD_UNIT_FLAG_ALPINI_ATLAS',		MoveRate,	2, 				'JFD_ITALY_V_E_III_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_WAR_INFANTRY';	

INSERT INTO Units 	
		(Type, 						PrereqTech, Class, Combat, RangedCombat, Range, Cost,	 Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 						Civilopedia, 							Help, 									Strategy,									ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_ANDREA_DORIA',	PrereqTech, Class, Combat, RangedCombat+10, Range, Cost+20, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI,  'TXT_KEY_UNIT_JFD_ANDREA_DORIA', 	'TXT_KEY_CIV5_JFD_ANDREA_DORIA_TEXT', 	'TXT_KEY_UNIT_JFD_ANDREA_DORIA_HELP', 	'TXT_KEY_UNIT_JFD_ANDREA_DORIA_STRATEGY', 	ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, 'ART_DEF_UNIT_JFD_ANDREA_DORIA',	0,					'JFD_UNIT_FLAG_ANDREA_DORIA_ATLAS',	MoveRate,	3, 				'JFD_ITALY_V_E_III_ATLAS'
FROM Units WHERE Type = 'UNIT_BATTLESHIP';	
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_ALPINI', 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_ANDREA_DORIA', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_BATTLESHIP';
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_ALPINI', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';
	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_ANDREA_DORIA', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_BATTLESHIP';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_ALPINI', 			UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_ANDREA_DORIA', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_BATTLESHIP';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_JFD_ANDREA_DORIA',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_BATTLESHIP';

INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType,                ResourceType, Cost)
VALUES  ('UNIT_JFD_ALPINI',  'RESOURCE_IRON', 1);
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_ALPINI', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_ANDREA_DORIA', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_BATTLESHIP';
--------------------------------	
-- Unit_FreePromotions
--------------------------------		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_ALPINI', 			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_ALPINI', 		'PROMOTION_JFD_ALPINI');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_ANDREA_DORIA', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_BATTLESHIP';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_ANDREA_DORIA', 	'PROMOTION_JFD_ANDREA_DORIA'),
		('UNIT_JFD_ANDREA_DORIA', 	'PROMOTION_JFD_ANDREA_DORIA_FRIENDLY_LANDS');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 							ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_V_E_III', 		'TXT_KEY_LEADER_JFD_V_E_III', 	'TXT_KEY_LEADER_JFD_V_E_III_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_V_E_III', 	'Tarcisio_VEIII_Scene.xml',	4, 						2, 						3, 							4, 			6, 				4, 				4, 					 3, 			 5, 		8, 			5, 				5, 			2, 			'JFD_ITALY_V_E_III_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_V_E_III', 		'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_JFD_V_E_III', 		'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_JFD_V_E_III', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_JFD_V_E_III', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_V_E_III', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_V_E_III', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_V_E_III', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_V_E_III',		'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_V_E_III',		'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_V_E_III',		'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_V_E_III',		'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_JFD_V_E_III',		'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_V_E_III', 		'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_DEFENSE', 					8),
		('LEADER_JFD_V_E_III', 		'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_V_E_III', 		'FLAVOR_RECON', 					4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_RANGED', 					3),
		('LEADER_JFD_V_E_III', 		'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_NAVAL', 					7),
		('LEADER_JFD_V_E_III', 		'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_JFD_V_E_III', 		'FLAVOR_NAVAL_GROWTH', 				6),
		('LEADER_JFD_V_E_III', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_JFD_V_E_III', 		'FLAVOR_AIR', 						5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_GOLD', 						5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_CULTURE', 					8),
		('LEADER_JFD_V_E_III', 		'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_V_E_III', 		'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_WONDER', 					4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_RELIGION', 					5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_V_E_III', 		'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_NUKE', 						2),
		('LEADER_JFD_V_E_III', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_V_E_III', 		'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_V_E_III', 		'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_V_E_III', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_V_E_III', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_V_E_III', 		'TRAIT_JFD_ITALY_V_E_III');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_JFD_ITALY_V_E_III', 'TXT_KEY_TRAIT_JFD_ITALY_V_E_III', 	'TXT_KEY_TRAIT_JFD_ITALY_V_E_III_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description,							ShortDescription, 							 Adjective, 								 Civilopedia, 								CivilopediaTag, 					DerivativeCiv,						DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					 SoundtrackTag, 	MapImage, 							DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III', 	'TXT_KEY_CIV_JFD_ITALY_V_E_III_DESC',	'TXT_KEY_CIV_JFD_ITALY_V_E_III_SHORT_DESC',  'TXT_KEY_CIV_JFD_ITALY_V_E_III_ADJECTIVE',  'TXT_KEY_CIV5_JFD_ITALY_V_E_III_TEXT_1', 	'TXT_KEY_CIV5_JFD_ITALY_V_E_III', 	'TXT_KEY_JFD_TAL_ITALIAN_STATES',	'PLAYERCOLOR_JFD_ITALY_V_E_III',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_ITALY_V_E_III_ATLAS', 	0, 				'JFD_ITALY_V_E_III_ALPHA_ATLAS',	'Rome', 			'Tarcisio_MapItalyVEIII512.dds',	'TXT_KEY_CIV5_DAWN_ITALY_V_E_III_TEXT',		'Tarcisio_VEIII_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ROME';

UPDATE Civilizations
SET DerivativeCiv = 'TXT_KEY_JFD_TAL_ITALIAN_STATES'
WHERE Type = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_ROME'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_2'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_3'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_4'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_5'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_6'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_7'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_8'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_9'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_10'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_11'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_12'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_13'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_14'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_15'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_16'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_17'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_18'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_19'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_20'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_21'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_22'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_23'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_24'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_25'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_26'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_27'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_28'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_29'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_30'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_31'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_32'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_33'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_34'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_35'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_36'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_37'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_38'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_39'),
		('CIVILIZATION_JFD_ITALY_V_E_III',  'TXT_KEY_CITY_NAME_JFD_ITALY_V_E_III_40');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III', 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ROME';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ROME';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III', 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ROME';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III', 		'LEADER_JFD_V_E_III');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 						UnitType)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III',		'UNITCLASS_GREAT_WAR_INFANTRY',		'UNIT_JFD_ALPINI'),
		('CIVILIZATION_JFD_ITALY_V_E_III',		'UNITCLASS_BATTLESHIP',				'UNIT_JFD_ANDREA_DORIA');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III', 		'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_0'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_1'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_2'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_3'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_4'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_5'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_6'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_7'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_8'),
		('CIVILIZATION_JFD_ITALY_V_E_III', 		'TXT_KEY_SPY_NAME_JFD_ITALY_V_E_III_9');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------			
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III',		1);
--==========================================================================================================================
--==========================================================================================================================