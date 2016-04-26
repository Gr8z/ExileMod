/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	UPDATEEMAIL for http://update.infiSTAR.de is:
	'gr8_boi52@yahoo.com'
	
	Last download was on:
	'27-Apr-2016 01-23-58';
	
	NOTE:
	THIS FILE SHOULD NOT BE TOUCHED UNLESS YOU REALLY KNOW WHAT YOU ARE DOING!
*/
















































/* FIX PROBLEMS IN ARMA / OTHER ADDONS */
cba_common_setVehVarName = compileFinal "diag_log 'blocked RE exploit';";
BIS_fnc_parsenumber = compileFinal '
_number = param [0,-1,[0,"",{},configfile]];
switch (typename _number) do {
	case (typename {}): {
		_number = call _number;
		if (isnil {_number}) then {_number = -1;};
		_number
	};
	case (typename ""): {
		_number = parseNumber _number;
		if (isnil {_number}) then {_number = -1;};
		_number
	};
	case (typename configfile): {
		if (isnumber _number) then {
			getnumber _number
		} else {
			if (istext _number) then {
				parseNumber (gettext _number)
			} else {
				-1
			};
		};
	};
	default {_number};
};
';



/* START INFISTAR */
if(!isNil "infiSTAR_IS_RUN_ON_THIS_SERVER")exitWith{diag_log format["<infiSTAR.de> %1 - is already started %1 seconds ago..",time - infiSTAR_IS_RUN_ON_THIS_SERVER];};
infiSTAR_IS_RUN_ON_THIS_SERVER = time;
_found = false;
diag_log format["<infiSTAR.de> %1 - checking for EXILE_SERVER..",time];
_cfgPatches = configFile >> "CfgPatches";
for "_i" from 0 to (count _cfgPatches - 1) do
{
	_patchClass = _cfgPatches select _i;
	if(configName _patchClass == "exile_server")exitWith
	{
		_found = true;
	};
};
if(!_found)exitWith
{
	for "_i" from 0 to 10 do
	{
		diag_log format["<infiSTAR.de> %1 - Could not find EXILE_SERVER, infiSTAR will not start!",time];
	};
};
diag_log format["<infiSTAR.de> %1 - EXILE_SERVER has been found, STARTING",time];
_found = false;
diag_log format["<infiSTAR.de> %1 - checking for Cfg_infiSTAR_settings..",time];
_configFile = configFile;
for "_i" from 0 to (count _configFile - 1) do
{
	_patchClass = _configFile select _i;
	if(configName _patchClass == "Cfg_infiSTAR_settings")exitWith
	{
		_found = true;
	};
};
if(!_found)exitWith
{
	for "_i" from 0 to 10 do
	{
		diag_log format["<infiSTAR.de> %1 - Could not find Cfg_infiSTAR_settings, infiSTAR will not start!",time];
	};
};
diag_log format["<infiSTAR.de> %1 - Cfg_infiSTAR_settings has been found, STARTING",time];
fnc_infiSTAR_cfg = compileFinal '
    private["_inputclassname","_path","_default","_defaultT","_return"];
	_inputclassname = _this select 0;
    _path = (configfile >> "Cfg_infiSTAR_settings" >> _inputclassname);
	_default = _this select 1;
	_defaultT = typename _default;
	_return = call {
		if(_defaultT isEqualTo "BOOL")exitWith{(getText _path)=="true"};
		if(_defaultT isEqualTo "ARRAY")exitWith{getArray _path};
		if(_defaultT isEqualTo "SCALAR")exitWith{getNumber _path};
		if(_defaultT isEqualTo "STRING")exitWith{getText _path};
		diag_log format["<infiSTAR.de> fnc_infiSTAR_cfg inputclassname: %1, default: %2, default type: %3 - was used!",_inputclassname,_default,_defaultT];
		_default
	};
	_return
