-- Naming Settings
-- Author: astog
-- DateCreated: 7/13/2015 7:00:38 PM
--------------------------------------------------------------

print("Settings Loaded")

local contextual_saveData 			= Modding.OpenSaveData()
-- local contextual_saveProperies 	= {}

--=================================================================================================================================================================
-- Name Variables. This is where each setting has its value set. Skip this unless you understand what to do
-- To do: Load this into a SQL Table for easy edit, and for modders.
--=================================================================================================================================================================

local numberSetting = 
{
	NONE 			= 	{ ID = 0, Description = "None",					Tooltip="TXT_KEY_UNIT_NUMBER_NONE"			},
	DYNAMIC			= 	{ ID = 1, Description = "Dynamic",				Tooltip="TXT_KEY_UNIT_NUMBER_DYNAMIC"		},
	DYNAMIC_BARE	=	{ ID = 2, Description = "Dynamic (no suffix)",	Tooltip="TXT_KEY_UNIT_NUMBER_DYNAMIC_BARE"	},
	ROMAN			=	{ ID = 3, Description = "Roman Numerals",		Tooltip="TXT_KEY_UNIT_NUMBER_ROMAN_NUMERAL"	},
	GLOBAL			=	{ ID = 4, Description = "Global",				Tooltip="TXT_KEY_UNIT_NUMBER_GLOBAL"		}
}

