--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_ETHIOPIA")
		THEN "_ETHIOPIA"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_BENIN_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_BENIN_MOD',	      'AFRICAN',		 'ANY');

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
            (LeaderType,									 FlavorType,    Flavor)
VALUES      ('LEADER_EWUARE_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         4);

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
SELECT  ('CIVILIZATION_BENIN_MOD'), LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_SONGHAI';

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,          HeadOfGovernmentName)
SELECT  ('CIVILIZATION_BENIN_MOD'), HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_SONGHAI';

INSERT INTO Civilization_JFD_Titles
        (CivilizationType,                                                    DefaultTitle,                               UniqueTitle)
VALUES  ('CIVILIZATION_BENIN_MOD',      'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',     'TXT_KEY_GOVERNMENT_JFD_BENIN_PRINCE'),
		('CIVILIZATION_BENIN_MOD',          'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',       'TXT_KEY_GOVERNMENT_JFD_BENIN_KING'),
		('CIVILIZATION_BENIN_MOD',            'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER',    'TXT_KEY_GOVERNMENT_JFD_BENIN_EMPEROR'),
		('CIVILIZATION_BENIN_MOD',          'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',       'TXT_KEY_GOVERNMENT_JFD_MISC_EARLY'),
		('CIVILIZATION_BENIN_MOD',     'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE',        'TXT_KEY_GOVERNMENT_JFD_MISC_LATE');

INSERT INTO Civilization_JFD_Politics
        (CivilizationType,                   PoliticsType,                          UniqueName)
VALUES  ('CIVILIZATION_BENIN_MOD',     'PARTY_JFD_CLERGY',    'TXT_KEY_JFD_PARTY_BENIN_CLERGY'),
		('CIVILIZATION_BENIN_MOD',   'PARTY_JFD_NOBILITY',  'TXT_KEY_JFD_PARTY_BENIN_NOBILITY');

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
        (LeaderType,							            FlavorType,                         Flavor)
VALUES  ('LEADER_EWUARE_MOD',			'FLAVOR_JFD_REFORM_GOVERNMENT',                              7),
        ('LEADER_EWUARE_MOD',			   'FLAVOR_JFD_REFORM_CULTURE',                              5),
        ('LEADER_EWUARE_MOD',             'FLAVOR_JFD_REFORM_ECONOMIC',                              2),
        ('LEADER_EWUARE_MOD',              'FLAVOR_JFD_REFORM_FOREIGN',                              8),
        ('LEADER_EWUARE_MOD',             'FLAVOR_JFD_REFORM_INDUSTRY',                              5),
        ('LEADER_EWUARE_MOD',             'FLAVOR_JFD_REFORM_RELIGION',                              5);

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
SELECT	('CIVILIZATION_BENIN_MOD'),	('JFD_WestAfrican'), ('JFD_WestAfrican'), ('JFD_WestAfrican'), ('JFD_WestAfrican'), ('AS2D_SOUND_JFD_MALINESE')
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SONGHAI';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_WestAfrican'
WHERE Type = 'CIVILIZATION_BENIN_MOD'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_WestAfrican')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
			(LeaderType,									                  TraitOne,					   TraitTwo)
SELECT		('LEADER_EWUARE_MOD'),		                       ('POLICY_PROTECTIVE_X'),	  ('POLICY_IMPERIALISTIC_X')
WHERE EXISTS (SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Ewuare[ICON_STRENGTH][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_BENIN_MOD_EWUARE_DESC' END) 
WHERE Type = 'LEADER_EWUARE_MOD';

CREATE TRIGGER CivIVTraitsTomatekhBenin
AFTER INSERT ON Leaders WHEN 'LEADER_EWUARE_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Ewuare[ICON_STRENGTH][ICON_CITY_STATE]'
		ELSE 'TXT_KEY_BENIN_MOD_EWUARE_DESC' END) 
	WHERE Type = 'LEADER_EWUARE_MOD';
END;	

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,						   LinguisticType)
VALUES		('CIVILIZATION_BENIN_MOD', 			null,									'JFD_Songhay'),
			('CIVILIZATION_BENIN_MOD', 			null,									  'JFD_Bantu');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_BENIN_MOD',				  'CIVILIZATION_ZULU');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					   RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_BENIN_MOD'),					 ('CIVILIZATION_JFD_NRI')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NRI');

--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');

INSERT INTO Leader_Flavors
        (LeaderType,									 FlavorType,                 Flavor)
VALUES  ('LEADER_EWUARE_MOD',                'FLAVOR_JFD_MERCENARY',                      7);

--Cultural Development
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
			(Description,								                            CivilizationType,						             CultureType)
VALUES		('TXT_KEY_EVENT_CULDEV_TOMATEKH_BENIN_01',			            'CIVILIZATION_BENIN_MOD',					           'JFD_WestAfrican');





