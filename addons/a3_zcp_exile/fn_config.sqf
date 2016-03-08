// First person in the Cap zone is the capper (If he leaves, the closest on of the group is the new capper but time is reset!).
// When multiple people are in the zone and not in the same group, the zone is contested.
// Being first in the zone starts the timer.
// Holding a zone  gives you a reward after x Min.

ZCP_dev = false; // Devmode for shorter development capture times

ZCP_DMS_doIUseDMS = true; // Use DMS to spawn AI IF CapturePoint has spawnAI = true
ZCP_Min_AI_Amount = 4; // Min ammount of AI at a ZCP
ZCP_Random_AI_Max = 8; // so min 4 and max 12 (4+8) AI

ZCP_CapTime = 600; // Seconds to cap an area uncontested
ZCP_CapRadius = 130; // Meter radius of the capture circle around the first object.
ZCP_MinWaitTime = 600; // seconds to wait to spawn a new capturepoint when 1 was capped.
ZCP_MaxWaitTime = 900; // random between 0 and THIS number added to the ZCP_MinWaitTime to counter spawning points at the same time
ZCP_BaseCleanupDelay = 500; // seconds to wait to delete a captured base.

ZCP_Minimum_Online_Players = 15; // Amount of players to be online before it allows to spawn capture points. !!! O = always

ZCP_RewardRelativeToPlayersOnline = true; // This will recalculate the crypto reward according the amount of online players.
ZCP_PoptabReward = 500; // Poptab reward for capping per player online. ( When poptab reward is selected or randomly chosen ).
ZCP_MinPoptabReward = 1000; // Poptabreward is added to this number
ZCP_PopTabsRewardForGroup = 1000;

/* Reputation is ALWAYS given as addition on the normal reward.*/
ZCP_ReputationReward = 150; // Respect reward for capping per  player online.
ZCP_MinReputationReward = 500; // ZCP_ReputationReward is added to this number
ZCP_ReputationRewardForGroup = 500; // Each group members gets this amount of reputation ( for the trouble).
ZCP_MinGroupDistance = 200; // meters to be close to the capper to get the group award

ZCP_CleanupBase = true; // Let the base dissappear after completing
ZCP_CleanupBaseWithAIBomber = false; // Cleanup with a airstrike
ZCP_CleanupAIVehicleClasses = ['B_Plane_CAS_01_F']; // Any flying vehicle in arma (default B_Plane_CAS_01_F = A10)
ZCP_FlyHeight = 150; // Height of the flying plane;

ZCP_UseSpecificNamesForCappers = true; // Use the player name, if false it say 'A player'

// Server will keep as many missions up as ZCP_MaxMissions, And they will be randomly choosen from the following list
// Location is ignored if not using static points. just put [0,0,0] then. activate static buy using isStatic = true
// valid rewards -> Random, Poptabs, Vehicle, Buildingbox, WeaponBox
ZCP_CapPoints = [ // [name,[x,y,z],reward, varname,index, spanwnAI, isStatic]
	["Battle Zone",[0,0,0],"Poptabs","alpha",0, true, false],
	["Battle Zone",[0,0,0],"Reputation","beta",1, true, false]
];

ZCP_MaxMissions = 1; // Amount of cap points at the same time.

// For every spawned mission,
ZCP_CapBases = [ // located in capbases folder
	"base1.sqf",
	"base2.sqf",
	"base3.sqf"
];

ZCP_TerrainGradient = 40; // Max meter terrain gradient ( height difference)
ZCP_MinDistanceFromObject = 150; // Missions needs an open spot. You can lower it but it might collide with other objects ( not always a problem)

// Same as DMS -> Credits DMS
ZCP_SpawnZoneDistance = 500;
ZCP_TradeZoneDistance = 500;
ZCP_TraderZoneMarkerTypes =			[							// If you're using custom trader markers, make sure you define them here. CASE SENSITIVE!!!
										"ExileTraderZone"
									];
