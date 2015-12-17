/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	ON LINUX YOU NEED THIS PARAMETER: -profiles
*/


/*
	"_serverCommandPassword" is passwordAdmin - in your servers config.cfg, needed for servercommands from client
	
	This is   VERY IMPORTANT   as it is needed to KICK & BAN people.
	
	It will try to get this password from "@ExileServer\addons\exile_server_config" first. If you did not set a password there (config.cpp),
	then it will take what you put here.
*/
_serverCommandPassword = 'penis1234';

/*
	"_passwordAdmin" is passwordAdmin - in your servers config.cfg, needed for servercommands from client
	
	This is used to be able to use the "login" function ingame. Will log you in as Arma "Admin".
*/
_passwordAdmin = 'penis123';
/* _serverCommandPassword and _passwordAdmin should always be different passwords or it could cause problems! */



/* Anti Teleport */
_UAT = true;
/* if "_UAT = true;" you can add more allowed TP positions to the array like -> _allowTP pushBack [POSITION,RADIUS]; */
_allowTP = [];
if(worldName == 'Altis')then	/* using == instead of isEqualTo because == is not case sensetive */
{
	_allowTP append
	[
		[[14599.966,16797.193,0],325],
		[[23334.605,24188.938,0],325],
		[[2998.0603,18175.479,0],325]
	];
};
if(worldName == 'Esseker')then
{
	_allowTP append
	[
		[[3943,9284,0],325],
		[[10810,4765,0],325],
		[[4739,4671,0],325]
	];
};
if(worldName == 'Bornholm')then
{
	_allowTP append
	[
		[[3092.2,5468.97,0],325],
		[[12737.6,8757.8,0],325],
		[[6420.46,17217.2,0],325]
	];
};



/* "_OPEN_ADMIN_MENU_KEY": Key to open the menu (google DIK_KeyCodes (0x3B is F1))   */
_OPEN_ADMIN_MENU_KEY = 0x3B;
_HIDE_FROM_PLAYERS = false;		/* So no normal can see it :)! */
_WRITE_TXT_LOG_FILES = true;	/* (DEFAULT VALUE: TRUE, has always been true) uses ARMA_LOG.dll */
_announce_adminstate_changed = false;	/* whenever you type !admin as an admin it will announce that you logged out or in to all players on the server! */


/* What ESCAPE Menu shows */
_ESCMNUTOP = '[GG] Ghostz Gamerz';
_ESCMNUBOT = 'www.GHOSTZGAMERZ.com';
_BRIEFING_MSG = true;	/* use mission briefing message: if   "_BRIEFING_MSG = false;"   then the message will be replaced by infiSTAR */

/* shows RESTART IN X MINS */
_USE_RESTART_TIMER = true;	/* true or false */
_RESTART_TIME_IN_M = 120;		/* restart time in minutes */
_SHOW_TIMER_IN_MIN = [1,2,3,5,10];	/* minutes before restart, when message is shown */
_VDN = true;	/* true or false - Chat-Vote Day/Night */

/* The following 3 options can be disabled by putting the value to -1. For example "_TGV = -1;" */
/* Terrain Grid Value   */ _TGV = 40;		/* 50, 25, 12.5  */	/* if set to 50 grass will be very low for better client FPS.. default is 25 ~35 is good performance and grass :) */
/* ViewDistance Value   */ _VDV = -1;
/* ObjectViewDistance   */ _VOV = -1;

/* "_LogAdminActions": Sends actions done by each admin to the server to log it to the .txt file and .rpt file + sends it back to all other admins. */
_LogAdminActions = true;	/* true or false */
_enableIngameLogs = true;	/* true or false */

/* "_startAsNormal": if you add admin UIDs in here as well, they will start as almost "normal" player instead of with admin menu and such. */
_startAsNormal =
[
	'0','0','0'
];


