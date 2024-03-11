--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type,							LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_CHICKEE', 'Improvement',	'Chickee');
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.60,  'ART_DEF_IMPROVEMENT_CHICKEE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Seminole Hut HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.60,  'ART_DEF_IMPROVEMENT_CHICKEE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Seminole Hut B.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.60,  'ART_DEF_IMPROVEMENT_CHICKEE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Seminole Hut PL.fxsxml', 1;
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_IMPROVEMENT_CHICKEE', 	'Unit', 	'SeminoleSV.dds');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('UC_SEMINOLE_ATLAS', 				256, 		'SeminoleAtlas256.dds',			2, 				2),
			('UC_SEMINOLE_ATLAS', 				128, 		'SeminoleAtlas128.dds',			2, 				2),
			('UC_SEMINOLE_ATLAS', 				80, 		'SeminoleAtlas80.dds',			2, 				2),
			('UC_SEMINOLE_ATLAS', 				64, 		'SeminoleAtlas64.dds',			2, 				2),
			('UC_SEMINOLE_ATLAS', 				45, 		'SeminoleAtlas45.dds',			2, 				2),
			('UC_SEMINOLE_ATLAS', 				32, 		'SeminoleAtlas32.dds',			2, 				2),
			('UC_SEMINOLE_ALPHA_ATLAS', 		128, 		'SeminoleAlpha128.dds',	1,				1),
			('UC_SEMINOLE_ALPHA_ATLAS', 		80, 		'SeminoleAlpha80.dds',		1, 				1),
			('UC_SEMINOLE_ALPHA_ATLAS', 		64, 		'SeminoleAlpha64.dds',		1, 				1),
			('UC_SEMINOLE_ALPHA_ATLAS', 		48, 		'SeminoleAlpha48.dds',		1, 				1),
			('UC_SEMINOLE_ALPHA_ATLAS', 		45, 		'SeminoleAlpha45.dds',		1, 				1),
			('UC_SEMINOLE_ALPHA_ATLAS', 		32, 		'SeminoleAlpha32.dds',		1, 				1),
			('UC_SEMINOLE_ALPHA_ATLAS', 		24, 		'SeminoleAlpha24.dds',		1, 				1),
			('UC_SEMINOLE_ALPHA_ATLAS', 		16, 		'SeminoleAlpha16.dds',		1, 				1),
			('UC_SEMINOLE_CHICKEE_ATLAS', 		64, 		'SeminoleHutBuild64.dds',		1, 				1),
			('UC_SEMINOLE_CHICKEE_ATLAS', 		45, 		'SeminoleHutBuild45.dds',		1, 				1),
			('UC_UNIT_FLAG_HAMMOCK_ATLAS', 	32, 		'HammockFlag.dds',	1, 				1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_UC_MICANOPY_PEACE', 	'SeminolePeace',	'DynamicResident'),
			('SND_LEADER_MUSIC_UC_MICANOPY_WAR', 	'SeminoleWar', 	'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES		('AS2D_AMBIENCE_LEADER_UC_MICANOPY_AMBIENCE', 	'SND_AMBIENCE_FOG_OF_WAR_BED', 				'GAME_SFX', 	60, 		60, 		0, 			1),
			('AS2D_LEADER_MUSIC_UC_MICANOPY_PEACE', 			'SND_LEADER_MUSIC_UC_MICANOPY_PEACE', 		'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_UC_MICANOPY_WAR', 			'SND_LEADER_MUSIC_UC_MICANOPY_WAR', 			'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	