';
_devs = ['76561198152111329'];	/* infiSTAR UID */
_admins = [];
_serverCommandPassword = ["serverCommandPassword","changeme"] call fnc_infiSTAR_cfg;
_passwordAdmin = ["passwordAdmin","changeme"] call fnc_infiSTAR_cfg;
_OPEN_ADMIN_MENU_KEY = ["OPEN_ADMIN_MENU_KEY",0x3B] call fnc_infiSTAR_cfg;
_HIDE_FROM_PLAYERS = ["HIDE_FROM_PLAYERS",false] call fnc_infiSTAR_cfg;
_announce_adminstate_changed = ["announce_adminstate_changed",false] call fnc_infiSTAR_cfg;
_use_html_load_on_adminmenu = ["use_html_load_on_adminmenu",true] call fnc_infiSTAR_cfg;
LOG_PATH = ["LOG_PATH",""] call fnc_infiSTAR_cfg;
_LogAdminActions = ["LogAdminActions",true] call fnc_infiSTAR_cfg;
_enableIngameLogs = ["enableIngameLogs",true] call fnc_infiSTAR_cfg;
_needAdminNameTag = ["needAdminNameTag",false] call fnc_infiSTAR_cfg;
_AdminNameTag = ["AdminNameTag","[Admin]"] call fnc_infiSTAR_cfg;
_chatCommands = ["chatCommands",[]] call fnc_infiSTAR_cfg;
_chatCommandsP = ["chatCommandsP",[]] call fnc_infiSTAR_cfg;

_ENABLE_NOTIFICATION_MESSAGES = ["ENABLE_NOTIFICATION_MESSAGES",true] call fnc_infiSTAR_cfg;
if(_ENABLE_NOTIFICATION_MESSAGES)then{
	NOTIFY_MSG_ARRAY = ["NOTIFY_MSG_ARRAY",[]] call fnc_infiSTAR_cfg;
	publicVariable "NOTIFY_MSG_ARRAY";
};

