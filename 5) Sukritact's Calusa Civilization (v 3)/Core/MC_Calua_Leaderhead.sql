--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 							CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 		IconAtlas, 				PortraitIndex)
VALUES		('LEADER_MC_CAALUS', 	'TXT_KEY_LEADER_MC_CAALUS', 	'TXT_KEY_LEADER_MC_CAALUS', 	'TXT_KEY_CIVILOPEDIA_LEADERS_MC_CAALUS', 	'MC_CalusaLeaderhead.xml',				6, 						3, 						4, 							7, 			5, 				2, 				3, 						4, 				4, 			3, 			5, 				2, 			4, 			'MC_CALUSA_ATLAS',		1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_MC_CAALUS', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_MC_CAALUS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
			('LEADER_MC_CAALUS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_MC_CAALUS', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_MC_CAALUS', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_MC_CAALUS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_MC_CAALUS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_CAALUS', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_MC_CAALUS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_MC_CAALUS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_MC_CAALUS', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_MC_CAALUS', 	'MINOR_CIV_APPROACH_BULLY', 		5);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_MC_CAALUS', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_MC_CAALUS', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_MC_CAALUS', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_MC_CAALUS', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_MC_CAALUS', 	'FLAVOR_RECON', 					5),
			('LEADER_MC_CAALUS', 	'FLAVOR_RANGED', 					6),
			('LEADER_MC_CAALUS', 	'FLAVOR_MOBILE', 					5),
			('LEADER_MC_CAALUS', 	'FLAVOR_NAVAL', 					7),
			('LEADER_MC_CAALUS', 	'FLAVOR_NAVAL_RECON', 				7),
			('LEADER_MC_CAALUS', 	'FLAVOR_NAVAL_GROWTH', 				7),
			('LEADER_MC_CAALUS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_MC_CAALUS', 	'FLAVOR_AIR', 						6),
			('LEADER_MC_CAALUS', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_MC_CAALUS', 	'FLAVOR_GROWTH', 					8),
			('LEADER_MC_CAALUS', 	'FLAVOR_TILE_IMPROVEMENT', 			2),
			('LEADER_MC_CAALUS', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_MC_CAALUS', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_MC_CAALUS', 	'FLAVOR_GOLD', 						6),
			('LEADER_MC_CAALUS', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_MC_CAALUS', 	'FLAVOR_CULTURE', 					7),
			('LEADER_MC_CAALUS', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_MC_CAALUS', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_MC_CAALUS', 	'FLAVOR_WONDER', 					3),
			('LEADER_MC_CAALUS', 	'FLAVOR_RELIGION', 					7),
			('LEADER_MC_CAALUS', 	'FLAVOR_DIPLOMACY', 				7),
			('LEADER_MC_CAALUS', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_MC_CAALUS', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_MC_CAALUS', 	'FLAVOR_NUKE', 						5),
			('LEADER_MC_CAALUS', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_MC_CAALUS', 	'FLAVOR_ESPIONAGE', 				3),
			('LEADER_MC_CAALUS', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_MC_CAALUS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_MC_CAALUS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_MC_CAALUS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_MC_CAALUS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_MC_CAALUS', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_MC_CAALUS', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_MC_CAALUS', 	'TRAIT_MC_CALUSA');
--==========================================================================================================================			
--==========================================================================================================================	