/*
   	Author: IT07

   	Description:
   	hpp config file for Vampire's Exile Mission Framework (a.k.a. VEMF)

	Little back story:
	VEMF is originally made by Vampire (for Epoch) but he kind of gave up on the project.
	Now, I (IT07) am carrying on with the project and I have now made it for Exile too.
	Please keep in mind that some of VEMF's code is still left-over from before I took over VEMF.
	Want to report an issue? Then either PM me on the Exilemod.com forums or reply to the VEMF forum post.
	Do you like and appreciate my work? Please leave a like or a nice comment for me on the forums :)
*/

class CfgVemfReloaded
{
	// Global settings
	allowHeadLessClient = -1; // HC support is currently broken // Set to 1 if you have (a) headless client(s) | -1 = DISABLED
	minServerFPS = 10; // Missions will not spawn if server's FPS is below this number
	validateLoot = 1; // Use -1 to disable. Checks if defined classes in loot and ai gear (except blacklist) are valid. Will output test result to RPT if ERROR logs enabled
	minPlayers = 1; // Missions will not start until player count reaches this number OR when player count goes below this amount
	maxGlobalMissions = 2; // Use -1 to disable limit | Max amount of missions that are allowed to run at the same time
 	timeOutTime = 5; // In minutes. Use -1 to disable mission timeout; Minimal: 5
	minNew = 2; // Minimum time before new mission can run
	maxNew = 3; // Maximum time before new mission can run
	missionList[] = {"DynamicLocationInvasion"}; // Speaks for itself, right?
	missionDistance = 3000; // Minimum distance between missions
	addons[] = {}; // Not used for now
	noMissionPos[] = {}; // Format: {{position},radius} | Default: Exile safezones
	locationBlackList[] = {"Sagonisi","Monisi","Fournos","Savri","Atsalis","Polemista","Cap Makrinos","Pyrgi","Makrynisi","Chelonisi","Almyra","Surf Club"};
	housesBlackList[] = {"Land_Pier_F"};
	killPercentage = 100; // In percent. 100 means all AI that belong to mission need to be killed
	sayKilled = 1; // Set to -1 if you do not want AI killed messages | 1 = everyone will see message | 2 = send message only to the killer
	allowSmall = 1; // Set to -1 if you do not want missions to target very small unusual locations
	keepLaunchers = -1; // Use -1 to remove AI's launcher on killed
	keepAIbodies = 1; // Set to -1 if you want the AI's body to be deleted after they are killed
	aiPoliceMode = 1; // Use -1 to give AI normal soldier clothing | 1 = normal police | 2 = S.W.A.T.
	respectReward = 20; // Default respect to give always | Use -1 to disable respect gain. Minimum: 1 (if you want it enabled) | VEMF will automatically give bonus

	/////// Debugging/learning mode ///////
	enableDebug = 0; // -1 to disable, 0 = ERRORS only | 1 = INFO only | 2 = ERRORS & INFO
	///////////////////////////////////////

	// Global AI skill settings. They affect each VEMF unit for any default VEMF mission
	class aiSkill // Minimum: 0 | Maximum: 1
	{
		difficulty = "Veteran"; // Options: "Easy" "Normal" "Veteran" "Hardcore" | Default: Veteran
		class Easy // AI looks stupid with this setting xD
		{
			accuracy = 0.4; aimingShake = 0.20; aimingSpeed = 0.3; endurance = 0.25; spotDistance = 0.5; spotTime = 0.7; courage = 1; reloadSpeed = 0.3; commanding = 0.8; general = 0.3;
		};
		class Normal
		{
			accuracy = 0.4; aimingShake = 0.20; aimingSpeed = 0.3; endurance = 0.25; spotDistance = 0.5; spotTime = 0.7; courage = 1; reloadSpeed = 0.3; commanding = 0.8; general = 0.4;
		};
		class Veteran
		{
			accuracy = 0.4; aimingShake = 0.20; aimingSpeed = 0.3; endurance = 0.25; spotDistance = 0.5; spotTime = 0.7; courage = 1; reloadSpeed = 0.3; commanding = 0.8; general = 0.5;
		};
		class Hardcore // Also known as Aimbots
		{
			accuracy = 0.4; aimingShake = 0.20; aimingSpeed = 0.3; endurance = 0.25; spotDistance = 0.5; spotTime = 0.7; courage = 1; reloadSpeed = 0.3; commanding = 0.8; general = 0.7;
		};
	};

	class DynamicLocationInvasion // DynamicLocationInvasion settings
	{
		maxInvasions = 3; // Max amount of active uncompleted invasions allowed at the same time
		useAnnouncements = 1; // Use -1 to disable mission announcements
		useMarker = 1; // Use -1 to disable mission markers
		cal50s = 3; // Max amount of .50 caliber machineguns at mission | Needs to be lower than total unit count per mission
			keep50s = -1; // Set to -1 to enable the removal of all 50s created by MI
			cal50delMode = 1; // 1 is delete, 2 is destroy
		groupCount[] = {2,4}; // In format: {minimum, maximum}; VEMF will pick a random number between min and max. If you want the same amount always, use same numbers for minimum and maximum.
		groupUnits[] = {4,6}; // How much units in each group. Works the same like groupCount
		useLaunchers = 1; // Set to -1 if you do NOT want the AI to have launchers
			hasLauncherChance = 25; // In percentage. How big the chance is that a unit gets a launcher
		playerCheck = 800; // If player(s) within this range of location, location gets skipped. Distance in m (meters)
		distanceCheck = 15000; // Check for locations around random player within this distance in m (meters)
		/* distanceCheck NOTE: set it to the minimal distance between ANY town on the map you are using. Otherwise location selection will fail */
		distanceTooClose = 2000; // Mission will not spawn closer to random player than this distance in meters
		distanceMaxPrefered = 7000; // Mission will prefer locations closer than this distance (in meters) to random player
		parachuteCrate = -1; // Use -1 to disable the crate parachuting in
			crateAltitude = 250; // Crate with parachute(!) will spawn at this altitude (meters)
		crateMapMarker = 1; // Use -1 if you do not want a marker to be placed on the crate
		crateVisualMarker = 1; // Use -1 to disable chemlight/smoke on crate
		crateTypes[] = {"I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F","I_supplyCrate_F","Box_East_AmmoVeh_F","Box_NATO_AmmoVeh_F"};
		smokeTypes[] = {"SmokeShell","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellRed","SmokeShellYellow"};
		flairTypes[] = {"Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"};
		placeMines = 1; // Set to -1 if you do not want mines at missions
		minesMode = 1; // 1 = Anti-Armor | 2 = Anti-Personell | 3 = Both Anti-Armor and Anti-Personell
			minesAmount = 20; // Ignore if placeMines = -1;
			cleanMines = 1; // 1 = remove mines when mission done | 2 = explode mines when mission done :D guarenteed chaos, LOL!
		randomModes = 1; // Set to -1 to disable random invasion modes
	};

