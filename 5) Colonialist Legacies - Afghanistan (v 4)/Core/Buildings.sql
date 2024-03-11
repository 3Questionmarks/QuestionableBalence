--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 				DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_CL_AFGHANISTAN_MOUNTAIN_TRADE', 	'BUILDING_CL_AFGHANISTAN_MOUNTAIN_TRADE',	'TXT_KEY_BUILDING_CL_AFGHANISTAN_MOUNTAIN_TRADE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 									NearbyMountainRequired, 		GreatWorkCount, Cost,	 FaithCost,  TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,		Description, 										Help,													IconAtlas,					PortraitIndex)
VALUES		('BUILDING_CL_AFGHANISTAN_MOUNTAIN_TRADE', 	'BUILDINGCLASS_CL_AFGHANISTAN_MOUNTAIN_TRADE', 	1, 								-1, 			-1,		-1, 		 50,								500,							'TXT_KEY_BUILDING_CL_AFGHANISTAN_MOUNTAIN_TRADE', 	'TXT_KEY_BUILDING_CL_AFGHANISTAN_MOUNTAIN_TRADE_HELP',	'CL_AFGHANISTAN_ATLAS',		0);
--==========================================================================================================================	
--==========================================================================================================================	
