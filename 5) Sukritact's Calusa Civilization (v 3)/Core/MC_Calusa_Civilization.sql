--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 						CivilopediaTag, 					DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				AlphaIconAtlas, 			PortraitIndex,		SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManAudio,						DawnOfManImage)
SELECT		('CIVILIZATION_MC_CALUSA'), 	('TXT_KEY_CIV_MC_CALUSA_DESC'), 	('TXT_KEY_CIV_MC_CALUSA_SHORT_DESC'), 		('TXT_KEY_CIV_MC_CALUSA_ADJECTIVE'), 	('TXT_KEY_CIV_MC_CALUSA_DESC'),	('TXT_KEY_CIV5_MC_CALUSA'), 		('PLAYERCOLOR_MC_CALUSA'),		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('MC_CALUSA_ATLAS'),  ('MC_CALUSA_ALPHA_ATLAS'),	0, 						('Iroquois'), 		('MC_CalusaMap512.dds'), 	('TXT_KEY_CIV5_DOM_MC_CAALUS_TEXT'), 	('AS2D_DOM_SPEECH_MC_CALUSA'), 	('MC_CalusaDoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_IROQUOIS');
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_1'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_2'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_3'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_4'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_5'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_6'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_7'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_8'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_9'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_10'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_11'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_12'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_13'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_14'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_15'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_16'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_17'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_18'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_19'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_20'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_21'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_22'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_23'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_24'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_25'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_26'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_27'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_28'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_29'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_30'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_31'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_32'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_33'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_34'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_CALUSA_35');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_MC_CALUSA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_IROQUOIS');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_MC_CALUSA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_IROQUOIS');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_MC_CALUSA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_IROQUOIS');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_MC_CALUSA', 		'LEADER_MC_CAALUS');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_MC_CALUSA', 		'UNITCLASS_TRIREME', 		'UNIT_MC_CALUSACANOE');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_MC_CALUSA', 		'BUILDINGCLASS_GRANARY', 		'BUILDING_MC_TIDALTRAP');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_MC_CALUSA',		'RELIGION_CHRISTIANITY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_0'),	
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_1'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_2'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_3'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_4'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_5'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_6'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_7'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_8'),
			('CIVILIZATION_MC_CALUSA', 	'TXT_KEY_SPY_NAME_MC_CALUSA_9');
--==========================================================================================================================
-- Civilization_Start_Along_River
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_River 
			(CivilizationType, 				StartAlongRiver)
VALUES		('CIVILIZATION_MC_CALUSA', 		1);
--==========================================================================================================================
--==========================================================================================================================