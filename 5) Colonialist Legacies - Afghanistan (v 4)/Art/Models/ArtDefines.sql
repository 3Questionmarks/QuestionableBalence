
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 								LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_CL_KALLE',	'Improvement', 	'CL_KALLE');

--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 						Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,			TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_CL_KALLE',		'Any', 	'UnderConstruction', 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Kalle_build.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_CL_KALLE',		'Any', 	'Constructed',		 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Kalle.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_CL_KALLE',		'Any', 	'Pillaged',			 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Kalle_PL.fxsxml', 1);

--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,		Formation)
VALUES		('ART_DEF_UNIT_CL_ZAMBURAK',		1, 				'DefaultCavalry');

--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
VALUES		('ART_DEF_UNIT_CL_ZAMBURAK',	'ART_DEF_UNIT_MEMBER_CL_ZAMBURAK',		5);

--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,				Model, 									MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES		('ART_DEF_UNIT_MEMBER_CL_ZAMBURAK',		0.119999997317791,	'u_afghanistan_camel_gunner.fxsxml',	'CLOTH',		 'FLESH');

--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_CL_MEMBER_ZAMBURAK'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index",	SubIndex,	WeaponTypeTag,	WeaponTypeSoundOverrideTag)
VALUES		('ART_DEF_UNIT_CL_MEMBER_ZAMBURAK',		0,			0,			'BULLET',		'BULLET');

INSERT INTO ArtDefine_UnitMemberCombatWeapons
			(ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, HitEffect, HitRadius, ContinuousFire, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES		('ART_DEF_UNIT_CL_MEMBER_ZAMBURAK', 0, 0, 'ART_DEF_VEFFECT_ANTIAIR_IMPACT_$(TERRAIN)', 32.0, 1, 'BULLETHC', 'BULLETHC');