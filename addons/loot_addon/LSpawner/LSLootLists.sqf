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
"arifle_MK20C_F",
"arifle_MK20_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"Binocular",						//counts as weapon
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_PDW2000_F",
"hgun_Rook40_F",
"SMG_01_F",
"SMG_02_F",
"srifle_EBR_F"
]],[ 1, [						// MILITARY
"arifle_Katiba_C_F",
"arifle_Katiba_F",
"arifle_Katiba_GL_F",
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
"LMG_Zafir_F",
"Rangefinder",
"SMG_01_F",
"SMG_02_F",
"srifle_EBR_F",
"srifle_GM6_F",
"srifle_LRR_F"
]],[ 2, [
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
"Laserdesignator",					//counts as weapon
"Rangefinder",						//counts as weapon
"srifle_GM6_F",
"srifle_LRR_F"
]],[ 4, [						// MEDICAL
"Laserdesignator"
]],[ 5, [						// FOOD
"Laserdesignator"
]],[ 6, [						// HANGARS
"Laserdesignator"
]]];

//-------------------------------------------------------------------------------------
//here place magazines, weaponattachments and bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//"lootMagazine_list" array of [class, [magazinelist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								magazinelist: list of magazine class names
lootMagazine_list = [
[ 0, [							// CIVIL
"16Rnd_9x21_Mag",
"20Rnd_556x45_UW_mag",
"20Rnd_762x51_Mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_556x45_Stanag",
"30Rnd_9x21_Mag",
"9Rnd_45ACP_Mag",
"HandGrenade",
"HandGrenade_Stone"
]],[ 1, [						// MILITARY
"100Rnd_65x39_caseless_mag",
"100Rnd_65x39_caseless_mag_Tracer",
"150Rnd_762x51_Box",
"150Rnd_762x51_Box_Tracer",
"16Rnd_9x21_Mag",
"1Rnd_HE_Grenade_shell",
"1Rnd_SmokeBlue_Grenade_shell",
"1Rnd_SmokeGreen_Grenade_shell",
"1Rnd_SmokeOrange_Grenade_shell",
"1Rnd_SmokePurple_Grenade_shell",
"1Rnd_SmokeRed_Grenade_shell",
"1Rnd_SmokeYellow_Grenade_shell",
"1Rnd_Smoke_Grenade_shell",
"200Rnd_65x39_cased_Box",
"200Rnd_65x39_cased_Box_Tracer",
"20Rnd_556x45_UW_mag",
"20Rnd_762x51_Mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_mag_Tracer",
"30Rnd_9x21_Mag",
"3Rnd_HE_Grenade_shell",
"3Rnd_SmokeBlue_Grenade_shell",
"3Rnd_SmokeGreen_Grenade_shell",
"3Rnd_SmokeOrange_Grenade_shell",
"3Rnd_SmokePurple_Grenade_shell",
"3Rnd_SmokeRed_Grenade_shell",
"3Rnd_SmokeYellow_Grenade_shell",
"3Rnd_Smoke_Grenade_shell",
"5Rnd_127x108_Mag",
"7Rnd_408_Mag",
"9Rnd_45ACP_Mag",
"APERSBoundingMine_Range_Mag",
"APERSMine_Range_Mag",
"APERSTripMine_Wire_Mag",
"ATMine_Range_Mag",
"ClaymoreDirectionalMine_Remote_Mag",
"HandGrenade",
"MiniGrenade",
"SLAMDirectionalMine_Wire_Mag",
"500Rnd_127x99_mag",
"100Rnd_127x99_mag_Tracer_Yellow"
]],[ 2, [						// INDUSTRIAL
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
"5Rnd_127x108_Mag",
"7Rnd_408_Mag",
"500Rnd_127x99_mag",
"100Rnd_127x99_mag_Tracer_Yellow"
]],[ 4, [						// MEDICAL
"Laserdesignator"
]],[ 5, [						// FOOD
"Laserdesignator"
]],[ 6, [						// HANGARS
"Laserdesignator"
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
"Exile_Melee_Axe",
"Exile_Item_Matches",
"Exile_Item_FuelCanisterFull",
"Exile_Item_FuelCanisterEmpty",
"Exile_Item_DuctTape",
"ItemCompass",
"ItemGPS",
"ItemWatch",
"Binocular",
"Exile_Item_InstaDoc",
"Exile_Item_Catfood_Cooked",
"Exile_Item_Catfood",
"Exile_Item_PlasticBottleFreshWater",
"Exile_Item_Energydrink", 	
"H_Bandanna_gry",
"H_Beret_red",
"H_Booniehat_dirty",
"H_Cap_blu",
"H_Cap_grn",
"H_Cap_red",
"H_Hat_brown",
"H_Hat_checker",
"H_Hat_grey",
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
"ItemMap",
"ItemRadio",
"ItemCompass",
"ItemWatch"						//<----Make sure last line has NO COMMA AT THE END
]],[ 1, [						// MILITARY
"acc_flashlight",
"acc_pointer_IR",
"H_HelmetB_camo",
"H_HelmetB_paint",
"H_HelmetIA_net",
"H_HelmetSpecB_blk",
"H_PilotHelmetFighter_I",
"ItemGPS",
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
"optic_Nightstalker",
"optic_NVS",
"optic_SOS",
"VehicleRepairLg",
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
"V_PlateCarrierSpec_rgr"
]],[ 2, [						// INDUSTRIAL
"ItemCompass",
"ItemMap",
"ItemWatch",
"U_B_Wetsuit",
"U_I_Wetsuit",
"U_O_Wetsuit",
"Exile_Item_WoodPlank",
"Exile_Item_Rope",
"Exile_Item_DuctTape",
"Exile_Item_ExtensionCord",
"Exile_Item_FuelCanisterEmpty",
"Exile_Item_JunkMetal",
"Exile_Item_LightBulb",
"Exile_Item_MetalBoard",
"Exile_Item_Matches",
"Exile_Item_CookingPot"
]],[ 3, [						// RESEARCH
"ItemGPS",
"NVGoggles",
"NVGoggles_INDEP",
"NVGoggles_OPFOR",
"optic_Nightstalker",
"optic_NVS",
"optic_SOS"
]],[ 4, [						// MEDICAL
"Exile_Item_InstaDoc" 
]],[ 5, [						// FOOD
"Exile_Item_Catfood_Cooked",
"Exile_Item_Catfood",
"Exile_Item_PlasticBottleFreshWater",
"Exile_Item_Energydrink"
]],[ 6, [						// HANGARS
"ItemCompass",
"ItemMap",
"ItemWatch",
"ItemGPS",
"Exile_Item_FuelCanisterEmpty",     //jerry
"Exile_Item_FuelCanisterFull",   //jerry
"Exile_Item_DuctTape",
"Exile_Item_JunkMetal",
"Exile_Item_LightBulb",
"Exile_Item_MetalBoard",
"Exile_Item_Matches",
"Exile_Item_CookingPot"
]]];

