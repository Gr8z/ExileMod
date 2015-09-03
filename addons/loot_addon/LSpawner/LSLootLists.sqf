//	Lootspawner junction lists for classes to spawn-/lootable items
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//here place Weapons an usable items (ex.: Binocular, ...)
//used with addWeaponCargoGlobal
//"lootWeapon_list" array of [class, [weaponlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								weaponlist	: list of weapon class names
lootWeapon_list = [
[ 0, [							// CIVIL
"Exile_Item_InstaDoc",
"arifle_MK20C_F",
"arifle_MK20_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"srifle_DMR_04_Tan_F",	
"srifle_DMR_05_blk_F",	
"srifle_DMR_05_hex_F", 				
"srifle_DMR_05_tan_f", 				
"srifle_DMR_06_camo_F", 				
"srifle_DMR_06_olive_F", 					
"srifle_EBR_F", 							
"srifle_GM6_camo_F", 				
"srifle_GM6_F", 		
"srifle_LRR_camo_F",					
"srifle_LRR_F", 
"Binocular",						//counts as weapon
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_PDW2000_F",
"hgun_Rook40_F",
"SMG_01_F",
"SMG_02_F"
]],[ 1, [						// MILITARY
"arifle_Katiba_C_F",
"srifle_DMR_02_F",
"arifle_Katiba_F",
"arifle_Katiba_GL_F",
"MMG_02_sand_F",
"arifle_Mk20C_F",
"arifle_Mk20_F",
"arifle_Mk20_GL_F",
"arifle_MXC_F",
"arifle_MXM_F",
"arifle_MX_F",
"arifle_MX_GL_F",
"arifle_MX_SW_F",
"arifle_SDAR_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"arifle_TRG21_GL_F",
"Binocular",
"hgun_ACPC2_snds_F",
"hgun_P07_snds_F",
"hgun_PDW2000_F",
"hgun_Rook40_snds_F",
"Laserdesignator",
"LMG_Mk200_F",
"srifle_DMR_04_F",
"LMG_Zafir_F",
"Rangefinder",
"SMG_01_F",
"SMG_02_F",
"srifle_DMR_05_ACO_F",
"arifle_MK20C_F",
"arifle_MK20_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"srifle_DMR_04_Tan_F",	
"srifle_DMR_05_blk_F",	
"srifle_DMR_05_hex_F", 				
"srifle_DMR_05_tan_f", 				
"srifle_DMR_06_camo_F", 				
"srifle_DMR_06_olive_F", 					
"srifle_EBR_F", 							
"srifle_GM6_camo_F", 				
"srifle_GM6_F", 		
"srifle_LRR_camo_F",					
"srifle_LRR_F" 
]],[ 2, [
"Exile_Item_InstaDoc",
"arifle_Katiba_C_F",
"arifle_Mk20C_F",
"arifle_Mk20_F",
"arifle_MXC_F",
"arifle_SDAR_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"Binocular",
"SMG_01_F",
"SMG_02_F"
]],[ 3, [						// RESEARCH
"Rangefinder",						//counts as weapon
"srifle_GM6_F",
"srifle_LRR_F"
]]];