	class policeConfig
	{
		uniforms[] = {"U_C_Journalist","U_Rangemaster","U_Marshal","U_Competitor"};
		headGear[] =
		{
			"H_HelmetB","H_HelmetB_camo","H_HelmetB_paint","H_HelmetB_light","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_indp",
			"H_Booniehat_mcamo","H_Booniehat_grn","H_Booniehat_tan","H_Booniehat_dirty","H_Booniehat_dgtl","H_Booniehat_khk_hs","H_HelmetB_plain_mcamo",
			"H_HelmetB_plain_blk","H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetIA","H_HelmetIA_net",
			"H_HelmetIA_camo","H_Helmet_Kerry","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand",
			"H_Cap_red","H_Cap_blu","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_brn_SPECOPS","H_Cap_tan_specops_US",
			"H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_grn_BI","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_oli_hs","H_Cap_press","H_Cap_usblack","H_Cap_police",
			"H_HelmetCrew_B","H_HelmetCrew_O","H_HelmetCrew_I","H_PilotHelmetFighter_B","H_PilotHelmetFighter_O","H_PilotHelmetFighter_I",
			"H_PilotHelmetHeli_B","H_PilotHelmetHeli_O","H_PilotHelmetHeli_I","H_CrewHelmetHeli_B","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I","H_HelmetO_ocamo",
			"H_HelmetLeaderO_ocamo","H_MilCap_ocamo","H_MilCap_mcamo","H_MilCap_oucamo","H_MilCap_rucamo","H_MilCap_gry","H_MilCap_dgtl",
			"H_MilCap_blue","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand","H_BandMask_blk",
			"H_BandMask_khk","H_BandMask_reaper","H_BandMask_demon","H_HelmetO_oucamo","H_HelmetLeaderO_oucamo","H_HelmetSpecO_ocamo","H_HelmetSpecO_blk",
			"H_Bandanna_surfer","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn",
			"H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_camo","H_Bandanna_mcamo","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_olive_hs",
			"H_ShemagOpen_khk","H_ShemagOpen_tan","H_Beret_blk","H_Beret_blk_POLICE","H_Beret_red","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF",
			"H_Beret_ocamo","H_Beret_02","H_Beret_Colonel","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_sgg",
			"H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","H_StrawHat","H_StrawHat_dark","H_TurbanO_blk","rhs_6b27m_digi",
			"rhs_6b27m_digi_bala","rhs_6b27m_digi_ess","rhs_6b27m_digi_ess_bala","rhs_6b27m","rhs_6b27m_ess","rhs_6b27m_bala","rhs_6b27m_ess_bala","rhs_6b27m_ml",
			"rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala","TRYK_US_ESS_Glasses",
			"TRYK_US_ESS_Glasses_WH","TRYK_US_ESS_Glasses_BLK","TRYK_US_ESS_Glasses_TAN","TRYK_US_ESS_Glasses_TAN_BLK","TRYK_SPGEAR_Glasses","TRYK_headset_Glasses","TRYK_SpsetG_Glasses",
			"TRYK_Spset_PHC1_Glasses","TRYK_Spset_PHC2_Glasses","TRYK_US_ESS_Glasses_H","TRYK_US_ESS_Glasses_Cover","TRYK_headset2_glasses","TRYK_US_ESS_Glasses_NV","TRYK_US_ESS_Glasses_TAN_NV",
			"TRYK_ESS_BLKTAN_NV","TRYK_ESS_BLKBLK_NV","TRYK_G_Shades_Black_NV","TRYK_G_Shades_Blue_NV","TRYK_G_bala_ess_NV","TRYK_bandana_NV","TRYK_SPgearG_NV",
			"TRYK_SPgear_PHC1_NV","TRYK_SPgear_PHC2_NV","TRYK_G_bala_wh_NV","TRYK_ESS_wh_NV","TRYK_ESS_CAP_OD","TRYK_ESS_CAP_tan","TRYK_R_CAP_BLK",
			"TRYK_R_CAP_TAN","TRYK_R_CAP_OD_US","TRYK_r_cap_tan_Glasses","TRYK_r_cap_blk_Glasses","TRYK_r_cap_od_Glasses","TRYK_H_headsetcap_Glasses","TRYK_H_headsetcap_blk_Glasses",
			"TRYK_H_headsetcap_od_Glasses","TRYK_TAC_EARMUFF_SHADE","TRYK_TAC_EARMUFF","TRYK_NOMIC_TAC_EARMUFF","TRYK_headset2","TRYK_TAC_EARMUFF_Gs","TRYK_TAC_SET_bn",
			"TRYK_NOMIC_TAC_EARMUFF_Gs","TRYK_TAC_EARMUFF_SHADE_Gs","TRYK_TAC_SET_TAN","TRYK_TAC_SET_OD","TRYK_TAC_SET_WH","TRYK_TAC_SET_MESH","TRYK_TAC_SET_TAN_2",
			"TRYK_TAC_SET_OD_2","TRYK_TAC_SET_WH_2","TRYK_TAC_SET_MESH_2","TRYK_bandana_g","TRYK_H_PASGT_BLK","TRYK_H_PASGT_OD","TRYK_H_PASGT_COYO",
			"TRYK_H_PASGT_TAN","TRYK_H_Helmet_Snow","TRYK_H_WH","TRYK_H_GR","TRYK_H_AOR1","TRYK_H_AOR2","TRYK_H_EARMUFF",
			"TRYK_H_TACEARMUFF_H","TRYK_H_Bandana_H","TRYK_H_Bandana_wig","TRYK_H_Bandana_wig_g","TRYK_H_wig","TRYK_H_headset2","TRYK_H_ghillie_over",
			"TRYK_H_ghillie_top","TRYK_H_ghillie_top_headless","TRYK_H_ghillie_over_green","TRYK_H_ghillie_top_green","TRYK_H_ghillie_top_headless_green",
			"TRYK_H_woolhat","TRYK_H_woolhat_CW","TRYK_H_woolhat_WH","TRYK_H_woolhat_br","TRYK_H_woolhat_cu","TRYK_H_woolhat_tan","TRYK_H_headsetcap","TRYK_H_headsetcap_blk",
			"TRYK_H_headsetcap_od","TRYK_H_pakol","TRYK_H_pakol2","TRYK_H_LHS_HEL_G","TRYK_H_Helmet_Winter","TRYK_H_Helmet_Winter_2","TRYK_Headphone_NV",
			"TRYK_HRPIGEAR_NV","TRYK_Headset_NV","TRYK_TAC_boonie_SET_NV","TRYK_TAC_SET_NV_TAN","TRYK_TAC_SET_NV_OD","TRYK_TAC_SET_NV_WH","TRYK_TAC_SET_NV_MESH",
			"TRYK_TAC_SET_NV_TAN_2","TRYK_TAC_SET_NV_OD_2","TRYK_TAC_SET_NV_WH_2","TRYK_TAC_SET_NV_MESH_2","TRYK_H_DELTAHELM_NV","TRYK_Shemagh_shade_MESH","TRYK_Shemagh_shade_N",
			"TRYK_Shemagh_shade_G_N","TRYK_Shemagh_shade_WH_N","TRYK_kio_balaclava_WH","TRYK_kio_balaclava_BLK","TRYK_kio_balaclavas","TRYK_kio_balaclava_BLK_ear","TRYK_kio_balaclava_ear",
			"TRYK_kio_balaclava_ESS","TRYK_Shemagh","TRYK_Shemagh_mesh","TRYK_Shemagh_G","TRYK_Shemagh_WH","TRYK_Shemagh_shade","TRYK_Shemagh_shade_G",
			"TRYK_Shemagh_shade_WH","TRYK_Shemagh_shade_MH","TRYK_Shemagh_ESS","TRYK_Shemagh_ESS_G","TRYK_Shemagh_ESS_WH","TRYK_Shemagh_EAR_TAN","TRYK_Shemagh_EAR_WH",
			"TRYK_balaclava_BLACK_NV","TRYK_balaclava_NV","TRYK_balaclava_BLACK_EAR_NV","TRYK_balaclava_EAR_NV","TRYK_Shemagh_TAN_NV","TRYK_Shemagh_MESH_NV","TRYK_Shemagh_G_NV",
			"TRYK_Shemagh_WH_NV","TRYK_Shemagh_EAR_NV","TRYK_Shemagh_EAR_G_NV","TRYK_Shemagh_EAR_WH_NV","TRYK_ShemaghESSTAN_NV","TRYK_ShemaghESSOD_NV","TRYK_ShemaghESSWH_NV"
		};
		vests[] = 
		{	
			"V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarrier3_rgr","V_PlateCarrierGL_rgr","V_PlateCarrier1_blk",
			"V_PlateCarrierSpec_rgr","V_Chestrig_khk","V_Chestrig_rgr","V_Chestrig_blk","V_Chestrig_oli","V_TacVest_khk",
			"V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_TacVest_blk_POLICE","V_TacVestIR_blk","V_TacVestCamo_khk",
			"V_HarnessO_brn","V_HarnessOGL_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_HarnessOSpec_gry",
			"V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_RebreatherB","V_RebreatherIR","V_RebreatherIA",
			"V_PlateCarrier_Kerry","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_I_G_resistanceLeader_F","V_Press_F"
			"V_Press_F","V_Rangemaster_belt","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli",
			"V_BandollierB_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","rhs_6sh92_headset",
			"rhs_6sh92_radio","rhs_6sh92_vog","rhs_6sh92_vog_headset","rhs_vydra_3m","rhs_6sh92_digi","rhs_6b13_6sh92_vog","rhs_6b13_6sh92_radio","rhs_6b23_digi_6sh92_vog_headset",
			"rhs_6b13_Flora","rhs_6b13_Flora_6sh92","rhs_6b13_Flora_6sh92_headset_mapcase","rhs_6b13_Flora_6sh92_vog","rhs_6b13_Flora_crewofficer","rhs_6b23",
			"rhs_6b23_6sh92","rhs_6b23_6sh92_headset","rhs_6b23_6sh92_headset_mapcase","rhs_6b23_6sh92_radio","rhs_6b23_6sh92_vog","rhs_6b23_6sh92_vog_headset",
			"rhs_6b23_crew","rhs_6b23_engineer","rhs_6b23_rifleman","rhs_6b23_sniper","rhs_6b23_ML","rhs_6b23_ML_6sh92","rhs_6b23_ML_6sh92_headset",
			"rhs_6b23_ML_6sh92_headset_mapcase","rhs_6b23_ML_6sh92_radio","rhs_6b23_ML_6sh92_vog","rhs_6b23_ML_6sh92_vog_headset","rhs_6b23_ML_crewofficer","rhs_6b23_ML_crew","rhs_6b23_ML_engineer",
			"rhs_6b23_ML_rifleman","rhs_6b23_ML_sniper","rhs_6sh46","rhsusf_iotv_ocp","rhsusf_iotv_ucp","rhsusf_iotv_ocp_Medic","rhsusf_iotv_ucp_Medic",
			"rhsusf_iotv_ocp_Repair","rhsusf_iotv_ucp_Repair","rhsusf_iotv_ocp_Rifleman","rhsusf_iotv_ucp_Rifleman","rhsusf_iotv_ocp_SAW","rhsusf_iotv_ucp_SAW","rhsusf_iotv_ocp_Squadleader",
			"rhsusf_iotv_ucp_Squadleader","rhsusf_iotv_ocp_Teamleader","rhsusf_iotv_ucp_Teamleader","rhsusf_iotv_ocp_Grenadier","rhsusf_iotv_ucp_Grenadier","TRYK_Hrp_vest_ucp",
			"TRYK_V_PlateCarrier_JSDF","TRYK_V_ArmorVest_AOR1","TRYK_V_ArmorVest_AOR2","TRYK_V_ArmorVest_coyo","TRYK_V_ArmorVest_Brown","TRYK_V_ArmorVest_CBR","TRYK_V_ArmorVest_khk",
			"TRYK_V_ArmorVest_rgr","TRYK_V_ArmorVest_green","TRYK_V_ArmorVest_tan","TRYK_V_ArmorVest_Delta","TRYK_V_ArmorVest_Ranger","TRYK_V_ArmorVest_AOR1_2","TRYK_V_ArmorVest_AOR2_2",
			"TRYK_V_ArmorVest_coyo2","TRYK_V_ArmorVest_Brown2","TRYK_V_ArmorVest_cbr2","TRYK_V_ArmorVest_khk2","TRYK_V_ArmorVest_rgr2","TRYK_V_ArmorVest_green2","TRYK_V_ArmorVest_tan2",
			"TRYK_V_ArmorVest_Delta2","TRYK_V_ArmorVest_Ranger2","TRYK_V_PlateCarrier_blk","TRYK_V_PlateCarrier_coyo","TRYK_V_PlateCarrier_wood","TRYK_V_PlateCarrier_ACU","TRYK_V_TacVest_coyo",
			"TRYK_V_harnes_blk_L","TRYK_V_harnes_od_L","TRYK_V_harnes_TAN_L","TRYK_V_PlateCarrier_blk_L","TRYK_V_PlateCarrier_wood_L","TRYK_V_PlateCarrier_ACU_L","TRYK_V_PlateCarrier_coyo_L",
			"TRYK_V_ChestRig_L","TRYK_V_ChestRig","TRYK_V_Bulletproof","TRYK_V_Bulletproof_BLK","TRYK_V_Bulletproof_BL","TRYK_V_IOTV_BLK","TRYK_V_tacv1M_BK",
			"TRYK_V_tacv1MLC_BK","TRYK_V_tacv1","TRYK_V_tacv1_CY","TRYK_V_tacv1_BK","TRYK_V_tacv1_P_BK","TRYK_V_tacv1_SHERIFF_BK","TRYK_V_tacv1_FBI_BK",
			"TRYK_V_tacv1LP_BK","TRYK_V_tacv1LSRF_BK","TRYK_V_tacv1LC_BK","TRYK_V_tacv1LC_CY","TRYK_V_tacv1LC_OD","TRYK_V_tacv1LC_FBI_BK","TRYK_V_tacv1LC_SRF_BK",
			"TRYK_V_tacv1LC_SRF_OD","TRYK_V_tacv1LC_P_BK","TRYK_V_PlateCarrier_POLICE","TRYK_V_ArmorVest_HRT_B","TRYK_V_ArmorVest_HRT_OD","TRYK_V_ArmorVest_HRT2_B","TRYK_V_ArmorVest_HRT2_OD",
			"TRYK_V_ArmorVest_Winter","TRYK_V_Sheriff_BA_OD","TRYK_V_tacv10_BK","TRYK_V_tacv10_OD","TRYK_V_tacv10_TN","TRYK_V_tacv10LC_BK","TRYK_V_tacv10LC_OD",
			"TRYK_V_tacv10LC_TN","TRYK_V_tacv1L_BK","TRYK_V_tacv1L_OD","TRYK_V_tacv1L_CY","TRYK_V_tacv1LC_FBI2_BK","TRYK_V_tacv1LC_SRF2_BK","TRYK_V_tacv1LC_SRF2_OD",
			"TRYK_V_tacv1LC_P2_BK","TRYK_V_tacv1_MSL_BK","TRYK_V_tacv1_MSL_NV","TRYK_V_tacv1LMSL_BK","TRYK_V_tacv1LMSL_NV","TRYK_V_tacv1LC_MSL_BK","TRYK_V_tacv1LC_MSL_NV",
			"TRYK_V_tacSVD_BK","TRYK_V_tacSVD_OD","TRYK_V_Sheriff_BA_TL","TRYK_V_Sheriff_BA_TBL","TRYK_V_Sheriff_BA_TCL","TRYK_V_Sheriff_BA_TL2","TRYK_V_Sheriff_BA_TBL2",
			"TRYK_V_Sheriff_BA_TCL2","TRYK_V_Sheriff_BA_T","TRYK_V_Sheriff_BA_TB","TRYK_V_Sheriff_BA_T2","TRYK_V_Sheriff_BA_TB2","TRYK_V_Sheriff_BA_T3","TRYK_V_Sheriff_BA_TB3",
			"TRYK_V_Sheriff_BA_T4","TRYK_V_Sheriff_BA_TB4","TRYK_V_Sheriff_BA_T5","TRYK_V_Sheriff_BA_TB5","TRYK_V_Sheriff_BA_TBL3_BK","TRYK_V_Sheriff_BA_TBL3_OD","TRYK_V_Sheriff_BA_TBL3_TN",
			"TRYK_LOC_AK_chestrig_OD","TRYK_LOC_AK_chestrig_TAN"
			};
		rifles[] =
		{
			"srifle_EBR_F","srifle_DMR_01_F","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F",
			"arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F",
			"arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F",
			"arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F","SMG_01_F","SMG_02_F","hgun_PDW2000_F","arifle_MXM_Black_F",
			"arifle_MX_GL_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","LMG_Mk200_F","arifle_MX_SW_F",
			"LMG_Zafir_F","arifle_MX_SW_Black_F","rhs_weap_m249_pip_L",
			"rhs_weap_m249_pip_L_para","rhs_weap_m249_pip_L_vfg","rhs_weap_m249_pip_S","rhs_weap_m249_pip_S_para","rhs_weap_m249_pip_S_vfg","rhs_weap_m240B","rhs_weap_m240B_CAP",
			"rhs_weap_m240G","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_m16a4",
			"rhs_weap_m16a4_carryhandle","rhs_weap_m16a4_carryhandle_grip","rhs_weap_m16a4_carryhandle_grip_pmag","rhs_weap_m16a4_carryhandle_M203","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m16a4_grip","rhs_weap_m4",
			"rhs_weap_m4_grip2","rhs_weap_m4_carryhandle","rhs_weap_m4_carryhandle_pmag","rhs_weap_m4_grip","rhs_weap_m4_m203","rhs_weap_m4_m320","rhs_weap_m4a1_carryhandle",
			"rhs_weap_m4a1_carryhandle_grip2","rhs_weap_m4a1_carryhandle_pmag","rhs_weap_m4a1_carryhandle_m203","rhs_weap_m4a1","rhs_weap_m4a1_grip2","rhs_weap_m4a1_grip","rhs_weap_m4a1_m203",
			"rhs_weap_m4a1_m320","rhs_weap_m4a1_blockII","rhs_weap_m4a1_blockII_KAC","rhs_weap_m4a1_blockII_grip2","rhs_weap_m4a1_blockII_grip2_KAC","rhs_weap_m4a1_blockII_M203","rhs_weap_mk18",
			"rhs_weap_mk18_KAC","rhs_weap_mk18_grip2","rhs_weap_mk18_grip2_KAC","rhs_weap_mk18_m320","rhs_weap_ak103","rhs_weap_ak103_npz","rhs_weap_ak103_1",
			"rhs_weap_ak74m","rhs_weap_ak74m_2mag","rhs_weap_ak74m_2mag_camo","rhs_weap_ak74m_2mag_npz","rhs_weap_ak74m_camo","rhs_weap_ak74m_desert","rhs_weap_ak74m_desert_npz",
			"rhs_weap_ak74m_desert_folded","rhs_weap_ak74m_plummag_folded","rhs_weap_ak74m_folded","rhs_weap_ak74m_camo_folded","rhs_weap_ak74m_gp25","rhs_weap_ak74m_gp25_npz","rhs_weap_ak74m_npz",
			"rhs_weap_ak74m_plummag","rhs_weap_ak74m_plummag_npz","rhs_weap_akm","rhs_weap_akm_gp25","rhs_weap_akms","rhs_weap_akms_gp25","rhs_weap_M107",
			"rhs_weap_sr25","rhs_weap_sr25_ec","rhs_weap_m14ebrri","rhs_weap_XM2010","rhs_weap_XM2010_wd","rhs_weap_XM2010_d","rhs_weap_XM2010_sa",
			"rhs_weap_svd","rhs_weap_svdp_wd","rhs_weap_svdp_wd_npz","rhs_weap_svdp_npz","rhs_weap_svds","rhs_weap_svds_npz"
		};
		pistols[] = {"hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F"};
		backpacks[] =
		{
			"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_cbr",
			"B_AssaultPack_mcamo","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk",
			"B_TacticalPack_oli","B_FieldPack_khk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr",
			"B_FieldPack_blk","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_khk","B_Carryall_cbr",
			"B_Parachute","B_FieldPack_oli","B_Carryall_oli","B_Kitbag_Base","B_Kitbag_cbr","B_Kitbag_mcamo",
			"B_Kitbag_rgr","B_Kitbag_sgg","B_OutdoorPack_Base","B_OutdoorPack_blk","B_OutdoorPack_blu",
			"B_OutdoorPack_tan","TRYK_B_AssaultPack_UCP",
			"TRYK_B_AssaultPack_Type2camo","TRYK_B_AssaultPack_MARPAT_Desert","TRYK_B_AssaultPack_MARPAT_Wood","TRYK_B_Kitbag_Base","TRYK_B_Kitbag_blk","TRYK_B_Kitbag_aaf","TRYK_B_Carryall_blk",
			"TRYK_B_Carryall_wh","TRYK_B_Carryall_wood","TRYK_B_Carryall_JSDF","TRYK_B_Kitbag_Base_JSDF","TRYK_B_Coyotebackpack","TRYK_B_Coyotebackpack_OD","TRYK_B_Coyotebackpack_BLK",
			"TRYK_B_Coyotebackpack_WH","TRYK_B_Alicepack","TRYK_B_Medbag","TRYK_B_Medbag_OD","TRYK_B_Medbag_BK","TRYK_B_Medbag_ucp","TRYK_B_Belt",
			"TRYK_B_Belt_BLK","TRYK_B_Belt_CYT","TRYK_B_Belt_tan","TRYK_B_Belt_br","TRYK_B_Belt_GR","TRYK_B_Belt_AOR1","TRYK_B_Belt_AOR2",
			"TRYK_B_BAF_BAG_BLK","TRYK_B_BAF_BAG_CYT","TRYK_B_BAF_BAG_OD","TRYK_B_BAF_BAG_rgr","TRYK_B_BAF_BAG_mcamo","TRYK_B_tube_cyt","TRYK_B_tube_od",
			"TRYK_B_tube_blk","TRYK_B_FieldPack_Wood","TRYK_Winter_pack"
		};
	};

