--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'FA_UB_ATLAS',					256,		5,				5,				'UBAtlas256.dds' UNION ALL
SELECT 'FA_UB_ATLAS',					128,		5,				5,				'UBAtlas128.dds' UNION ALL
SELECT 'FA_UB_ATLAS',					80,			5,				5,				'UBAtlas80.dds' UNION ALL
SELECT 'FA_UB_ATLAS',					64,			5,				5,				'UBAtlas64.dds' UNION ALL
SELECT 'FA_UB_ATLAS',					45,			5,				5,				'UBAtlas45.dds';

--------------------------------------------------------------------------------------------------
--Font Mapping
-------------------------------------------------------------------------------------------------- 
INSERT INTO IconFontTextures (IconFontTexture,	IconFontTextureFile)
SELECT 'ICON_FONT_TEXTURE_UB',					'UB-FontIcons';