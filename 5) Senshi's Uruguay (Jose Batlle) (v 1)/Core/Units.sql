--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 										Class, Cost, Range, PrereqTech, Combat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_BLANDENGUE'),		Class, Cost, Range, PrereqTech, 33, 3, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_BLANDENGUE'),	('TXT_KEY_CIV5_UNIT_SENSHI_BLANDENGUE_TEXT'), 	('TXT_KEY_UNIT_SENSHI_BLANDENGUE_HELP'), 	('TXT_KEY_UNIT_SENSHI_BLANDENGUE_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_BLANDENGUE'),  0,					('SENSHI_BLANDENGUE_FLAG'),	3, 				('SENSHI_URUGUAY_ATLAS')
FROM Units WHERE (Type = 'UNIT_LANCER');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_BLANDENGUE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_BLANDENGUE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_BLANDENGUE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_BLANDENGUE', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 					ResourceType)
VALUES		('UNIT_SENSHI_BLANDENGUE', 	'RESOURCE_HORSE');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
VALUES		('UNIT_SENSHI_BLANDENGUE', 		'BUILD_FORT'),
			('UNIT_SENSHI_BLANDENGUE', 		'BUILD_PASTURE');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 								PromotionType)
VALUES		('UNIT_SENSHI_BLANDENGUE', 		'PROMOTION_AMPHIBIOUS'),
            ('UNIT_SENSHI_BLANDENGUE', 		'PROMOTION_SPAWN_GENERALS_I');

INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_BLANDENGUE',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
--==========================================================================================================================