	// Loot crate configuration
	class crateLoot
	{
		maxPrimarySlots = 10; // Maximum primary weapons in each loot crate
		minPrimarySlots = 4; // Minimum primary weapons in each loot crate
		primaryWeaponLoot[] =
		{ // The number after each classname means how much of that type will be put in crate. WARNING: DO NOT USE NUMBERS WITH DECIMALS.
			{"srifle_DMR_01_F",2},{"srifle_EBR_F",3},{"srifle_GM6_F",1},{"LMG_Mk200_F",3},{"LMG_Zafir_F",3},{"arifle_Katiba_F",3},{"arifle_Katiba_GL_F",2},{"arifle_Mk20_F",2},
			{"arifle_Mk20_plain_F",2},{"arifle_Mk20C_F",2},{"arifle_Mk20C_plain_F",2},{"arifle_Mk20_GL_F",2},{"arifle_Mk20_GL_plain_F",2},{"arifle_MXC_F",2},{"arifle_MX_F",2},
			{"arifle_MX_GL_F",2},{"arifle_MX_SW_F",2},{"arifle_MXM_F",2},{"arifle_MXC_Black_F",2},{"arifle_MX_Black_F",2},{"arifle_MX_GL_Black_F",2},{"arifle_MX_SW_Black_F",2},
			{"arifle_MXM_Black_F",2},{"arifle_SDAR_F",2},{"arifle_TRG21_F",2},{"arifle_TRG20_F",2},{"arifle_TRG21_GL_F",2},{"SMG_01_F",2},{"SMG_02_F",2},{"srifle_GM6_camo_F",2},
			{"srifle_LRR_camo_F",2},{"srifle_DMR_02_F",2},{"srifle_DMR_02_camo_F",2},{"srifle_DMR_02_sniper_F",2},{"srifle_DMR_03_F",2},{"srifle_DMR_03_khaki_F",2},{"srifle_DMR_03_tan_F",2},
			{"srifle_DMR_03_multicam_F",2},{"srifle_DMR_03_woodland_F",2},{"srifle_DMR_04_F",2},{"srifle_DMR_04_Tan_F",2},{"srifle_DMR_05_blk_F",2},{"srifle_DMR_05_hex_F",2},{"srifle_DMR_05_tan_f",2},{"srifle_DMR_06_camo_F",2},{"srifle_DMR_06_olive_F",2},{"MMG_01_hex_F",2},{"MMG_01_tan_F",2},{"MMG_02_camo_F",2},
			{"MMG_02_black_F",2},{"MMG_02_sand_F",2}
		};