//-------------------------------------------------------------------------------------
//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//"lootBackpack_list" array of [class, [backpacklist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								backpacklist: list of backpack class names
lootBackpack_list = [
[ 0, [							// CIVIL
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
"B_Kitbag_sgg",
"V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr","V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr","V_Press_F",
"V_Rangemaster_belt","V_TacVest_blk","V_TacVest_blk_POLICE","V_TacVest_brn","V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_TacVestCamo_khk","V_TacVestIR_blk",
"V_I_G_resistanceLeader_F","V_HarnessO_brn","V_HarnessO_gry","V_HarnessOGL_brn","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_HarnessOSpec_gry","V_PlateCarrier1_blk",
"V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarrier3_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierGL_rgr","V_PlateCarrierH_CTRG",
"V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierL_CTRG","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp",
"V_PlateCarrierSpec_rgr",
// DLC Vests
"V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli",
"H_HelmetSpecB_paint1",
"H_HelmetIA_camo",
"H_HelmetLeaderO_ocamo",
"H_HelmetLeaderO_oucamo",
"H_PilotHelmetHeli_I",
"H_PilotHelmetHeli_O",
"H_PilotHelmetFighter_I",
"H_PilotHelmetFighter_O",
"H_HelmetCrew_O",
"H_CrewHelmetHeli_I"
]],[ 1, [						// MILITARY
"B_BergenG",						// 64 Mags
"B_Carryall_cbr",					// 60 Mags
"B_FieldPack_blk",					// 35 Mags
"B_FieldPack_ocamo",
"B_FieldPack_oli",
"B_FieldPack_oucamo",
"B_GMG_01_high_weapon_F",
"B_GMG_01_weapon_F",
"B_HMG_01_support_F",
"B_HMG_01_support_high_F",
"B_HMG_01_weapon_F",
"B_Mortar_01_support_F",
"B_Mortar_01_weapon_F",
"B_TacticalPack_blk",				// 42 Mags
"B_TacticalPack_mcamo",
"B_TacticalPack_ocamo",
"B_TacticalPack_oli",
"B_TacticalPack_rgr"
]],[ 2, [						// INDUSTRIAL
"B_Carryall_cbr",					// 60 Mags
"B_TacticalPack_oli",
"B_TacticalPack_rgr"
]],[ 3, [						// RESEARCH
"Exile_Item_SafeKit",
"B_GMG_01_high_weapon_F",
"B_GMG_01_weapon_F",
"B_HMG_01_support_F",
"B_HMG_01_support_high_F",
"B_HMG_01_weapon_F",
"B_Mortar_01_support_F",
"B_Mortar_01_weapon_F"
]],[ 4, [						// MEDICAL
"Exile_Item_InstaDoc"
]],[ 5, [						// FOOD
"Exile_Item_Catfood_Cooked",
"Exile_Item_Catfood", 					// food
"Exile_Item_PlasticBottleFreshWater",			// water
"Exile_Item_Energydrink"
]],[ 6, [						// HANGARS
"Exile_Item_DuctTape"
]]];

//-------------------------------------------------------------------------------------
//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//"lootworldObject_list" array of [class, [objectlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								objectlist	: list of worldobject class names
lootworldObject_list = [
[ 0, [							// CIVIL

]],[ 1, [						// MILITARY

]],[ 2, [						// INDUSTRIAL

]],[ 3, [						// RESEARCH

]],[ 4, [						// MEDICAL

]],[ 5, [						// FOOD

]],[ 6, [						// HANGARS

]]
];