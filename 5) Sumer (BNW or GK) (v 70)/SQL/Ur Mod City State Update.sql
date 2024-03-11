--
CREATE TABLE IF NOT EXISTS 
MinorCivilization_JFD_CultureTypes(
	MinorCivilizationType 						text 	REFERENCES MinorCivilizations(Type) 	default null,
	CultureType 								text											default null);

CREATE TABLE IF NOT EXISTS 
JFD_CultureTypes(
	ID  									integer 							   primary key autoincrement,
	Type 									text												default null,
	ShortDescription						text												default null,
	DefaultArtDefineTag						text												default null,
	DefaultSoundtrackTag					text												default null,
	DefaultSplashScreenTag					text												default null,
	DefaultUnitDialogueTag					text												default null,
	StartDistance							integer												default	0,
	FontIcon								text												default	null,
	IconAtlas								text		REFERENCES IconTextureAtlases(Atlas)	default	null,
	IconAlphaAtlas							text		REFERENCES IconTextureAtlases(Atlas)	default	null,
	PortraitIndex							integer												default	0,
	AlphaIndex								integer												default	0,
	EmbarkationArtDefineEarly				text												default	null,
	EmbarkationArtDefineMid					text												default	null);

---- Ur to Skara Brae
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_MOD_SKARA_BRAE',
	ShortDescription = 'TXT_KEY_CITYSTATE_MOD_SKARA_BRAE',
	Adjective = 'TXT_KEY_CITYSTATE_MOD_SKARA_BRAE_ADJ',
	Civilopedia = 'TXT_KEY_CITYSTATE_MOD_SKARA_BRAE_PEDIA',
	ArtStyleType = 'ARTSTYLE_EUROPEAN',
	ArtStyleSuffix = '_EURO',
	ArtStylePrefix = 'EUROPEAN'
WHERE Type = 'MINOR_CIV_UR';

DELETE FROM MinorCivilization_CityNames WHERE MinorCivType IN ('MINOR_CIV_UR');
INSERT INTO MinorCivilization_CityNames 
			(MinorCivType, 				                                   CityName)
VALUES		('MINOR_CIV_UR', 					 'TXT_KEY_CITYSTATE_MOD_SKARA_BRAE');

DELETE FROM MinorCivilization_JFD_CultureTypes WHERE MinorCivilizationType IN ('MINOR_CIV_UR');
INSERT INTO MinorCivilization_JFD_CultureTypes
            (MinorCivilizationType,					   CultureType)
VALUES      ('MINOR_CIV_UR',		                'JFD_Northern');

CREATE TRIGGER TomatekhUrCulDivUpdate
AFTER INSERT ON MinorCivilization_JFD_CultureTypes WHEN 'MINOR_CIV_UR' = NEW.MinorCivilizationType
BEGIN
	DELETE FROM MinorCivilization_JFD_CultureTypes WHERE MinorCivilizationType IN ('MINOR_CIV_UR');
	INSERT INTO MinorCivilization_JFD_CultureTypes
				(MinorCivilizationType,					   CultureType)
	VALUES      ('MINOR_CIV_UR',		                'JFD_Northern');
END;