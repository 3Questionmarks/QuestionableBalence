--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 							Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 		PortraitIndex)
VALUES		('LEADER_JAYAVARMAN_VII', 		'TXT_KEY_LEADER_JAYAVARMAN_VII', 		'TXT_KEY_LEADER_JAYAVARMAN_VII_PEDIA', 		'TXT_KEY_CIVILOPEDIA_LEADERS_JAYAVARMAN_VII', 		'Jayavarman_VII_Scene.xml',	4, 						9, 						3, 							5, 			8, 				5, 				4, 						7, 				9, 			5, 			6, 				4, 			4, 			'KHMER_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_JAYAVARMAN_VII', 		'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_JAYAVARMAN_VII', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JAYAVARMAN_VII', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
			('LEADER_JAYAVARMAN_VII', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_JAYAVARMAN_VII', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JAYAVARMAN_VII', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_JAYAVARMAN_VII', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES		('LEADER_JAYAVARMAN_VII', 		'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_JAYAVARMAN_VII', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JAYAVARMAN_VII', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_JAYAVARMAN_VII', 		'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_JAYAVARMAN_VII', 		'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 					FlavorType, 						Flavor)
VALUES		('LEADER_JAYAVARMAN_VII', 		'FLAVOR_OFFENSE', 					4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_DEFENSE', 					4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_RECON', 					4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_RANGED', 					4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_MOBILE', 					4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_NAVAL', 					4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_AIR', 						4),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_EXPANSION', 				6),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_GROWTH', 					8),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_PRODUCTION', 				7),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_GOLD', 						5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_SCIENCE', 					5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_CULTURE', 					7),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_HAPPINESS', 				7),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_WONDER', 					10),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_RELIGION', 					7),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_DIPLOMACY', 				5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_SPACESHIP', 				5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_NUKE', 						2),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_ESPIONAGE', 				3),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JAYAVARMAN_VII', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 					TraitType)
VALUES		('LEADER_JAYAVARMAN_VII', 		'TRAIT_KHMER_BARAYS');
--==========================================================================================================================				
--==========================================================================================================================		