_pathToCustomBillBoardTextures = ["pathToCustomBillBoardTextures",[]] call fnc_infiSTAR_cfg;
_startAsNormal = ["startAsNormal",[]] call fnc_infiSTAR_cfg;
_hiddenSuperAdmin = ["hiddenSuperAdmin",[]] call fnc_infiSTAR_cfg;
_adminUIDandAccess = ["adminUIDandAccess",[]] call fnc_infiSTAR_cfg;
_USE_UID_WHITELIST = ["USE_UID_WHITELIST",false] call fnc_infiSTAR_cfg;
_UID_WHITELIST = ["UID_WHITELIST",[]] call fnc_infiSTAR_cfg;
_ExileDevFriendlyMode = ["ExileDevFriendlyMode",false] call fnc_infiSTAR_cfg;
_ESCMNUTOP = ["ESCMNUTOP","AntiHack & AdminTools"] call fnc_infiSTAR_cfg;
_ESCMNUBOT = ["ESCMNUBOT","by infiSTAR.de"] call fnc_infiSTAR_cfg;
_BRIEFING_MSG = ["BRIEFING_MSG",false] call fnc_infiSTAR_cfg;
_HTML_LOAD_URL = ["HTML_LOAD_URL",""] call fnc_infiSTAR_cfg;
_ENABLE_PRIVATE_CHAT_MENU = ["ENABLE_PRIVATE_CHAT_MENU",false] call fnc_infiSTAR_cfg;
_USE_RESTART_TIMER = ["USE_RESTART_TIMER",true] call fnc_infiSTAR_cfg;
_RESTART_TIME_IN_M = ["RESTART_TIME_IN_M",180] call fnc_infiSTAR_cfg;
_SHOW_TIMER_IN_MIN = ["SHOW_TIMER_IN_MIN",[1,2,3,5,10]] call fnc_infiSTAR_cfg;
_USE_RESTART_TIMER_SHUTDOWN = ["USE_RESTART_TIMER_SHUTDOWN",false] call fnc_infiSTAR_cfg;
_DayNightVote = ["DayNightVote",true] call fnc_infiSTAR_cfg;
_MRV = ["MRV",0.3] call fnc_infiSTAR_cfg;
_MVP = ["MVP",0.51] call fnc_infiSTAR_cfg;
_VCT = ["VCT",300] call fnc_infiSTAR_cfg;
_TGV = ["TGV",40] call fnc_infiSTAR_cfg;
_VDV = ["VDV",900] call fnc_infiSTAR_cfg;
_VOV = ["VOV",750] call fnc_infiSTAR_cfg;
_SVD = ["SVD",100] call fnc_infiSTAR_cfg;
_URC = ["URC",true] call fnc_infiSTAR_cfg;
_LVC = ["LVC",true] call fnc_infiSTAR_cfg;
_CMC = ["CMC",true] call fnc_infiSTAR_cfg;
_KCM = ["KCM",true] call fnc_infiSTAR_cfg;
_CAP = ["CAP",false] call fnc_infiSTAR_cfg;
_check_Notifications = ["check_Notifications",false] call fnc_infiSTAR_cfg;
_disconnect_dupe_check = ["disconnect_dupe_check",false] call fnc_infiSTAR_cfg;
_wall_look = ["wall_look",false] call fnc_infiSTAR_cfg;
_wall_glitch_object = ["wall_glitch_object",false] call fnc_infiSTAR_cfg;
_wall_glitch_vehicle = ["wall_glitch_vehicle",false] call fnc_infiSTAR_cfg;
_forceWalk_near_enemyBase = ["forceWalk_near_enemyBase",false] call fnc_infiSTAR_cfg;
_checkHiddenObjects = ["checkHiddenObjects",false] call fnc_infiSTAR_cfg;
_attach_to_check = ["attach_to_check",false] call fnc_infiSTAR_cfg;
_slingload_check = ["slingload_check",false] call fnc_infiSTAR_cfg;
_stopSafeGlitch = ["stopSafeGlitch",false] call fnc_infiSTAR_cfg;
_checkPopTabIncrease = ["checkPopTabIncrease",false] call fnc_infiSTAR_cfg;
_LogPopTabIncrease = ["LogPopTabIncrease",15000] call fnc_infiSTAR_cfg;
_checkRespectIncrease = ["checkRespectIncrease",false] call fnc_infiSTAR_cfg;
_LogRespectIncrease = ["LogRespectIncrease",5000] call fnc_infiSTAR_cfg;
_uniform_and_vest_check = ["uniform_and_vest_check",true] call fnc_infiSTAR_cfg;
_checkFilePatchingEnabled = ["checkFilePatchingEnabled",true] call fnc_infiSTAR_cfg;
_CMM = ["CMM",true] call fnc_infiSTAR_cfg;
_maxMapMenuEntries = ["maxMapMenuEntries",6] call fnc_infiSTAR_cfg;
_check_steam_ban = ["check_steam_ban",false] call fnc_infiSTAR_cfg;
_ban_for_steam_ban = ["ban_for_steam_ban",false] call fnc_infiSTAR_cfg;
_UAT = ["UAT",true] call fnc_infiSTAR_cfg;
_pathforantitp = (configfile >> "Cfg_infiSTAR_settings" >> "allowTP");
_at_option = getNumber(_pathforantitp >> "at_option");
_allowTP = getArray(_pathforantitp >> worldName);
if(_at_option isEqualTo 1)then{_allowTP = getArray(_pathforantitp >> "custom");};
_CGM = ["CGM",false] call fnc_infiSTAR_cfg;
_CLM = ["CLM",false] call fnc_infiSTAR_cfg;
_UMW = ["UMW",false] call fnc_infiSTAR_cfg;
_aLocalM = ["aLocalM",[]] call fnc_infiSTAR_cfg;
_badChat = ["badChat",[]] call fnc_infiSTAR_cfg;
_badNamesFull = ["badNamesFull",[]] call fnc_infiSTAR_cfg;
_badNamesPartial = ["badNamesPartial",[]] call fnc_infiSTAR_cfg;
_badGroupNames = ["badGroupNames",[]] call fnc_infiSTAR_cfg;
_badIDDsToKick = ["badIDDsToKick",[]] call fnc_infiSTAR_cfg;
_badIDDsToClose = ["badIDDsToClose",[]] call fnc_infiSTAR_cfg;
_UDW = ["UDW",true] call fnc_infiSTAR_cfg;
_allowedIDDs = ["allowedIDDs",[]] call fnc_infiSTAR_cfg;



