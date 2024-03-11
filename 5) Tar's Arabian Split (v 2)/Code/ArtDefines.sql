--DDS Defines
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('TAR_ARABIA_ATLAS', 					256, 		'Tar_Arabian_Icons_256.dds',		5,				2),
			('TAR_ARABIA_ATLAS', 					128, 		'Tar_Arabian_Icons_128.dds',		5, 				2),
			('TAR_ARABIA_ATLAS', 					80, 		'Tar_Arabian_Icons_80.dds',			5, 				2),
			('TAR_ARABIA_ATLAS', 					64, 		'Tar_Arabian_Icons_64.dds',			5, 				2),
			('TAR_ARABIA_ATLAS', 					45, 		'Tar_Arabian_Icons_45.dds',			5, 				2),
			('TAR_ARABIA_ATLAS', 					32, 		'Tar_Arabian_Icons_32.dds',			5, 				2),
			('TAR_ARABIA_ALPHA_ATLAS',				128, 		'Tar_Arabian_Alpha_128.dds',		5,				2),
			('TAR_ARABIA_ALPHA_ATLAS',				80, 		'Tar_Arabian_Alpha_80.dds',			5, 				2),
			('TAR_ARABIA_ALPHA_ATLAS',				64, 		'Tar_Arabian_Alpha_64.dds',			5, 				2),
			('TAR_ARABIA_ALPHA_ATLAS',				48, 		'Tar_Arabian_Alpha_48.dds',			5, 				2),
			('TAR_ARABIA_ALPHA_ATLAS',				32, 		'Tar_Arabian_Alpha_32.dds',			5, 				2),
			('TAR_ARABIA_ALPHA_ATLAS',				24, 		'Tar_Arabian_Alpha_24.dds',			5, 				2),
			('TAR_ARABIA_ALPHA_ATLAS',				16, 		'Tar_Arabian_Alpha_16.dds',			5, 				2),
			('TAR_UNIT_FLAG_PHYSICIAN_ATLAS',		32,			'Tar_Physician_Alpha_32.dds',		1, 				1),
			('TAR_UNIT_FLAG_YAMANI_ATLAS',			32,			'Tar_Yamani_Alpha_32.dds',			1, 				1),
			('TAR_UNIT_FLAG_ANSAR_ATLAS',			32,			'Tar_Ansar_Alpha_32.dds',			1, 				1);
--Models
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TAR_YAMANI', 1, 'Pikeman');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TAR_YAMANI', 'ART_DEF_UNIT_MEMBER_TAR_YAMANI', 12);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_YAMANI', 0.140000000596046, 'Pikeman_Arabia.fxsxml', 'ARMOR', 'ARMOR');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_YAMANI', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_YAMANI', 0, 0, 'METAL', 'SPEAR');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_YAMANI', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TAR_YAMANI', 'Unit', 'Tar_SV_Yamani.dds');

INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TAR_ANSAR', 1, 'EarlyGreatMerchant');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TAR_ANSAR', 'ART_DEF_UNIT_MEMBER_TAR_ANSAR_LEADER', 1);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TAR_ANSAR', 'ART_DEF_UNIT_MEMBER_TAR_ANSAR_CAMEL_V1', 1);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TAR_ANSAR', 'ART_DEF_UNIT_MEMBER_TAR_ANSAR_CAMEL_V2', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_ANSAR_LEADER', 0.119999997317791, 'Assets/Units/GreatPeople/Merchant/Early/GreatMerchant_Early_Leader.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_ANSAR_CAMEL_V1', 0.119999997317791, 'Assets/Units/GreatPeople/Merchant/Early/GreatMerchant_Early_Camel_V1.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_ANSAR_CAMEL_V2', 0.119999997317791, 'Assets/Units/GreatPeople/Merchant/Early/GreatMerchant_Early_Camel_V2.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_ANSAR_LEADER', 'Idle Death BombardDefend Run', 1);
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_ANSAR_CAMEL_V1', 'Idle Death BombardDefend Run', 1);
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TAR_ANSAR_CAMEL_V2', 'Idle Death BombardDefend Run', 1);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TAR_ANSAR', 'Unit', 'Tar_SV_Ansar.dds');

INSERT INTO ArtDefine_UnitInfos(Type, DamageStates)
  VALUES ('ART_DEF_UNIT_TAR_PHYSICIAN', 1);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TAR_PHYSICIAN', 'ART_DEF_UNIT_MEMBER_GREATTAR_PHYSICIAN', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_GREATTAR_PHYSICIAN', 0.119999997317791, 'Assets/Units/GreatPeople/Scientist/Early/GreatScientist_Early.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_GREATTAR_PHYSICIAN', 'Idle Death BombardDefend Run', 1);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TAR_PHYSICIAN', 'Unit', 'Tar_SV_Physician.dds');