//-------------------------------------------------------------------------------------
//here place magazines, weaponattachments and bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//"lootMagazine_list" array of [class, [magazinelist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								magazinelist: list of magazine class names
lootMagazine_list = [
[ 0, [							// CIVIL
"Exile_Item_InstaDoc",
"100Rnd_65x39_caseless_mag",
"100Rnd_65x39_caseless_mag_Tracer",
"10Rnd_127x54_Mag",
"10Rnd_338_Mag",
"10Rnd_762x54_Mag",
"10Rnd_93x64_DMR_05_Mag",
"11Rnd_45ACP_Mag",
"130Rnd_338_Mag",
"150Rnd_762x54_Box",
"150Rnd_762x54_Box_Tracer",
"150Rnd_93x64_Mag",
"16Rnd_9x21_Mag",
"200Rnd_65x39_cased_Box",
"200Rnd_65x39_cased_Box_Tracer",
"20Rnd_556x45_UW_mag",
"20Rnd_762x51_Mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_45ACP_Mag_SMG_01_tracer_green",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_mag_Tracer",
"30Rnd_9x21_Mag",
"5Rnd_127x108_APDS_Mag",
"5Rnd_127x108_Mag",
"6Rnd_45ACP_Cylinder",
"6Rnd_GreenSignal_F",
"6Rnd_RedSignal_F",
"7Rnd_408_Mag",
"9Rnd_45ACP_Mag",
"HandGrenade",
"HandGrenade_Stone"
]],[ 1, [						// MILITARY
"Exile_Item_InstaDoc",
"100Rnd_65x39_caseless_mag",
"100Rnd_65x39_caseless_mag_Tracer",
"10Rnd_127x54_Mag",
"10Rnd_338_Mag",
"10Rnd_762x54_Mag",
"10Rnd_93x64_DMR_05_Mag",
"11Rnd_45ACP_Mag",
"130Rnd_338_Mag",
"150Rnd_762x54_Box",
"150Rnd_762x54_Box_Tracer",
"150Rnd_93x64_Mag",
"16Rnd_9x21_Mag",
"200Rnd_65x39_cased_Box",
"200Rnd_65x39_cased_Box_Tracer",
"20Rnd_556x45_UW_mag",
"20Rnd_762x51_Mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_45ACP_Mag_SMG_01_tracer_green",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_mag_Tracer",
"30Rnd_9x21_Mag",
"5Rnd_127x108_APDS_Mag",
"5Rnd_127x108_Mag",
"6Rnd_45ACP_Cylinder",
"6Rnd_GreenSignal_F",
"6Rnd_RedSignal_F",
"7Rnd_408_Mag",
"9Rnd_45ACP_Mag"
]],[ 2, [						// INDUSTRIAL
"Exile_Item_InstaDoc",
"20Rnd_556x45_UW_mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_mag_Tracer",
"30Rnd_9x21_Mag"
]],[ 3, [						// RESEARCH
"Exile_Item_InstaDoc",
"5Rnd_127x108_Mag",
"7Rnd_408_Mag"
]]];