_adminUIDandAccess =
[
	[
		/* Head Admin/Owner */
		['76561198078201908', //GR8
		 '76561198153784743', //Ghost
		 '76561198195305425', //Shahzad
		 '76561198115492831', //BigEgg
		 '76561198137100220', //Deadskin
		 '76561198001066546', //Meowmix
		 //Add UID's Above - Don't forget the comma!
		 '0'],
		[
			'Teleport On Map Click','Teleport - Target To Me','Teleport - Me To Target','Teleport In Facing Direction (10m steps)',
			'spectating','AdminConsole','Delete Vehicle','FlyUp','ShowGear','Show Server Information',
			'HealSelf','HealRepairNear','AdminLog','Freeze Target','UnFreeze Target','Restrain','UnRestrain',
			'==== Loadouts ====','==== Vehicles ====','==== Base Deleter ====','==== WeatherLord ====','Items spawn menu',
			'Remove Gear','Heal','Restore','Flip Vehicle','Move In My Vehicle','Move In Target Vehicle','Eject','Eject Crew',
			'Kill','Explode','Force Disconnect','Kick (Silent)','Kick (Announce)','Ban (Silent)','Ban (Announce)',
			'infiSTAR Player ESP','infiSTAR Dead ESP','infiSTAR AI ESP',
			'infiSTAR MapIcons','Vehicle Marker','Flag Marker (with radius)','DeadPlayer Marker',
			'God Mode','Vehicle God Mode','Lower Terrain','Vehboost','UnlimAmmo','noRecoil','FastFire','Stealth / Invisible',
			'Disable Announces','Mass Message','Spawn Support-Boxes',
			'Spawn Ammo','Login as Arma Admin','BIS FreeRoam Cam (works with ESP)','FreeRoam Cam (does not work with ESP)',
			'Request Steam Name','showinfo','Add / Remove Money','Add / Remove Respect'
		]
	],
	[
		/* Admins */
		['76561198029881052', //Dirk Verite
		 '76561198067566966', //Snipernosniping
		 '76561198163835069', //Snipernosniping		 
		 '76561198196195669', //Shroudy
		 '76561198126348047', //Mr. Bandit
		 '76561197960289679', //TangoWhiskey
		 '76561198029881052', //Dirk Verite
		 '76561198062993387', //Azul
		 '76561198058099842', //Fap
		 '76561198056028211', //Nasty
		 //Add UID's Above - Don't forget the comma!
		 '0'],
		[
			'Teleport On Map Click','Teleport - Target To Me','Teleport - Me To Target','Teleport In Facing Direction (10m steps)',
			'spectating','Delete Vehicle','FlyUp','ShowGear','Show Server Information',
			'HealSelf','HealRepairNear','AdminLog',
			'==== Vehicles ====','==== Base Deleter ====','Items spawn menu',
			'Remove Gear','Heal','Restore','Flip Vehicle','Force Disconnect',
			'infiSTAR Player ESP','infiSTAR Dead ESP','infiSTAR AI ESP',
			'infiSTAR MapIcons','Vehicle Marker','Flag Marker (with radius)','DeadPlayer Marker',
			'God Mode','Lower Terrain','Stealth / Invisible',
			'Disable Announces','Mass Message','Spawn Support-Boxes',
			'Spawn Ammo','BIS FreeRoam Cam (works with ESP)','FreeRoam Cam (does not work with ESP)',
			'Request Steam Name','showinfo','Add / Remove Money','Add / Remove Respect'
		]
	],
	[	/* Mods */
		['76561198124203897', // Put in zeros so I don't break the code.
		 //Add UID's Above - Don't forget the comma!
		 '0'],
		[
			'spectating','Show Server Information',
			'HealSelf','HealRepairNear','Heal','Flip Vehicle',
			'Lower Terrain','Request Steam Name','showinfo','Add / Remove Money'
		]
	]
];
/* ********************************************************************************* */
/*            many checks should be set to true instead of false.                    */
/* ********************************************************************************* */
_URC = true;		/* Check unitRecoilCoefficient and reset default unitRecoilCoefficient */
_LVC = true;		/* Local Vehicle Check */
_CMC = true;		/* Check for custom CommandingMenus */
_KCM = true;		/* Just close ALL CommandingMenus */
_CAP = false;		/* Check Actions Plr - "Actions: xxx/xxx possible scroll menu hack (or you added custom actions..)" */
_wall_look = false;					/* checks if a players tries to look through a wall (if player is allowed to build in that territory, it will not be logged.) */
_wall_glitch_object = true;		/* checks if a players tries to glitch through a wall (if player is allowed to build in that territory, it will not be logged.) */
_wall_glitch_vehicle = true;		/* stops players from glitching into bases using "eject" or "getout" of a vehicle.. */
_forceWalk_near_enemyBase = false;	/* forcing players to walk when near an enemy base */
_RHS_MOD_ENABLED = true;			/* You need to set this option to true if you run RHS mod */

