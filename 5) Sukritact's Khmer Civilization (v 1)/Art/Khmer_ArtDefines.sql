--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('KHMER_ATLAS', 						256, 		'KhmerAtlas_256.dds',					4, 				1),
			('KHMER_ATLAS', 						128, 		'KhmerAtlas_128.dds',					4, 				1),
			('KHMER_ATLAS', 						80, 		'KhmerAtlas_80.dds',					4, 				1),
			('KHMER_ATLAS', 						64, 		'KhmerAtlas_64.dds',					4, 				1),
			('KHMER_ATLAS', 						45, 		'KhmerAtlas_45.dds',					4, 				1),
			('KHMER_ATLAS', 						32, 		'KhmerAtlas_32.dds',					4, 				1),
			('KHMER_ALPHA_ATLAS', 					128, 		'KhmerAlphaAtlas_128.dds',				1, 				1),
			('KHMER_ALPHA_ATLAS', 					80, 		'KhmerAlphaAtlas_80.dds',				1, 				1),
			('KHMER_ALPHA_ATLAS', 					64, 		'KhmerAlphaAtlas_64.dds',				1, 				1),
			('KHMER_ALPHA_ATLAS', 					48, 		'KhmerAlphaAtlas_48.dds',				1, 				1),
			('KHMER_ALPHA_ATLAS', 					45, 		'KhmerAlphaAtlas_45.dds',				1, 				1),
			('KHMER_ALPHA_ATLAS', 					32, 		'KhmerAlphaAtlas_32.dds',				1, 				1),
			('KHMER_ALPHA_ATLAS', 					24, 		'KhmerAlphaAtlas_24.dds',				1, 				1),
			('KHMER_ALPHA_ATLAS', 					16, 		'KhmerAlphaAtlas_16.dds',				1, 				1),
			('KHMER_UNIT_ATLAS', 					32, 		'Unit_RoyalTromeak_Flag_32.dds',		1, 				1);

--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos (Type,							DamageStates,		Formation)
SELECT							'ART_DEF_UNIT_ROYAL_TROMEAK',	DamageStates,		('UnFormed')
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_SIAMESE_WARELEPHANT';
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfoMemberInfos
			(UnitInfoType,						UnitMemberInfoType,					NumMembers)
VALUES		('ART_DEF_UNIT_ROYAL_TROMEAK', 		'ART_DEF_UNIT_MEMBER_TROMEAK', 		"1");	
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType,					EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation)
SELECT									('ART_DEF_UNIT_MEMBER_TROMEAK'),	EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation
FROM ArtDefine_UnitMemberCombats		WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY';
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitMemberCombatWeapons 	('UnitMemberType',					'Index', 'SubIndex', 'ID', 'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
SELECT 											('ART_DEF_UNIT_MEMBER_TROMEAK'),	"Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
FROM ArtDefine_UnitMemberCombatWeapons	WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitMemberInfos 	(Type,								Scale,		ZOffset,		Domain,		Model,						MaterialTypeTag,	 MaterialTypeSoundOverrideTag)
SELECT									('ART_DEF_UNIT_MEMBER_TROMEAK'),	Scale,		ZOffset,		Domain,		('royal_tromeak.fxsxml'),			MaterialTypeTag,	 MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos			WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT';
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_ROYAL_TROMEAK',			'Unit',		'sv_RoyalTromeak.dds');
--==========================================================================================================================
--==========================================================================================================================