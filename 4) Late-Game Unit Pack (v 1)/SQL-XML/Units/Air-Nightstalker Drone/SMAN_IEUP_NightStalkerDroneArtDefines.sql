-- =======================================================================================================
--		Predator Drone Art Defines
-- =======================================================================================================

-- Unit Art Defines
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation) VALUES ('ART_DEF_UNIT_SMAN_IEUP_NIGHTSTALKER_DRONE', 1, "ThreeBigGuns");
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_SMAN_IEUP_NIGHTSTALKER_DRONE', 'ART_DEF_UNIT_MEMBER_SMAN_IEUP_NIGHTSTALKER_DRONE', 3);
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES ('ART_DEF_UNIT_SMAN_IEUP_NIGHTSTALKER_DRONE', 'Unit', 'SV_HelicopterGunship.dds');

-- Unit Member Art Defines

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_NIGHTSTALKER_DRONE', 0.04, "Hover", 'SMAN_IEUP_Nightstalker.fxsxml', "METAL", "METALLRG");


INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, HasShortRangedAttack, HasRefaceAfterCombat)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_NIGHTSTALKER_DRONE', "Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady", 1, 1);



INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_NIGHTSTALKER_DRONE', 0, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', "BULLETHC", "BULLETHC");

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_NIGHTSTALKER_DRONE', 0, 1, 'PROJECTILE', 10.0, 15.0, 4.0, 'EXPLOSIVE', 'EXPLOSION200POUND');