_maxMapMenuEntries = 6;	/* "Map Menu has been changed x entries found - Texts: y" incase you want to add some briefing to your map menu */


/* if steam api.steampowered.com is working, this might be a nice feature */
_check_steam_ban = false;	/* will announce and log steambanned players - using GetPlayerBans v1 */
_ban_for_steam_ban = false;	/* if "_check_steam_ban = true;" then steambanned players will get banned from your Arma server! */


/*  Check Global Markers */ _CGM = true;	/* true or false */	/* you may need to disable this check for A.I. Missions - or whitelist the used Markers in the _aLocalM Array beneath */
/*  Check Local Markers  */ _CLM = false;	/* true or false */	/* false if you do not want LocalMarker to be checked. */
/*  Use _aLocalM array   */ _UMW = false;	/* true or false */	/* use allowed marker array from below (for example AltisLife uses house_ and others in there) or A.I. Missions */
/* _aLocalM: if '_CLM' && _UMW - this array of names will be allowed */
_aLocalM = ['TreasureMarker','MissionMarker'];




/* _badIDDsToKick will be checked before _badIDDsToClose, _badIDDsToClose will be checked before _allowedIDDs */
/* _badIDDsToKick: Forbidden Idds that will get you Kicked by the AH */
_badIDDsToKick = [-1337,133,167,1340,1341,1342,1343,1344,1345,1346,1347];

/* _badIDDsToClose: Forbidden Idds that will get closed by the AH */
_badIDDsToClose =
[
	2,3,7,17,19,25,26,27,28,29,30,31,32,37,40,41,43,44,45,51,52,53,56,74,85,
	106,126,127,132,146,147,150,151,152,153,154,155,159,162,164,262,
	314,632,1320,2121,148,163,129,169,157,131,69
];

/* Use IDD White-List ? */ _UDW = true;	/* true or false */
/* _allowedIDDs: Insert IDDs here to prevent them from being closed! */
_allowedIDDs =
[
	0,4,5,6,8,12,18,24,46,49,54,55,63,70,160,174,602,999,
	20023,24001,24002,24004,24005,24006,24007,24008,24009,24010,24011,24012,
	24013,24014,24015,20016,20017,20018,20019,20020,20021,24025,2900
];




/* _blacklistedVariables: The AntiHack will check if one of these variables is existing for the client */
_blacklistedVariables =
[
	'arsenalOpened','BIS_fnc_arsenal_fullArsenal','bis_fnc_camera_target'
];


