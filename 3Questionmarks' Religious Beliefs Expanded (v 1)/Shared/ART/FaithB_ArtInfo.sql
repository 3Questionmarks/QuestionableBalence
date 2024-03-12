--==========================================================================================================================
-- ATLASES
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
(Atlas, 					IconSize,	Filename, 						IconsPerRow,	IconsPerColumn) VALUES		
('GAIA_FAITHBLDG_ATLAS', 	256, 		'GAIA_FaithBuildings_256.dds',	4, 				3),
('GAIA_FAITHBLDG_ATLAS', 	128, 		'GAIA_FaithBuildings_128.dds',	4, 				3),
('GAIA_FAITHBLDG_ATLAS', 	064, 		'GAIA_FaithBuildings_064.dds',	4, 				3),
('GAIA_FAITHBLDG_ATLAS', 	045, 		'GAIA_FaithBuildings_045.dds',	4, 				3);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'FaithB_ArtInfo';