

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
        (LeaderType,            TraitOne,               TraitTwo)
SELECT  'LEADER_TAR_UMAR',		'POLICY_AGGRESSIVE_X',	 'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

INSERT INTO Leader_SharedTraits
        (LeaderType,           		 	TraitOne,               TraitTwo)
SELECT  'LEADER_TAR_ABD_AL_MALIK',		'POLICY_FINANCIAL_X',	 'POLICY_CHARISMATIC_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Umar [ICON_WAR][ICON_PEACE]'
WHERE Type = 'LEADER_TAR_UMAR'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders 
SET Description = 'Abd al-Malik [ICON_TRADE][ICON_HAPPINESS_1]'
WHERE Type = 'LEADER_TAR_ABD_AL_MALIK'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_ARABIA'
WHERE Type = 'CIVILIZATION_TAR_RASHIDUN'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ARABIA');

UPDATE Civilizations 
SET ArtStyleSuffix = '_ARABIA'
WHERE Type = 'CIVILIZATION_TAR_UMAYYAD'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ARABIA');

UPDATE Civilizations 
SET ArtStyleSuffix = '_ARABIA'
WHERE Type = 'CIVILIZATION_TAR_ABBASID'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ARABIA');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_RASHIDUN',	37,	43);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_RASHIDUN',	75,	44);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_RASHIDUN',	48,	17);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_RASHIDUN',	64,	34);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_UMAYYAD',	37,	52);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_UMAYYAD',	72,	49);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_UMAYYAD',	47,	21);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_UMAYYAD',	63,	39);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_UMAYYAD',	139, 12);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_ABBASID',	43,	51);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_ABBASID',	76,	49);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_ABBASID',	50,	21);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_ABBASID',	66,	39);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_TAR_ABBASID',	161, 17);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_ABBASID',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_ABBASID',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_ABBASID',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TAR_ABBASID',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_ARABIA';

CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_ARABIA';

CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType,	CultureEra)
SELECT	'CIVILIZATION_TAR_ABBASID',	CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
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
		(CivilizationType,				LinguisticType)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,				LinguisticType)
SELECT	'CIVILIZATION_TAR_UMAYYAD',		LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,				LinguisticType)
SELECT	'CIVILIZATION_TAR_ABBASID',		LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,						Flavor)
VALUES	('LEADER_TAR_UMAR',				'FLAVOR_JFD_DECOLONIZATION',	4),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_DECOLONIZATION',	1);
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
		(LeaderType,					FlavorType,				Flavor)
VALUES	('LEADER_TAR_UMAR',				'FLAVOR_JFD_SLAVERY',	10),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_SLAVERY',	10);
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
		(CivilizationType,				ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_TAR_ABBASID',	ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Islamic'
WHERE Type = 'CIVILIZATION_TAR_RASHIDUN'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Islamic'
WHERE Type = 'CIVILIZATION_TAR_UMAYYAD'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Islamic'
WHERE Type = 'CIVILIZATION_TAR_ABBASID'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
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
		(LeaderType,					FlavorType,								Flavor)
VALUES	('LEADER_TAR_UMAR',				'FLAVOR_JFD_MERCENARY',					0),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_MERCENARY',					8);
--====================================	
-- JFD PIETY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,								Flavor)
VALUES	('LEADER_TAR_UMAR',				'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_TAR_UMAR',				'FLAVOR_JFD_STATE_RELIGION',			10),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_STATE_RELIGION',			6);
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
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_TAR_ABBASID',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_ARABIA';
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
		(CivilizationType,				LegislatureName, OfficeTitle,	GovernmentType,	Weight)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	LegislatureName, OfficeTitle,	GovernmentType,	Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,			LegislatureName, OfficeTitle,	GovernmentType,	Weight)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	LegislatureName, OfficeTitle,	GovernmentType,	Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,			LegislatureName, OfficeTitle,	GovernmentType,	Weight)
SELECT	'CIVILIZATION_TAR_ABBASID',	LegislatureName, OfficeTitle,	GovernmentType,	Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
		(CivilizationType,				HeadOfGovernmentName)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_HeadsOfGovernment
		(CivilizationType,			HeadOfGovernmentName)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_HeadsOfGovernment
		(CivilizationType,			HeadOfGovernmentName)
SELECT	'CIVILIZATION_TAR_ABBASID',	HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	CultureType							text 		 											default null,
	ReligionType						text 		REFERENCES Religions(Type) 					default null,
	DefaultTitle						text 		 											default null,
	UniqueTitle							text 		 											default null,
	UseAdjective						boolean													default 0);	
	
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,				DefaultTitle, UniqueTitle, UseAdjective, ReligionType)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	DefaultTitle, UniqueTitle, UseAdjective, ReligionType
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,			DefaultTitle, UniqueTitle, UseAdjective, ReligionType)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	DefaultTitle, UniqueTitle, UseAdjective, ReligionType
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,			DefaultTitle, UniqueTitle, UseAdjective, ReligionType)
SELECT	'CIVILIZATION_TAR_ABBASID',	DefaultTitle, UniqueTitle, UseAdjective, ReligionType
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	PoliticsType  						text 													default null,
	UniqueName							text													default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				UniqueName, PoliticsType)
