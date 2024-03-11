--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_BABYLON")
		THEN "_BABYLON"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_AKKADIAN_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						    CultureType,	CultureEra)
VALUES		('CIVILIZATION_AKKADIAN_MOD',	      'ARABIAN',		 'ANY');

--JFD
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                                        text                                        default null,
    Value                                       integer                                     default 1);

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									             FlavorType,    Flavor)
VALUES      ('LEADER_AKKADIAN_MOD_GILGAMESH',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         7);

UPDATE Buildings SET PrereqTech = 
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_ASSYRIA' )
		THEN 'TECH_CALENDAR'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Technologies WHERE Type = 'TECH_JFD_PRIESTHOOD' )
		THEN 'TECH_JFD_PRIESTHOOD'
		ELSE 'TECH_CALENDAR' END ) END
	) WHERE Type = 'BUILDING_AKKADIAN_MOD_ZIGGURAT';

CREATE TRIGGER SumerPriesthoodZigs
AFTER INSERT ON Technologies WHEN 'TECH_JFD_PRIESTHOOD' = NEW.Type
BEGIN
	UPDATE Buildings SET PrereqTech = 
		( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_ASSYRIA' )
			THEN 'TECH_CALENDAR'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Technologies WHERE Type = 'TECH_JFD_PRIESTHOOD' )
			THEN 'TECH_JFD_PRIESTHOOD'
			ELSE 'TECH_CALENDAR' END ) END
		) WHERE Type = 'BUILDING_AKKADIAN_MOD_ZIGGURAT';
END;

--Prestige
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);

CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);

INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT  ('CIVILIZATION_AKKADIAN_MOD'), LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_BABYLON';

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,          HeadOfGovernmentName)
SELECT  ('CIVILIZATION_AKKADIAN_MOD'), HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_BABYLON';

INSERT INTO Civilization_JFD_Titles
        (CivilizationType,          DefaultTitle,   UniqueTitle)
SELECT  ('CIVILIZATION_AKKADIAN_MOD'), DefaultTitle,   UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_BABYLON';

INSERT INTO Civilization_JFD_Politics
        (CivilizationType,          PoliticsType, UniqueName)
SELECT  ('CIVILIZATION_AKKADIAN_MOD'), PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_BABYLON';

INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');

INSERT INTO Leader_Flavors
        (LeaderType,							                 FlavorType,                         Flavor)
VALUES  ('LEADER_AKKADIAN_MOD_GILGAMESH',    'FLAVOR_JFD_REFORM_GOVERNMENT',                              8),
        ('LEADER_AKKADIAN_MOD_GILGAMESH',       'FLAVOR_JFD_REFORM_CULTURE',                              5),
        ('LEADER_AKKADIAN_MOD_GILGAMESH',      'FLAVOR_JFD_REFORM_ECONOMIC',                              5),
        ('LEADER_AKKADIAN_MOD_GILGAMESH',       'FLAVOR_JFD_REFORM_FOREIGN',                              5),
        ('LEADER_AKKADIAN_MOD_GILGAMESH',      'FLAVOR_JFD_REFORM_INDUSTRY',                              8),
        ('LEADER_AKKADIAN_MOD_GILGAMESH',      'FLAVOR_JFD_REFORM_RELIGION',                              8);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	('CIVILIZATION_AKKADIAN_MOD'),	ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, ('AS2D_SOUND_JFD_SUMERIAN')
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_BABYLON';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mesopotamic'
WHERE Type = 'CIVILIZATION_AKKADIAN_MOD'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesopotamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
			(LeaderType,									          TraitOne,					 TraitTwo)
SELECT		('LEADER_AKKADIAN_MOD_GILGAMESH'),		    ('POLICY_INVENTIVE_X'),	    ('POLICY_EXPANSIVE_X')
WHERE EXISTS (SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Eannatum[ICON_RESEARCH][ICON_FOOD]'
	ELSE 'TXT_KEY_AKKADIAN_MOD_GILGAMESH_DESC' END) 
WHERE Type = 'LEADER_AKKADIAN_MOD_GILGAMESH';

CREATE TRIGGER CivIVTraitsTomatekhSumer
AFTER INSERT ON Leaders WHEN 'LEADER_AKKADIAN_MOD_GILGAMESH' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Eannatum[ICON_RESEARCH][ICON_FOOD]'
		ELSE 'TXT_KEY_AKKADIAN_MOD_GILGAMESH_DESC' END) 
	WHERE Type = 'LEADER_AKKADIAN_MOD_GILGAMESH';
END;

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_AKKADIAN_MOD', 			null,									'JFD_Mesopotamian');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_AKKADIAN_MOD',		'CIVILIZATION_BABYLON'),
			('CIVILIZATION_AKKADIAN_MOD',		'CIVILIZATION_ASSYRIA');

--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');

INSERT INTO Leader_Flavors
        (LeaderType,									 FlavorType,                 Flavor)
VALUES  ('LEADER_AKKADIAN_MOD_GILGAMESH',    'FLAVOR_JFD_MERCENARY',                      8);

--Cultural Developments
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
			(Description,								                      CivilizationType,						                CultureType)
VALUES		('TXT_KEY_EVENT_CULDEV_TOMATEKH_SUMER_01',			   'CIVILIZATION_AKKADIAN_MOD',					              'JFD_Mesopotamic');