		maxSecondarySlots = 4; // Maximum number of secondary weapons to be in each loot crate
		minSecondarySlots = 2; // Minimum number of secondary weapons to be in each loot crate
		secondaryWeaponLoot[] =
		{ // The number after each classname means how much of that type will be put in crate. WARNING: DO NOT USE NUMBERS WITH DECIMALS.
			{"hgun_ACPC2_F",3},{"hgun_P07_F",3},{"hgun_Pistol_heavy_01_F",3},{"hgun_Pistol_heavy_02_F",3},{"hgun_Rook40_F",3}
		};

		maxMagSlots = 6; // Maximum number of magazine slots in each loot crate
		minMagSlots = 4; // Minimum number of magazine slots in each loot crate
		magazinesLoot[] =
		{ // The number after each classname means how much of that type will be put in crate. WARNING: DO NOT USE NUMBERS WITH DECIMALS.
			{"30Rnd_556x45_Stanag",20},{"30Rnd_556x45_Stanag_Tracer_Red",20},{"30Rnd_556x45_Stanag_Tracer_Green",20},
			{"30Rnd_556x45_Stanag_Tracer_Yellow",20},{"30Rnd_65x39_caseless_mag",20},{"30Rnd_65x39_caseless_green",20},{"30Rnd_65x39_caseless_mag_Tracer",20},
			{"30Rnd_65x39_caseless_green_mag_Tracer",20},{"20Rnd_762x51_Mag",20},{"7Rnd_408_Mag",20},{"5Rnd_127x108_Mag",20},{"100Rnd_65x39_caseless_mag",20},
			{"100Rnd_65x39_caseless_mag_Tracer",20},{"200Rnd_65x39_cased_Box",20},{"200Rnd_65x39_cased_Box_Tracer",20},{"30Rnd_9x21_Mag",20},{"16Rnd_9x21_Mag",20},
			{"30Rnd_45ACP_Mag_SMG_01",20},{"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",20},{"9Rnd_45ACP_Mag",20},{"150Rnd_762x51_Box",20},{"150Rnd_762x51_Box_Tracer",20},
			{"150Rnd_762x54_Box",20},{"150Rnd_762x54_Box_Tracer",20},{"11Rnd_45ACP_Mag",20},{"6Rnd_45ACP_Cylinder",20},{"10Rnd_762x51_Mag",20},{"10Rnd_762x54_Mag",20},
			{"5Rnd_127x108_APDS_Mag",20},{"10Rnd_338_Mag",20},{"130Rnd_338_Mag",20},{"10Rnd_127x54_Mag",20},{"150Rnd_93x64_Mag",20},{"10Rnd_93x64_DMR_05_Mag",20}
		};

		maxAttSlots = 4; // Maximum number of attachment slots in each loot crate
		minAttSlots = 2; // Minimum number of attachment slots in each loot crate
		attachmentsLoot[] =
		{ // The number after each classname means how much of that type will be put in crate. WARNING: DO NOT USE NUMBERS WITH DECIMALS.
			{"ItemGPS",5},{"ItemRadio",4},{"ItemMap",6},{"MineDetector",1},{"Binocular",4},{"Rangefinder",2},{"Medikit",3},{"ToolKit",1},
			{"muzzle_snds_H",2},{"muzzle_snds_L",2},{"muzzle_snds_M",2},{"muzzle_snds_B",2},{"muzzle_snds_H_MG",2},{"muzzle_snds_H_SW",2},
			{"optic_Arco",3},{"optic_Aco",3},{"optic_ACO_grn",3},{"optic_Aco_smg",3},{"optic_ACO_grn_smg",3},{"optic_Holosight",3},
			{"optic_Holosight_smg",3},{"optic_SOS",3},{"acc_flashlight",3},{"acc_pointer_IR",3},{"optic_MRCO",3},{"muzzle_snds_acp",3},
			{"optic_NVS",3},{"optic_DMS",3},{"optic_Yorris",2},{"optic_MRD",2},{"optic_LRPS",3},{"muzzle_snds_338_black",3},{"muzzle_snds_338_green",3},
			{"muzzle_snds_338_sand",3},{"muzzle_snds_93mmg",3},{"muzzle_snds_93mmg_tan",3},{"optic_AMS",3},{"optic_AMS_khk",3},{"bipod_03_F_oli",3},
			{"optic_AMS_snd",3},{"optic_KHS_blk",3},{"optic_KHS_hex",3},{"optic_KHS_old",3},{"optic_KHS_tan",3},{"bipod_01_F_snd",3},
			{"bipod_01_F_blk",3},{"bipod_01_F_mtp",3},{"bipod_02_F_blk",3},{"bipod_02_F_tan",3},{"bipod_02_F_hex",3},{"bipod_03_F_blk",3}
		};

		maxItemSlots = 4; // Maximum number of attachment slots in each loot crate
		minItemSlots = 2; // Minimum number of attachment slots in each loot crate
		itemsLoot[] =
		{ // The number after each classname means how much of that type will be put in crate. WARNING: DO NOT USE NUMBERS WITH DECIMALS.
			{"Exile_Item_Flag",3},{"Exile_Item_FuelCanisterFull",2},{"Exile_Item_FuelCanisterEmpty",1},{"Exile_Item_InstaDoc",4},{"Exile_Item_Matches",3},{"Exile_Item_PlasticBottleFreshWater",5}
		};

		maxVestSlots = 4; // Maximum number of vest slots in each loot crate
		minVestSlots = 2; // Minimum number of vest slots in each loot crate
		vestsLoot[] = // NOTE ABOUT VESTS: it is recommended to keep amount for each vest at 1 because vests do not stack unlike weapons, items and magazines
		{ // The number after each classname means how much of that type will be put in crate. WARNING: DO NOT USE NUMBERS WITH DECIMALS.
			{"V_PlateCarrier1_rgr",1},{"V_PlateCarrier2_rgr",1},{"V_PlateCarrier3_rgr",1},{"V_PlateCarrierGL_rgr",1},{"V_PlateCarrier1_blk",1},
			{"V_PlateCarrierSpec_rgr",1},{"V_Chestrig_khk",1},{"V_Chestrig_rgr",1},{"V_Chestrig_blk",1},{"V_Chestrig_oli",1},{"V_TacVest_khk",1},
			{"V_TacVest_brn",1},{"V_TacVest_oli",1},{"V_TacVest_blk",1},{"V_TacVest_camo",1},{"V_TacVest_blk_POLICE",1},{"V_TacVestIR_blk",1},{"V_TacVestCamo_khk",1},
			{"V_HarnessO_brn",1},{"V_HarnessOGL_brn",1},{"V_HarnessO_gry",1},{"V_HarnessOGL_gry",1},{"V_HarnessOSpec_brn",1},{"V_HarnessOSpec_gry",1},
			{"V_PlateCarrierIA1_dgtl",1},{"V_PlateCarrierIA2_dgtl",1},{"V_PlateCarrierIAGL_dgtl",1},{"V_RebreatherB",1},{"V_RebreatherIR",1},{"V_RebreatherIA",1},
			{"V_PlateCarrier_Kerry",1},{"V_PlateCarrierL_CTRG",1},{"V_PlateCarrierH_CTRG",1},{"V_I_G_resistanceLeader_F",1},{"V_Press_F",1}
		};

		maxHeadGearSlots = 4; // Maximum number of headGear slots in each loot crate
		minHeadGearSlots = 2; // Minimum number of headGear slots in each loot crate
		headGearLoot[] = // NOTE ABOUT HEADGEAR: it is recommended to keep amount for each headGear item at 1 because headGear items do not stack unlike weapons, items and magazines
		{ // The number after each classname means how much of that type will be put in crate. WARNING: DO NOT USE NUMBERS WITH DECIMALS.
			{"H_HelmetB",1},{"H_HelmetB_camo",1},{"H_HelmetB_paint",1},{"H_HelmetB_light",1},{"H_Booniehat_khk",1},{"H_Booniehat_oli",1},{"H_Booniehat_indp",1},
			{"H_Booniehat_mcamo",1},{"H_Booniehat_grn",1},{"H_Booniehat_tan",1},{"H_Booniehat_dirty",1},{"H_Booniehat_dgtl",1},{"H_Booniehat_khk_hs",1},{"H_HelmetB_plain_mcamo",1},
			{"H_HelmetB_plain_blk",1},{"H_HelmetSpecB",1},{"H_HelmetSpecB_paint1",1},{"H_HelmetSpecB_paint2",1},{"H_HelmetSpecB_blk",1},{"H_HelmetIA",1},{"H_HelmetIA_net",1},
			{"H_HelmetIA_camo",1},{"H_Helmet_Kerry",1},{"H_HelmetB_grass",1},{"H_HelmetB_snakeskin",1},{"H_HelmetB_desert",1},{"H_HelmetB_black",1},{"H_HelmetB_sand",1},
			{"H_Cap_red",1},{"H_Cap_blu",1},{"H_Cap_oli",1},{"H_Cap_headphones",1},{"H_Cap_tan",1},{"H_Cap_blk",1},{"H_Cap_blk_CMMG",1},{"H_Cap_brn_SPECOPS",1},{"H_Cap_tan_specops_US",1},
			{"H_Cap_khaki_specops_UK",1},{"H_Cap_grn",1},{"H_Cap_grn_BI",1},{"H_Cap_blk_Raven",1},{"H_Cap_blk_ION",1},{"H_Cap_oli_hs",1},{"H_Cap_press",1},{"H_Cap_usblack",1},{"H_Cap_police",1},
			{"H_HelmetCrew_B",1},{"H_HelmetCrew_O",1},{"H_HelmetCrew_I",1},{"H_PilotHelmetFighter_B",1},{"H_PilotHelmetFighter_O",1},{"H_PilotHelmetFighter_I",1},
			{"H_PilotHelmetHeli_B",1},{"H_PilotHelmetHeli_O",1},{"H_PilotHelmetHeli_I",1},{"H_CrewHelmetHeli_B",1},{"H_CrewHelmetHeli_O",1},{"H_CrewHelmetHeli_I",1},{"H_HelmetO_ocamo",1},
			{"H_HelmetLeaderO_ocamo",1},{"H_MilCap_ocamo",1},{"H_MilCap_mcamo",1},{"H_MilCap_oucamo",1},{"H_MilCap_rucamo",1},{"H_MilCap_gry",1},{"H_MilCap_dgtl",1},
			{"H_MilCap_blue",1},{"H_HelmetB_light_grass",1},{"H_HelmetB_light_snakeskin",1},{"H_HelmetB_light_desert",1},{"H_HelmetB_light_black",1},{"H_HelmetB_light_sand",1},{"H_BandMask_blk",1},
			{"H_BandMask_khk",1},{"H_BandMask_reaper",1},{"H_BandMask_demon",1},{"H_HelmetO_oucamo",1},{"H_HelmetLeaderO_oucamo",1},{"H_HelmetSpecO_ocamo",1},{"H_HelmetSpecO_blk",1},
			{"H_Bandanna_surfer",1},{"H_Bandanna_khk",1},{"H_Bandanna_khk_hs",1},{"H_Bandanna_cbr",1},{"H_Bandanna_sgg",1},{"H_Bandanna_sand",1},{"H_Bandanna_surfer_blk",1},{"H_Bandanna_surfer_grn",1},
			{"H_Bandanna_gry",1},{"H_Bandanna_blu",1},{"H_Bandanna_camo",1},{"H_Bandanna_mcamo",1},{"H_Shemag_khk",1},{"H_Shemag_tan",1},{"H_Shemag_olive",1},{"H_Shemag_olive_hs",1},
			{"H_ShemagOpen_khk",1},{"H_ShemagOpen_tan",1},{"H_Beret_blk",1},{"H_Beret_blk_POLICE",1},{"H_Beret_red",1},{"H_Beret_grn",1},{"H_Beret_grn_SF",1},{"H_Beret_brn_SF",1},
			{"H_Beret_ocamo",1},{"H_Beret_02",1},{"H_Beret_Colonel",1},{"H_Watchcap_blk",1},{"H_Watchcap_cbr",1},{"H_Watchcap_khk",1},{"H_Watchcap_camo",1},{"H_Watchcap_sgg",1},
			{"H_TurbanO_blk",1},{"H_Cap_marshal",1}
		};

