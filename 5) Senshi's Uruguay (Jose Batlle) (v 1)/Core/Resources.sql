--==========================================================================================================================
-- Resources
--==========================================================================================================================
INSERT INTO Resources 
			(Type,							Description,						Civilopedia, 										ArtDefineTag,						ResourceClassType, 		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	IconString, 				PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_SENSHI_CHARQUE',		'TXT_KEY_RESOURCE_SENSHI_CHARQUE',	'TXT_KEY_CIV5_RESOURCE_SENSHI_CHARQUE_TEXT',		'ART_DEF_RESOURCE_SENSHI_CHARQUE',	'RESOURCECLASS_LUXURY',	4,			10,					0, 				0, 				'[ICON_RES_SENSHI_CHARQUE]',	2, 				'SENSHI_URUGUAY_ATLAS');
--==========================================================================================================================
-- Resource_YieldChanges
--==========================================================================================================================
INSERT INTO Resource_YieldChanges 	
			(ResourceType, 						YieldType, 			Yield)
VALUES		('RESOURCE_SENSHI_CHARQUE',			'YIELD_FOOD',		1),
			('RESOURCE_SENSHI_CHARQUE',			'YIELD_GOLD',		1);
--==========================================================================================================================
-- Resource_Flavors
--==========================================================================================================================
INSERT INTO Resource_Flavors 	
			(ResourceType, 					FlavorType, 				Flavor)
VALUES		('RESOURCE_SENSHI_CHARQUE', 	'FLAVOR_HAPPINESS', 		10),
			('RESOURCE_SENSHI_CHARQUE', 	'FLAVOR_GROWTH', 			10);
--==========================================================================================================================
-- Improvement_ResourceTypes
--==========================================================================================================================
INSERT INTO Improvement_ResourceTypes
			(ResourceType, 					ImprovementType)
VALUES		('RESOURCE_SENSHI_CHARQUE',		'IMPROVEMENT_PASTURE');
--==========================================================================================================================
-- Improvement_ResourceType_Yields
--==========================================================================================================================
INSERT INTO Improvement_ResourceType_Yields
			(ResourceType, 					ImprovementType,				YieldType,			Yield)
VALUES		('RESOURCE_SENSHI_CHARQUE',		'IMPROVEMENT_PASTURE',			'YIELD_PRODUCTION',		1);
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================	
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,	ResourceType, 					YieldType, Yield)
SELECT	BuildingType,	('RESOURCE_SENSHI_CHARQUE'),	YieldType, Yield
FROM Building_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_COW';
--==========================================================================================================================	
-- Belief_ResourceYieldChanges
--==========================================================================================================================	
INSERT INTO Belief_ResourceYieldChanges
			(BeliefType,	ResourceType, 					YieldType, Yield)
SELECT		BeliefType,		('RESOURCE_SENSHI_CHARQUE'),	YieldType, Yield
FROM Belief_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_COW';
	--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_LandmarkTypes 
			(Type,								LandmarkType,	FriendlyName) 
VALUES		('ART_DEF_RESOURCE_SENSHI_CHARQUE',		'Resource',		'Charque');
--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_Landmarks 
			(Era, State, Scale, ImprovementType, LayoutHandler,	ResourceType, 						Model, TerrainContour, Tech)
SELECT 		Era, State, Scale, ImprovementType, LayoutHandler,	('ART_DEF_RESOURCE_SENSHI_CHARQUE'), 	Model, TerrainContour, Tech
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_COW';
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType,						TileType,	Asset) 
VALUES		('ART_DEF_RESOURCE_SENSHI_CHARQUE',		'Resource',	'sv_Charque.dds');
--==========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT INTO IconFontTextures 
			(IconFontTexture, 							IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_SENSHI_CHARQUE',		'CharqueResource');
--==========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT INTO IconFontMapping 
			(IconName, 					IconFontTexture,					IconMapping)
VALUES		('ICON_RES_SENSHI_CHARQUE',		'ICON_FONT_TEXTURE_SENSHI_CHARQUE',		1);