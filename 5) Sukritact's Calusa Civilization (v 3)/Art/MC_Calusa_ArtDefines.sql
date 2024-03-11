--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_MC_NOKA_CANOE', 	'Unit', 	'sv_MC_Noka_Canoe.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_MC_NOKA_CANOE'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	(Type = 'ART_DEF_UNIT_CANNON');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_MC_NOKA_CANOE'), 	('ART_DEF_UNIT_MEMBER_MC_NOKA_CANOE'),	3
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GALLEASS');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_MC_NOKA_CANOE'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_NOKA_CANOE'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,		ZOffset, Domain, Model,  						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_NOKA_CANOE'),	Scale,		ZOffset, Domain, ('MC_Noka_Canoe.fxsxml'),  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('MC_CALUSA_FLAG', 				32, 		'Flags_MC_Noka_Canoe.dds',				1, 				1),
			('MC_CALUSA_ATLAS', 			256, 		'MC_CalusaAtlas_256.dds',				4, 				1),
			('MC_CALUSA_ATLAS', 			128, 		'MC_CalusaAtlas_128.dds',				4, 				1),
			('MC_CALUSA_ATLAS', 			80, 		'MC_CalusaAtlas_80.dds',				4, 				1),
			('MC_CALUSA_ATLAS', 			64, 		'MC_CalusaAtlas_64.dds',				4, 				1),
			('MC_CALUSA_ATLAS', 			45, 		'MC_CalusaAtlas_45.dds',				4, 				1),
			('MC_CALUSA_ATLAS', 			32, 		'MC_CalusaAtlas_32.dds',				4, 				1),
			('MC_CALUSA_ALPHA_ATLAS', 		128, 		'MC_CalusaAlpha_128.dds',				1, 				1),
			('MC_CALUSA_ALPHA_ATLAS', 		80, 		'MC_CalusaAlpha_80.dds',				1, 				1),
			('MC_CALUSA_ALPHA_ATLAS', 		64, 		'MC_CalusaAlpha_64.dds',				1, 				1),
			('MC_CALUSA_ALPHA_ATLAS', 		48, 		'MC_CalusaAlpha_48.dds',				1, 				1),
			('MC_CALUSA_ALPHA_ATLAS', 		45, 		'MC_CalusaAlpha_45.dds',				1, 				1),
			('MC_CALUSA_ALPHA_ATLAS', 		32, 		'MC_CalusaAlpha_32.dds',				1, 				1),
			('MC_CALUSA_ALPHA_ATLAS', 		24, 		'MC_CalusaAlpha_24.dds',				1, 				1),
			('MC_CALUSA_ALPHA_ATLAS', 		16, 		'MC_CalusaAlpha_16.dds',				1, 				1);
--==========================================================================================================================
--==========================================================================================================================
