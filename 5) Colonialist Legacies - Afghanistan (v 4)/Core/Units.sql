--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 												Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_CL_AFGHANISTAN_ZAMBURAK'),		Class, 200, Range, PrereqTech, Combat, RangedCombat, 5, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_CL_AFGHANISTAN_ZAMBURAK'),	('TXT_KEY_UNIT_CIV5_CL_AFGHANISTAN_ZAMBURAK_CIVILOPEDIA'), 	('TXT_KEY_UNIT_CL_AFGHANISTAN_ZAMBURAK_HELP'), 	('TXT_KEY_UNIT_CL_AFGHANISTAN_ZAMBURAK_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_CL_ZAMBURAK'),  0,					('CL_UNIT_FLAG_ZAMBURAK_ATLAS'),	3, 				('CL_AFGHANISTAN_ATLAS')
FROM Units WHERE (Type = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_CL_AFGHANISTAN_ZAMBURAK'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_CL_AFGHANISTAN_ZAMBURAK'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_CL_AFGHANISTAN_ZAMBURAK'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_CL_AFGHANISTAN_ZAMBURAK', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 							ResourceType)
VALUES		('UNIT_CL_AFGHANISTAN_ZAMBURAK', 	'RESOURCE_HORSE');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 								PromotionType)
VALUES		('UNIT_CL_AFGHANISTAN_ZAMBURAK', 		'PROMOTION_CAN_MOVE_AFTER_ATTACKING');

INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_CL_AFGHANISTAN_ZAMBURAK',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================
--==========================================================================================================================