		maxBagSlots = 4;
		minBagSlots = 2;
		backpacksLoot[] = // NOTE ABOUT BACKPACKS: it is recommended to keep amount for each bag at 1 because bags do not stack unlike weapons, items and magazines
		{ // The number after each classname means how much of that type will be put in crate. WARNING: DO NOT USE NUMBERS WITH DECIMALS.
			{"B_AssaultPack_khk",1},{"B_AssaultPack_dgtl",1},{"B_AssaultPack_rgr",1},{"B_AssaultPack_sgg",1},{"B_AssaultPack_cbr",1},
			{"B_AssaultPack_mcamo",1},{"B_TacticalPack_rgr",1},{"B_TacticalPack_mcamo",1},{"B_TacticalPack_ocamo",1},{"B_TacticalPack_blk",1},
			{"B_TacticalPack_oli",1},{"B_FieldPack_khk",1},{"B_FieldPack_ocamo",1},{"B_FieldPack_oucamo",1},{"B_FieldPack_cbr",1},
			{"B_FieldPack_blk",1},{"B_Carryall_ocamo",1},{"B_Carryall_oucamo",1},{"B_Carryall_mcamo",1},{"B_Carryall_khk",1},{"B_Carryall_cbr",1},
			{"B_Parachute",1},{"B_FieldPack_oli",1},{"B_Carryall_oli",1},{"B_Kitbag_Base",1},{"B_Kitbag_cbr",1},{"B_Kitbag_mcamo",1},
			{"B_Kitbag_rgr",1},{"B_Kitbag_sgg",1},{"B_OutdoorPack_Base",1},{"B_OutdoorPack_blk",1},{"B_OutdoorPack_blu",1},
			{"B_OutdoorPack_tan",1}
		};

