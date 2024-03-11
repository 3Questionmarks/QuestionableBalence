-- Give all recon units PROMOTION_XP_FOR_SCOUTING
INSERT INTO Unit_FreePromotions(UnitType, PromotionType)
  SELECT Type, 'PROMOTION_XP_FOR_SCOUTING' FROM Units WHERE CombatClass='UNITCOMBAT_RECON';
	
-- Update any additional recon units to have PROMOTION_XP_FOR_SCOUTING as well
CREATE TRIGGER FreeXpForScouting
AFTER INSERT ON Units
WHEN 'UNITCOMBAT_RECON'=NEW.CombatClass
BEGIN
  INSERT INTO Unit_FreePromotions(UnitType, PromotionType)
    VALUES(NEW.Type, 'PROMOTION_XP_FOR_SCOUTING');
END;
