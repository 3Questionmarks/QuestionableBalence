--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 										IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_ITALY_V_E_III_ATLAS', 					256, 		'JFD_ItalyVE3Atlas_256.dds',				2, 				2),
		('JFD_ITALY_V_E_III_ATLAS', 					128, 		'JFD_ItalyVE3Atlas_128.dds',				2, 				2),
		('JFD_ITALY_V_E_III_ATLAS', 					80, 		'JFD_ItalyVE3Atlas_80.dds',					2, 				2),
		('JFD_ITALY_V_E_III_ATLAS', 					64, 		'JFD_ItalyVE3Atlas_64.dds',					2, 				2),
		('JFD_ITALY_V_E_III_ATLAS', 					45, 		'JFD_ItalyVE3Atlas_45.dds',					2, 				2),
		('JFD_ITALY_V_E_III_ATLAS', 					32, 		'JFD_ItalyVE3Atlas_32.dds',					2, 				2),
		('JFD_ITALY_V_E_III_ALPHA_ATLAS', 				128, 		'JFD_ItalyVE3AlphaAtlas_128.dds',			1,				1),
		('JFD_ITALY_V_E_III_ALPHA_ATLAS', 				80, 		'JFD_ItalyVE3AlphaAtlas_80.dds',			1, 				1),
		('JFD_ITALY_V_E_III_ALPHA_ATLAS', 				64, 		'JFD_ItalyVE3AlphaAtlas_64.dds',			1, 				1),
		('JFD_ITALY_V_E_III_ALPHA_ATLAS', 				48, 		'JFD_ItalyVE3AlphaAtlas_48.dds',			1, 				1),
		('JFD_ITALY_V_E_III_ALPHA_ATLAS', 				45, 		'JFD_ItalyVE3AlphaAtlas_45.dds',			1, 				1),
		('JFD_ITALY_V_E_III_ALPHA_ATLAS', 				32, 		'JFD_ItalyVE3AlphaAtlas_32.dds',			1, 				1),
		('JFD_ITALY_V_E_III_ALPHA_ATLAS', 				24, 		'JFD_ItalyVE3AlphaAtlas_24.dds',			1, 				1),
		('JFD_ITALY_V_E_III_ALPHA_ATLAS', 				16, 		'JFD_ItalyVE3AlphaAtlas_16.dds',			1, 				1),
		('JFD_UNIT_FLAG_ALPINI_ATLAS',					32, 		'JFD_AlpiniUnitFlag_32.dds',				1, 				1),
		('JFD_UNIT_FLAG_ANDREA_DORIA_ATLAS',			32, 		'JFD_AndreaDoriaUnitFlag_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_ITALY_V_E_III_ICON', 		0.807,	0.807,	0.807,	1),
		('COLOR_PLAYER_JFD_ITALY_V_E_III_BACKGROUND',	0.164,	0.345,	0,		1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 											PrimaryColor, 								SecondaryColor, 								 TextColor)
VALUES	('PLAYERCOLOR_JFD_ITALY_V_E_III',				'COLOR_PLAYER_JFD_ITALY_V_E_III_ICON', 		'COLOR_PLAYER_JFD_ITALY_V_E_III_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 								LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_V_E_III_PEACE', 			'VEIII_Peace',							'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_V_E_III_WAR', 			'VEIII_War', 							'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 								SoundType, 		DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_V_E_III_PEACE',			'SND_LEADER_MUSIC_JFD_V_E_III_PEACE', 	'GAME_MUSIC', 	0,						0,					-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_V_E_III_WAR', 			'SND_LEADER_MUSIC_JFD_V_E_III_WAR', 	'GAME_MUSIC', 	0,						0,					-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_ALPINI',				'Unit', 		'sv_Alpini.dds'),
		('ART_DEF_UNIT_JFD_ANDREA_DORIA',		'Unit', 		'sv_AndreaDoria.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_ALPINI',				DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_WW1_INFANTRY';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_ANDREA_DORIA',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_BATTLESHIP';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_ALPINI', 				'ART_DEF_UNIT_MEMBER_JFD_ALPINI',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_WW1_INFANTRY';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_ANDREA_DORIA', 		'ART_DEF_UNIT_MEMBER_JFD_ANDREA_DORIA',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_BATTLESHIP';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ALPINI',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ANDREA_DORIA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ALPINI',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ANDREA_DORIA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ALPINI',		Scale,	ZOffset, Domain, 'alpini.fxsxml',					MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_ANDREA_DORIA',	Scale,	ZOffset, Domain, 'Conte_Di_Cavour_Class.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';
--==========================================================================================================================	
--==========================================================================================================================	
