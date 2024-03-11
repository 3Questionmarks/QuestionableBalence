--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_CL_MIRWAIS_HOTAK', 		'TXT_KEY_LEADER_CL_MIRWAIS_HOTAK', 	'TXT_KEY_CIVILOPEDIA_LEADER_MIRWAIS_HOTAK', 	'TXT_KEY_CIVILOPEDIA_LEADERS_CL_MIRWAIS_HOTAK', 	'MirwaisHotak_Scene.xml',		5, 						4, 						4, 							5, 			7, 				7, 				4, 						9, 				7, 			4, 			6, 				5, 			2, 			'CL_AFGHANISTAN_ATLAS', 	2);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_CL_MIRWAIS_HOTAK', 		'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_CL_MIRWAIS_HOTAK', 		'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_CL_MIRWAIS_HOTAK', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_CL_MIRWAIS_HOTAK', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_CL_MIRWAIS_HOTAK', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_CL_MIRWAIS_HOTAK', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_CL_MIRWAIS_HOTAK', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_CL_MIRWAIS_HOTAK', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_CL_MIRWAIS_HOTAK', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_CL_MIRWAIS_HOTAK', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_CL_MIRWAIS_HOTAK', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_CL_MIRWAIS_HOTAK', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_RECON', 					5),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_RANGED', 					7),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_MOBILE', 					2),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_NAVAL', 					5),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_AIR', 						3),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_GROWTH', 					6),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_GOLD', 						7),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_CULTURE', 					8),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_WONDER', 					4),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_RELIGION', 					6),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_NUKE', 						2),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_I_TRADE_DESTINATION', 		7),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_I_TRADE_ORIGIN', 			8),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		9),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_CL_MIRWAIS_HOTAK', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_CL_MIRWAIS_HOTAK', 	'TRAIT_CL_AFGHANISTAN');
--==========================================================================================================================				
--==========================================================================================================================		