SELECT	'CIVILIZATION_TAR_RASHIDUN',	UniqueName, PoliticsType
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,			UniqueName, PoliticsType)
SELECT	'CIVILIZATION_TAR_UMAYYAD',	UniqueName, PoliticsType
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_ARABIA';

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,			UniqueName, PoliticsType)
SELECT	'CIVILIZATION_TAR_ABBASID',	UniqueName, PoliticsType
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,							Flavor)
VALUES	('LEADER_TAR_UMAR',				'FLAVOR_JFD_REFORM_GOVERNMENT',		8),
		('LEADER_TAR_UMAR',				'FLAVOR_JFD_REFORM_LEGAL',			9),
		('LEADER_TAR_UMAR',				'FLAVOR_JFD_REFORM_CULTURE',		4),
		('LEADER_TAR_UMAR',				'FLAVOR_JFD_REFORM_ECONOMIC',		6),
		('LEADER_TAR_UMAR',				'FLAVOR_JFD_REFORM_FOREIGN',		4),
		('LEADER_TAR_UMAR',				'FLAVOR_JFD_REFORM_INDUSTRY',		4),
		('LEADER_TAR_UMAR',				'FLAVOR_JFD_REFORM_MILITARY',		8),
		('LEADER_TAR_UMAR',				'FLAVOR_JFD_REFORM_RELIGION',		9),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_REFORM_GOVERNMENT',		4),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_REFORM_LEGAL',			6),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_REFORM_CULTURE',		7),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_REFORM_ECONOMIC',		8),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_REFORM_FOREIGN',		5),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_REFORM_INDUSTRY',		7),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_REFORM_MILITARY',		4),
		('LEADER_TAR_ABD_AL_MALIK',		'FLAVOR_JFD_REFORM_RELIGION',		4);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Tar_Arabian_Decisions.lua');

INSERT INTO Policies 
			(Type, 							Description,										BuildingPurchaseCostModifier,	UnitPurchaseCostModifier) 
VALUES		('POLICY_TAR_QAYS',	 			'TXT_KEY_DECISIONS_TAR_UMAYYAD_QAYS',				0,								0),
			('POLICY_TAR_HOUSE_OF_WEALTH',	'TXT_KEY_DECISIONS_TAR_RASHIDUN_HOUSE_OF_WEALTH',	-33,							-33),
			('POLICY_TAR_MOSQUE',			'TXT_KEY_DECISIONS_TAR_RASHIDUN_MOSQUE',			0,								0);

			
--==========================================================================================================================
--==========================================================================================================================
UPDATE Units
SET Class = 'UNITCLASS_JFD_GREAT_DOCTOR', BaseBeakersTurnsToCount = 0, DontShowYields = 1, GPExtra = 3, Help = 'TXT_KEY_UNIT_HELP_TAR_PHYSICIAN_CID'
WHERE Type = 'UNIT_TAR_PHYSICIAN'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_TAR_PHYSICIAN',	Type
FROM UnitPromotions WHERE Type IN ('PROMOTION_MEDIC')
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

INSERT INTO Unit_Missions 	
		(UnitType, 				MissionType,				RequiresCity)
SELECT	'UNIT_TAR_PHYSICIAN', 	'MISSION_JFD_CURE_PLAGUE',	1
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

INSERT INTO Unit_Missions 	
		(UnitType, 				MissionType,				RequiresCity)
SELECT	'UNIT_TAR_PHYSICIAN', 	'MISSION_JFD_POPULATION',	1
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_TAR_PHYSICIAN'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_JFD_GREAT_DOCTOR'
WHERE CivilizationType = 'CIVILIZATION_TAR_ABBASID' AND UnitType = 'UNIT_TAR_PHYSICIAN'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');
--==========================================================================================================================
UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_HOSPITAL', SpecialistType = 'SPECIALIST_JFD_DOCTOR', SpecialistCount = 2, Help = 'TXT_KEY_BUILDING_TAR_BIMARISTAN_CID_HELP', GoldMaintenance = 0
WHERE Type = 'BUILDING_TAR_BIMARISTAN'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');

DELETE FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_TAR_BIMARISTAN'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');
INSERT INTO Building_JFD_HealthMods 
		(BuildingType, 						DiseasePopMod)
SELECT	'BUILDING_TAR_BIMARISTAN', 			-33
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TAR_BIMARISTAN'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_TAR_BIMARISTAN', 			'BUILDINGCLASS_JFD_APOTHECARY'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');

DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_TAR_BIMARISTAN'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');

INSERT INTO Building_YieldChanges 
		(BuildingType, 				YieldType,			Yield)
SELECT	'BUILDING_TAR_BIMARISTAN', 	'YIELD_JFD_HEALTH', 5
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType,		 Flavor)
SELECT	'BUILDING_TAR_BIMARISTAN', 	'FLAVOR_GROWTH', 35
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');

UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_HOSPITAL'
WHERE CivilizationType = 'CIVILIZATION_TAR_ABBASID' AND BuildingType = 'BUILDING_TAR_BIMARISTAN'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY');

INSERT INTO Building_YieldChanges 
		(BuildingType, 				YieldType,			Yield)
SELECT	'BUILDING_TAR_BIMARISTAN', 	'YIELD_JFD_CRIME',	4
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY')
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_JAIL');

DELETE FROM Building_JFD_CrimeMods WHERE BuildingType = 'BUILDING_TAR_BIMARISTAN'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY')
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_JAIL');

INSERT INTO Building_JFD_CrimeMods 
		(BuildingType, 				CrimeType,			CrimeMod)
SELECT	'BUILDING_TAR_BIMARISTAN', 	'CRIME_JFD_HEALTH',	-15
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_APOTHECARY')
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_JFD_JAIL');
