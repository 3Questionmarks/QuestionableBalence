--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 											IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('DMS_IRELAND_OCONNELL_ATLAS', 						256, 		'DMS_IrelandAtlas_256.dds',			2, 				2),
		('DMS_IRELAND_OCONNELL_ATLAS', 						128, 		'DMS_IrelandAtlas_128.dds',			2, 				2),
		('DMS_IRELAND_OCONNELL_ATLAS', 						80, 		'DMS_IrelandAtlas_80.dds',			2, 				2),
		('DMS_IRELAND_OCONNELL_ATLAS', 						64, 		'DMS_IrelandAtlas_64.dds',			2, 				2),
		('DMS_IRELAND_OCONNELL_ATLAS', 						45, 		'DMS_IrelandAtlas_45.dds',			2, 				2),
		('DMS_IRELAND_OCONNELL_ATLAS', 						32, 		'DMS_IrelandAtlas_32.dds',			2, 				2),
		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS', 				128, 		'DMS_IrelandAlphaAtlas_128.dds',	1,				1),
		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS', 				80, 		'DMS_IrelandAlphaAtlas_80.dds',		1, 				1),
		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS', 				64, 		'DMS_IrelandAlphaAtlas_64.dds',		1, 				1),
		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS', 				48, 		'DMS_IrelandAlphaAtlas_48.dds',		1, 				1),
		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS', 				45, 		'DMS_IrelandAlphaAtlas_45.dds',		1, 				1),
		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS', 				32, 		'DMS_IrelandAlphaAtlas_32.dds',		1, 				1),
		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS', 				24, 		'DMS_IrelandAlphaAtlas_24.dds',		1, 				1),
		('DMS_IRELAND_OCONNELL_ALPHA_ATLAS', 				16, 		'DMS_IrelandAlphaAtlas_16.dds',		1, 				1),
		('DMS_DEVILS_OWN_FLAG_ART_ATLAS', 					32, 		'UnitFlag_Devils_Own_32.dds',		1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 													Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_DMS_IRELAND_OCONNELL_ICON',				0.878,	0.678,	0.278,	1),
		('COLOR_PLAYER_DMS_IRELAND_OCONNELL_BACKGROUND',		0.078,	0.314,	0.502,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_DMS_IRELAND_OCONNELL',		'COLOR_PLAYER_DMS_IRELAND_OCONNELL_ICON', 	'COLOR_PLAYER_DMS_IRELAND_OCONNELL_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_DMS_DANIEL_O_CONNELL_PEACE', 	'DanielOConnell_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_DMS_DANIEL_O_CONNELL_WAR', 		'DanielOConnell_War', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 											SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_DMS_DANIEL_O_CONNELL_PEACE',	'SND_LEADER_MUSIC_DMS_DANIEL_O_CONNELL_PEACE',		'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_DMS_DANIEL_O_CONNELL_WAR', 		'SND_LEADER_MUSIC_DMS_DANIEL_O_CONNELL_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_DMS_DEVILS_OWN',	'Unit', 	'sv_u_devils_own.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_DMS_DEVILS_OWN'),DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_DMS_DEVILS_OWN')	('ART_DEF_UNIT_MEMBER_DMS_DEVILS_OWN'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_DEVILS_OWN'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_DEVILS_OWN'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_DEVILS_OWN'),	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================	
--==========================================================================================================================	