local combatClassSetting =
{
	NONE 			= 	{ ID = 0, Description = "None",					Tooltip="TXT_KEY_UNIT_COMBAT_CLASS_NONE"		},
	UNIT_TYPE 		= 	{ ID = 1, Description = "Unit Type",			Tooltip="TXT_KEY_UNIT_COMBAT_CLASS_UNIT_TYPE"	},

	-- These are meant as naming skews. Subject to change
	COMBATCLASS		= 	{
							START 	= 	2, ID = 2,						Tooltip="TXT_KEY_UNIT_COMBAT_CLASS_COMBATCLASS",

							-- TODO: Adds more skews
							-- NOTE: Keep the name of skews as TYPE[number]. The value of ID has to be between start and end value, and unique
							TYPE1	=
										{	ID	=	3,

											Description = 	"Ancient",

										 	UNITCOMBAT_RECON 		=	"Recon",
										 	UNITCOMBAT_ARCHER		= 	"Archer",
										 	UNITCOMBAT_SIEGE		=	"Catapult",
										 	UNITCOMBAT_MOUNTED		=	"Cavalry",
										 	UNITCOMBAT_MELEE		=	"Infantry",
										 	UNITCOMBAT_GUN 			= 	"Infantry",
										 	UNITCOMBAT_ARMOR		=	"Armor",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Galley",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Barque",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							TYPE2	=
										{	ID	=	4,

											Description = 	"Classical",

										 	UNITCOMBAT_RECON 		=	"Recon",
										 	UNITCOMBAT_ARCHER		= 	"Archer",
										 	UNITCOMBAT_SIEGE		=	"Catapult",
										 	UNITCOMBAT_MOUNTED		=	"Cavalry",
										 	UNITCOMBAT_MELEE		=	"Infantry",
										 	UNITCOMBAT_GUN 			= 	"Infantry",
										 	UNITCOMBAT_ARMOR		=	"Armor",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Galley",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Barque",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							TYPE3	=
										{	ID	=	5,

											Description = 	"Medieval",

										 	UNITCOMBAT_RECON 		=	"Recon",
										 	UNITCOMBAT_ARCHER		= 	"Archer",
										 	UNITCOMBAT_SIEGE		=	"Trebuchet",
										 	UNITCOMBAT_MOUNTED		=	"Cavalry",
										 	UNITCOMBAT_MELEE		=	"Infantry",
										 	UNITCOMBAT_GUN 			= 	"Infantry",
										 	UNITCOMBAT_ARMOR		=	"Armor",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Galley",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Barque",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							TYPE4	=
										{	ID	=	6,

											Description = 	"Renaissance",

										 	UNITCOMBAT_RECON 		=	"Recon",
										 	UNITCOMBAT_ARCHER		= 	"Archer",
										 	UNITCOMBAT_SIEGE		=	"Cannon",
										 	UNITCOMBAT_MOUNTED		=	"Cavalry",
										 	UNITCOMBAT_MELEE		=	"Infantry",
										 	UNITCOMBAT_GUN 			= 	"Infantry",
										 	UNITCOMBAT_ARMOR		=	"Armor",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Carrack",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Caravel",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							TYPE5	=
										{	ID	=	7,

											Description = 	"Industrial",

										 	UNITCOMBAT_RECON 		=	"Recon",
										 	UNITCOMBAT_ARCHER		= 	"Support",
										 	UNITCOMBAT_SIEGE		=	"Artillery",
										 	UNITCOMBAT_MOUNTED		=	"Cavalry",
										 	UNITCOMBAT_MELEE		=	"Infantry",
										 	UNITCOMBAT_GUN 			= 	"Infantry",
										 	UNITCOMBAT_ARMOR		=	"Armor",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Carrack",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Ironclad",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							TYPE6	=
										{	ID	=	8,

											Description = 	"Modern",

										 	UNITCOMBAT_RECON 		=	"Recon",
										 	UNITCOMBAT_ARCHER		= 	"Support",
										 	UNITCOMBAT_SIEGE		=	"Artillery",
										 	UNITCOMBAT_MOUNTED		=	"Cavalry",
										 	UNITCOMBAT_MELEE		=	"Infantry",
										 	UNITCOMBAT_GUN 			= 	"Infantry",
										 	UNITCOMBAT_ARMOR		=	"Armor",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Battleship",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Destroyer",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							TYPE7	=
										{	ID	=	9,

											Description = 	"Atomic",

										 	UNITCOMBAT_RECON 		=	"Recon",
										 	UNITCOMBAT_ARCHER		= 	"Support",
										 	UNITCOMBAT_SIEGE		=	"Artillery",
										 	UNITCOMBAT_MOUNTED		=	"Cavalry",
										 	UNITCOMBAT_MELEE		=	"Infantry",
										 	UNITCOMBAT_GUN 			= 	"Infantry",
										 	UNITCOMBAT_ARMOR		=	"Armor",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Battleship",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Destroyer",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							TYPE8	=
										{	ID	=	10,

											Description = 	"Information",

										 	UNITCOMBAT_RECON 		=	"Recon",
										 	UNITCOMBAT_ARCHER		= 	"Support",
										 	UNITCOMBAT_SIEGE		=	"Artillery",
										 	UNITCOMBAT_MOUNTED		=	"Cavalry",
										 	UNITCOMBAT_MELEE		=	"Infantry",
										 	UNITCOMBAT_GUN 			= 	"Infantry",
										 	UNITCOMBAT_ARMOR		=	"Armor",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Cruiser",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Destroyer",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							TYPE9	=	
										{	ID = 11,

											Description = 	"Roman Units",

											UNITCOMBAT_RECON 		=	"Agrimensor",
										 	UNITCOMBAT_ARCHER		= 	"Sagittarii",
										 	UNITCOMBAT_SIEGE		=	"Ballistarius",
										 	UNITCOMBAT_MOUNTED		=	"Decurion",
										 	UNITCOMBAT_MELEE		=	"Legio",
										 	UNITCOMBAT_GUN 			= 	"Legionary",
										 	-- Technically this is not historical, but it sounds appropriate.
										 	UNITCOMBAT_ARMOR		=	"Centurion",
										 	-- Not sure about these names
										 	UNITCOMBAT_HELICOPTER	=	"Heli",
										 	UNITCOMBAT_NAVAL 		=	"Navy",
										 	UNITCOMBAT_NAVALRANGED	=	"Quinquereme",
										 	UNITCOMBAT_FIGHTER		=	"Fighter",
										 	UNITCOMBAT_BOMBER		=	"Bomber",
										 	UNITCOMBAT_NAVALMELEE	=	"Trireme",
										 	UNITCOMBAT_SUBMARINE	=	"Submarine",
										 	UNITCOMBAT_CARRIER		=	"Carrier"
										},

							END 	=	12
						}

	-- HYBRID. Takes Unit Type or Unit Class into consideration.
	-- HYBRID			=	{
	-- 						START 	=	8,

	-- 						TYPE1	=	{
	-- 										ID 	=	9,

	-- 										Description 			=	"Hybrid: Ancient",

	-- 										-- This is the setting used, if no exception is given
	-- 										BaseCombatClassSetting	=	3,
	-- 										UNITCLASS_CATAPAULT

	-- 									}

	-- 						END 	=	10
	-- 					}	
}

local contextSetting =
{
	NONE 			= 	{ ID = 0, Description = "None",					Tooltip="TXT_KEY_UNIT_CONTEXT_NONE"		},
	CITY 			= 	{ ID = 1, Description = "City",					Tooltip="TXT_KEY_UNIT_CONTEXT_CITY"		},
	LEADER 			= 	{ ID = 2, Description = "Leader",				Tooltip="TXT_KEY_UNIT_CONTEXT_LEADER"	},
	
	CIV 			= 	{ 
							NORMAL 		= 	{ ID = 3, Description = "Civlization",					Tooltip="TXT_KEY_UNIT_CONTEXT_CIVILIZATION"				}, 	
							ADJECTIVE 	= 	{ ID = 4, Description = "Civlization (with Adjective)",	Tooltip="TXT_KEY_UNIT_CONTEXT_CIVILIZATION_ADJECTIVE"	} 
						},

	FIXED 			= 	{ 
							START	=	5,

								-- NOTE: Keep the name of skews as TYPE[number]. The value of ID has to be above the start value, and unique
								TYPE1 	= 	{ ID = 6, Description = "Fixed - Regiment", VALUE = "Regiment",	Tooltip="TXT_KEY_UNIT_CONTEXT_FIXED_REGIMENT"	},	
								TYPE2 	= 	{ ID = 7, Description = "Fixed - Division", VALUE = "Division",	Tooltip="TEXT_KEY_UNIT_CONTEXT_FIXED_DIVISION"	},

							END 	=	8
						},
	ROMAN 			=	{
							ID = 9, Description = "Roman Legion Titles", Tooltip="TXT_KEY_UNIT_CONTEXT_ROMAN_LEGION",
							VALUES 	= 
									{ 	"Roma",			"Parthica",			"Italica",		"Augusta",		"Adiutrix", 	"Germanica", 	"Macriana", "Minervia",   	"Cyrenaica", "Gallica", 	"Flavia Felix", "Macedonica",
										"Scythica", 	"Alaudae", 			"Ferrata", 		"Hispana", 		"Victrix", 		"Claudia", 		"Gemina", 	"Fretensis", 	"Fulminata", "Apollinaris", "Primigenia",
										"Flavia Firma", "Valeria Vict.", 	"Rapax", 		"Deiotariana"
									}
						}
}

local arrangementSetting =
{
	NUMBER_COMBATCLASS_CONTEXT 	= 0,
	NUMBER_CONTEXT_COMBATCLASS 	= 1,
	CONTEXT_NUMBER_COMBATCLASS 	= 2,
	CONTEXT_COMBATCLASS_NUMBER	= 3,
	COMBATCLASS_NUMBER_CONTEXT	= 4,
	COMBATCLASS_CONTEXT_NUMBER	= 5
}

-- Note: Format for names TYPE .. [ID], so the ID HAS TO MATCH the Type number. White spaces between each part of a name is defined here. DONT FORGET THAT
local connectorSetting =
{
	TYPE1 	=	{ ID = 1, Description = "Blank"	,			VALUE = " "		},
	TYPE2	=	{ ID = 2, Description = "of"	, 			VALUE = " of "	},
	TYPE3	=	{ ID = 3, Description = "'s (Apostrophe)", 	VALUE = "'s " 	},
	TYPE4	=	{ ID = 4, Description = "None"	,			VALUE = ""		},
	TYPE5	=	{ ID = 5, Description = "the"	,			VALUE = " the "	}
}

-- Presets
local presetDefines =
{
	----------------------------
	-- Normal
	----------------------------
	NORMAL1 =
			{	ID = 1, Description = "Normal: Ancient/Classical", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	NORMAL2 =
			{	ID = 2, Description = "Normal: Medieval", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE3.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	NORMAL3 =
			{	ID = 3, Description = "Normal: Renaissance", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE4.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	NORMAL4 =
			{	ID = 4, Description = "Normal: Industrial", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE5.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	NORMAL5 =
			{	ID = 5, Description = "Normal: Modern", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE6.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},

	----------------------------
	-- Alternate
	----------------------------

	ALTERNATE1 =
			{	ID = 6, Description = "Alternate: Ancient/Classical", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.FIXED.TYPE2.ID,
						nameArrangement 	=	arrangementSetting.COMBATCLASS_NUMBER_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE1.ID
					}
			},
	ALTERNATE2 =
			{	ID = 7, Description = "Alternate: Medieval", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE3.ID,
						nameContext 		=	contextSetting.FIXED.TYPE2.ID,
						nameArrangement 	=	arrangementSetting.COMBATCLASS_NUMBER_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE1.ID
					}
			},
	ALTERNATE3 =
			{	ID = 8, Description = "Alternate: Renaissance", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE4.ID,
						nameContext 		=	contextSetting.FIXED.TYPE2.ID,
						nameArrangement 	=	arrangementSetting.COMBATCLASS_NUMBER_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE1.ID
					}
			},
	ALTERNATE4 =
			{	ID = 9, Description = "Alternate: Industrial", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE5.ID,
						nameContext 		=	contextSetting.FIXED.TYPE2.ID,
						nameArrangement 	=	arrangementSetting.COMBATCLASS_NUMBER_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE1.ID
					}
			},
	ALTERNATE5 =
			{	ID = 10, Description = "Alternate: Modern", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE6.ID,
						nameContext 		=	contextSetting.FIXED.TYPE2.ID,
						nameArrangement 	=	arrangementSetting.COMBATCLASS_NUMBER_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE1.ID
					}
			},

	----------------------------
	-- Others
	----------------------------
	
	ROMAN =
			{	ID = 11, Description = "Glory of Rome", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = false,

				VALUES =
					{
						nameUnitNumber 		=	numberSetting.ROMAN.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE9.ID,
						nameContext 		=	contextSetting.ROMAN.ID,
						nameArrangement 	=	arrangementSetting.COMBATCLASS_NUMBER_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE1.ID
					}
			},

	----------------------------
	-- Customs
	----------------------------

	CUSTOM1 = 
			{	ID = 12, Description = "Custom1", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = true,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	CUSTOM2 = 
			{	ID = 13, Description = "Custom2", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = true,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	CUSTOM3 = 
			{	ID = 14, Description = "Custom3", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = true,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	CUSTOM4 = 
			{	ID = 15, Description = "Custom4", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = true,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	CUSTOM5 = 
			{	ID = 16, Description = "Custom5", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = true,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	CUSTOM6 = 
			{	ID = 17, Description = "Custom6", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = true,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	CUSTOM7 = 
			{	ID = 18, Description = "Custom7", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = true,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			},
	CUSTOM8 = 
			{	ID = 19, Description = "Custom8", Tooltip="TXT_KEY_PRESET_COMMAN_TOOLTIP", Custom = true,
					
				VALUES = 
					{
						nameUnitNumber 		=	numberSetting.DYNAMIC.ID,
						nameCombatClass 	=	combatClassSetting.COMBATCLASS.TYPE1.ID,
						nameContext 		=	contextSetting.CITY.ID,
						nameArrangement 	=	arrangementSetting.NUMBER_COMBATCLASS_CONTEXT,
						nameFirstConnector 	=	connectorSetting.TYPE1.ID,
						nameSecondConnector =	connectorSetting.TYPE2.ID
					}
			}
}

-- This has to match number above, othewise those save variable wont be initialized
local totalCustomPresets = 8;

-- Overall Preset Defines
local overallPresetDefines =
{
	NORMAL =
			{
				ID = 1, Description = "Normal", Tooltip="Example: [COLOR_UNIT_TEXT]2nd Cavalry of Thebes[ENDCOLOR]",
				Preset = 
				{
					AncientEra 		= presetDefines.NORMAL1.ID,
					ClassicalEra 	= presetDefines.NORMAL1.ID,
					MedievalEra 	= presetDefines.NORMAL2.ID,
					RenaissanceEra 	= presetDefines.NORMAL3.ID,
					IndustrialEra 	= presetDefines.NORMAL4.ID,
					ModernEra 		= presetDefines.NORMAL5.ID,
					AtomicEra 		= presetDefines.NORMAL5.ID,
					InformationEra 	= presetDefines.NORMAL5.ID
				}
			},
	ALTERNATE =
			{
				ID = 2, Description = "Alternate", Tooltip="Example: [COLOR_UNIT_TEXT]Infantry 6th Division[ENDCOLOR]",
				Preset = 
				{
					AncientEra 		= presetDefines.ALTERNATE1.ID,
					ClassicalEra 	= presetDefines.ALTERNATE1.ID,
					MedievalEra 	= presetDefines.ALTERNATE2.ID,
					RenaissanceEra 	= presetDefines.ALTERNATE3.ID,
					IndustrialEra 	= presetDefines.ALTERNATE4.ID,
					ModernEra 		= presetDefines.ALTERNATE5.ID,
					AtomicEra 		= presetDefines.ALTERNATE5.ID,
					InformationEra 	= presetDefines.ALTERNATE5.ID
				}
			},
	ROMAN  =
			{
				ID = 3, Description = "Glory of Rome", Tooltip="Example: [COLOR_UNIT_TEXT]Legio IV Italica[ENDCOLOR]",
				Preset =
				{
					AncientEra 		= presetDefines.ROMAN.ID,
					ClassicalEra 	= presetDefines.ROMAN.ID,
					MedievalEra 	= presetDefines.ROMAN.ID,
					RenaissanceEra 	= presetDefines.ROMAN.ID,
					IndustrialEra 	= presetDefines.ROMAN.ID,
					ModernEra 		= presetDefines.ROMAN.ID,
					AtomicEra 		= presetDefines.ROMAN.ID,
					InformationEra 	= presetDefines.ROMAN.ID
				}
			}
	-- CUSTOM  =
	-- 		{
	-- 			ID = 4, Description = "Custom", Tooltip="",
	-- 			Preset =
	-- 			{
	-- 				AncientEra 		= presetDefines.CUSTOM.ID,
	-- 				ClassicalEra 	= presetDefines.CUSTOM.ID,
	-- 				MedievalEra 	= presetDefines.CUSTOM.ID,
	-- 				RenaissanceEra 	= presetDefines.CUSTOM.ID,
	-- 				IndustrialEra 	= presetDefines.CUSTOM.ID,
	-- 				ModernEra 		= presetDefines.CUSTOM.ID,
	-- 				AtomicEra 		= presetDefines.CUSTOM.ID,
	-- 				InformationEra 	= presetDefines.CUSTOM.ID
	-- 			}
	-- 		}
}


--=================================================================================================================================================================
-- Main Settings. Tweak this part of the code.
--=================================================================================================================================================================

-- Guide to these settings
-- Each name has three parts: Unit Number -- Combat Class -- City / Civ Name
-- You can either pick different 'types' of each part, disable a particular part, and even re-order them

--	This value turns on contextual naming. Used in the In-Game UI
local isContextualNamingEnabled = true

-- City check range. This determines how far a unit searches for a city
local cityCheckRange 		= 3

-- This determines if you want to name enemy units. Only enable this if using an add-on that lets you see the name of enemy units, obviously
local isNamingNonhumanUnits = false

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Unit Number Settings. This alters the Unit Number part of the name (Marked in double quotes). "5th" Keshik of Karakorum
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NONE						: Disables Unit Number part of the name
-- DYNAMIC					: It is tied to whatever setting you chose for the "Combat Class" and "Context", with a suffix ('st', 'nd', 'rd', 'th'). Recommended to use this
-- DYNAMIC_NORMAL			: It is tied to whatever setting you chose for the "Combat Class" and "Context", with no suffix.
-- GLOBAL					: It is not tied to anything and increments for every combat unit spawned

local nameUnitNumber		= numberSetting.DYNAMIC.ID

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Combat Class Settings. This alters the Combat Class part of the name (Marked in double quotes). 5th "Keshik" of Karakorum
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NONE						: Disables Combat Class part of the name
-- COMBATCLASS				: This part of the name is tied to its combat class type. Refer to various skew above, and assign the ID.
-- UNIT_TYPE				: This part of the name is tied to its unit type. A Swordsman will be called Swordsman, and a Horsman will be called Horseman

local nameCombatClass		= combatClassSetting.COMBATCLASS.TYPE1.ID

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Context Settings. This alters the Context part of the name (Marked in double quotes). 5th Keshik of "Karakorum"
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NONE						: Disables the Context part of the name
-- CITY						: This part of the name is tied to the city it was spawned in. A Keshik born in Karakorum will get "Karakorum" as its context.
-- CIV.NORMAL				: This part of the name is tied to the civlization. A Keshik trained by Mongolia, will get "Mongolia" as its context
-- CIV.ADJECTIVE			: This part of the name is tied to the civlization. A Keshik trained by Mongolia, will get "Mongolian" as its context
-- LEADER					: This part of the name is tied to leader of the civ. A Keshik trained by leader Genghis Khan, will get "Genghis Khan" as its context
-- FIXED					: Context part is fixed to what is set in the VALUE. Assign the ID to nameContext

local nameContext			=  contextSetting.CITY.ID


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Arrangement Settings. This alters how the name is written
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NUMBER_COMBATCLASS_CONTEXT	: 5th Keshik of Karakorum
-- NUMBER_CONTEXT_COMBATCLASS	: 5th Mongolian/Karakorum's Keshik.
-- CONTEXT_NUMBER_COMBATCLASS	: Karakorum's 5th Keshik
-- CONTEXT_COMBATCLASS_NUMBER	: Karakorum's Keshik 5th. Sounds weird.
-- COMBATCLASS_NUMBER_CONTEXT	: Cavalry 5th Division
-- COMBATCLASS_CONTEXT_NUMBER	: Cavalry Division 5th

local nameArrangement 		=  arrangementSetting.NUMBER_COMBATCLASS_CONTEXT

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Connector Settings. This alters each part of the name is connected to another
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TYPE1	:	(blank whitespace of length 1) 
-- TYPE2	:	of
-- TYPE3	: 	's (apostrophe)

local nameFirstConnector	=  	connectorSetting.TYPE1.ID

local nameSecondConnector	= 	connectorSetting.TYPE2.ID

-- This is like a preset for presets. It sets eraPresets.
local overallPreset			=	presetDefines.NORMAL1.ID

-- Era Presets. These values get ovewritten by the overallPreset. I set values here just for precaution, so that no nil values exist.
local ancientEraPreset		= presetDefines.NORMAL1.ID
local classicalEraPreset	= presetDefines.NORMAL1.ID
local medievalEraPreset		= presetDefines.NORMAL2.ID
local renaissanceEraPreset	= presetDefines.NORMAL3.ID
local industrialEraPreset	= presetDefines.NORMAL4.ID
local modernEraPreset		= presetDefines.NORMAL5.ID
local atomicEraPreset		= presetDefines.NORMAL5.ID
local informationEraPreset	= presetDefines.NORMAL5.ID

-- Compatability Mode. This turns off Era Auto Change Preset, and allows you a preset that is always active
local isCompatabilityMode 	= false
-- Doesnt have to be set, but I set to keep it non nil
local compatabilityPreset 	= presetDefines.NORMAL1.ID

--=================================================================================================================================================================
-- Functions. Most of these are getters and setters. DONT REMOVE THEM
--=================================================================================================================================================================

-- Print statements to see settings loaded properly
function printSettings()

	print("-----------------NameSettings: Current Settings-----------------")

	print("Enabled: " 						.. 	boolToString(	isContextualNamingEnabled))
	print("Overall Preset: "				..					overallPreset)
	print("Name Unit Number Setting: " 		.. 					nameUnitNumber)
	print("Name Combat Class Setting: " 	.. 					nameCombatClass)
	print("Name Context Setting: " 			.. 					nameContext)
	print("Name First Connector Setting: "	..					nameFirstConnector)
	print("Name Second Connector Setting: "	..					nameSecondConnector)
	print("Name Arrangement Setting: " 		.. 					nameArrangement)
	print("")
	print("-------ADVANCED SETTINGS-------")
	print("City Check Range: " 				..					cityCheckRange)
	print("Compatability Mode: "			..	boolToString(	isCompatabilityMode))
	print("Naming Non-Human Units: "		.. 	boolToString( 	isNamingNonhumanUnits))
	print("")
	print("----------ERA PRESETS----------")
	print("Ancient Era Preset: "			..					ancientEraPreset)
	print("Classical Era Preset: "			..					classicalEraPreset)
	print("Medieval Era Preset: "			..					medievalEraPreset)
	print("Renaissance Era Preset: "		..					renaissanceEraPreset)
	print("Industrial Era Preset: "			..					industrialEraPreset)
	print("Modern Era Preset: "				..					modernEraPreset)
	print("Atomic Era Preset: "				..					atomicEraPreset)
	print("Information Era Preset: "		..					informationEraPreset)
	print("")
	print("----------Other PRESETS----------")
	print("Compatability Preset: " 			.. 					compatabilityPreset)
	print("------------------------END OF SETTINGS------------------------")
	print("")
end
--Events.SequenceGameInitComplete.Add(printSettings)

function initializeSettings()

	-- If any of these settings are not set, re-setup all settings into memory. Not all settings have to be here, it is just for a precaution.
	if (	   contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_NUMBER") 				== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_COMBATCLASS") 			== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_CONTEXT") 				== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ARRANGEMENT") 			== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_FIRST_CONNECTOR") 		== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_SECOND_CONNECTOR") 		== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_CONTEXTUAL_ENABLED") 	== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_OVERALL_PRESET") 		== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ERA_PRESET_ANCIENT") 	== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ERA_PRESET_CLASSICAL") 	== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ERA_PRESET_MEDIEVAL") 	== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ERA_PRESET_RENAISSANCE") == nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ERA_PRESET_INDUSTRIAL") 	== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ERA_PRESET_MODERN") 		== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ERA_PRESET_ATOMIC") 		== nil
			or contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_ERA_PRESET_INFORMATION") == nil
		) then

		print("initializeSettings: Save values not setup. Saving now...")
		saveUserSettings()
	else
		print("initializeSettings: Save already present. Skipping overwrite...")
	end
end

-- Saves the current settings into the memory
function saveUserSettings()	
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_NUMBER", 			nameUnitNumber 		)
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_COMBATCLASS",		nameCombatClass 	)
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_CONTEXT", 			nameContext 		)
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ARRANGEMENT", 		nameArrangement 	)
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_FIRST_CONNECTOR",	nameFirstConnector 	)
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_SECOND_CONNECTOR", 	nameSecondConnector	)

	-- Extra variables
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_CONTEXTUAL_ENABLED", boolToInt(	isContextualNamingEnabled 	))
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_OVERALL_PRESET",					overallPreset 				)
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_CITY_CHECK_RANGE",				cityCheckRange 				)
	contextual_saveData.SetValue("CONTEXTUAL_NONHUMAN_NAMING_SETTING", 		boolToInt( 	isNamingNonhumanUnits 		))

	-- ERA PRESETS
	print("saveUserSettings: Setting up Era Presets")

	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_PRESET_COMPATABILITY",	compatabilityPreset	 )

	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_ANCIENT",		ancientEraPreset	 )
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_CLASSICAL",	classicalEraPreset	 )
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_MEDIEVAL",	medievalEraPreset	 )
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_RENAISSANCE",	renaissanceEraPreset )
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_INDUSTRIAL",	industrialEraPreset  )
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_MODERN",		modernEraPreset		 )
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_ATOMIC",		atomicEraPreset		 )
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_INFORMATION",	informationEraPreset )

	--Custom Presets Initialize
	print("saveUserSettings: Setting up custom presets...")
	for index=1, totalCustomPresets do
		print("saveUserSettings: Initializing Custom Preset no: " .. index)

		setCustomPresetNumber			(index, presetDefines["CUSTOM" .. index].VALUES.nameUnitNumber);
		setCustomPresetCombatClass		(index, presetDefines["CUSTOM" .. index].VALUES.nameCombatClass);
		setCustomPresetContext			(index, presetDefines["CUSTOM" .. index].VALUES.nameContext);
		setCustomPresetArrangement		(index, presetDefines["CUSTOM" .. index].VALUES.nameArrangement);
		setCustomPresetFirstConnector	(index, presetDefines["CUSTOM" .. index].VALUES.nameFirstConnector);
		setCustomPresetSecondConnector	(index, presetDefines["CUSTOM" .. index].VALUES.nameSecondConnector);
	end
	
	-- print("Settings Set As:")
	-- printSettings()
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GETTERS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- isContextualNamingEnabled
-- cityCheckRange
-- isNamingNonhumanUnits
-- nameUnitNumber
-- nameCombatClass
-- nameContext
-- nameArrangement
-- nameFirstConnector
-- nameSecondConnector

function getNameVaraibles()
	return numberSetting, combatClassSetting, contextSetting, arrangementSetting, connectorSetting
end

function getOverallPresetDefines()
	return overallPresetDefines
end

function getPresetDefines()
	return presetDefines
end

----------------------------------
-- START OF ERA PRESET
----------------------------------

function getAncientEraPresetSetting()
	return contextual_saveData.GetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_ANCIENT")
end

function getClassicalEraPresetSetting()
	return contextual_saveData.GetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_CLASSICAL")
end

function getMedievalEraPresetSetting()
	return contextual_saveData.GetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_MEDIEVAL")
end

function getRenaissanceEraPresetSetting()
	return contextual_saveData.GetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_RENAISSANCE")
end

function getIndustrialEraPresetSetting()
	return contextual_saveData.GetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_INDUSTRIAL")
end

function getModernEraPresetSetting()
	return contextual_saveData.GetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_MODERN")
end

function getAtomicEraPresetSetting()
	return contextual_saveData.GetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_ATOMIC")
end

function getInformationEraPresetSetting()
	return contextual_saveData.GetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_INFORMATION")
end

----------------------------------
-- END OF ERA PRESET
----------------------------------

function getIsContextualNamingEnabled()
	return intToBool( contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_CONTEXTUAL_ENABLED"))
end

function getCityCheckRangeSetting()
	return contextual_saveData.GetValue	("CONTEXTUAL_UNIT_NAME_CITY_CHECK_RANGE")
end

function getOverallPreset()
	return contextual_saveData.GetValue	("CONTEXTUAL_UNIT_NAME_OVERALL_PRESET")
end

-- Compatability -----------------
function getIsCompatabilityMode()
	return contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_PRESET_COMPATABILITY_SETTING")
end

function getCompatabilityPreset()
	return contextual_saveData.GetValue ("CONTEXTUAL_UNIT_NAME_PRESET_COMPATABILITY")
end

-- Non Human Settings ------------

function getIsNonhumanNamingSetting()
	return intToBool(contextual_saveData.GetValue ("CONTEXTUAL_NONHUMAN_NAMING_SETTING"))
end

----------------------------------
-- START OF CUSTOM PRESET
----------------------------------

function getCustomPresetNumber(index)
	return contextual_saveData.GetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_NUMBER")
end

function getCustomPresetCombatClass(index)
	return contextual_saveData.GetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_COMBATCLASS")
end

function getCustomPresetContext(index)
	return contextual_saveData.GetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_CONTEXT")
end

function getCustomPresetArrangement(index)
	return contextual_saveData.GetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_ARRANGEMENT")
end

function getCustomPresetFirstConnector(index)
	return contextual_saveData.GetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_FIRST_CONNECTOR")
end

function getCustomPresetSecondConnector(index)
	return contextual_saveData.GetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_SECOND_CONNECTOR")
end

-- Combines all returns from the previous ones. Do I even use this?
function getCustomPresetSetting(index)
	return getCustomPresetNumber(index), getCustomPresetCombatClass(index), getCustomPresetContext(index), getCustomPresetArrangement(index), getCustomPresetFirstConnector(index), getCustomPresetSecondConnector(index)
end

-----------------------------------
-- End of Custom Preset
-----------------------------------

function getNameUnitNumber()
	return contextual_saveData.GetValue	("CONTEXTUAL_UNIT_NAME_NUMBER")
end

function getNameUnitCombatClass()
	return contextual_saveData.GetValue	("CONTEXTUAL_UNIT_NAME_COMBATCLASS")
end

function getNameUnitContext()
	return contextual_saveData.GetValue	("CONTEXTUAL_UNIT_NAME_CONTEXT")
end

function getNameArrangement()
	return contextual_saveData.GetValue	("CONTEXTUAL_UNIT_NAME_ARRANGEMENT")
end

function getNameFirstConnector()
	return contextual_saveData.GetValue	("CONTEXTUAL_UNIT_NAME_FIRST_CONNECTOR")
end

function getNameSecondConnector()
	return contextual_saveData.GetValue	("CONTEXTUAL_UNIT_NAME_SECOND_CONNECTOR")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SETTERS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- isContextualNamingEnabled
-- cityCheckRange
-- isNamingNonhumanUnits
-- nameUnitNumber
-- nameCombatClass
-- nameContext
-- nameArrangement
-- nameFirstConnector
-- nameSecondConnector


----------------------------------
-- START OF CUSTOM PRESET
----------------------------------

function setCustomPresetNumber(index, value)
	contextual_saveData.SetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_NUMBER", 			value)
end

function setCustomPresetCombatClass(index, value)
	contextual_saveData.SetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_COMBATCLASS", 		value)
end

function setCustomPresetContext(index, value)
	contextual_saveData.SetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_CONTEXT", 			value)
end

function setCustomPresetArrangement(index, value)
	contextual_saveData.SetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_ARRANGEMENT", 		value)
end

function setCustomPresetFirstConnector(index, value)
	contextual_saveData.SetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_FIRST_CONNECTOR", 	value)
end

function setCustomPresetSecondConnector(index, value)
	contextual_saveData.SetValue ("CONTEXTUAL_CUSTOMPRESET" .. index .. "_UNIT_NAME_SECOND_CONNECTOR", 	value)
end

-----------------------------------
-- End of Custom Preset
-----------------------------------

function setIsContextualNamingEnabled(newValue)
	isContextualNamingEnabled = newValue
	contextual_saveData.SetValue ("CONTEXTUAL_UNIT_NAME_CONTEXTUAL_ENABLED",	boolToInt(	isContextualNamingEnabled ))
end

function setCityCheckRange(newValue)
	cityCheckRange = newValue
	contextual_saveData.SetValue ("CONTEXTUAL_UNIT_NAME_CITY_CHECK_RANGE",					cityCheckRange 	)
end

function setOverallPreset(newValue)
	overallPreset = newValue
	contextual_saveData.SetValue ("CONTEXTUAL_UNIT_NAME_OVERALL_PRESET",				overallPreset 		)
end

-- Compatability ------------------

function setIsCompatabilityMode(newValue)
	isCompatabilityMode = newValue
	contextual_saveData.SetValue ("CONTEXTUAL_UNIT_NAME_PRESET_COMPATABILITY_SETTING", 	isCompatabilityMode )
end

function setCompatabilityPreset(newValue)
	compatabilityPreset = newValue
	contextual_saveData.SetValue ("CONTEXTUAL_UNIT_NAME_PRESET_COMPATABILITY",			compatabilityPreset )
end

-- Non Human Settings ------------

function setIsNamingNonhumanUnits(newValue)
	isNamingNonhumanUnits = newValue
	contextual_saveData.SetValue ("CONTEXTUAL_NONHUMAN_NAMING_SETTING",			boolToInt(	isNamingNonhumanUnits ))
end

----------------------------------
-- START OF ERA PRESET
----------------------------------

function setAncientEraPresetSetting(value)
	ancientEraPreset = value
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_ANCIENT",			ancientEraPreset)
end

function setClassicalEraPresetSetting(value)
	classicalEraPreset = value
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_CLASSICAL",		classicalEraPreset)
end

function setMedievalEraPresetSetting(value)
	medievalEraPreset = value
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_MEDIEVAL",		medievalEraPreset)
end

function setRenaissanceEraPresetSetting(value)
	renaissanceEraPreset = value 
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_RENAISSANCE",		renaissanceEraPreset)
end

function setIndustrialEraPresetSetting(value)
	industrialEraPreset = value
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_INDUSTRIAL",		industrialEraPreset)
end

function setModernEraPresetSetting(value)
	modernEraPreset = value
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_MODERN",			modernEraPreset)
end

function setAtomicEraPresetSetting(value)
	atomicEraPreset = value
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_ATOMIC",			atomicEraPreset)
end

function setInformationEraPresetSetting(value)
	informationEraPreset = value
	contextual_saveData.SetValue("CONTEXTUAL_UNIT_NAME_ERA_PRESET_INFORMATION",		informationEraPreset)
end

----------------------------------
-- END OF ERA PRESET
----------------------------------

function setNameUnitNumber(newValue)
	nameUnitNumber = newValue
	contextual_saveData.SetValue	("CONTEXTUAL_UNIT_NAME_NUMBER",										nameUnitNumber				)
end

function setNameUnitCombatClass(newValue)
	nameCombatClass = newValue
	contextual_saveData.SetValue	("CONTEXTUAL_UNIT_NAME_COMBATCLASS",								nameCombatClass				)
end

function setNameUnitContext(newValue)
	nameContext = newValue
	contextual_saveData.SetValue	("CONTEXTUAL_UNIT_NAME_CONTEXT",									nameContext					)
end

function setNameUnitArrangement(newValue)
	nameArrangement = newValue
	contextual_saveData.SetValue	("CONTEXTUAL_UNIT_NAME_ARRANGEMENT",								nameArrangement				)
end

function setNameFirstConnector(newValue)
	nameFirstConnector = newValue
	contextual_saveData.SetValue	("CONTEXTUAL_UNIT_NAME_FIRST_CONNECTOR",							nameFirstConnector			)
end

function setNameSecondConnector(newValue)
	nameSecondConnector = newValue
	contextual_saveData.SetValue	("CONTEXTUAL_UNIT_NAME_SECOND_CONNECTOR",							nameSecondConnector			)
end

-- UTILS---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- function GetContextualPersistentProperty(name)
-- 	if (not contextual_saveProperies[name]) then

-- 		local val = contextual_saveData.GetValue(name)

-- 		if val then
-- 			contextual_saveProperies[name] = val
-- 		else
-- 			print("GetPersistentProperty: NO SAVED VALUE AVAILABLE. ERROR")
-- 		end
-- 	end

-- 	return contextual_saveProperies[name]
-- end

-- function SetContextualPersistentProperty(name, value)
--     if GetContextualPersistentProperty(name) == value then return end
--     contextual_saveData.SetValue(name, value)
--     contextual_saveProperies[name] = value
-- end

function boolToString(value)
	if value then
		return "True"
	else
		return "False"
	end
end

function boolToInt(value)
	if value then
		return 1
	else
		return 0
	end
end

function intToBool(value)
	if value == 1 then
		return true
	elseif value == 0 then
		return false
	else
		print("intToBool: Cant read value")
	end
end










--==================================================
-- SETUP
--==================================================

-- saveUserSettings()
initializeSettings()
--print("--------------------------CONTEXTUAL UNIT NAMES: Initial Varaible Check--------------------------")
printSettings()