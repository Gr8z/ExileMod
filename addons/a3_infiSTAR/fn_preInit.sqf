/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	UPDATEEMAIL for http://update.infiSTAR.de is:
	'psychotic_closure@hotmail.com'
	
	Last download was on:
	'18022016';
*/
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

	diag_log format["<infiSTAR.de> fnc_infiSTAR_cfg inputclassname: %1, default: %2, default type: %3",_inputclassname,_default,_defaultT];

	_return = call {
		if(_defaultT isEqualTo "BOOL")exitWith{(getText _path)=="true"};
		if(_defaultT isEqualTo "ARRAY")exitWith{getArray _path};
		if(_defaultT isEqualTo "SCALAR")exitWith{getNumber _path};
		if(_defaultT isEqualTo "STRING")exitWith{getText _path};
		_default
	};
	_return
';
_serverCommandPassword = ["serverCommandPassword","changeme"] call fnc_infiSTAR_cfg;
_passwordAdmin = ["passwordAdmin","changeme"] call fnc_infiSTAR_cfg;
_OPEN_ADMIN_MENU_KEY = ["OPEN_ADMIN_MENU_KEY",0x3B] call fnc_infiSTAR_cfg;
_HIDE_FROM_PLAYERS = ["HIDE_FROM_PLAYERS",false] call fnc_infiSTAR_cfg;
_WRITE_TXT_LOG_FILES = ["WRITE_TXT_LOG_FILES",true] call fnc_infiSTAR_cfg;
_announce_adminstate_changed = ["announce_adminstate_changed",false] call fnc_infiSTAR_cfg;
_use_html_load_on_adminmenu = ["use_html_load_on_adminmenu",true] call fnc_infiSTAR_cfg;
_LogAdminActions = ["LogAdminActions",true] call fnc_infiSTAR_cfg;
_enableIngameLogs = ["enableIngameLogs",true] call fnc_infiSTAR_cfg;
_needAdminNameTag = ["needAdminNameTag",false] call fnc_infiSTAR_cfg;
_AdminNameTag = ["AdminNameTag","[Admin]"] call fnc_infiSTAR_cfg;
_chatCommands = ["chatCommands",[]] call fnc_infiSTAR_cfg;
_startAsNormal = ["startAsNormal",[]] call fnc_infiSTAR_cfg;
_adminUIDandAccess = ["adminUIDandAccess",[]] call fnc_infiSTAR_cfg;
_USE_UID_WHITELIST = ["USE_UID_WHITELIST",false] call fnc_infiSTAR_cfg;
_UID_WHITELIST = ["UID_WHITELIST",[]] call fnc_infiSTAR_cfg;
_ESCMNUTOP = ["ESCMNUTOP","[GG] Ghostz Gamerz"] call fnc_infiSTAR_cfg;
_ESCMNUBOT = ["ESCMNUBOT","by GhostzGamerz.com"] call fnc_infiSTAR_cfg;
_BRIEFING_MSG = ["BRIEFING_MSG",false] call fnc_infiSTAR_cfg;
_HTML_LOAD_URL = ["HTML_LOAD_URL",""] call fnc_infiSTAR_cfg;
_USE_RESTART_TIMER = ["USE_RESTART_TIMER",true] call fnc_infiSTAR_cfg;
_RESTART_TIME_IN_M = ["RESTART_TIME_IN_M",180] call fnc_infiSTAR_cfg;
_SHOW_TIMER_IN_MIN = ["SHOW_TIMER_IN_MIN",[1,2,3,5,10]] call fnc_infiSTAR_cfg;
_USE_RESTART_TIMER_SHUTDOWN = ["USE_RESTART_TIMER_SHUTDOWN",false] call fnc_infiSTAR_cfg;
_TGV = ["TGV",40] call fnc_infiSTAR_cfg;
_VDV = ["VDV",900] call fnc_infiSTAR_cfg;
_VOV = ["VOV",750] call fnc_infiSTAR_cfg;
_SVD = ["SVD",100] call fnc_infiSTAR_cfg;
_VDN = ["VDN",true] call fnc_infiSTAR_cfg;
_URC = ["URC",true] call fnc_infiSTAR_cfg;
_LVC = ["LVC",true] call fnc_infiSTAR_cfg;
_CMC = ["CMC",true] call fnc_infiSTAR_cfg;
_KCM = ["KCM",true] call fnc_infiSTAR_cfg;
_CAP = ["CAP",false] call fnc_infiSTAR_cfg;
_RHS_CUP_MOD_ENABLED = ["RHS_CUP_MOD_ENABLED",false] call fnc_infiSTAR_cfg;
_disconnect_dupe_check = ["disconnect_dupe_check",false] call fnc_infiSTAR_cfg;

_wall_look = ["wall_look",false] call fnc_infiSTAR_cfg;
_wall_glitch_object = ["wall_glitch_object",false] call fnc_infiSTAR_cfg;
_wall_glitch_vehicle = ["wall_glitch_vehicle",false] call fnc_infiSTAR_cfg;
_forceWalk_near_enemyBase = ["forceWalk_near_enemyBase",false] call fnc_infiSTAR_cfg;

