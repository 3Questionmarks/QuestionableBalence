--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('CL_AFGHANISTAN_ATLAS', 					256, 		'CL_AfghanistanAtlas_256.dds',					5, 				1),
			('CL_AFGHANISTAN_ATLAS', 					128, 		'CL_AfghanistanAtlas_128.dds',					5, 				1),
			('CL_AFGHANISTAN_ATLAS', 					80, 		'CL_AfghanistanAtlas_80.dds',					5, 				1),
			('CL_AFGHANISTAN_ATLAS', 					64, 		'CL_AfghanistanAtlas_64.dds',					5, 				1),
			('CL_AFGHANISTAN_ATLAS', 					48, 		'CL_AfghanistanAtlas_48.dds',					5, 				1),
			('CL_AFGHANISTAN_ATLAS', 					45, 		'CL_AfghanistanAtlas_45.dds',					5, 				1),
			('CL_AFGHANISTAN_ATLAS', 					32, 		'CL_AfghanistanAtlas_32.dds',					5, 				1),
			('CL_AFGHANISTAN_ALPHA_ATLAS', 					256, 		'Afganistan_Alpha_256.dds',					8, 				8),
			('CL_AFGHANISTAN_ALPHA_ATLAS', 					128, 		'Afganistan_Alpha_128.dds',					8, 				8),
			('CL_AFGHANISTAN_ALPHA_ATLAS', 					80, 		'Afganistan_Alpha_80.dds',					8, 				8),
			('CL_AFGHANISTAN_ALPHA_ATLAS', 					64, 		'Afganistan_Alpha_64.dds',					8, 				8),
			('CL_AFGHANISTAN_ALPHA_ATLAS', 					48, 		'Afganistan_Alpha_48.dds',					8, 				8),
			('CL_AFGHANISTAN_ALPHA_ATLAS', 					45, 		'Afganistan_Alpha_45.dds',					8, 				8),
			('CL_AFGHANISTAN_ALPHA_ATLAS', 					32, 		'Afganistan_Alpha_32.dds',					8, 				8),
			('CL_BUILD_KALLE_ATLAS', 					45, 		'CL_Kalle_45.dds',								1, 				1),
			('CL_BUILD_KALLE_ATLAS', 					64, 		'CL_Kalle_64.dds',								1, 				1),
			('CL_UNIT_FLAG_ZAMBURAK_ATLAS', 			32, 		'ZamburakFlag.dds',								1, 				1);
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,		Asset)
VALUES		('ART_DEF_UNIT_CL_ZAMBURAK', 		'Unit', 		'sv_Zamburak.dds'),
			('ART_DEF_IMPROVEMENT_CL_KALLE', 	'Improvement', 	'sv_Kalle.dds');