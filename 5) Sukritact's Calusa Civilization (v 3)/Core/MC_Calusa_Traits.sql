--==========================================================================================================================
-- Traits
--==========================================================================================================================		
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_MC_CALUSA', 	'TXT_KEY_TRAIT_MC_CALUSA', 	'TXT_KEY_TRAIT_MC_CALUSA_SHORT');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 												Description) 
VALUES		('POLICY_MC_CALUSA_UA',	 	    	'TXT_KEY_TRAIT_MC_CALUSA_SHORT');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
			(Type, 								Description, 								Help, 									CannotBeChosen, 		Sound, 				PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_MC_CALUSA_UA', 			'TXT_KEY_TRAIT_MC_CALUSA_SHORT', 			'TXT_KEY_PROMOTION_MC_CALUSA_UA_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_TRAIT_MC_CALUSA_SHORT');
--==========================================================================================================================
-- UnitPromotions_Features
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions_Features		
			(PromotionType, 			FeatureType, 		DoubleMove, Attack, Defense)
VALUES		('PROMOTION_MC_CALUSA_UA', 	'FEATURE_MARSH', 	1, 			0, 		15);
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================
-- INSERT INTO UnitPromotions_UnitCombats
-- 			(PromotionType, 							UnitCombatType)
-- VALUES		('PROMOTION_MC_CALUSA_UA', 					'UNITCOMBAT_RECON'),
-- 			('PROMOTION_MC_CALUSA_UA', 					'UNITCOMBAT_ARCHER'),
-- 			('PROMOTION_MC_CALUSA_UA', 					'UNITCOMBAT_MOUNTED'),
-- 			('PROMOTION_MC_CALUSA_UA', 					'UNITCOMBAT_MELEE'),
-- 			('PROMOTION_MC_CALUSA_UA', 					'UNITCOMBAT_SIEGE'),
-- 			('PROMOTION_MC_CALUSA_UA', 					'UNITCOMBAT_GUN'),
-- 			('PROMOTION_MC_CALUSA_UA', 					'UNITCOMBAT_ARMOR');
--==========================================================================================================================
-- Trait_FreePromotionUnitCombats
--==========================================================================================================================	
INSERT INTO Trait_FreePromotionUnitCombats 
			(TraitType, 			PromotionType,	UnitCombatType)
SELECT		('TRAIT_MC_CALUSA'), 	PromotionType,	UnitCombatType
FROM UnitPromotions_UnitCombats WHERE (PromotionType = 'PROMOTION_MC_CALUSA_UA');
--==========================================================================================================================	
--==========================================================================================================================				

