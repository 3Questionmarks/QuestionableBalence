--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 								Description, 							ShortDescription, 							Adjective, 									Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType,			ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_CL_AFGHANISTAN'), 	('TXT_KEY_CIV_CL_AFGHANISTAN_DESC'), 	('TXT_KEY_CIV_CL_AFGHANISTAN_SHORT_DESC'), ('TXT_KEY_CIV_CL_AFGHANISTAN_ADJECTIVE'), 	('TXT_KEY_CIV5_CL_AFGHANISTAN_TEXT_1'), 	('TXT_KEY_CIV5_CL_AFGHANISTAN'), 	('PLAYERCOLOR_CL_AFGHANISTAN'), 	ArtDefineTag, ArtStyleType,			ArtStyleSuffix,	ArtStylePrefix,	('CL_AFGHANISTAN_ATLAS'), 	0, 				('CL_AFGHANISTAN_ALPHA_ATLAS'), 	('Persia'), 	('AfghanistanMap512.dds'), 	('TXT_KEY_CIV5_DOM_CL_MIRWAIS_HOTAK_TEXT'), 	('MirwaisHotak_DoM.dds'),	('AS2D_DOM_SPEECH_CL_MIRWAIS_HOTAK')
FROM Civilizations WHERE (Type = 'CIVILIZATION_PERSIA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_PERSIA' )
	THEN '_PERSIA'
	ELSE '_MIDDLE_EAST' END) 
WHERE Type = 'CIVILIZATION_CL_AFGHANISTAN';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_01'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_02'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_03'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_04'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_05'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_06'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_07'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_08'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_09'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_10'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_11'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_12'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_13'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_14'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_15'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_16'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_17'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_18'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_19'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_20'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_21'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_22'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_23'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_24'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_25'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_26'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_27'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_28'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_CITY_NAME_CL_AFGHANISTAN_29');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_CL_AFGHANISTAN'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_PERSIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_CL_AFGHANISTAN'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_PERSIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_CL_AFGHANISTAN'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_PERSIA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_CL_AFGHANISTAN', 	'LEADER_CL_MIRWAIS_HOTAK');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			 UnitType)
VALUES		('CIVILIZATION_CL_AFGHANISTAN', 	'UNITCLASS_GATLINGGUN',	'UNIT_CL_AFGHANISTAN_ZAMBURAK');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_CL_AFGHANISTAN', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_PERSIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_0'),	
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_1'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_2'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_3'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_4'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_5'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_6'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_7'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_8'),
			('CIVILIZATION_CL_AFGHANISTAN', 	'TXT_KEY_SPY_NAME_CL_AFGHANISTAN_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

