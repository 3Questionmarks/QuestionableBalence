--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name, Value);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('PROMOTIONS_CROSS_MOUNTAINS', 1);
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,					TraitTwo)
SELECT  'LEADER_JFD_V_E_III',		'POLICY_PROTECTIVE_X',		'POLICY_SEAFARING_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Victor Emmaneul III [ICON_STRENGTH][ICON_MOVES]'
WHERE Type = 'LEADER_JFD_V_E_III'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------	
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
------------------------------
-- UnitPromotions
------------------------------	
UPDATE UnitPromotions 
SET CanCrossMountains = 1, Help = 'TXT_KEY_PROMOTION_JFD_ALPINI_HELP_CP'
WHERE Type = 'PROMOTION_JFD_ALPINI'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE' AND Value = 1);
------------------------------
-- Units
------------------------------	
UPDATE Units 
SET Help = 'TXT_KEY_UNIT_JFD_ALPINI_HELP_CP', Strategy = 'TXT_KEY_UNIT_JFD_ALPINI_STRATEGY_CP'
WHERE Type = 'UNIT_JFD_ALPINI'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_ROME'
WHERE Type = 'CIVILIZATION_JFD_ITALY_V_E_III'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ROME');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EarthStandardStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EarthStandardStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EarthStandardStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_EarthStandardStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_ApennineStartPosition (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_ApennineStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_ApennineStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_MediterraneanStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_NorthAtlanticStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeNewStartPosition (Europe (Greatest) Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeNewStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_EuroLargeNewStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustStartPosition (Africa, Asia & Australia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_AfriAsiaAustStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroStartPosition (Africa & Southern Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(Type,								X,		Y)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	X,		Y
FROM Civilizations_AfriSouthEuroStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_ApennineRequestedResource (Apennine)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ApennineRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_ApennineRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large (new))
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeNewRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeNewRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustRequestedResource (Africa, Asia & Australia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriAsiaAustRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfriAsiaAustRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroRequestedResource (Africa & Southern Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriSouthEuroRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfriSouthEuroRequestedResource WHERE Type = 'CIVILIZATION_ROME';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,							CultureType,	CultureEra)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_VENICE';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 										text 											default null,
	Value 										integer 										default 1);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_JFD_ANDREA_DORIA_INFO');
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_VENICE';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Southern'
WHERE Type = 'CIVILIZATION_JFD_ITALY_V_E_III'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Southern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
--====================================
-- JFD COLONIES
--====================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 					ColonyName,										LinguisticType)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III',	null,											'JFD_Latinate'),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_COLONY_NAME_JFD_ITALY_V_E_III_1',		null),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_COLONY_NAME_JFD_ITALY_V_E_III_2',		null),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_COLONY_NAME_JFD_ITALY_V_E_III_3',		null),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_COLONY_NAME_JFD_ITALY_V_E_III_4',		null),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_COLONY_NAME_JFD_ITALY_V_E_III_5',		null),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_COLONY_NAME_JFD_ITALY_V_E_III_6',		null),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_COLONY_NAME_JFD_ITALY_V_E_III_7',		null);
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,					DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_VENICE';
--====================================	
-- JFD SLAVERY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,				Flavor)
VALUES	('LEADER_JFD_V_E_III',	'FLAVOR_JFD_SLAVERY',	0);
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD AND POUAKAI MERCENARIES
--====================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_JFD_V_E_III',		'FLAVOR_JFD_MERCENARY',		3);
--====================================	
-- JFD PIETY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,								Flavor)
VALUES	('LEADER_JFD_V_E_III',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5);
--====================================
-- JFD PROSPERITY
--====================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,					CurrencyType)
SELECT	'CIVILIZATION_JFD_ITALY_V_E_III',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_VENICE';
--====================================
-- JFD SOVEREIGNTY
--====================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					LegislatureName, 											OfficeTitle,														GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_ITALY_V_E_III',	'GOVERNMENT_JFD_MONARCHY',	70);
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      			HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_1'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_2'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_3'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_4'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_5'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_6'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_7'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_8'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_9'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_10'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_11'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_12'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_13'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_14'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_15'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_16'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_17'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_18'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_19'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_20'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_21'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_22'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_23'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_24'),
        ('CIVILIZATION_JFD_ITALY_V_E_III',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_ITALY_V_E_III_25');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType,				UniqueName)
VALUES	('CIVILIZATION_JFD_ITALY_V_E_III',	'PARTY_JFD_LIBERTARIAN',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_ITALY_V_E_III'),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'PARTY_JFD_NOBILITY',		'TXT_KEY_JFD_PARTY_JFD_NOBILITY_ITALY_V_E_III'),
		('CIVILIZATION_JFD_ITALY_V_E_III',	'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_ITALY_V_E_III');
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							 Flavor)
VALUES	('LEADER_JFD_V_E_III',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 6),
		('LEADER_JFD_V_E_III',	'FLAVOR_JFD_REFORM_CULTURE',		 4),
		('LEADER_JFD_V_E_III',	'FLAVOR_JFD_REFORM_ECONOMIC',		 5),
		('LEADER_JFD_V_E_III',	'FLAVOR_JFD_REFORM_FOREIGN',		 8),
		('LEADER_JFD_V_E_III',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_V_E_III',	'FLAVOR_JFD_REFORM_LEGAL',			 5),
		('LEADER_JFD_V_E_III',	'FLAVOR_JFD_REFORM_MILITARY',		 8),
		('LEADER_JFD_V_E_III',	'FLAVOR_JFD_REFORM_RELIGION',		 8);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) SELECT ('JFD_ItalyVEIII_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,												DomesticGreatGeneralRateModifier,	PlotCultureExponentModifier, Description)
VALUES	('POLICY_DECISIONS_JFD_CONSTITUTIONAL_FREEDOMS',	0,									20,							 'TXT_KEY_DECISIONS_JFD_ITALY_V_E_III_FREEDOMS'),
		('POLICY_DECISIONS_JFD_REFORM_FRONTLINE',			20,									0,							 'TXT_KEY_DECISIONS_JFD_ITALY_V_E_III_FRONTLINE');
--==========================================================================================================================
--==========================================================================================================================