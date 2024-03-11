--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_BATLLE', 		'TXT_KEY_LEADER_SENSHI_BATLLE', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_BATLLE', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_BATLLE', 	'Senshi_Batlle_Scene.xml',		3, 						5, 						7, 							3, 			5, 				7, 				4, 						8, 				8, 			6, 			5, 				4, 			2, 			'SENSHI_URUGUAY_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_BATLLE', 		'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_SENSHI_BATLLE', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_SENSHI_BATLLE', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_SENSHI_BATLLE', 		'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_SENSHI_BATLLE', 		'MAJOR_CIV_APPROACH_AFRAID', 		6),
			('LEADER_SENSHI_BATLLE', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_BATLLE', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_BATLLE', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_SENSHI_BATLLE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_BATLLE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_SENSHI_BATLLE', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_SENSHI_BATLLE', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_BATLLE', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_RECON', 					4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_RANGED', 					6),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_MOBILE', 					8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_NAVAL', 					4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_AIR', 						6),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_EXPANSION', 				4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_GROWTH', 					9),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_GOLD', 						8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_CULTURE', 					8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_HAPPINESS', 				12),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_WONDER', 					6),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_RELIGION', 					1),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_DIPLOMACY', 				9),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_NUKE', 						3),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_AIRLIFT', 					4),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_I_TRADE_DESTINATION', 		8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_I_TRADE_ORIGIN', 			8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		8),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_ARCHAEOLOGY', 				3),
			('LEADER_SENSHI_BATLLE', 	'FLAVOR_AIR_CARRIER', 				3);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_BATLLE', 	'TRAIT_SENSHI_URUGUAY');
--==========================================================================================================================				
--==========================================================================================================================		