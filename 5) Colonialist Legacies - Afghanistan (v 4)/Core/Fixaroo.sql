
--===========================================================================================================================================
--Zamburak animations
---------------------------------------------------------------------------------------------------------------------------------------------

UPDATE ArtDefine_UnitInfoMemberInfos --Doing it in reverse because I've got nothing else as a reference in the UnitMemberCombat tables
SET UnitMemberInfoType = 'ART_DEF_UNIT_CL_MEMBER_ZAMBURAK'
WHERE UnitInfoType = 'ART_DEF_UNIT_CL_ZAMBURAK';

UPDATE ArtDefine_UnitMemberInfos
SET Type = 'ART_DEF_UNIT_CL_MEMBER_ZAMBURAK'
WHERE Model = 'u_afghanistan_camel_gunner.fxsxml';
--===========================================================================================================================================

--===========================================================================================================================================
--Kalle
---------------------------------------------------------------------------------------------------------------------------------------------

UPDATE Improvements
SET RequiresFlatLands = 0, Permanent = 0, BuildableOnResources = 0, Help = 'TXT_KEY_IMPROVEMENT_CL_KALLE_HELP', DefenseModifier = 15, NoTwoAdjacent = 0
WHERE Type = 'IMPROVEMENT_CL_KALLE';

DELETE FROM Improvement_AdjacentMountainYieldChanges
WHERE ImprovementType = 'IMPROVEMENT_CL_KALLE';

INSERT INTO BuildFeatures
		(BuildType,			FeatureType,		PrereqTech,					Time,		Remove,		Production)
VALUES	('BUILD_CL_KALLE',	'FEATURE_FOREST',	'TECH_MINING',				400,		1,			20),
		('BUILD_CL_KALLE',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',		700,		1,			0),
		('BUILD_CL_KALLE',	'FEATURE_MARSH',	'TECH_MASONRY',				600,		1,			0);
		
INSERT INTO Improvements
			(Type,								UpgradeTime,	GoldMaintenance,	NoTwoAdjacent,	RequiresFlatlands,	 Description,							Civilopedia,										ArtDefineTag,						DestroyedWhenPillaged,	Permanent,	PillageGold,	BuildableOnResources,	PortraitIndex,	IconAtlas, Help, DefenseModifier)
SELECT		'IMPROVEMENT_C15_KALLE_MOUNTAIN',	UpgradeTime,	GoldMaintenance,	NoTwoAdjacent,	RequiresFlatLands,	Description,							Civilopedia,										ArtDefineTag,						DestroyedWhenPillaged,	Permanent,	PillageGold,	BuildableOnResources,	PortraitIndex,	IconAtlas, Help, DefenseModifier
FROM Improvements WHERE Type = 'IMPROVEMENT_CL_KALLE';

INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,		Yield)
SELECT	'IMPROVEMENT_C15_KALLE_MOUNTAIN',	YieldType,		Yield * 2
FROM Improvement_Yields WHERE ImprovementType = 'IMPROVEMENT_CL_KALLE';

--===========================================================================================================================================

--===========================================================================================================================================
--Diplomacy
---------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_FIRST_GREETING',	'TXT_KEY_LEADER_MIRWAIS_HOTAK_FIRSTGREETING%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_WARBLUFF',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_WARBLUFF%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_WINWAR',			'TXT_KEY_LEADER_MIRWAIS_HOTAK_WINWAR%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_LOSEWAR',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_LOSEWAR%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_DEFEATED',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_DEFEATED%','1');
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_TRADE_ACCEPT_ACCEPTABLE',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_TRADE_YES_NEUTRAL%','1');
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_TRADE_NEEDMORE_NEUTRAL',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_TRADE_NEEDMORE_NEUTRAL%','1');
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_TRADE_NO_NEUTRAL',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_TRADE_NO_NEUTRAL%','1');
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_TRADEREQUEST_NEUTRAL',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_TRADEREQUEST_NEUTRAL%','1');			Disabled these because I don't know how the friendliness system is set up - Civ can't decide whether there are seperate tags for _FRIENDLY, _NEUTRAL, and _ANGRY; or whether certain numbered responses are used for certain friendliness levels.
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_DEMANDTRIBUTE_NEUTRAL',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_DEMANDTRIBUTE_NEUTRAL%','1');
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_LETSHEARIT',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_LETSHEARIT%','1');
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_GREETING_FRIENDLY',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_GREETING%','1'); 
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_DECLAREWAR',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_DECLAREWAR%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_CL_MIRWAIS_HOTAK','RESPONSE_ATTACKED',		'TXT_KEY_LEADER_MIRWAIS_HOTAK_ATTACKED%','1');

--===========================================================================================================================================

--===========================================================================================================================================
-- Events_CulturalDevelopments
--===========================================================================================================================================
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,											CivilizationType,						CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_CL_AFGHANISTAN_01',				'CIVILIZATION_CL_AFGHANISTAN',			'JFD_Islamic');
------------------------------
-- Language_en_US
------------------------------
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_EVENT_CULDEV_CL_AFGHANISTAN_01',
		'The citizens of {1_City} have created a machine with large, horizontal blades that turn millstones. They call this creation a "windmill".'
	);
	
--===========================================================================================================================================

--===========================================================================================================================================
--Change Religion to Islam, because the Pashtun were Sunni rather than Zoro-thing. Also giving Afghanistan a hills bias, because that's only fair
---------------------------------------------------------------------------------------------------------------------------------------------

UPDATE Civilization_Religions
SET ReligionType = 'RELIGION_ISLAM'
WHERE CivilizationType = 'CIVILIZATION_CL_AFGHANISTAN';

INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,					RegionType)
VALUES	('CIVILIZATION_CL_AFGHANISTAN',		'REGION_HILLS');




-- Hiding this?
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);
 
--Any items entered into this table will not show into the Civilopedia. There is no technical limitation as to what can be hidden (I think).
INSERT INTO JFD_Civilopedia_HideFromPedia
        (Type)
VALUES  ('BUILDING_CL_AFGHANISTAN_MOUNTAIN_TRADE');