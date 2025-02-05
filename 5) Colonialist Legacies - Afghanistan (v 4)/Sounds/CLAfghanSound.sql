--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 										Filename, 					LoadType)
VALUES		('SND_LEADER_MUSIC_CL_MIRWAIS_HOTAK_PEACE', 	'MirwaisHotak_Peace',		'DynamicResident'),
			('SND_LEADER_MUSIC_CL_MIRWAIS_HOTAK_WAR', 		'MirwaisHotak_War', 		'DynamicResident'),
			('SND_DOM_SPEECH_CL_MIRWAIS_HOTAK',				'MirwaisHotak_DoM',			'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_CL_MIRWAIS_HOTAK_PEACE', 	'SND_LEADER_MUSIC_CL_MIRWAIS_HOTAK_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_CL_MIRWAIS_HOTAK_WAR', 		'SND_LEADER_MUSIC_CL_MIRWAIS_HOTAK_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,			0),
			('AS2D_DOM_SPEECH_CL_MIRWAIS_HOTAK', 			'SND_DOM_SPEECH_CL_MIRWAIS_HOTAK', 			'GAME_SPEECH', 	60, 		60, 		0,			0);
--==========================================================================================================================		
--==========================================================================================================================		