_stopSafeGlitch = ["stopSafeGlitch",false] call fnc_infiSTAR_cfg;

_SpeedHackCheck = ["SpeedHackCheck",false] call fnc_infiSTAR_cfg;
_TimeToKickForSpeedHack = ["TimeToKickForSpeedHack",60] call fnc_infiSTAR_cfg;
_SpeedHackCheck = false;

_checkPopTabIncrease = ["checkPopTabIncrease",false] call fnc_infiSTAR_cfg;
_LogPopTabIncrease = ["LogPopTabIncrease",15000] call fnc_infiSTAR_cfg;
_checkRespectIncrease = ["checkRespectIncrease",false] call fnc_infiSTAR_cfg;
_LogRespectIncrease = ["LogRespectIncrease",5000] call fnc_infiSTAR_cfg;

_uniform_and_vest_check = ["uniform_and_vest_check",true] call fnc_infiSTAR_cfg;	
_log_uniform_and_vest_check_actions = ["log_uniform_and_vest_check_actions",false] call fnc_infiSTAR_cfg;	

_CMM = ["CMM",true] call fnc_infiSTAR_cfg;
_maxMapMenuEntries = ["maxMapMenuEntries",6] call fnc_infiSTAR_cfg;

_check_steam_ban = ["check_steam_ban",false] call fnc_infiSTAR_cfg;
_ban_for_steam_ban = ["ban_for_steam_ban",false] call fnc_infiSTAR_cfg;
_UAT = ["UAT",true] call fnc_infiSTAR_cfg;

_pathforantitp = (configfile >> "Cfg_infiSTAR_settings" >> "allowTP");
_use_custom = getNumber(_pathforantitp >> "use_custom");
_allowTP = getArray(_pathforantitp >> worldName);
if(_use_custom isEqualTo 1)then{_allowTP = getArray(_pathforantitp >> "custom");};


_CGM = ["CGM",false] call fnc_infiSTAR_cfg;
_CLM = ["CLM",false] call fnc_infiSTAR_cfg;
_UMW = ["UMW",false] call fnc_infiSTAR_cfg;
_aLocalM = ["aLocalM",[]] call fnc_infiSTAR_cfg;
_badChat = ["badChat",[]] call fnc_infiSTAR_cfg;
_badNames = ["badNames",[]] call fnc_infiSTAR_cfg;
_badGroupNames = ["badGroupNames",[]] call fnc_infiSTAR_cfg;
_badIDDsToKick = ["badIDDsToKick",[]] call fnc_infiSTAR_cfg;
_badIDDsToClose = ["badIDDsToClose",[]] call fnc_infiSTAR_cfg;
_UDW = ["UDW",true] call fnc_infiSTAR_cfg;
_allowedIDDs = ["allowedIDDs",[]] call fnc_infiSTAR_cfg;
_blacklistedVariables = ["blacklistedVariables",[]] call fnc_infiSTAR_cfg;
_UVC = ["UVC",true] call fnc_infiSTAR_cfg;
_VehicleWhiteList = ["VehicleWhiteList",[]] call fnc_infiSTAR_cfg;
_ForbiddenVehicles = ["ForbiddenVehicles",[]] call fnc_infiSTAR_cfg;
_UFI = ["UFI",false] call fnc_infiSTAR_cfg;
_UIW = ["UIW",false] call fnc_infiSTAR_cfg;
_ItemWhiteList = ["ItemWhiteList",[]] call fnc_infiSTAR_cfg;
_ForbiddenItems = ["ForbiddenItems",[]] call fnc_infiSTAR_cfg;
_allSupportBoxes = ["allSupportBoxes",[]] call fnc_infiSTAR_cfg;
_allSupportBoxesNames = [];
_allSupportBoxesContent = [];
{
	if!(_x isEqualTo [])then
	{
		_allSupportBoxesNames pushBack (_x select 0);
		_allSupportBoxesContent pushBack (_x select 1);
	};
} forEach _allSupportBoxes;
_KYLE_MODE = ["KYLE_MODE",false] call fnc_infiSTAR_cfg;



if(!isNil "infiSTAR_IS_RUN_ON_THIS_SERVER") exitWith {
	diag_log format["<infiSTAR.de> %1 - is already started %1 seconds ago..",time - infiSTAR_IS_RUN_ON_THIS_SERVER];
};
infiSTAR_IS_RUN_ON_THIS_SERVER = time;

diag_log format["<infiSTAR.de> %1 - STARTUP - including AdminTools",time];
#include "EXILE_AT.sqf"
diag_log format["<infiSTAR.de> %1 - STARTUP - AdminTools included!",time];
diag_log format["<infiSTAR.de> %1 - STARTUP - including AntiHack",time];
#include "EXILE_AH.sqf"
diag_log format["<infiSTAR.de> %1 - STARTUP - AntiHack included!",time];
comment "Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de";
true