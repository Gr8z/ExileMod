///////////////////////////////////////////////////////////////////
/*                    Mission Config                             */
///////////////////////////////////////////////////////////////////
// VEMF Debug Settings:
// Creates a lot of RPT Entries, turn off after debugging
VEMFDebugLocs = false;
VEMFDebugAI = false;
VEMFDebugFunc = false;

// AI Group Count per City
// Default is 3 Groups
VEMFGroupCnt = 3;

// Punish Players who Run Over AI?
// Causes 10% Vehicle Damage per AI Runover
VEMFPunishRunover = true;

// Dynamic Crate Loot?
// Blacklist Still Applies
VEMFDynCrate = true;

// Crate Loot List
// (DynCrate must be off)
VEMFLootList = [
	""
];

// Blacklist Crate Loot
VEMFCrateBlacklist = [
	"DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ATMine_Range_Mag",
	"ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag",
	"APERSTripMine_Wire_Mag"
];

// Min & Max Mission Times (Will Be Made Better)
// Time is in Minutes
// Min Must Be Less Than Max
VEMFMinMissTime = 5;
VEMFMaxMissTime = 20;

// Timeout (No Players Near)
// Time in minutes
VEMFTimeoutTime = 20;

// Enable Timeout?
// In false waits forever
VEMFTimeout = true;

// Announce to Last Killer or to Near Players?
// Distance in Meters. 0 for Last Killer option.
VEMFMissEndAnn = 0;

// Mission Name Array
VEMFMissionArray = ["DynamicTownInvasion"];

// Custom Addon Array (Don't Touch Unless You're Positive)
// What is your addon script name?
// Example: Caves.sqf
VEMFAddon = [""];

// Blacklist Zone Array -- missions will not spawn in these areas
// format: [[x,y,z],radius]
// Ex: [[06325,07807,0],300] //Starry Sobor
VEMFBlacklistZones = [
	[[0,0,0],50]
];

///////////////////////////////////////////////////////////////////
/*                       AI Config                               */
///////////////////////////////////////////////////////////////////

// Generate Dynamic Weapon List?
// If True WeaponLists Below Ignored
// Recommended to Use With Blacklist
VEMFDynWeapons = true;

// Required Kill Percentage
// Example 0.80 (80%)
VEMFRequiredKillPercent = 0.80;

// Blacklisted Weapons
VEMFWepBlack = [
	"srifle_GM6_F",
	"srifle_LRR_F"
];

// AI Headgear Array
// 39-70, 74-92, Festives
VEMFHeadgearList = [
	"H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass","H_HelmetB_light_sand","H_HelmetB_light_snakeskin","H_HelmetIA","H_HelmetIA_camo","H_HelmetIA_net","H_HelmetB","H_HelmetB_black","H_HelmetB_camo","H_HelmetB_desert","H_HelmetB_grass"
	,"H_HelmetB_paint","H_HelmetB_plain_blk","H_HelmetB_sand","H_HelmetB_snakeskin","H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetSpecO_blk","H_HelmetSpecO_ocamo","H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo"
];

// AI Uniform Array
VEMFUniformList = [
	"U_O_CombatUniform_ocamo", "U_O_PilotCoveralls", "U_OG_Guerilla1_1", "U_OG_Guerilla2_1", "U_OG_Guerilla2_3",
	"U_OG_Guerilla3_1", "U_OG_Guerilla3_2", "U_OG_leader", "U_C_Poloshirt_stripped", "U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite", "U_C_Poor_1", "U_C_WorkerCoveralls", "U_C_Journalist",
	"U_OrestesBody", "U_CamoRed_uniform", "U_CamoBrn_uniform", "U_CamoBlue_uniform", "U_Camo_uniform", "U_C_Driver_3", "U_C_Driver_4"
];

// AI Vest Array
VEMFVestList = [
	"V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr","V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr","V_Press_F",
	"V_Rangemaster_belt","V_TacVest_blk","V_TacVest_blk_POLICE","V_TacVest_brn","V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_TacVestCamo_khk","V_TacVestIR_blk",
	"V_I_G_resistanceLeader_F","V_HarnessO_brn","V_HarnessO_gry","V_HarnessOGL_brn","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_HarnessOSpec_gry","V_PlateCarrier1_blk",
	"V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarrier3_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierGL_rgr","V_PlateCarrierH_CTRG",
	"V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierL_CTRG","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_rgr",
	// DLC Vests
	"V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli"
];

// AI Rifle Array
VEMFRiflesList = [
	"srifle_EBR_F","srifle_DMR_01_F","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F",
	"arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F",
	"arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F","SMG_01_F",
	"SMG_02_F","hgun_PDW2000_F","arifle_MXM_Black_F","arifle_MX_GL_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","Rollins_F",
	"LMG_Mk200_F","arifle_MX_SW_F","LMG_Zafir_F","arifle_MX_SW_Black_F"
];

// AI Pistol Array
VEMFPistolsList = [
	"hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Pistol_Signal_F"
];

/* ======== Do Not Modify Below ======== */
diag_log text format ["[VEMF]: Configuration File Loaded!"];
VEMFVersion = "1.0.0c-PreAlpha";