//-------------------------------------------------------------------------------------
//here place hats, glasses, clothes, uniforms, vests
//used with addItemCargoGlobal
//"lootItem_list" array of [class, [itemlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								itemlist	: list of item class names
lootItem_list = [
[ 0, [							// CIVIL
"Exile_Item_InstaDoc",
"Exile_Item_PlasticBottleFreshWater",
"Exile_Item_Beer",
"Exile_Item_Energydrink",
"Exile_Item_Rope",
"Exile_Item_DuctTape",
"Exile_Item_ExtensionCord",
"Exile_Item_FuelCanisterEmpty",
"Exile_Item_JunkMetal",
"Exile_Item_LightBulb",
"Exile_Item_MetalBoard",
"Exile_Item_MetalPole",
"Exile_Item_CamoTentKit",
"bipod_01_F_blk",
"bipod_01_F_mtp",
"bipod_01_F_snd",
"bipod_02_F_blk",
"bipod_02_F_hex",
"bipod_02_F_tan",
"bipod_03_F_blk",
"U_O_OfficerUniform_ocamo",
"U_O_SpecopsUniform_blk",
"U_O_SpecopsUniform_ocamo",
"U_I_G_Story_Protagonist_F",
"U_C_HunterBody_grn",
"U_IG_Guerilla1_1",
"U_IG_Guerilla2_1",
"U_IG_Guerilla2_2",
"U_IG_Guerilla2_3",
"U_IG_Guerilla3_1",
"U_BG_Guerilla2_1",
"U_IG_Guerilla3_2",
"U_BG_Guerrilla_6_1",
"U_BG_Guerilla1_1",
"U_BG_Guerilla2_2",
"U_BG_Guerilla2_3",
"U_BG_Guerilla3_1",
"U_BG_leader",
"U_IG_leader",
"U_I_G_resistanceLeader_F",
"U_B_FullGhillie_ard",
"U_B_FullGhillie_lsh",
"U_B_FullGhillie_sard",
"U_B_GhillieSuit",
"U_I_FullGhillie_ard",
"U_I_FullGhillie_lsh",
"H_Bandanna_gry",
"H_Beret_red",
"H_Booniehat_dirty",
"H_Cap_blu",
"H_Cap_grn",
"H_Cap_red",
"H_Hat_brown",
"H_Hat_checker",
"H_Hat_grey",
"muzzle_snds_338_black",
"muzzle_snds_338_green",
"muzzle_snds_338_sand",
"muzzle_snds_93mmg",
"muzzle_snds_93mmg_tan",
"muzzle_snds_acp",
"muzzle_snds_B",
"muzzle_snds_H",
"muzzle_snds_H_MG",
"muzzle_snds_H_SW",
"muzzle_snds_L",
"muzzle_snds_M",
"optic_Aco",
"optic_ACO_grn",
"optic_aco_smg",
"optic_Holosight",
"optic_Holosight_smg",
"U_C_Commoner1_1",
"U_C_Poloshirt_redwhite",
"V_BandollierB_blk",
"V_BandollierB_oli",
"V_TacVestCamo_khk",
"V_TacVestIR_blk",
"V_TacVest_blk",
"V_TacVest_blk_POLICE",
"V_TacVest_brn",
"V_TacVest_camo",
"V_TacVest_khk",
"V_TacVest_oli",
"ItemWatch"						//<----Make sure last line has NO COMMA AT THE END
]],[ 1, [						// MILITARY
"Exile_Item_InstaDoc",
"acc_flashlight",
"acc_pointer_IR",
"B_UavTerminal",
"H_HelmetB_camo",
"H_HelmetB_paint",
"H_HelmetIA_net",
"H_HelmetSpecB_blk",
"H_PilotHelmetFighter_I",
"muzzle_snds_acp",
"muzzle_snds_B",
"muzzle_snds_H",
"muzzle_snds_H_MG",
"muzzle_snds_L",
"muzzle_snds_M",
"NVGoggles",
"NVGoggles_INDEP",
"NVGoggles_OPFOR",
"optic_Aco",
"optic_ACO_grn",
"optic_aco_smg",
"optic_Arco",
"optic_Hamr",
"optic_Holosight",
"optic_Holosight_smg",
"optic_NVS",
"optic_SOS",
"O_UavTerminal",
"Exile_Item_InstaDoc",
"U_B_CombatUniform_mcam",
"U_B_GhillieSuit",
"U_I_CombatUniform",
"U_I_GhillieSuit",
"U_O_CombatUniform_ocamo",
"U_O_GhillieSuit",
"V_Chestrig_blk",
"V_HarnessOGL_brn",
"V_HarnessOSpec_brn",
"V_HarnessO_brn",
"V_PlateCarrier1_blk",
"V_PlateCarrier2_rgr",
"V_PlateCarrier3_rgr",
"V_PlateCarrierGL_rgr",
"V_PlateCarrierIA1_dgtl",
"V_PlateCarrierIA2_dgtl",
"V_PlateCarrierIAGL_dgtl",
"V_PlateCarrierSpec_rgr",
"V_RebreatherB",
"V_RebreatherIA",
"V_RebreatherIR"
]],[ 2, [						// INDUSTRIAL
"Exile_Item_InstaDoc",
"Exile_Item_Rope",
"Exile_Item_DuctTape",
"Exile_Item_ExtensionCord",
"Exile_Item_FuelCanisterEmpty",
"Exile_Item_JunkMetal",
"Exile_Item_LightBulb",
"Exile_Item_MetalBoard",
"Exile_Item_Matches",
"Exile_Item_CookingPot",
"Binocular",
"Rangefinder",
"Laserdesignator",
"Laserdesignator_02",
"Laserdesignator_03",
"NVGoggles",
"NVGoggles_INDEP",
"NVGoggles_OPFOR",
"ItemGPS",
"ItemMap",
"ItemCompass",
"ItemRadio",
"ItemWatch",
"U_B_Wetsuit",
"U_I_Wetsuit",
"U_O_Wetsuit",
"V_RebreatherB",
"V_RebreatherIA",
"V_RebreatherIR"
]],[ 3, [						// RESEARCH
"Exile_Item_InstaDoc",
"NVGoggles",
"NVGoggles_INDEP",
"NVGoggles_OPFOR",
"optic_Nightstalker",
"optic_NVS",
"optic_SOS",
"O_UavTerminal"
]]];