ZCP_SpawnZoneMarkerTypes =			[							// If you're using custom spawn zone markers, make sure you define them here. CASE SENSITIVE!!!
										"ExileSpawnZone"
									];


/* These are arma 3 colors, look up the color naming if you are going to change this */
ZCP_FreeColor = "ColorIndependent"; // uncontested marker color
ZCP_CappedColor = "ColorCivilian"; // uncontested + capping color
ZCP_ContestColor = "ColorOPFOR"; // contested + capping color
ZCP_BackgroundColor = "ColorWhite"; // Color to get attention on the map, if zoomed out this will be bigger then the cap circle which is the normal size.
ZCP_MissionMarkerWinDotTime = 120; // Seconds to show a marker after a capped point. Change to 0 to disable!

ZCP_DisableVehicleReward = false; // Because it doesnt save without changing epoch code.

/** Uses DMS system, why make one if it already excist? Credits DMS **/
ZCP_DMS_MinimumMagCount					= 3;						// Minimum number of magazines for weapons.
ZCP_DMS_MaximumMagCount					= 5;						// Maximum number of magazines for weapons.
ZCP_DMS_CrateCase_Sniper =				[							// If you pass "Sniper" in _lootValues, then it will spawn these weapons/items/backpacks
										[
											["Rangefinder",1],
											["srifle_GM6_F",1],
											["srifle_LRR_F",1],
											["srifle_EBR_F",1],
											["hgun_Pistol_heavy_01_F",1],
											["hgun_PDW2000_F",1]
										],
										[
											["ItemGPS",1],
											["U_B_FullGhillie_ard",1],
											["U_I_FullGhillie_lsh",1],
											["U_O_FullGhillie_sard",1],
											["U_O_GhillieSuit",1],
											["V_PlateCarrierGL_blk",1],
											["V_HarnessO_brn",1],
											["Exile_Item_InstaDoc",3],
											["Exile_Item_Surstromming_Cooked",5],
											["Exile_Item_PlasticBottleFreshWater",5],
											["optic_DMS",1],
											["acc_pointer_IR",1],
											["muzzle_snds_B",1],
											["optic_LRPS",1],
											["optic_MRD",1],
											["muzzle_snds_acp",1],
											["optic_Holosight_smg",1],
											["muzzle_snds_L",1],
											["5Rnd_127x108_APDS_Mag",3],
											["7Rnd_408_Mag",3],
											["20Rnd_762x51_Mag",5],
											["11Rnd_45ACP_Mag",3],
											["30Rnd_9x21_Mag",3]
										],
										[
											["B_Carryall_cbr",1],
											["B_Kitbag_mcamo",1]
										]
									];
