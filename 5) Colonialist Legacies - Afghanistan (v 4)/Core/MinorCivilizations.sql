--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_CL_BAKU_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_CL_BAKU_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_CL_BAKU_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_CL_BAKU_TEXT_1'
WHERE Type = 'MINOR_CIV_KABUL';	
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = 'MINOR_CIV_KABUL';
INSERT INTO MinorCivilization_CityNames
			(MinorCivType, 			CityName)
VALUES		('MINOR_CIV_KABUL', 	'TXT_KEY_CITYSTATE_CL_BAKU');
--==========================================================================================================================
--==========================================================================================================================	
INSERT INTO Language_en_US
			(Tag,										Text)
VALUES		('TXT_KEY_CITYSTATE_CL_BAKU',				'Baku'),
			('TXT_KEY_CITYSTATE_CL_BAKU_DESC',			'Baku'),
			('TXT_KEY_CITYSTATE_CL_BAKU_SHORT_DESC',	'Baku'),
			('TXT_KEY_CITYSTATE_CL_BAKU_ADJECTIVE',		'Bakuvian'),
			('TXT_KEY_CIV5_CL_BAKU_TEXT_1',				'Baku is the capital of Azerbaijan, as well as the largest city on the Caspian Sea. Baku is the lowest lying national capital in the world and also the largest city in the world located below sea level.');
