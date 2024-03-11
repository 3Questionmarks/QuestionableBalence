--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Type,						Class, 	PrereqTech, Combat, Cost,		Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 	UnitArtInfo,						UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex,  IconAtlas, 					MoveRate)
SELECT		('UNIT_MC_CALUSACANOE'), 	Class,	PrereqTech, Combat-2, Cost-15,	Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_MC_CALUSACANOE'), 	('TXT_KEY_CIV5_MC_CALUSACANOE_TEXT'), 	('TXT_KEY_UNIT_MC_CALUSACANOE_STRATEGY'), 	('TXT_KEY_UNIT_HELP_MC_CALUSACANOE'), 	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 	'ART_DEF_UNIT_MC_NOKA_CANOE',		0,					('MC_CALUSA_FLAG'),		2,				('MC_CALUSA_ATLAS'), MoveRate
FROM Units WHERE Type = 'UNIT_TRIREME';                                                     
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_CALUSACANOE'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_TRIREME');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_MC_CALUSACANOE'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_TRIREME');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_MC_CALUSACANOE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_TRIREME');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		('UNIT_MC_CALUSACANOE'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_TRIREME');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
VALUES		('UNIT_MC_CALUSACANOE',		'PROMOTION_MC_CALUSACANOE'),
			('UNIT_MC_CALUSACANOE',		'PROMOTION_HEAVY_CHARGE');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_MC_CALUSACANOE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_TRIREME';
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 					ResourceType)
VALUES		('UNIT_MC_CALUSACANOE', 	'RESOURCE_HARDWOOD');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 									Description, 						Help, 											Sound, 				CannotBeChosen, LostWithUpgrade,	PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_MC_CALUSACANOE', 			'TXT_KEY_PROMOTION_MC_CALUSACANOE',	'TXT_KEY_PROMOTION_MC_CALUSACANOE_HELP', 		'AS2D_IF_LEVELUP', 	1, 				1, 					59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_MC_CALUSACANOE');
--==========================================================================================================================	
--==========================================================================================================================	