_UVC = false;	/* Use Vehicle Check(s) - recommended but I am not sure if all existing vehicles are already in this white-list below. "EXILE" ones are white-listed anyways */
_VehicleWhiteList =
[
	'Steerable_Parachute_F','I_UAV_01_F','B_HMG_01_high_F','O_HMG_01_F','B_Heli_Transport_01_F','B_Heli_Transport_01_camo_F','O_MRAP_02_gmg_F','O_static_AT_F','Land_Camping_Light_F'
];
_ForbiddenVehicles =
[
	'B_Heli_Light_01_armed_F','B_Heli_Attack_01_F','B_Plane_CAS_01_F','B_APC_Tracked_01_rcws_F','B_APC_Tracked_01_CRV_F','B_APC_Tracked_01_AA_F','B_MBT_01_cannon_F',
	'B_MBT_01_arty_F','B_MBT_01_mlrs_F','B_Boat_Armed_01_minigun_F','B_UAV_02_F','B_UAV_02_CAS_F','B_MRAP_01_gmg_F','B_MRAP_01_hmg_F','B_G_Offroad_01_armed_F',
	'B_APC_Wheeled_01_cannon_F','B_MBT_01_TUSK_F','O_Heli_Light_02_F','O_Heli_Attack_02_F','O_Heli_Attack_02_black_F','O_Plane_CAS_02_F','O_APC_Tracked_02_cannon_F',
	'O_APC_Tracked_02_AA_F','O_MBT_02_cannon_F','O_MBT_02_arty_F','O_Boat_Armed_01_hmg_F','O_UAV_02_CAS_F','O_UAV_02_F','O_MRAP_02_hmg_F','O_G_Offroad_01_armed_F',
	'O_APC_Wheeled_02_rcws_F','O_UGV_01_rcws_F','B_UGV_01_rcws_F','I_UGV_01_rcws_F','I_APC_Wheeled_03_cannon_F','I_MRAP_03_gmg_F','I_MRAP_03_hmg_F','I_G_Offroad_01_armed_F',
	'I_UAV_02_CAS_F','I_UAV_02_F','I_Boat_Armed_01_minigun_F','I_MBT_03_cannon_F','I_APC_tracked_03_cannon_F','I_Plane_Fighter_03_AA_F','I_Plane_Fighter_03_CAS_F','I_Heli_light_03_F',
	'B_HMG_01_F','I_HMG_01_F','O_HMG_01_high_F','I_HMG_01_high_F','B_HMG_01_A_F','O_HMG_01_A_F','I_HMG_01_A_F','B_Mortar_01_F','O_Mortar_01_F','I_Mortar_01_F','I_G_Mortar_01_F',
	'B_G_Mortar_01_F','O_G_Mortar_01_F','B_GMG_01_F','O_GMG_01_F','I_GMG_01_F','O_GMG_01_high_F','I_GMG_01_high_F','B_GMG_01_A_F','O_GMG_01_A_F','I_GMG_01_A_F',
	'B_static_AA_F','O_static_AA_F','I_static_AA_F','B_static_AT_F','I_static_AT_F','B_GMG_01_high_F'
];


_UFI = true;	/* Use "_ForbiddenItems"/Item Check(s) */
_UIW = false;	/* if "_UIW = true;" then it checks if the items the individual player has are in "_ItemWhiteList" */
_ItemWhiteList =
[
	'AllowThisItem1','AllowThisItem2'
];
_ForbiddenItems =
[
	'autocannon_Base_F','autocannon_30mm','autocannon_35mm','autocannon_40mm_CTWS','autocannon_30mm_CTWS','Bomb_04_Plane_CAS_01_F',
	'Bomb_03_Plane_CAS_02_F','cannon_105mm','cannon_120mm','cannon_120mm_long','cannon_125mm','Cannon_30mm_Plane_CAS_02_F','gatling_20mm',
	'gatling_25mm','gatling_30mm','Gatling_30mm_Plane_CAS_01_F','GBU12BombLauncher','GMG_20mm','GMG_40mm','GMG_UGV_40mm','HMG_127_MBT',
	'HMG_127','HMG_127_APC','HMG_01','HMG_M2','HMG_NSVT','LMG_Minigun2','LMG_RCWS','LMG_M200','LMG_Minigun','LMG_Minigun_heli','LMG_coax',
	'Missile_AGM_02_Plane_CAS_01_F','Missile_AA_04_Plane_CAS_01_F','Missile_AA_03_Plane_CAS_02_F','Missile_AGM_01_Plane_CAS_02_F','missiles_DAGR',
	'missiles_DAR','missiles_ASRAAM','missiles_SCALPEL','missiles_titan','missiles_titan_static','missiles_Zephyr','Mk82BombLauncher','mortar_82mm',
	'mortar_155mm_AMOS','rockets_Skyfire','rockets_230mm_GAT','Rocket_04_HE_Plane_CAS_01_F','Rocket_04_AP_Plane_CAS_01_F','Rocket_03_HE_Plane_CAS_02_F',
	'Rocket_03_AP_Plane_CAS_02_F','Twin_Cannon_20mm'
];



