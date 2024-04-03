--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_CARTHAGE_DIDO_ATLAS', 			256, 		'JFD_CarthageDidoAtlas_256.dds',			2, 				2),
		('JFD_CARTHAGE_DIDO_ATLAS', 			128, 		'JFD_CarthageDidoAtlas_128.dds',			2, 				2),
		('JFD_CARTHAGE_DIDO_ATLAS', 			80, 		'JFD_CarthageDidoAtlas_80.dds',				2, 				2),
		('JFD_CARTHAGE_DIDO_ATLAS', 			64, 		'JFD_CarthageDidoAtlas_64.dds',				2, 				2),
		('JFD_CARTHAGE_DIDO_ATLAS', 			45, 		'JFD_CarthageDidoAtlas_45.dds',				2, 				2),
		('JFD_CARTHAGE_DIDO_ATLAS', 			32, 		'JFD_CarthageDidoAtlas_32.dds',				2,				2),
		('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		128, 		'JFD_CarthageDidoAlphaAtlas_128.dds',		1, 				1),
		('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		80, 		'JFD_CarthageDidoAlphaAtlas_80.dds',		1, 				1),
		('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		64, 		'JFD_CarthageDidoAlphaAtlas_64.dds',		1, 				1),
		('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		48, 		'JFD_CarthageDidoAlphaAtlas_48.dds',		1, 				1),
		('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		45, 		'JFD_CarthageDidoAlphaAtlas_45.dds',		1, 				1),
		('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		32, 		'JFD_CarthageDidoAlphaAtlas_32.dds',		1, 				1),
		('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		24, 		'JFD_CarthageDidoAlphaAtlas_24.dds',		1, 				1),
		('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		16, 		'JFD_CarthageDidoAlphaAtlas_16.dds',		1, 				1);
------------------------------
-- IconFontMapping 
------------------------------
INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,							IconMapping)
VALUES	('ICON_RES_JFD_SHELLFISH', 				'ICON_FONT_TEXTURE_JFD_SHELLFISH',			1);
------------------------------
-- Font Icons
------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_SHELLFISH', 	'JFD_ShellFishFontIcons_22');
---==========================================================================================================================
-- RESOURCE GRAPHICS
--==========================================================================================================================	
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
		(Type,								LandmarkType,	FriendlyName) 
VALUES	('ART_DEF_RESOURCE_JFD_SHELLFISH',	'Resource',		'Shellfish');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks 
		(Era,			State,		Scale,					ImprovementType,						LayoutHandler,	ResourceType,						Model,								TerrainContour, Tech)
VALUES	('Ancient',		'Any',		0.07000000029802322,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RESOURCE_JFD_SHELLFISH',	'shellfish.fxsxml',					1,				null),
		('Industrial',	'Any',		0.07000000029802322,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RESOURCE_JFD_SHELLFISH',	'shellfish_industrial.fxsxml',		1,				null),
		('Ancient',		'Any',		0.07000000029802322,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RESOURCE_JFD_SHELLFISH',	'shellfish.fxsxml',					1,				null),
		('Industrial',	'Any',		0.07000000029802322,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RESOURCE_JFD_SHELLFISH',	'shellfish_industrial.fxsxml',		1,				null);
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,					TileType,	Asset) 
VALUES	('ART_DEF_RESOURCE_JFD_SHELLFISH',	'Resource',	'sv_ShellFish.dds');
--==========================================================================================================================	
--==========================================================================================================================	