ZCP_DMS_BoxWeapons =					[							// List of weapons that can spawn in a crate
											"Exile_Melee_Axe",
											"arifle_Katiba_GL_F",
											"arifle_MX_GL_Black_F",
											"arifle_Mk20_GL_F",
											"arifle_TRG21_GL_F",
											"arifle_Katiba_F",
											"arifle_MX_Black_F",
											"arifle_TRG21_F",
											"arifle_TRG20_F",
											"arifle_Mk20_plain_F",
											"arifle_Mk20_F",
											"LMG_Zafir_F",
											"MMG_01_hex_F",
											"srifle_EBR_F",
											"srifle_DMR_01_F",
											"srifle_GM6_F",
											"srifle_LRR_F",
											"srifle_DMR_02_F",
											"MMG_01_tan_F",
											"MMG_02_camo_F",
											"MMG_02_black_F",
											"MMG_02_sand_F",
											"srifle_DMR_03_F",
											"srifle_DMR_03_khaki_F",
											"srifle_DMR_03_tan_F",
											"srifle_DMR_04_F",
											"srifle_DMR_04_Tan_F",
											"srifle_DMR_05_blk_F",
											"srifle_DMR_05_tan_F",
											"srifle_DMR_05_hex_F",
											"srifle_DMR_06_camo_F",
											"srifle_DMR_06_olive_F",
											"srifle_LRR_camo_F",
											"srifle_GM6_camo_F",
											"CUP_lmg_M249_para",
											"CUP_lmg_Mk48_des",
											"CUP_lmg_Mk48_wdl",
											"CUP_lmg_L110A1",
											"CUP_lmg_Pecheneg",
											"CUP_lmg_UK59",
											"CUP_lmg_L7A2",
											"CUP_lmg_M60A4",
											"CUP_lmg_M240",
											"CUP_lmg_M249",
											"CUP_lmg_PKM",
											"CUP_srifle_DMR",
											"CUP_srifle_ksvk",
											"CUP_srifle_M110",
											"CUP_srifle_M14",
											"CUP_srifle_M24_des",
											"CUP_srifle_M24_wdl",
											"CUP_srifle_M24_ghillie",
											"CUP_srifle_SVD",
											"CUP_srifle_SVD_des",
											"CUP_srifle_VSSVintorez",
											"CUP_srifle_CZ750",
											"CUP_srifle_Mk12SPR",
											"CUP_srifle_AS50",
											"CUP_srifle_AWM_des",
											"CUP_srifle_AWM_wdl",
											"CUP_srifle_CZ550",
											"CUP_srifle_LeeEnfield",
											"CUP_srifle_M40A3"	
										];
ZCP_DMS_BoxFood =						[							// List of food that can spawn in a crate.
										"Exile_Item_GloriousKnakworst_Cooked",
										"Exile_Item_Surstromming_Cooked",
										"Exile_Item_SausageGravy_Cooked",
										"Exile_Item_ChristmasTinner_Cooked",
										"Exile_Item_BBQSandwich_Cooked",
										"Exile_Item_Catfood_Cooked",
										"Exile_Item_DogFood_Cooked"
									];
ZCP_DMS_BoxDrinks =						[
										"Exile_Item_PlasticBottleCoffee",
										"Exile_Item_PowerDrink",
										"Exile_Item_PlasticBottleFreshWater",
										"Exile_Item_EnergyDrink",
										"Exile_Item_MountainDupe"
									];
ZCP_DMS_BoxMeds =						[
										"Exile_Item_InstaDoc",
										"Exile_Item_Vishpirin",
										"Exile_Item_Bandage"
									];
ZCP_DMS_BoxSurvivalSupplies	=			[							//List of survival supplies (food/drink/meds) that can spawn in a crate. "ZCP_DMS_BoxFood", "ZCP_DMS_BoxDrinks", and "ZCP_DMS_BoxMeds" is automatically added to this list.
										"Exile_Item_Matches",
										"Exile_Item_CookingPot",
										"Exile_Melee_Axe",
										"Exile_Item_CanOpener",
										"Exile_Item_DuctTape"
									] + ZCP_DMS_BoxFood + ZCP_DMS_BoxDrinks + ZCP_DMS_BoxMeds;
ZCP_DMS_BoxBaseParts =					[
										"Exile_Item_CamoTentKit",
										"Exile_Item_WoodWallKit",
										"Exile_Item_WoodWallHalfKit",
										"Exile_Item_WoodDoorwayKit",
										"Exile_Item_WoodDoorKit",
										"Exile_Item_WoodFloorKit",
										"Exile_Item_WoodFloorPortKit",
										"Exile_Item_WoodStairsKit",
										"Exile_Item_WoodSupportKit",
										"Exile_Item_FortificationUpgrade"
									];
ZCP_DMS_BoxCraftingMaterials =			[
										"Exile_Item_MetalPole",
										"Exile_Item_MetalBoard",
										"Exile_Item_JunkMetal"
									];
ZCP_DMS_BoxTools =						[
										"Exile_Item_Grinder",
										"Exile_Item_Handsaw"
									];