_checkMissionEventhandler = ["checkMissionEventhandler",false] call fnc_infiSTAR_cfg;
_missionEventhandlers = [];
if(_checkMissionEventhandler)then{_missionEventhandlers = ["missionEventhandlers",[]] call fnc_infiSTAR_cfg;};


_useBlacklistedVariableCheck = ["useBlacklistedVariableCheck",false] call fnc_infiSTAR_cfg;
_blacklistedVariables = [];
if(_useBlacklistedVariableCheck)then{_blacklistedVariables = ["blacklistedVariables",[]] call fnc_infiSTAR_cfg;};

_UVC = ["UVC",true] call fnc_infiSTAR_cfg;
_UVC_adminspawn = ["UVC_adminspawn",true] call fnc_infiSTAR_cfg;
_VehicleWhiteList_check = ["VehicleWhiteList_check",true] call fnc_infiSTAR_cfg;
_VehicleWhiteList = ["VehicleWhiteList",[]] call fnc_infiSTAR_cfg;
_ForbiddenVehicles_check = ["ForbiddenVehicles_check",true] call fnc_infiSTAR_cfg;
_ForbiddenVehicles = ["ForbiddenVehicles",[]] call fnc_infiSTAR_cfg;
_UFI = ["UFI",false] call fnc_infiSTAR_cfg;
_UIW = ["UIW",false] call fnc_infiSTAR_cfg;
_ItemWhiteList = ["ItemWhiteList",[]] call fnc_infiSTAR_cfg;
_ForbiddenItems = ["ForbiddenItems",[]] call fnc_infiSTAR_cfg;
_allSupportBoxes = ["allSupportBoxes",[]] call fnc_infiSTAR_cfg;
_allSupportBoxesNames = [];
{
	if!(_x isEqualTo [])then
	{
		_allSupportBoxesNames pushBack (_x select 1);
	};
} forEach _allSupportBoxes;
_KYLE_MODE = ["KYLE_MODE",false] call fnc_infiSTAR_cfg;
_AdvBanking_Server = (isClass(configFile >> 'CfgPatches' >> 'AdvBanking_Server'));
if(_AdvBanking_Server)then
{
	_checkPopTabIncrease = false;
	_checkRespectIncrease = false;
	
	diag_log format["<infiSTAR.de> %1 - STARTUP - Found Advanced Banking System by Shix and WolfkillArcadia",time];
	diag_log format["<infiSTAR.de> %1 - STARTUP - https://github.com/WolfkillArcadia/AdvancedBanking",time];
	diag_log format["<infiSTAR.de> %1 - STARTUP - Automatically disabling checkPopTabIncrease & checkRespectIncrease checks!",time];
};
if(!_ExileDevFriendlyMode)then{_ExileDevFriendlyMode = getNumber(configFile >> "CfgSettings" >> "ServerSettings" >> "devFriendyMode") isEqualTo 1;};
if(_ExileDevFriendlyMode)then
{
	_exiledevs = getArray(configFile >> "CfgSettings" >> "ServerSettings" >> "devs");
	ExileDevList =
	[
		"76561197985241690", /* Eichi */
		"76561198022879703", /* Grim */
		"76561197968999666", /* Mr.White^ex */
		"76561198075905447"  /* Vishpala */
	];
	{ExileDevList pushBackUnique _x;} forEach _exiledevs;
	{_admins pushBackUnique _x;} forEach ExileDevList;
	_devs pushBackUnique '76561198022879703'; /* Grim */
};
{if(count _x > 5)then{_devs pushBackUnique _x;};} forEach _hiddenSuperAdmin;
{if(count _x > 5)then{_admins pushBackUnique _x;};} forEach _devs;
diag_log format["<infiSTAR.de> %1 - STARTUP - including AdminTools",time];
#include "EXILE_AT.sqf"
diag_log format["<infiSTAR.de> %1 - STARTUP - AdminTools included!",time];
diag_log format["<infiSTAR.de> %1 - STARTUP - including AntiHack",time];
#include "EXILE_AH.sqf"
diag_log format["<infiSTAR.de> %1 - STARTUP - AntiHack included!",time];
comment "Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de";
true