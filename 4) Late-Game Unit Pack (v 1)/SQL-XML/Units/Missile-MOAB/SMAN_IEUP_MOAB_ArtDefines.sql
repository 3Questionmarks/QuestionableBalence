-- =======================================================================================================
--		MOAB Art Defines
-- =======================================================================================================

-- Unit Art Defines
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation) VALUES ('ART_DEF_UNIT_SMAN_IEUP_MOAB', 1, "");
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) VALUES ('ART_DEF_UNIT_SMAN_IEUP_MOAB', 'ART_DEF_UNIT_MEMBER_SMAN_IEUP_MOAB', 1);
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES ('ART_DEF_UNIT_SMAN_IEUP_MOAB', 'Unit', 'SV_SMAN_IEUP_MOAB.dds');


-- Unit Member Art Defines

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_MOAB', 0.05, "Air", 'SMAN_IEUP_MOAB.fxsxml', "METAL", "METALLRG");


INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions,					AttackRadius,	MoveRate,	TurnRateMin,	TurnRateMax,	HasRefaceAfterCombat,	AttackAltitude)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_MOAB', "Idle Attack Bombard Death Run",			48.0,			1.5,		0.10,			0.25,			0,						80.0);


INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex,	VisKillStrengthMin,		VisKillStrengthMax, ProjectileSpeed,	WeaponTypeTag,	WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_MOAB',					0,		0,			50.0,					75.0,				1.25,				 "BULLETHC",	"BULLETHC");

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index",	SubIndex,	VisKillStrengthMin,		VisKillStrengthMax, ProjectileSpeed,	ProjectileChildEffectScale,	AreaDamageDelay,	WaitForEffectCompletion,	TargetGround,	IsDropped,	WeaponTypeTag,	WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_IEUP_MOAB',					1,		0,			100.0,					100.0,				1.25,				0.25,						0.25,				1,							1,				1,			"EXPLOSIVE",	"ATOMICBOMB");
