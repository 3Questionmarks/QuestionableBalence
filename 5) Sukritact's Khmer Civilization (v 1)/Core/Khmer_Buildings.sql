--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_KHMER', 					'BUILDING_KHMER_PRASAT_EFFECT', 		'Prasat Effect');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 								BuildingClass, Cost, GoldMaintenance, 	PrereqTech, Description, 								Civilopedia, 								Help, 											Strategy,											ArtDefineTag, 	MinAreaSize, ConquestProb, Happiness, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_KHMER_PRASAT'),			BuildingClass, Cost, GoldMaintenance, 	PrereqTech, ('TXT_KEY_BUILDING_KHMER_PRASAT'), 			('TXT_KEY_CIV5_KHMER_PRASAT_TEXT'), 		('TXT_KEY_BUILDING_KHMER_PRASAT_HELP'), 		('TXT_KEY_BUILDING_KHMER_PRASAT_STRATEGY'),				ArtDefineTag,	MinAreaSize, ConquestProb, 4, HurryCostModifier, 3, 				('KHMER_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_COLOSSEUM');	

INSERT INTO Buildings 	
			(Type, 						 		BuildingClass, 			GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 		CultureRateModifier)
VALUES		('BUILDING_KHMER_PRASAT_EFFECT', 	'BUILDINGCLASS_KHMER', 	-1, 			-1,   -1, 		 null, 		 'Prasat Effect', 	10),
			('BUILDING_KHMER_BARAY_EFFECT', 	'BUILDINGCLASS_KHMER', 	-1, 			-1,   -1, 		 null, 		 'Baray Effect', 	0);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType, Flavor)
SELECT		('BUILDING_KHMER_PRASAT'),			FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_COLOSSEUM');

INSERT OR REPLACE INTO 	Building_Flavors 	
						(BuildingType, 				FlavorType, 		Flavor)
VALUES					('BUILDING_KHMER_PRASAT',	'FLAVOR_WONDER',	50);
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType, 		Yield)
VALUES		('BUILDING_KHMER_PRASAT',			'YIELD_FAITH', 	4);
--==========================================================================================================================
-- Building_RemoteGreatPeoplePoints
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Building_RemoteGreatPeoplePoints	(
	BuildingType text,
	SpecialistType text,
	RateChange integer default 0,
	Modified boolean default 1,
	Capital boolean default 1
);

INSERT INTO Building_RemoteGreatPeoplePoints 	
			(BuildingType, 							SpecialistType, 		RateChange,		Modified,	Capital)
VALUES		('BUILDING_KHMER_BARAY_EFFECT',			'SPECIALIST_ENGINEER', 	3,				0,			0);
--==========================================================================================================================	
--==========================================================================================================================