ZCP_DMS_BoxBuildingSupplies	=			[							// List of building supplies that can spawn in a crate ("ZCP_DMS_BoxBaseParts", "ZCP_DMS_BoxCraftingMaterials", and "ZCP_DMS_BoxTools" are automatically added to this list. "ZCP_DMS_BoxCraftingMaterials" is added twice for weight.)
										"Exile_Item_DuctTape",
										"Exile_Item_PortableGeneratorKit"
									] + ZCP_DMS_BoxBaseParts + ZCP_DMS_BoxCraftingMaterials + ZCP_DMS_BoxCraftingMaterials + ZCP_DMS_BoxTools;
ZCP_DMS_BoxOptics =						[							// List of optics that can spawn in a crate
										"optic_Arco",
										"optic_Hamr",
										"optic_Aco",
										"optic_Holosight",
										"optic_MRCO",
										"optic_SOS",
										"optic_DMS",
										"optic_LRPS",
										"optic_Nightstalker",
										"rhsusf_acc_eotech_552",
										"rhsusf_acc_LEUPOLDMK4",
										"rhsusf_acc_ELCAN",
										"rhsusf_acc_ELCAN_pip",
										"rhsusf_acc_ACOG",
										"rhsusf_acc_ACOG_pip",
										"rhs_acc_1pn93_2",
										"rhsusf_acc_ACOG2",
										"rhsusf_acc_ACOG_USMC",
										"rhsusf_acc_ACOG2_USMC",
										"rhsusf_acc_ACOG3_USMC",
										"rhsusf_acc_LEUPOLDMK4_2",
										"rhsusf_acc_EOTECH",
										"rhs_acc_1p29",
										"rhs_acc_1p78",
										"rhs_acc_pkas",
										"rhs_acc_1p63",
										"rhs_acc_ekp1",
										"rhs_acc_pso1m2",
										"rhs_acc_pgo7v",
										"rhs_acc_1pn93_1",
										"CUP_optic_PSO_1",
										"CUP_optic_PSO_3",
										"CUP_optic_Kobra",
										"CUP_optic_GOSHAWK",
										"CUP_optic_PechenegScope",
										"CUP_optic_HoloBlack",
										"CUP_optic_HoloWdl",
										"CUP_optic_HoloDesert",
										"CUP_optic_Eotech533",
										"CUP_optic_Eotech533Grey",
										"CUP_optic_CompM4",
										"CUP_optic_SUSAT",
										"CUP_optic_RCO",
										"CUP_optic_RCO_desert",
										"CUP_optic_CompM2_Woodland2",
										"CUP_optic_CompM2_Woodland",
										"CUP_optic_CompM2_Black",
										"CUP_optic_CompM2_Desert",
										"CUP_optic_ACOG",
										"CUP_optic_SB_3_12x50_PMII",
										"CUP_optic_AN_PAS_13c2",
										"CUP_optic_AN_PVS_4",
										"CUP_optic_AN_PVS_10",
										"CUP_optic_LeupoldMk4",
										"CUP_optic_LeupoldM3LR",
										"CUP_optic_LeupoldMk4_CQ_T",
										"CUP_optic_LeupoldMk4_MRT_tan",
										"CUP_optic_LeupoldMk4_10x40_LRT_Desert",
										"CUP_optic_LeupoldMk4_10x40_LRT_Woodland",
										"CUP_optic_Leupold_VX3",
										"CUP_optic_ElcanM145",
										"CUP_optic_ELCAN_SpecterDR",
										"CUP_optic_AN_PAS_13c1",
										"CUP_optic_SB_11_4x20_PM",
										"CUP_optic_ZDDot",
										"CUP_optic_MRad",
										"CUP_optic_TrijiconRx01_black",
										"CUP_optic_TrijiconRx01_desert"
									];