/*
	custom Box content:
	just an item like it is in the example with   'ItemMap'   will put the item once in the box.
	if an array is used like the   ['ItemGPS',5]   example, well I assume you could guess what it will do.
	
	You can just define as many as you want buy copy pasting one of the existing _SupportBoxXContents and changing it up.
	After doing that you have to add it into the _allSupportBoxes array (last entry can't have a , at the end or the array is broken!).
*/
_SupportBox1Content =
[
['Exile_Item_Flag',1],['WorkBench',1],['Exile_Item_WoodDoorKit',1],['Exile_Item_Codelock',1],['Exile_Item_WoodFloorKit',4],['Exile_Item_WoodFloorPortKit',2],
['Exile_Item_WoodWallKit',5],['Exile_Item_CampFireKit',1],['Exile_Item_SafeKit',1],['Exile_Item_Storagecratekit',2],['Exile_Melee_Axe',1],['Exile_Ammo_Swing',1],
['Exile_Item_Matches',1],['Exile_Item_CookingPot',1]
];

_SupportBox2Content =
[
	['Exile_Item_Flag',1],['WorkBench',2],['Exile_Item_WoodDoorKit',2],['Exile_Item_WoodGateKit',2],['Exile_Item_Codelock',4],['Exile_Item_WoodFloorKit',18],['Exile_Item_WoodFloorPortKit',2],
	['Exile_Item_WoodWallKit',25],['Exile_Item_CampFireKit',2],['Exile_Item_SafeKit',3],['Exile_Item_Storagecratekit',4],['Exile_Item_WoodStairsKit',4],['Exile_Melee_Axe',2],['Exile_Ammo_Swing',1],
	['Exile_Item_Matches',2],['Exile_Item_CookingPot',2],['B_Carryall_oucamo',1]
];

_SupportBox3Content =
[
	['Exile_Item_Flag',2],['WorkBench',3],['Exile_Item_WoodDoorKit',4],['Exile_Item_WoodGateKit',4],['Exile_Item_Codelock',8],['Exile_Item_WoodFloorKit',40],['Exile_Item_WoodFloorPortKit',4],
	['Exile_Item_WoodWallKit',30],['Exile_Item_CampFireKit',3],['Exile_Item_SafeKit',6],['Exile_Item_Storagecratekit',5],['Exile_Item_WoodStairsKit',8],['Exile_Melee_Axe',3],['Exile_Ammo_Swing',1],
	['Exile_Item_Matches',3],['Exile_Item_CookingPot',3],['B_Carryall_oucamo',1]
];

_allSupportBoxes = [
	_SupportBox1Content,
	_SupportBox2Content,
	_SupportBox3Content
];




/* ***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER */
/*
	THE KYLE MODE - by enabling it (setting it to true), you disable 99% of the AntiHack features.
	(DEFAULT VALUE: FALSE).
	This is only for those, that want to use the Admin Menu only!
*/
_KYLE_MODE = false;
/* ***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER***DANGER */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ******************************DO NOT TOUCH BELOW********************************* */
_allSupportBoxesCount = count _allSupportBoxes;
if(!isNil 'infiSTAR_IS_RUN_ON_THIS_SERVER') exitWith {
	diag_log format['<infiSTAR.de> %1 - is already started %1 seconds ago..',time - infiSTAR_IS_RUN_ON_THIS_SERVER];
};
infiSTAR_IS_RUN_ON_THIS_SERVER = time;
/* ********************************************************************************* */
/* #4076 */
/* ********************************************************************************* */
_exileFound = false;
_cfgPatches = configFile >> 'CfgPatches';
for '_i' from 0 to (count _cfgPatches - 1) do
{
	_patchClass = _cfgPatches select _i;
	if(configName _patchClass == 'exile_server')exitWith
	{
		_exileFound = true;
	};
};
if(_exileFound)then
{
	comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
	diag_log format['<infiSTAR.de> %1 - STARTUP - including AdminTools',time];
	#include "EXILE_AT.sqf"
	diag_log format['<infiSTAR.de> %1 - STARTUP - AdminTools included!',time];
	diag_log format['<infiSTAR.de> %1 - STARTUP - including AntiHack',time];
	#include "EXILE_AH.sqf"
	diag_log format['<infiSTAR.de> %1 - STARTUP - AntiHack included!',time];
}
else
{
	for '_i' from 0 to 20 do
	{
		diag_log '<infiSTAR.de> could not find exile_server';
	};
};
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2015 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */