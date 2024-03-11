--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,		BuildingClass,					PrereqTech,			FreeStartEra,		Water,	TrainedFreePromotion,			ConquestProb,	Cost,	GoldMaintenance,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Description,						Help,									Strategy,								Civilopedia,								ArtDefineTag,	DisplayPosition,	ArtInfoEraVariation,	MinAreaSize) 
SELECT 'BUILDING_FA_TRADINGPOST',	'BUILDINGCLASS_LIGHTHOUSE',		'TECH_OPTICS',		'ERA_RENAISSANCE',	1,		'PROMOTION_VIKING_HERITAGE',	66,				70,		0,					10,					'FA_UB_ATLAS',		5,				'TXT_KEY_BUILDING_FA_TRADINGPOST',	'TXT_KEY_BUILDING_FA_TRADINGPOST_HELP',	'TXT_KEY_BUILDING_LIGHTHOUSE_STRATEGY',	'TXT_KEY_CIV5_BUILDINGS_LIGHTHOUSE_TEXT',	'LIGHTHOUSE',	8,					1,						10;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_SeaResourceYieldChanges (BuildingType,	YieldType,			Yield) 
SELECT 'BUILDING_FA_TRADINGPOST',							'YIELD_FOOD',		1;

--------------------------------------------------------------------------------------------------
--Building Seaplot Yields
--------------------------------------------------------------------------------------------------
INSERT INTO Building_SeaPlotYieldChanges (BuildingType,		YieldType,			Yield) 
SELECT 'BUILDING_FA_TRADINGPOST',							'YIELD_FOOD',		1;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,	FlavorType,							Flavor)
SELECT 'BUILDING_FA_TRADINGPOST',			'FLAVOR_MILITARY_TRAINING',			5 UNION ALL
SELECT 'BUILDING_FA_TRADINGPOST',			'FLAVOR_NAVAL_GROWTH',				20 UNION ALL
SELECT 'BUILDING_FA_TRADINGPOST',			'FLAVOR_GROWTH',					15 UNION ALL
SELECT 'BUILDING_FA_TRADINGPOST',			'FLAVOR_SCIENCE',					5 UNION ALL
SELECT 'BUILDING_FA_TRADINGPOST',			'FLAVOR_GOLD',						10 UNION ALL
SELECT 'BUILDING_FA_TRADINGPOST',			'FLAVOR_NAVAL_TILE_IMPROVEMENT',	20;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,				BuildingType)
SELECT 'CIVILIZATION_DENMARK',											'BUILDINGCLASS_LIGHTHOUSE',		'BUILDING_FA_TRADINGPOST';

--------------------------------------------------------------------------------------------------
--Delete Unique Units
--------------------------------------------------------------------------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_DANISH_SKI_INFANTRY';
UPDATE Units SET Cost = -1, ShowInPedia = 0 WHERE Type = 'UNIT_DANISH_SKI_INFANTRY';

--------------------------------------------------------------------------------------------------
--Promotions
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions (Type,		CannotBeChosen,	MovesChange,	Description,							Help,										PediaEntry,								IconAtlas,			PortraitIndex,	Sound,				PediaType)
SELECT 'PROMOTION_VIKING_HERITAGE',		1,				1,				'TXT_KEY_PROMOTION_VIKING_HERITAGE',	'TXT_KEY_PROMOTION_VIKING_HERITAGE_HELP',	'TXT_KEY_PROMOTION_VIKING_HERITAGE',	'PROMOTION_ATLAS',	33,				'AS2D_IF_LEVELUP',	'PEDIA_SHARED';

--------------------------------------------------------------------------------------------------
--Allowed Promotions, UnitCombats
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombats (PromotionType,	UnitCombatType)
SELECT 'PROMOTION_VIKING_HERITAGE',						'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 'PROMOTION_VIKING_HERITAGE',						'UNITCOMBAT_NAVALRANGED';

INSERT INTO UnitPromotions_UnitCombats (PromotionType,	UnitCombatType)
SELECT 'PROMOTION_VIKING_HERITAGE',						'UNITCOMBAT_NAVAL';

--------------------------------------------------------------------------------------------------
--BNW Updates
--------------------------------------------------------------------------------------------------
DELETE FROM Buildings
	WHERE NOT EXISTS ( SELECT * FROM Civilizations WHERE Type = 'CIVILIZATION_DENMARK')
	AND Type = 'BUILDING_FA_TRADINGPOST';

DELETE FROM UnitPromotions
	WHERE NOT EXISTS ( SELECT * FROM Civilizations WHERE Type = 'CIVILIZATION_DENMARK')
	AND Type = 'PROMOTION_VIKING_HERITAGE';

UPDATE Buildings
	SET	Help = 'TXT_KEY_BUILDING_FA_TRADINGPOST2_HELP',
		FreePromotionRemoved = 'PROMOTION_OCEAN_IMPASSABLE'
	WHERE EXISTS ( SELECT * FROM Specialists WHERE Type = 'SPECIALIST_MUSICIAN')
	AND Type = 'BUILDING_FA_TRADINGPOST';

INSERT INTO Building_SeaResourceYieldChanges (BuildingType, YieldType, Yield) SELECT Type, 'YIELD_PRODUCTION', 1 FROM Buildings
	WHERE EXISTS ( SELECT * FROM Specialists WHERE Type = 'SPECIALIST_MUSICIAN' )
	AND Type = 'BUILDING_FA_TRADINGPOST';


