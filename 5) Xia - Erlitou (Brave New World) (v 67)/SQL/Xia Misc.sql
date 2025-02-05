INSERT OR REPLACE INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_TOURISMHANDLER_0', 			'BUILDING_TOURISMHANDLER_0', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_00'		),
			('BUILDINGCLASS_TOURISMHANDLER_1', 			'BUILDING_TOURISMHANDLER_1', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_01'		),
			('BUILDINGCLASS_TOURISMHANDLER_2', 			'BUILDING_TOURISMHANDLER_2', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_02'		),
			('BUILDINGCLASS_TOURISMHANDLER_4', 			'BUILDING_TOURISMHANDLER_4', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_04'		),
			('BUILDINGCLASS_TOURISMHANDLER_8', 			'BUILDING_TOURISMHANDLER_8', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_08'		),
			('BUILDINGCLASS_TOURISMHANDLER_16', 		'BUILDING_TOURISMHANDLER_16', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_016'		),
			('BUILDINGCLASS_TOURISMHANDLER_32', 		'BUILDING_TOURISMHANDLER_32', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_032'		),
			('BUILDINGCLASS_TOURISMHANDLER_64', 		'BUILDING_TOURISMHANDLER_64', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_064'		),
			('BUILDINGCLASS_TOURISMHANDLER_128', 		'BUILDING_TOURISMHANDLER_128', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_0128'		),
			('BUILDINGCLASS_TOURISMHANDLER_256', 		'BUILDING_TOURISMHANDLER_256', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_0256'		),
			('BUILDINGCLASS_TOURISMHANDLER_512', 		'BUILDING_TOURISMHANDLER_512', 			'TXT_KEY_SUKRITACT_TOURISM_DUMMY_0512'		),
			('BUILDINGCLASS_TOURISMHANDLER_1024', 		'BUILDING_TOURISMHANDLER_1024', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_01024'		),
			('BUILDINGCLASS_TOURISMHANDLER_2048', 		'BUILDING_TOURISMHANDLER_2048', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_02048'		),
			('BUILDINGCLASS_TOURISMHANDLER_4096', 		'BUILDING_TOURISMHANDLER_4096', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_04096'		),
			('BUILDINGCLASS_TOURISMHANDLER_8192', 		'BUILDING_TOURISMHANDLER_8192', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_08192'		);

--INSERT INTO BuildingClasses	
--			(Type, 						 		 	DefaultBuilding, 					Description)
--VALUES		('BUILDINGCLASS_XIA_TEMP_ART', 			'BUILDING_XIA_TEMP_ART', 			'TXT_KEY_BUILDING_XIA_ART_HOLDER_DESC');

INSERT OR REPLACE INTO Buildings 	
			(Type, 						 					BuildingClass, 							Description,							    TechEnhancedTourism,		GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture,	NukeImmune,		IconAtlas,		 PortraitIndex)
VALUES		('BUILDING_TOURISMHANDLER_0', 	 				'BUILDINGCLASS_TOURISMHANDLER_0', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_00',		0,							-1,				-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_1', 	 				'BUILDINGCLASS_TOURISMHANDLER_1', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_01',		1,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_2', 	 				'BUILDINGCLASS_TOURISMHANDLER_2', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_02',		2,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_4', 	 				'BUILDINGCLASS_TOURISMHANDLER_4', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_04',		4,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_8', 	 				'BUILDINGCLASS_TOURISMHANDLER_8', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_08',		8,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_16', 	 				'BUILDINGCLASS_TOURISMHANDLER_16', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_016',		16,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_32', 	 				'BUILDINGCLASS_TOURISMHANDLER_32', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_032',		32,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_64', 	 				'BUILDINGCLASS_TOURISMHANDLER_64', 		'TXT_KEY_SUKRITACT_TOURISM_DUMMY_064',		64,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_128',  				'BUILDINGCLASS_TOURISMHANDLER_128', 	'TXT_KEY_SUKRITACT_TOURISM_DUMMY_0128',		128,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_256',  				'BUILDINGCLASS_TOURISMHANDLER_256', 	'TXT_KEY_SUKRITACT_TOURISM_DUMMY_0256',		256,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_512',  				'BUILDINGCLASS_TOURISMHANDLER_512', 	'TXT_KEY_SUKRITACT_TOURISM_DUMMY_0512',		512,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_1024', 				'BUILDINGCLASS_TOURISMHANDLER_1024',	'TXT_KEY_SUKRITACT_TOURISM_DUMMY_01024',	1024,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_2048', 				'BUILDINGCLASS_TOURISMHANDLER_2048',	'TXT_KEY_SUKRITACT_TOURISM_DUMMY_02048',	2048,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_4096', 				'BUILDINGCLASS_TOURISMHANDLER_4096',	'TXT_KEY_SUKRITACT_TOURISM_DUMMY_04096',	4096,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_8192', 				'BUILDINGCLASS_TOURISMHANDLER_8192',	'TXT_KEY_SUKRITACT_TOURISM_DUMMY_08192',	8192,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21);

--INSERT INTO Buildings 	
--			(Type, 						 	BuildingClass, 						Description,								GreatWorkSlotType,					GreatWorkCount,	   Cost,   FaithCost,   PrereqTech, 	NeverCapture,	NukeImmune,		IconAtlas,		 PortraitIndex)
--VALUES		('BUILDING_XIA_TEMP_ART', 	 	'BUILDINGCLASS_XIA_TEMP_ART', 		'TXT_KEY_BUILDING_XIA_ART_HOLDER_DESC',		'GREAT_WORK_SLOT_ART_ARTIFACT',		1, 					-1,    -1, 		    null,			1,				1,				'BW_ATLAS_1',				21);

INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 				LoadType)
VALUES		('SND_SOUND_XIA_SHANG_SACRIFICE', 		'ShangBianzhong',		'DynamicResident');		

INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_SOUND_XIA_SHANG_SACRIFICE', 			'SND_SOUND_XIA_SHANG_SACRIFICE', 		'GAME_SFX', 	95, 		95, 		0, 			0);