ZCP_DMS_BoxBackpacks =					[							//List of backpacks that can spawn in a crate
										"B_Bergen_rgr",
										"B_Carryall_oli",
										"B_Kitbag_mcamo",
										"B_Carryall_cbr",
										"B_FieldPack_oucamo",
										"B_FieldPack_cbr",
										"B_Bergen_blk",
										"TRYK_B_AssaultPack_UCP",
										"TRYK_B_AssaultPack_Type2camo",
										"TRYK_B_AssaultPack_MARPAT_Desert",
										"TRYK_B_AssaultPack_MARPAT_Wood",
										"TRYK_B_Kitbag_Base",
										"TRYK_B_Kitbag_blk",
										"TRYK_B_Kitbag_aaf",
										"TRYK_B_Carryall_blk",
										"TRYK_B_Carryall_wh",
										"TRYK_B_Carryall_wood",
										"TRYK_B_Carryall_JSDF",
										"TRYK_B_Kitbag_Base_JSDF",
										"TRYK_B_Coyotebackpack",
										"TRYK_B_Coyotebackpack_OD",
										"TRYK_B_Coyotebackpack_BLK",
										"TRYK_B_Coyotebackpack_WH",
										"TRYK_B_Alicepack",
										"TRYK_B_Medbag",
										"TRYK_B_Medbag_OD",
										"TRYK_B_Medbag_BK",
										"TRYK_B_Medbag_ucp",
										"TRYK_B_Belt",
										"TRYK_B_Belt_BLK",
										"TRYK_B_Belt_CYT",
										"TRYK_B_Belt_tan",
										"TRYK_B_Belt_br",
										"TRYK_B_Belt_GR",
										"TRYK_B_Belt_AOR1",
										"TRYK_B_Belt_AOR2",
										"TRYK_B_BAF_BAG_BLK",
										"TRYK_B_BAF_BAG_CYT",
										"TRYK_B_BAF_BAG_OD",
										"TRYK_B_BAF_BAG_rgr",
										"TRYK_B_BAF_BAG_mcamo",
										"TRYK_B_tube_cyt",
										"TRYK_B_tube_od",
										"TRYK_B_tube_blk",
										"TRYK_B_FieldPack_Wood",
										"TRYK_Winter_pack"
									];
ZCP_DMS_BoxItems						= ZCP_DMS_BoxSurvivalSupplies+ZCP_DMS_BoxBuildingSupplies+ZCP_DMS_BoxOptics;	// Random "items" can spawn optics, survival supplies, or building supplies

ZCP_DMS_RareLoot						= true;						// Potential chance to spawn rare loot in any crate.
ZCP_DMS_RareLootList =					[							// List of rare loot to spawn
										"Exile_Item_SafeKit",
										"Exile_Item_CodeLock",
										"Exile_Item_Defibrillator"
									];
ZCP_DMS_RareLootChance	= 10;						// Percentage Chance to spawn rare loot in any crate | Default: 10%

// Vehicles
ZCP_DMS_ArmedVehicles =					[							// List of armed vehicles that can spawn
										"Exile_Car_Offroad_Armed_Guerilla01"
									];

ZCP_VehicleReward = ZCP_DMS_ArmedVehicles;
ZCP_DMS_DEBUG = false;


if(ZCP_dev) then {
	ZCP_CapTime = 60;
	ZCP_CapRadius = 60;
	ZCP_MinWaitTime = 60;
	ZCP_MaxWaitTime = 80;
	ZCP_BaseCleanupDelay = 50;
	ZCP_Minimum_Online_Players = 0;
	ZCP_DMS_doIUseDMS = false;
};

/* Do not change this*/
ZCP_Version = "ZCP_Exile_1.0.1";
ZCP_Data = [];
ZCP_Bases = [];
ZCP_MissionCounter = 0;
ZCP_DMS_MagRange = ZCP_DMS_MaximumMagCount - ZCP_DMS_MinimumMagCount;