//-------------------------------------------------------------------------------------
//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//"lootBackpack_list" array of [class, [backpacklist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								backpacklist: list of backpack class names
lootBackpack_list = [
[ 0, [							// CIVIL
"Exile_Item_InstaDoc",
"B_AssaultPack_cbr",
"B_AssaultPack_dgtl",
"B_AssaultPack_khk",
"B_AssaultPack_mcamo",
"B_AssaultPack_ocamo",
"B_AssaultPack_rgr",
"B_AssaultPack_sgg",
"B_FieldPack_blk",
"B_FieldPack_cbr",
"B_FieldPack_khk",
"B_FieldPack_ocamo",
"B_FieldPack_oli",
"B_FieldPack_oucamo",
"B_Kitbag_cbr",
"B_Kitbag_mcamo",
"B_Kitbag_rgr",
"B_Kitbag_sgg"
]],[ 1, [						// MILITARY
"Exile_Item_InstaDoc",
"B_Carryall_cbr",					// 60 Mags
"B_FieldPack_blk",					// 35 Mags
"B_FieldPack_ocamo",
"B_FieldPack_oli",
"B_FieldPack_oucamo",
"B_HMG_01_support_F",
"B_HMG_01_support_high_F"
]],[ 2, [						// INDUSTRIAL
"Exile_Item_InstaDoc",
"Binocular",
"Rangefinder",
"Laserdesignator",
"Laserdesignator_02",
"Laserdesignator_03",
"NVGoggles",
"NVGoggles_INDEP",
"NVGoggles_OPFOR",
"ItemGPS",
"ItemMap",
"ItemCompass",
"ItemRadio",
"ItemWatch",
"B_Carryall_cbr",					// 60 Mags
"B_TacticalPack_oli",
"B_TacticalPack_rgr"
]],[ 3, [						// RESEARCH
"Exile_Item_InstaDoc",
"B_TacticalPack_oli"
]]];


//-------------------------------------------------------------------------------------
//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//"lootworldObject_list" array of [class, [objectlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								objectlist	: list of worldobject class names
lootworldObject_list = [
[ 0, [							// CIVIL
"Exile_Item_InstaDoc",
"Exile_Item_Catfood_Cooked",
"Exile_Item_Catfood", 					// food
"Exile_Item_PlasticBottleFreshWater",			// water
"Exile_Item_Energydrink", 					// energydrink
"Exile_Item_DuctTape"					// repairkit
]],[ 1, [						// MILITARY
""				// repairkit
]],[ 2, [						// INDUSTRIAL
"Exile_Item_FuelCanisterEmpty",     //jerry
"Exile_Item_FuelCanisterFull",   //jerry
"Exile_Item_InstaDoc",
"Exile_Item_DuctTape"				// repairkit
]],
[ 3, [						// RESEARCH
"Exile_Item_InstaDoc",
"Exile_Item_DuctTape",				// repairkit
"Exile_Item_FuelCanisterEmpty",     //jerry
"Exile_Item_FuelCanisterFull"     //jerry
]]];
