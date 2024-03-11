-- =======================================================================================================
--		Predator Drone Art Defines
-- =======================================================================================================

-- Unit Art Defines
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation) VALUES ('ART_DEF_UNIT_SMAN_IEUP_PREDATOR_DRONE', 1, "FighterWing");
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_SMAN_IEUP_PREDATOR_DRONE', 'ART_DEF_UNIT_MEMBER_SMAN_IEUP_PREDATOR_DRONE', 1);
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES ('ART_DEF_UNIT_SMAN_IEUP_PREDATOR_DRONE', 'Unit', 'SV_HelicopterGunship.dds');

-- Unit Member Art Defines

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PREDATOR_DRONE', 0.09, "Air", 'SMAN_IEUP_Predator.fxsxml', "METAL", "METALLRG");


INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PREDATOR_DRONE', "Idle Attack Bombard Death Run", 135.0, 2.0, 0.25, 0.5, 0);


INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PREDATOR_DRONE', 0, 0, 3.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PREDATOR_DRONE', 1, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_PREDATOR_DRONE', 1, 1, 'PROJECTILE', 25.0, 50.0, 3.0, 'EXPLOSIVE', 'EXPLOSION200POUND');

