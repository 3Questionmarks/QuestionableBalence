--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 							Description,					ShortDescription, 					Adjective, 						Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 							DawnOfManAudio,				DawnOfManImage)
SELECT		('CIVILIZATION_KHMER'), 		('TXT_KEY_KHMER_DESC'),			('TXT_KEY_KHMER_SHORT_DESC'), 		('TXT_KEY_KHMER_ADJ'),			('TXT_KEY_CIV5_KHMER_TEXT_1'), 			('TXT_KEY_CIV5_KHMER'), 		('PLAYERCOLOR_KHMER'), 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('KHMER_ATLAS'), 		0, 				('KHMER_ALPHA_ATLAS'), 			('Siam'), 		('KhmerMap512.dds'),	('TXT_KEY_CIV5_DOM_JAYAVARMAN_VII_TEXT'), 	('AS2D_DOM_SPEECH_KHMER'),	('Jayavarman_VII_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SIAM');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SIAM' )
	THEN '_SIAM'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_KHMER';
--------------------------------
-- Map Labels Support
--------------------------------
CREATE TABLE IF NOT EXISTS ML_CivCultures(CivType, CultureType, CultureEra);
INSERT INTO ML_CivCultures
			(CivType,					CultureType,				CultureEra)
VALUES		('CIVILIZATION_KHMER',		'MOD_TP_SOUTHEAST_ASIAN',	'ANY');
--------------------------------	
-- ExCE Support
--------------------------------
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);
	
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 					ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_KHMER', 				null,									'JFD_Tai_Khmer');
			
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    RevolutionaryCivilizationType               text    REFERENCES Civilizations(Type)      default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn   	 
			(CivilizationType,    		RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_KHMER'),		('CIVILIZATION_SIAM')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_KHMER') AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_SIAM');	
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_ANGKOR_THOM'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_YASODHARAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_HARIHARALAYA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_NAGARA_JAYASRI'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_RAJAVIHARA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_ISVARAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_BANTEAY_KDEI'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_JAYENDRANAGARI'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_PRE_RUP'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_VIMAYAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_LINGAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_KRONG_CHAKTOMUK'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_CHOK_GARGYAR'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_MAHENDRAPARVATA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_AMARENDRAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_INDRAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_LAVO'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_PREAH_VIHEAR'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_PHANOM_RUNG'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_MUANG_TAM'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_BENG_MELEA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_PRASAT_BAKAN'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_SINGHAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_CHALIENG'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_SUKHOTHAI'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_VIANGCHAN'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_BATTAMBANG'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_SURYAPARVATA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_PREY_NOKOR'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_ANINDITAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_ISANAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_SHRESTAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_ANGKOR_BOREI'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_VYADHAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_BHAVAPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_SAMBHUPURA'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_LOVEK'),
			('CIVILIZATION_KHMER', 	'TXT_KEY_CITY_NAME_KHMER_UDONG');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_KHMER'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_KHMER'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_KHMER'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_KHMER', 		'LEADER_JAYAVARMAN_VII');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_KHMER', 		'UNITCLASS_ENGINEER', 	'UNIT_KHMER_TROMEAK');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_KHMER', 		'BUILDINGCLASS_COLOSSEUM', 	'BUILDING_KHMER_PRASAT');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_KHMER', 		'RELIGION_BUDDHISM');
--------------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions 
SET ReligionType = ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MAHAYANA' )
		THEN 'RELIGION_MAHAYANA'
		ELSE 'RELIGION_BUDDHISM' END) 
WHERE CivilizationType = 'CIVILIZATION_KHMER';

CREATE TRIGGER ReligionKhmer
AFTER INSERT ON Religions WHEN 'RELIGION_MAHAYANA' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_MAHAYANA'
	WHERE CivilizationType = 'CIVILIZATION_KHMER';
END;
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_0'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_1'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_2'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_3'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_4'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_5'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_6'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_7'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_8'),
			('CIVILIZATION_KHMER', 		'TXT_KEY_SPY_NAME_KHMER_9');
--==========================================================================================================================		
--==========================================================================================================================