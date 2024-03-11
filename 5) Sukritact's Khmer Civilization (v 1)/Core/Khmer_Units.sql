--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 					PrereqTech, CivilianAttackPriority, Class, Cost, NoMaintenance, Moves, FaithCost, RequiresFaithPurchaseEnabled, Special, CombatLimit, Domain, 	DefaultUnitAI, 	Description, 					Civilopedia, 							Help, 									Strategy,								   AdvancedStartCost, WorkRate, BaseHurry, HurryMultiplier, Pillage, IgnoreBuildingDefense, UnitArtInfo,								UnitFlagIconOffset,	UnitFlagAtlas,		MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_KHMER_TROMEAK'),	PrereqTech, CivilianAttackPriority, Class, Cost, 1, 			6    , FaithCost, RequiresFaithPurchaseEnabled, Special, CombatLimit, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_KHMER_TROMEAK'), 	('TXT_KEY_CIV5_KHMER_TROMEAK_TEXT'), 	('TXT_KEY_UNIT_KHMER_TROMEAK_HELP'), 	('TXT_KEY_UNIT_KHMER_TROMEAK_STRATEGY'),   AdvancedStartCost, WorkRate, BaseHurry, HurryMultiplier, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_ROYAL_TROMEAK'),  			0,					'KHMER_UNIT_ATLAS',	MoveRate,	2, 				('KHMER_ATLAS')
FROM Units WHERE (Type = 'UNIT_ENGINEER');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_KHMER_TROMEAK'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SIAMESE_WARELEPHANT');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_KHMER_TROMEAK'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ENGINEER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_KHMER_TROMEAK'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ENGINEER');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
SELECT		('UNIT_KHMER_TROMEAK'),			BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_ENGINEER');
--==========================================================================================================================
--==========================================================================================================================