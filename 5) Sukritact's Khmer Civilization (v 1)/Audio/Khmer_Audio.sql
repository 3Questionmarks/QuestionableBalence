--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 										Filename, 						LoadType)
VALUES		('SND_LEADER_MUSIC_JAYAVARMAN_VII_PEACE', 		'Jayavarman_VII_Peace',			'DynamicResident'),
			('SND_LEADER_MUSIC_JAYAVARMAN_VII_WAR', 		'Jayavarman_VII_War', 			'DynamicResident'),
			('SND_DOM_SPEECH_KHMER', 						'Khmer_DoM',					'DynamicResident');						
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JAYAVARMAN_VII_PEACE', 		'SND_LEADER_MUSIC_JAYAVARMAN_VII_PEACE', 	'GAME_MUSIC', 	100, 		100, 		1, 		 0),
			('AS2D_LEADER_MUSIC_JAYAVARMAN_VII_WAR', 		'SND_LEADER_MUSIC_JAYAVARMAN_VII_WAR', 		'GAME_MUSIC', 	100, 		100, 		1,		 0),
			('AS2D_DOM_SPEECH_KHMER', 						'SND_DOM_SPEECH_KHMER',						'GAME_SPEECH', 	100, 		100, 		1, 		 0);
--==========================================================================================================================		
--==========================================================================================================================		
