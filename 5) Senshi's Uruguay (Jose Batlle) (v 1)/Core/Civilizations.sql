--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_URUGUAY'), 		('TXT_KEY_CIV_SENSHI_URUGUAY_DESC'), 		('TXT_KEY_CIV_SENSHI_URUGUAY_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_URUGUAY_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_URUGUAY_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_URUGUAY'), 		('PLAYERCOLOR_SENSHI_URUGUAY'), 		ArtDefineTag, ('ARTSTYLE_GRECO_ROMAN'),		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_URUGUAY_ATLAS'), 		0, 				('SENSHI_URUGUAY_ALPHA_ATLAS'), 	('BRAZIL'), 	('BatlleMap.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_BATLLE_TEXT'), 	('BatlleDOM.dds'),	('AS2D_DOM_SPEECH_SENSHI_BATLLE')
FROM Civilizations WHERE (Type = 'CIVILIZATION_BRAZIL');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_BRAZIL' )
	THEN '_BRAZIL'
	ELSE '_AMER' END) 
WHERE Type = 'CIVILIZATION_SENSHI_URUGUAY';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_01'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_02'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_03'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_04'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_05'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_06'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_07'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_08'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_09'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_10'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_11'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_12'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_13'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_14'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_15'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_16'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_17'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_18'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_19'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_20'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_21'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_22'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_23'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_24'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_25'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_26'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_27'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_28'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_29'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_30'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_31'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_32'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_33'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_34'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_CITY_NAME_SENSHI_URUGUAY_35');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_URUGUAY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_BRAZIL');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_URUGUAY'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_BRAZIL');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_URUGUAY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_BRAZIL');
--==========================================================================================================================	
-- Civilization_Start_Along_River
--==========================================================================================================================			
INSERT INTO Civilization_Start_Along_River 
			(CivilizationType, 					StartAlongRiver)
VALUES		('CIVILIZATION_SENSHI_URUGUAY', 	1);	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_URUGUAY', 	'LEADER_SENSHI_BATLLE');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 		UnitType)
VALUES		('CIVILIZATION_SENSHI_URUGUAY', 	'UNITCLASS_LANCER',	'UNIT_SENSHI_BLANDENGUE');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_SENSHI_URUGUAY', 	'BUILDINGCLASS_WORKSHOP',	'BUILDING_SENSHI_SALADERO');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_URUGUAY', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_BRAZIL');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_0'),	
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_1'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_2'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_3'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_4'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_5'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_6'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_7'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_8'),
			('CIVILIZATION_SENSHI_URUGUAY', 	'TXT_KEY_SPY_NAME_SENSHI_URUGUAY_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

