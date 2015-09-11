/*
	File: fn_configuration.sqf
	Author: [midgetgrimm]
	Purpose: Main config for planned mission system, right now only fn_heliCrashes.sqf uses
	Notes: Global messages assist from eraser1, check notes on that
	TODO: better fill crate system; better messaging system;
*/
exsys_cc_debugMode = true;
exsys_cc_mapCenter = switch (toLower worldName) do {
	case "altis":		{[14600,16797.199,22.35]; };
	case "bornholm":	{[10058.3, 117.542, 9015.85]; };
};

exsys_cc_weapon = [
		["srifle_LRR_F","7Rnd_408_Mag",3],
		["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green",3],
		["srifle_DMR_03_ACO_F","20Rnd_762x51_Mag",3],
		["srifle_DMR_04_Tan_F","10Rnd_127x54_Mag",3],
		["srifle_DMR_05_hex_F","10Rnd_93x64_DMR_05_Mag",3],
		["srifle_DMR_06_camo_F","20Rnd_762x51_Mag",3],
		["arifle_TRG21_GL_F","30Rnd_556x45_Stanag",3],
		["arifle_TRG21_GL_F","UGL_FlareGreen_F",3],
		["arifle_MX_SW_F","100Rnd_65x39_caseless_mag",1],
		["arifle_Mk20_F","30Rnd_556x45_Stanag",3],
		["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder",3],
		["hgun_Pistol_heavy_01_F","11Rnd_45ACP_Mag",3]
];
exsys_cc_usableItem = [
	"Exile_Item_InstaDoc","Exile_Item_InstaDoc","Exile_Item_InstaDoc","Exile_Item_Catfood_Cooked","Exile_Item_CookingPot","Exile_Item_InstaDoc","Exile_Item_Surstromming_Cooked","Exile_Item_PlasticBottleFreshWater","Exile_Item_PlasticBottleFreshWater","Exile_Item_Matches","Rangefinder","ItemGPS","Exile_Item_CamoTentKit","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming","Exile_Item_SausageGravy","Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Catfood","Exile_Item_Rope","Exile_Item_DuctTape"
];

exsys_cc_attachments = [
	"optic_Nightstalker","optic_MRD","optic_MRCO","optic_LRPS","optic_KHS_tan","optic_KHS_hex","optic_KHS_blk","optic_Holosight","optic_Hamr","optic_DMS","optic_Arco"
];

exsys_cc_backPack = [
	"B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_dgtl","B_AssaultPack_khk","B_AssaultPack_mcamo","B_AssaultPack_rgr","B_AssaultPack_sgg","B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_ocamo","B_FieldPack_oucamo","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_ocamo","B_TacticalPack_mcamo","B_TacticalPack_oli","B_Kitbag_cbr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Carryall_cbr","B_Carryall_khk","B_Carryall_mcamo","B_Carryall_ocamo","B_Carryall_oli","B_Carryall_oucamo","B_Bergen_blk","B_Bergen_mcamo","B_Bergen_rgr","B_Bergen_sgg","B_HuntingBackpack","B_OutdoorPack_blk","B_OutdoorPack_blu","B_OutdoorPack_tan"
];

exsys_cc_clothes = [
	"B_Parachute","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_blk","V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrierH_CTRG","V_Rangemaster_belt","V_TacVest_camo","V_I_G_resistanceLeader_F","V_Chestrig_oli","U_I_Wetsuit","U_O_Wetsuit","U_B_Wetsuit","U_B_survival_uniform","U_O_GhillieSuit","U_O_FullGhillie_lsh","U_BG_leader","U_IG_leader","U_I_OfficerUniform","U_I_CombatUniform"
];

exsys_cc_rareItems = [
	"Exile_Item_WoodWallKit","Exile_Item_WoodGateKit","Exile_Item_WoodWindowKit","Exile_Item_WoodFloorPortKit","Exile_Item_WoodDoorKit","Exile_Item_WorkBenchKit","Exile_Item_WoodWallHalfKit","Exile_Item_WoodSupportKit","Exile_Item_WoodStairsKit","Exile_Item_WoodPlank","Exile_Item_StorageCrateKit","Exile_Item_PortableGeneratorKit","Exile_Item_MetalPole","Exile_Item_MetalBoard","Exile_Item_FloodLightKit","Exile_Item_CampFireKit","Exile_Item_CampFireKit","Exile_Item_CampFireKit","Exile_Item_SafeKit","Exile_Item_CodeLock"
];

exsys_cc_backUpCoords = [
	[12156.942,10559.936,6.7566476],[9978.2871,10243.397,8.0348911],[4952.3799,12681.224,40.712955],[8327.4844,11424.908,37.894329],[18645.348,10154.359,201.51491],[21728.203,7171.3091,13.959172],[23716.584,16267.91,5.3600001],[15872.413,16017.495,3.5469923],[15678.516,16701.068,16.965584],[19600.371,19218.439,27.386595],[25661.465,22167.375,60.479336],[21202.65,18745.406,23.562441],[5064.584,19172.135,246.52228],[8014.3467,22600.275,75.994545],[12531.412,19792.918,62.800682],[11639.334,16401.467,46.568279],[16282.361,19281.244,23.551466]
];

exsys_cc_boxes =[
	"CargoNet_01_box_F","CargoNet_01_box_F","CargoNet_01_box_F","Box_IND_WpsSpecial_F","Box_IND_Wps_F","Box_IND_WpsLaunch_F","Box_IND_AmmoVeh_F","Box_East_Wps_F","Box_NATO_AmmoOrd_F","Box_East_Support_F"
];

exsys_cc_wrecks = [
	"Land_Wreck_Heli_Attack_02_F","Land_UWreck_MV22_F","Land_UWreck_Heli_Attack_02_F","Land_Wreck_Heli_Attack_01_F"
];

exsys_cc_prisonNames = [
	"Leavenworth","Polunsky","Wabash Valley","Pelican Bay","Attica","Sing Sing","Folsom State","Alcatraz","Rikers Island","ADX","San Quentin","Hanoi Hilton","Tuol Sleng","Elmina Castle","Robben Island","Montelupich","Camp 1391","Camp 22","Carandiru","Tadmor","Diyarbakir","Gldani"
];


/*
	line below taken from eraser1 and his Defents Mission System for ExileMod -
	Had to use this for the global messaging as I couldn't get it working right
	So I just nicked this bit here and away we go!
	1. playerNotificationTypes 2.dynamicTextSize 3.dynamicTextColor 4.BroadcastMissionStatus
	// Notification types. Supported values are: ["advancedHintRequest","dynamicTextRequest","standardHintRequest","systemChatRequest"]
*/
exsys_cc_playerNotificationTypes = ["standardHintRequest"];
exsys_cc_dynamicTextSize = 0.55;
exsys_cc_dynamicTextColor = "#FFCC00";
exsys_cc_BroadcastMissionStatus = compileFinal "
							if !((typeName _this) == ""STRING"") then {
								_this = str _this;
							};
							{
								private ""_args"";
								_args =	[
											[_x, [_this]],
											[_x, [_this,0,exsys_cc_dynamicTextSize,exsys_cc_dynamicTextColor]]
										] select (_x == ""dynamicTextRequest"");

								_args call ExileServer_system_network_send_broadcast;
								false;
							} count exsys_cc_playerNotificationTypes;";

/*end eraser1 recompiles - thanks dude! xD*/