		blackListLoot[] =
		{
			"DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag",
			"APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag",
			"ChainSaw","srifle_DMR_03_spotter_F"
		};
		// End of loot crate configuration
	};
	class aiGear
	{
		// Configuration of what AI have
		aiHeadGear[] =
		{
			"H_HelmetB","H_HelmetB_camo","H_HelmetB_paint","H_HelmetB_light","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_indp",
			"H_Booniehat_mcamo","H_Booniehat_grn","H_Booniehat_tan","H_Booniehat_dirty","H_Booniehat_dgtl","H_Booniehat_khk_hs","H_HelmetB_plain_mcamo",
			"H_HelmetB_plain_blk","H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetIA","H_HelmetIA_net",
			"H_HelmetIA_camo","H_Helmet_Kerry","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand",
			"H_Cap_red","H_Cap_blu","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_brn_SPECOPS","H_Cap_tan_specops_US",
			"H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_grn_BI","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_oli_hs","H_Cap_press","H_Cap_usblack","H_Cap_police",
			"H_HelmetCrew_B","H_HelmetCrew_O","H_HelmetCrew_I","H_PilotHelmetFighter_B","H_PilotHelmetFighter_O","H_PilotHelmetFighter_I",
			"H_PilotHelmetHeli_B","H_PilotHelmetHeli_O","H_PilotHelmetHeli_I","H_CrewHelmetHeli_B","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I","H_HelmetO_ocamo",
			"H_HelmetLeaderO_ocamo","H_MilCap_ocamo","H_MilCap_mcamo","H_MilCap_oucamo","H_MilCap_rucamo","H_MilCap_gry","H_MilCap_dgtl",
			"H_MilCap_blue","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand","H_BandMask_blk",
			"H_BandMask_khk","H_BandMask_reaper","H_BandMask_demon","H_HelmetO_oucamo","H_HelmetLeaderO_oucamo","H_HelmetSpecO_ocamo","H_HelmetSpecO_blk",
			"H_Bandanna_surfer","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn",
			"H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_camo","H_Bandanna_mcamo","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_olive_hs",
			"H_ShemagOpen_khk","H_ShemagOpen_tan","H_Beret_blk","H_Beret_blk_POLICE","H_Beret_red","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF",
			"H_Beret_ocamo","H_Beret_02","H_Beret_Colonel","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_sgg",
			"H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","H_StrawHat","H_StrawHat_dark","H_TurbanO_blk","rhs_6b27m_digi",
			"rhs_6b27m_digi_bala","rhs_6b27m_digi_ess","rhs_6b27m_digi_ess_bala","rhs_6b27m","rhs_6b27m_ess","rhs_6b27m_bala","rhs_6b27m_ess_bala","rhs_6b27m_ml",
			"rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala","TRYK_US_ESS_Glasses",
			"TRYK_US_ESS_Glasses_WH","TRYK_US_ESS_Glasses_BLK","TRYK_US_ESS_Glasses_TAN","TRYK_US_ESS_Glasses_TAN_BLK","TRYK_SPGEAR_Glasses","TRYK_headset_Glasses","TRYK_SpsetG_Glasses",
			"TRYK_Spset_PHC1_Glasses","TRYK_Spset_PHC2_Glasses","TRYK_US_ESS_Glasses_H","TRYK_US_ESS_Glasses_Cover","TRYK_headset2_glasses","TRYK_US_ESS_Glasses_NV","TRYK_US_ESS_Glasses_TAN_NV",
			"TRYK_ESS_BLKTAN_NV","TRYK_ESS_BLKBLK_NV","TRYK_G_Shades_Black_NV","TRYK_G_Shades_Blue_NV","TRYK_G_bala_ess_NV","TRYK_bandana_NV","TRYK_SPgearG_NV",
			"TRYK_SPgear_PHC1_NV","TRYK_SPgear_PHC2_NV","TRYK_G_bala_wh_NV","TRYK_ESS_wh_NV","TRYK_ESS_CAP_OD","TRYK_ESS_CAP_tan","TRYK_R_CAP_BLK",
			"TRYK_R_CAP_TAN","TRYK_R_CAP_OD_US","TRYK_r_cap_tan_Glasses","TRYK_r_cap_blk_Glasses","TRYK_r_cap_od_Glasses","TRYK_H_headsetcap_Glasses","TRYK_H_headsetcap_blk_Glasses",
			"TRYK_H_headsetcap_od_Glasses","TRYK_TAC_EARMUFF_SHADE","TRYK_TAC_EARMUFF","TRYK_NOMIC_TAC_EARMUFF","TRYK_headset2","TRYK_TAC_EARMUFF_Gs","TRYK_TAC_SET_bn",
			"TRYK_NOMIC_TAC_EARMUFF_Gs","TRYK_TAC_EARMUFF_SHADE_Gs","TRYK_TAC_SET_TAN","TRYK_TAC_SET_OD","TRYK_TAC_SET_WH","TRYK_TAC_SET_MESH","TRYK_TAC_SET_TAN_2",
			"TRYK_TAC_SET_OD_2","TRYK_TAC_SET_WH_2","TRYK_TAC_SET_MESH_2","TRYK_bandana_g","TRYK_H_PASGT_BLK","TRYK_H_PASGT_OD","TRYK_H_PASGT_COYO",
			"TRYK_H_PASGT_TAN","TRYK_H_Helmet_Snow","TRYK_H_WH","TRYK_H_GR","TRYK_H_AOR1","TRYK_H_AOR2","TRYK_H_EARMUFF",
			"TRYK_H_TACEARMUFF_H","TRYK_H_Bandana_H","TRYK_H_Bandana_wig","TRYK_H_Bandana_wig_g","TRYK_H_wig","TRYK_H_headset2","TRYK_H_ghillie_over",
			"TRYK_H_ghillie_top","TRYK_H_ghillie_top_headless","TRYK_H_ghillie_over_green","TRYK_H_ghillie_top_green","TRYK_H_ghillie_top_headless_green","TRYK_H_woolhat","TRYK_H_woolhat_CW",
			"TRYK_H_woolhat_WH","TRYK_H_woolhat_br","TRYK_H_woolhat_cu","TRYK_H_woolhat_tan","TRYK_H_headsetcap","TRYK_H_headsetcap_blk","TRYK_H_headsetcap_od",
			"TRYK_H_pakol","TRYK_H_pakol2","TRYK_H_LHS_HEL_G","TRYK_H_Helmet_Winter","TRYK_H_Helmet_Winter_2","TRYK_Headphone_NV","TRYK_HRPIGEAR_NV",
			"TRYK_Headset_NV","TRYK_TAC_boonie_SET_NV","TRYK_TAC_SET_NV_TAN","TRYK_TAC_SET_NV_OD","TRYK_TAC_SET_NV_WH","TRYK_TAC_SET_NV_MESH","TRYK_TAC_SET_NV_TAN_2",
			"TRYK_TAC_SET_NV_OD_2","TRYK_TAC_SET_NV_WH_2","TRYK_TAC_SET_NV_MESH_2","TRYK_H_DELTAHELM_NV","TRYK_Shemagh_shade_MESH","TRYK_Shemagh_shade_N","TRYK_Shemagh_shade_G_N",
			"TRYK_Shemagh_shade_WH_N","TRYK_kio_balaclava_WH","TRYK_kio_balaclava_BLK","TRYK_kio_balaclavas","TRYK_kio_balaclava_BLK_ear","TRYK_kio_balaclava_ear","TRYK_kio_balaclava_ESS",
			"TRYK_Shemagh","TRYK_Shemagh_mesh","TRYK_Shemagh_G","TRYK_Shemagh_WH","TRYK_Shemagh_shade","TRYK_Shemagh_shade_G","TRYK_Shemagh_shade_WH",
			"TRYK_Shemagh_shade_MH","TRYK_Shemagh_ESS","TRYK_Shemagh_ESS_G","TRYK_Shemagh_ESS_WH","TRYK_Shemagh_EAR_TAN","TRYK_Shemagh_EAR_WH","TRYK_balaclava_BLACK_NV",
			"TRYK_balaclava_NV","TRYK_balaclava_BLACK_EAR_NV","TRYK_balaclava_EAR_NV","TRYK_Shemagh_TAN_NV","TRYK_Shemagh_MESH_NV","TRYK_Shemagh_G_NV","TRYK_Shemagh_WH_NV",
			"TRYK_Shemagh_EAR_NV","TRYK_Shemagh_EAR_G_NV","TRYK_Shemagh_EAR_WH_NV","TRYK_ShemaghESSTAN_NV","TRYK_ShemaghESSOD_NV","TRYK_ShemaghESSWH_NV"
		};
		aiUniforms[] =
		{
			"U_I_CombatUniform","U_I_CombatUniform_tshirt","U_I_CombatUniform_shortsleeve","U_I_pilotCoveralls",
			"U_I_GhillieSuit","U_I_OfficerUniform","U_MillerBody","U_KerryBody","U_IG_Guerilla1_1","U_IG_Guerilla2_1",
			"U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_IG_leader","U_BG_Guerilla1_1",
			"U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2","U_BG_leader","U_OG_Guerilla1_1",
			"U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_OG_leader",
			"U_C_WorkerCoveralls","U_C_HunterBody_grn","U_C_HunterBody_brn","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_survival_uniform",
			"U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F","U_IG_Guerrilla_6_1","U_BG_Guerrilla_6_1","U_OG_Guerrilla_6_1",
			"U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard",
			"U_O_FullGhillie_ard","U_I_FullGhillie_lsh","U_I_FullGhillie_sard","U_I_FullGhillie_ard","U_C_Journalist","U_C_Poloshirt_blue",
			"U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2",
			"U_C_Poor_shorts_1","U_C_Scientist","U_OrestesBody","U_Rangemaster","U_NikosAgedBody","U_NikosBody","U_Competitor",
			"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_worn",
			"U_BG_Guerilla2_2","U_B_GhillieSuit","U_O_GhillieSuit","U_I_Wetsuit","U_O_Wetsuit","U_B_Wetsuit","U_B_HeliPilotCoveralls",
			"U_I_HeliPilotCoveralls","U_B_PilotCoveralls","U_O_PilotCoveralls","rhs_uniform_cu_ocp","rhs_uniform_cu_ucp","rhs_uniform_cu_ocp_101st","rhs_uniform_df15",
			"rhs_uniform_m88_patchless","rhs_uniform_emr_patchless","rhs_uniform_flora_patchless","rhs_uniform_flora_patchless_alt","rhs_uniform_FROG01_m81",
			"rhs_uniform_FROG01_d","rhs_uniform_FROG01_wd","rhs_uniform_m88_patchless","rhs_uniform_mflora_patchless","rhs_uniform_vdv_mflora","TRYK_HRP_UCP",
			"TRYK_HRP_USMC","TRYK_HRP_khk","TRYK_U_B_OD_OD_CombatUniform","TRYK_U_B_OD_OD_R_CombatUniform","TRYK_U_B_TANTAN_CombatUniform","TRYK_U_B_TANTAN_R_CombatUniform","TRYK_U_B_BLKBLK_CombatUniform",
			"TRYK_U_B_BLKBLK_R_CombatUniform","TRYK_U_B_GRYOCP_CombatUniform","TRYK_U_B_GRYOCP_R_CombatUniformTshirt","TRYK_U_B_TANOCP_CombatUniform","TRYK_U_B_TANOCP_R_CombatUniformTshirt","TRYK_U_B_BLKOCP_CombatUniform","TRYK_U_B_BLKOCP_R_CombatUniformTshirt",
			"TRYK_U_B_BLKTAN_CombatUniform","TRYK_U_B_BLKTANR_CombatUniformTshirt","TRYK_U_B_ODTAN_CombatUniform","TRYK_U_B_ODTANR_CombatUniformTshirt","TRYK_U_B_GRTAN_CombatUniform","TRYK_U_B_GRTANR_CombatUniformTshirt","TRYK_U_B_wood_CombatUniform",
			"TRYK_U_B_woodR_CombatUniformTshirt","TRYK_U_B_wood3c_CombatUniform","TRYK_U_B_wood3c_CombatUniformTshirt","TRYK_U_B_MARPAT_WOOD_CombatUniform","TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt","TRYK_U_B_WOOD_MARPAT_CombatUniform","TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",
			"TRYK_U_B_woodtan_CombatUniform","TRYK_U_B_woodtanR_CombatUniformTshirt","TRYK_U_B_JSDF_CombatUniform","TRYK_U_B_JSDF_CombatUniformTshirt","TRYK_U_B_3CD_Delta_BDU","TRYK_U_B_3CD_Delta_BDUTshirt","TRYK_U_B_3CD_Ranger_BDU",
			"TRYK_U_B_3CD_Ranger_BDUTshirt","TRYK_U_B_3CD_BLK_BDUTshirt","TRYK_U_B_3CD_BLK_BDUTshirt2","TRYK_U_B_ACU","TRYK_U_B_ACUTshirt","TRYK_U_B_MARPAT_Wood","TRYK_U_B_MARPAT_Wood_Tshirt",
			"TRYK_U_B_MARPAT_Desert","TRYK_U_B_MARPAT_Desert_Tshirt","TRYK_U_B_MARPAT_Desert2","TRYK_U_B_MARPAT_Desert2_Tshirt","TRYK_U_B_3c","TRYK_U_B_3cr","TRYK_U_B_Sage_Tshirt",
			"TRYK_U_B_BLK3CD","TRYK_U_B_BLK3CD_Tshirt","TRYK_U_B_BLK","TRYK_U_B_BLK_Tshirt","TRYK_U_B_BLKTAN","TRYK_U_B_BLKTAN_Tshirt","TRYK_U_B_ODTAN",
			"TRYK_U_B_ODTAN_Tshirt","TRYK_U_B_BLK_OD","TRYK_U_B_BLK_OD_Tshirt","TRYK_U_B_C01_Tsirt","TRYK_U_B_C02_Tsirt","TRYK_U_B_OD_BLK","TRYK_U_B_OD_BLK_2",
			"TRYK_U_B_BLK_TAN_1","TRYK_U_B_BLK_TAN_2","TRYK_U_B_wh_tan_Rollup_CombatUniform","TRYK_U_B_wh_OD_Rollup_CombatUniform","TRYK_U_B_wh_blk_Rollup_CombatUniform","TRYK_U_B_BLK_tan_Rollup_CombatUniform","TRYK_U_B_BLK_OD_Rollup_CombatUniform",
			"TRYK_U_B_NATO_UCP_GRY_CombatUniform","TRYK_U_B_NATO_UCP_GRY_R_CombatUniform","TRYK_U_B_NATO_UCP_CombatUniform","TRYK_U_B_NATO_UCP_R_CombatUniform","TRYK_U_B_NATO_OCP_c_BLK_CombatUniform","TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform","TRYK_U_B_NATO_OCP_BLK_CombatUniform",
			"TRYK_U_B_NATO_OCP_BLK_R_CombatUniform","TRYK_U_B_NATO_OCPD_CombatUniform","TRYK_U_B_NATO_OCPD_R_CombatUniform","TRYK_U_B_NATO_OCP_CombatUniform","TRYK_U_B_NATO_OCP_R_CombatUniform","TRYK_U_B_AOR1_Rollup_CombatUniform","TRYK_U_B_AOR2_Rollup_CombatUniform",
			"TRYK_U_B_MTP_CombatUniform","TRYK_U_B_MTP_R_CombatUniform","TRYK_U_B_MTP_BLK_CombatUniform","TRYK_U_B_MTP_BLK_R_CombatUniform","TRYK_U_B_Woodland","TRYK_U_B_Woodland_Tshirt","TRYK_U_B_WDL_GRY_CombatUniform",
			"TRYK_U_B_WDL_GRY_R_CombatUniform","TRYK_U_B_ARO1_GR_CombatUniform","TRYK_U_B_ARO1_GR_R_CombatUniform","TRYK_U_B_ARO1_GRY_CombatUniform","TRYK_U_B_ARO1_GRY_R_CombatUniform","TRYK_U_B_ARO1_CombatUniform","TRYK_U_B_ARO1R_CombatUniform",
			"TRYK_U_B_ARO1_BLK_CombatUniform","TRYK_U_B_ARO1_BLK_R_CombatUniform","TRYK_U_B_ARO1_CBR_CombatUniform","TRYK_U_B_ARO1_CBR_R_CombatUniform","TRYK_U_B_ARO2_CombatUniform","TRYK_U_B_ARO2R_CombatUniform","TRYK_U_B_AOR2_BLK_CombatUniform",
			"TRYK_U_B_AOR2_BLK_R_CombatUniform","TRYK_U_B_AOR2_OD_CombatUniform","TRYK_U_B_AOR2_OD_R_CombatUniform","TRYK_U_B_AOR2_GRY_CombatUniform","TRYK_U_B_AOR2_GRY_R_CombatUniform","TRYK_U_B_Snow_CombatUniform","TRYK_U_B_Snowt",
			"TRYK_U_B_Denim_T_WH","TRYK_U_B_Denim_T_BK","TRYK_U_B_BLK_T_WH","TRYK_U_B_BLK_T_BK","TRYK_U_B_RED_T_BR","TRYK_U_B_Denim_T_BG_WH","TRYK_U_B_Denim_T_BG_BK",
			"TRYK_U_B_BLK_T_BG_WH","TRYK_U_B_BLK_T_BG_BK","TRYK_U_B_RED_T_BG_BR","TRYK_U_B_fleece","TRYK_U_B_fleece_UCP","TRYK_U_B_UCP_PCUs","TRYK_U_B_GRY_PCUs",
			"TRYK_U_B_Wood_PCUs","TRYK_U_B_PCUs","TRYK_U_B_UCP_PCUs_R","TRYK_U_B_GRY_PCUs_R","TRYK_U_B_Wood_PCUs_R","TRYK_U_B_PCUs_R","TRYK_U_B_PCUGs",
			"TRYK_U_B_PCUODs","TRYK_U_B_PCUGs_gry","TRYK_U_B_PCUGs_BLK","TRYK_U_B_PCUGs_OD","TRYK_U_B_PCUGs_gry_R","TRYK_U_B_PCUGs_BLK_R","TRYK_U_B_PCUGs_OD_R",
			"TRYK_U_Bts_GRYGRY_PCUs","TRYK_U_Bts_UCP_PCUs","TRYK_U_Bts_Wood_PCUs","TRYK_U_Bts_PCUs","TRYK_U_pad_j","TRYK_U_pad_j_blk","TRYK_U_pad_hood_Cl",
			"TRYK_U_pad_hood_Cl_blk","TRYK_U_pad_hood_tan","TRYK_U_pad_hood_Blk","TRYK_U_pad_hood_CSATBlk","TRYK_U_pad_hood_Blod","TRYK_U_pad_hood_odBK","TRYK_U_pad_hood_BKT2",
			"TRYK_hoodie_Blk","TRYK_hoodie_FR","TRYK_hoodie_Wood","TRYK_hoodie_3c","TRYK_T_camo_tan","TRYK_T_camo_3c","TRYK_T_camo_Wood",
			"TRYK_T_camo_wood_marpat","TRYK_T_camo_Desert_marpat","TRYK_T_camo_3c_BG","TRYK_T_camo_Wood_BG","TRYK_T_camo_wood_marpat_BG","TRYK_T_camo_desert_marpat_BG","TRYK_T_PAD",
			"TRYK_T_OD_PAD","TRYK_T_TAN_PAD","TRYK_T_BLK_PAD","TRYK_T_T2_PAD","TRYK_T_CSAT_PAD","TRYK_U_nohoodPcu_gry","TRYK_U_hood_nc",
			"TRYK_U_hood_mc","TRYK_U_denim_hood_blk","TRYK_U_denim_hood_mc","TRYK_U_denim_hood_3c","TRYK_U_denim_hood_nc","TRYK_U_denim_jersey_blu","TRYK_U_denim_jersey_blk",
			"TRYK_shirts_PAD","TRYK_shirts_OD_PAD","TRYK_shirts_TAN_PAD","TRYK_shirts_BLK_PAD","TRYK_shirts_PAD_BK","TRYK_shirts_OD_PAD_BK","TRYK_shirts_TAN_PAD_BK",
			"TRYK_shirts_BLK_PAD_BK","TRYK_shirts_PAD_BLW","TRYK_shirts_OD_PAD_BLW","TRYK_shirts_TAN_PAD_BLW","TRYK_shirts_BLK_PAD_BLW","TRYK_shirts_PAD_YEL","TRYK_shirts_OD_PAD_YEL",
			"TRYK_shirts_TAN_PAD_YEL","TRYK_shirts_BLK_PAD_YEL","TRYK_shirts_PAD_RED2","TRYK_shirts_OD_PAD_RED2","TRYK_shirts_TAN_PAD_RED2","TRYK_shirts_BLK_PAD_RED2","TRYK_shirts_PAD_BLU3",
			"TRYK_shirts_OD_PAD_BLU3","TRYK_shirts_TAN_PAD_BLU3","TRYK_shirts_BLK_PAD_BLU3","TRYK_shirts_DENIM_R","TRYK_shirts_DENIM_BL","TRYK_shirts_DENIM_BK","TRYK_shirts_DENIM_WH",
			"TRYK_shirts_DENIM_BWH","TRYK_shirts_DENIM_RED2","TRYK_shirts_DENIM_WHB","TRYK_shirts_DENIM_ylb","TRYK_shirts_DENIM_od","TRYK_shirts_DENIM_R_Sleeve","TRYK_shirts_DENIM_BL_Sleeve",
			"TRYK_shirts_DENIM_BK_Sleeve","TRYK_shirts_DENIM_WH_Sleeve","TRYK_shirts_DENIM_BWH_Sleeve","TRYK_shirts_DENIM_RED2_Sleeve","TRYK_shirts_DENIM_WHB_Sleeve","TRYK_shirts_DENIM_ylb_Sleeve","TRYK_shirts_DENIM_od_Sleeve",
			"TRYK_shirts_PAD_BL","TRYK_shirts_OD_PAD_BL","TRYK_shirts_TAN_PAD_BL","TRYK_shirts_BLK_PAD_BL","TRYK_U_taki_wh","TRYK_U_taki_COY","TRYK_U_taki_BL",
			"TRYK_U_taki_BLK","TRYK_U_Bts_PCUGs","TRYK_U_Bts_PCUODs","TRYK_U_taki_G_WH","TRYK_U_taki_G_COY","TRYK_U_taki_G_BL","TRYK_U_taki_G_BLK",
			"TRYK_U_B_PCUHs","TRYK_U_B_PCUGHs","TRYK_U_B_PCUODHs","TRYK_B_USMC_R","TRYK_B_USMC_R_ROLL","TRYK_ZARATAKI","TRYK_ZARATAKI2",
			"TRYK_ZARATAKI3","TRYK_B_TRYK_UCP_T","TRYK_B_TRYK_3C_T","TRYK_B_TRYK_MTP_T","TRYK_B_TRYK_OCP_T","TRYK_B_TRYK_OCP_D_T","TRYK_DMARPAT_T",
			"TRYK_C_AOR2_T","TRYK_U_B_Sage_T","TRYK_U_B_Wood_T","TRYK_U_B_BLTAN_T","TRYK_U_B_BLOD_T","TRYK_OVERALL_flesh","TRYK_OVERALL_nok_flesh",
			"TRYK_OVERALL_SAGE_BLKboots","TRYK_OVERALL_SAGE_BLKboots_nk_blk","TRYK_OVERALL_SAGE_BLKboots_nk","TRYK_OVERALL_SAGE_BLKboots_nk_blk2","TRYK_OVERALL_SAGE","TRYK_SUITS_BLK_F","TRYK_SUITS_BR_F",
			"TRYK_H_ghillie_top_headless3glass","TRYK_shoulder_armor_BK","TRYK_shoulder_armor_OD","TRYK_shoulder_armor_CY","TRYK_H_ghillie_top_headless3","TRYK_U_B_PCUHsW","TRYK_U_B_PCUHsW2",
			"TRYK_U_B_PCUHsW3","TRYK_U_B_PCUHsW3nh","TRYK_U_B_PCUHsW4","TRYK_U_B_PCUHsW5","TRYK_U_B_PCUHsW6"
		};
		iVests[] =
		{
			"V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarrier3_rgr","V_PlateCarrierGL_rgr","V_PlateCarrier1_blk",
			"V_PlateCarrierSpec_rgr","V_Chestrig_khk","V_Chestrig_rgr","V_Chestrig_blk","V_Chestrig_oli","V_TacVest_khk",
			"V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_TacVest_blk_POLICE","V_TacVestIR_blk","V_TacVestCamo_khk",
			"V_HarnessO_brn","V_HarnessOGL_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_HarnessOSpec_gry",
			"V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_RebreatherB","V_RebreatherIR","V_RebreatherIA",
			"V_PlateCarrier_Kerry","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_I_G_resistanceLeader_F","V_Press_F"
			"V_Press_F","V_Rangemaster_belt","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli",
			"V_BandollierB_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","rhs_6sh92_headset",
			"rhs_6sh92_radio","rhs_6sh92_vog","rhs_6sh92_vog_headset","rhs_vydra_3m","rhs_6sh92_digi","rhs_6b13_6sh92_vog","rhs_6b13_6sh92_radio","rhs_6b23_digi_6sh92_vog_headset",
			"rhs_6b13_Flora","rhs_6b13_Flora_6sh92","rhs_6b13_Flora_6sh92_headset_mapcase","rhs_6b13_Flora_6sh92_vog","rhs_6b13_Flora_crewofficer","rhs_6b23",
			"rhs_6b23_6sh92","rhs_6b23_6sh92_headset","rhs_6b23_6sh92_headset_mapcase","rhs_6b23_6sh92_radio","rhs_6b23_6sh92_vog","rhs_6b23_6sh92_vog_headset",
			"rhs_6b23_crew","rhs_6b23_engineer","rhs_6b23_rifleman","rhs_6b23_sniper","rhs_6b23_ML","rhs_6b23_ML_6sh92","rhs_6b23_ML_6sh92_headset",
			"rhs_6b23_ML_6sh92_headset_mapcase","rhs_6b23_ML_6sh92_radio","rhs_6b23_ML_6sh92_vog","rhs_6b23_ML_6sh92_vog_headset","rhs_6b23_ML_crewofficer","rhs_6b23_ML_crew","rhs_6b23_ML_engineer",
			"rhs_6b23_ML_rifleman","rhs_6b23_ML_sniper","rhs_6sh46","rhsusf_iotv_ocp","rhsusf_iotv_ucp","rhsusf_iotv_ocp_Medic","rhsusf_iotv_ucp_Medic",
			"rhsusf_iotv_ocp_Repair","rhsusf_iotv_ucp_Repair","rhsusf_iotv_ocp_Rifleman","rhsusf_iotv_ucp_Rifleman","rhsusf_iotv_ocp_SAW","rhsusf_iotv_ucp_SAW","rhsusf_iotv_ocp_Squadleader",
			"rhsusf_iotv_ucp_Squadleader","rhsusf_iotv_ocp_Teamleader","rhsusf_iotv_ucp_Teamleader","rhsusf_iotv_ocp_Grenadier","rhsusf_iotv_ucp_Grenadier","TRYK_Hrp_vest_ucp",
			"TRYK_V_PlateCarrier_JSDF","TRYK_V_ArmorVest_AOR1","TRYK_V_ArmorVest_AOR2","TRYK_V_ArmorVest_coyo","TRYK_V_ArmorVest_Brown","TRYK_V_ArmorVest_CBR","TRYK_V_ArmorVest_khk",
			"TRYK_V_ArmorVest_rgr","TRYK_V_ArmorVest_green","TRYK_V_ArmorVest_tan","TRYK_V_ArmorVest_Delta","TRYK_V_ArmorVest_Ranger","TRYK_V_ArmorVest_AOR1_2","TRYK_V_ArmorVest_AOR2_2",
			"TRYK_V_ArmorVest_coyo2","TRYK_V_ArmorVest_Brown2","TRYK_V_ArmorVest_cbr2","TRYK_V_ArmorVest_khk2","TRYK_V_ArmorVest_rgr2","TRYK_V_ArmorVest_green2","TRYK_V_ArmorVest_tan2",
			"TRYK_V_ArmorVest_Delta2","TRYK_V_ArmorVest_Ranger2","TRYK_V_PlateCarrier_blk","TRYK_V_PlateCarrier_coyo","TRYK_V_PlateCarrier_wood","TRYK_V_PlateCarrier_ACU","TRYK_V_TacVest_coyo",
			"TRYK_V_harnes_blk_L","TRYK_V_harnes_od_L","TRYK_V_harnes_TAN_L","TRYK_V_PlateCarrier_blk_L","TRYK_V_PlateCarrier_wood_L","TRYK_V_PlateCarrier_ACU_L","TRYK_V_PlateCarrier_coyo_L",
			"TRYK_V_ChestRig_L","TRYK_V_ChestRig","TRYK_V_Bulletproof","TRYK_V_Bulletproof_BLK","TRYK_V_Bulletproof_BL","TRYK_V_IOTV_BLK","TRYK_V_tacv1M_BK",
			"TRYK_V_tacv1MLC_BK","TRYK_V_tacv1","TRYK_V_tacv1_CY","TRYK_V_tacv1_BK","TRYK_V_tacv1_P_BK","TRYK_V_tacv1_SHERIFF_BK","TRYK_V_tacv1_FBI_BK",
			"TRYK_V_tacv1LP_BK","TRYK_V_tacv1LSRF_BK","TRYK_V_tacv1LC_BK","TRYK_V_tacv1LC_CY","TRYK_V_tacv1LC_OD","TRYK_V_tacv1LC_FBI_BK","TRYK_V_tacv1LC_SRF_BK",
			"TRYK_V_tacv1LC_SRF_OD","TRYK_V_tacv1LC_P_BK","TRYK_V_PlateCarrier_POLICE","TRYK_V_ArmorVest_HRT_B","TRYK_V_ArmorVest_HRT_OD","TRYK_V_ArmorVest_HRT2_B","TRYK_V_ArmorVest_HRT2_OD",
			"TRYK_V_ArmorVest_Winter","TRYK_V_Sheriff_BA_OD","TRYK_V_tacv10_BK","TRYK_V_tacv10_OD","TRYK_V_tacv10_TN","TRYK_V_tacv10LC_BK","TRYK_V_tacv10LC_OD",
			"TRYK_V_tacv10LC_TN","TRYK_V_tacv1L_BK","TRYK_V_tacv1L_OD","TRYK_V_tacv1L_CY","TRYK_V_tacv1LC_FBI2_BK","TRYK_V_tacv1LC_SRF2_BK","TRYK_V_tacv1LC_SRF2_OD",
			"TRYK_V_tacv1LC_P2_BK","TRYK_V_tacv1_MSL_BK","TRYK_V_tacv1_MSL_NV","TRYK_V_tacv1LMSL_BK","TRYK_V_tacv1LMSL_NV","TRYK_V_tacv1LC_MSL_BK","TRYK_V_tacv1LC_MSL_NV",
			"TRYK_V_tacSVD_BK","TRYK_V_tacSVD_OD","TRYK_V_Sheriff_BA_TL","TRYK_V_Sheriff_BA_TBL","TRYK_V_Sheriff_BA_TCL","TRYK_V_Sheriff_BA_TL2","TRYK_V_Sheriff_BA_TBL2",
			"TRYK_V_Sheriff_BA_TCL2","TRYK_V_Sheriff_BA_T","TRYK_V_Sheriff_BA_TB","TRYK_V_Sheriff_BA_T2","TRYK_V_Sheriff_BA_TB2","TRYK_V_Sheriff_BA_T3","TRYK_V_Sheriff_BA_TB3",
			"TRYK_V_Sheriff_BA_T4","TRYK_V_Sheriff_BA_TB4","TRYK_V_Sheriff_BA_T5","TRYK_V_Sheriff_BA_TB5","TRYK_V_Sheriff_BA_TBL3_BK","TRYK_V_Sheriff_BA_TBL3_OD","TRYK_V_Sheriff_BA_TBL3_TN",
			"TRYK_LOC_AK_chestrig_OD","TRYK_LOC_AK_chestrig_TAN"
		};
		aiRifles[] =
		{
			"srifle_EBR_F","srifle_DMR_01_F","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F",
			"arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F",
			"arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F",
			"arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F","SMG_01_F","SMG_02_F","hgun_PDW2000_F","arifle_MXM_Black_F",
			"arifle_MX_GL_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","LMG_Mk200_F","arifle_MX_SW_F",
			"LMG_Zafir_F","arifle_MX_SW_Black_F","rhs_weap_m249_pip_L",
			"rhs_weap_m249_pip_L_para","rhs_weap_m249_pip_L_vfg","rhs_weap_m249_pip_S","rhs_weap_m249_pip_S_para","rhs_weap_m249_pip_S_vfg","rhs_weap_m240B","rhs_weap_m240B_CAP",
			"rhs_weap_m240G","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_m16a4",
			"rhs_weap_m16a4_carryhandle","rhs_weap_m16a4_carryhandle_grip","rhs_weap_m16a4_carryhandle_grip_pmag","rhs_weap_m16a4_carryhandle_M203","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m16a4_grip","rhs_weap_m4",
			"rhs_weap_m4_grip2","rhs_weap_m4_carryhandle","rhs_weap_m4_carryhandle_pmag","rhs_weap_m4_grip","rhs_weap_m4_m203","rhs_weap_m4_m320","rhs_weap_m4a1_carryhandle",
			"rhs_weap_m4a1_carryhandle_grip2","rhs_weap_m4a1_carryhandle_pmag","rhs_weap_m4a1_carryhandle_m203","rhs_weap_m4a1","rhs_weap_m4a1_grip2","rhs_weap_m4a1_grip","rhs_weap_m4a1_m203",
			"rhs_weap_m4a1_m320","rhs_weap_m4a1_blockII","rhs_weap_m4a1_blockII_KAC","rhs_weap_m4a1_blockII_grip2","rhs_weap_m4a1_blockII_grip2_KAC","rhs_weap_m4a1_blockII_M203","rhs_weap_mk18",
			"rhs_weap_mk18_KAC","rhs_weap_mk18_grip2","rhs_weap_mk18_grip2_KAC","rhs_weap_mk18_m320","rhs_weap_ak103","rhs_weap_ak103_npz","rhs_weap_ak103_1",
			"rhs_weap_ak74m","rhs_weap_ak74m_2mag","rhs_weap_ak74m_2mag_camo","rhs_weap_ak74m_2mag_npz","rhs_weap_ak74m_camo","rhs_weap_ak74m_desert","rhs_weap_ak74m_desert_npz",
			"rhs_weap_ak74m_desert_folded","rhs_weap_ak74m_plummag_folded","rhs_weap_ak74m_folded","rhs_weap_ak74m_camo_folded","rhs_weap_ak74m_gp25","rhs_weap_ak74m_gp25_npz","rhs_weap_ak74m_npz",
			"rhs_weap_ak74m_plummag","rhs_weap_ak74m_plummag_npz","rhs_weap_akm","rhs_weap_akm_gp25","rhs_weap_akms","rhs_weap_akms_gp25","rhs_weap_M107",
			"rhs_weap_sr25","rhs_weap_sr25_ec","rhs_weap_m14ebrri","rhs_weap_XM2010","rhs_weap_XM2010_wd","rhs_weap_XM2010_d","rhs_weap_XM2010_sa",
			"rhs_weap_svd","rhs_weap_svdp_wd","rhs_weap_svdp_wd_npz","rhs_weap_svdp_npz","rhs_weap_svds","rhs_weap_svds_npz"
		};
		aiBackpacks[] =
		{
			"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_cbr",
			"B_AssaultPack_mcamo","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk",
			"B_TacticalPack_oli","B_FieldPack_khk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr",
			"B_FieldPack_blk","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_khk","B_Carryall_cbr",
			"B_Parachute","B_FieldPack_oli","B_Carryall_oli","B_Kitbag_Base","B_Kitbag_cbr","B_Kitbag_mcamo",
			"B_Kitbag_rgr","B_Kitbag_sgg","B_OutdoorPack_Base","B_OutdoorPack_blk","B_OutdoorPack_blu",
			"B_OutdoorPack_tan","TRYK_B_AssaultPack_UCP",
			"TRYK_B_AssaultPack_Type2camo","TRYK_B_AssaultPack_MARPAT_Desert","TRYK_B_AssaultPack_MARPAT_Wood","TRYK_B_Kitbag_Base","TRYK_B_Kitbag_blk","TRYK_B_Kitbag_aaf","TRYK_B_Carryall_blk",
			"TRYK_B_Carryall_wh","TRYK_B_Carryall_wood","TRYK_B_Carryall_JSDF","TRYK_B_Kitbag_Base_JSDF","TRYK_B_Coyotebackpack","TRYK_B_Coyotebackpack_OD","TRYK_B_Coyotebackpack_BLK",
			"TRYK_B_Coyotebackpack_WH","TRYK_B_Alicepack","TRYK_B_Medbag","TRYK_B_Medbag_OD","TRYK_B_Medbag_BK","TRYK_B_Medbag_ucp","TRYK_B_Belt",
			"TRYK_B_Belt_BLK","TRYK_B_Belt_CYT","TRYK_B_Belt_tan","TRYK_B_Belt_br","TRYK_B_Belt_GR","TRYK_B_Belt_AOR1","TRYK_B_Belt_AOR2",
			"TRYK_B_BAF_BAG_BLK","TRYK_B_BAF_BAG_CYT","TRYK_B_BAF_BAG_OD","TRYK_B_BAF_BAG_rgr","TRYK_B_BAF_BAG_mcamo","TRYK_B_tube_cyt","TRYK_B_tube_od",
			"TRYK_B_tube_blk","TRYK_B_FieldPack_Wood","TRYK_Winter_pack"
		};
		aiLaunchers[] =
		{
			"launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_B_Titan_short_F"
		};
		aiPistols[] =
		{
			"hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F"
		};
	};
};

class CfgPatches
{
	class Exile_VEMF_Reloaded
	{
		units[] = {"B_G_Soldier_AR_F"};
		requiredAddons[] = {"exile_server"};
		fileName = "Exile_VEMF_Reloaded.pbo";
		requiredVersion = 1.50;
		version = 0730.2; // Do NOT change
		author[]= {"IT07"}; // Original author: Vampire. Permission to continue/remake VEMF under VEMF_Reloaded given to IT07
	};
};

class CfgFunctions
{
	class Exile_VEMF_Reloaded
	{
		tag = "VEMFr";
		class serverFunctions
		{
			file = "Exile_VEMF_Reloaded\functions";
			class random {};
			class log {};
			class getSetting {};
			class aiKilled {};
			class findPos {};
			class broadCast {};
			class playerCount {};
			class headLessClient {};
			class signAI {};
			class transferOwner {};
			class checkPlayerPresence {};
			class loadInv {};
			class spawnAI {};
			class loadLoot {};
			class placeMines {};
			class waitForPlayers {};
			class waitForMissionDone {};
			class checkLoot {};
			class missionTimer {};
			class launch { postInit = 1; };
			class REMOTEguard { postInit = 1; };
		};
	};
};
