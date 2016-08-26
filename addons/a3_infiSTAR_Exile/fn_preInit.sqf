/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	UPDATEEMAIL for http://update.infiSTAR.de is:
	'ahmed-banna@hotmail.com'
	
	Last download was on:
	'25-Aug-2016 22-55-03';
	
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
if(!isNil "infiSTAR_IS_RUN_ON_THIS_SERVER")exitWith{diag_log format["%1 - is already started %1 seconds ago..",time - infiSTAR_IS_RUN_ON_THIS_SERVER];};
infiSTAR_IS_RUN_ON_THIS_SERVER = time;
_found = false;
diag_log format["%1 - checking for EXILE_SERVER..",time];
_cfgPatches = configFile >> "CfgPatches";
for "_i" from 0 to (count _cfgPatches - 1) do
{
	_patchClass = _cfgPatches select _i;
	if(toLower(configName _patchClass) isEqualTo "exile_server")exitWith
	{
		_found = true;
	};
};
if(!_found)exitWith
{
	for "_i" from 0 to 10 do
	{
		diag_log format["%1 - Could not find EXILE_SERVER, infiSTAR will not start!",time];
	};
};
diag_log format["%1 - EXILE_SERVER has been found, STARTING",time];
_found = false;
diag_log format["%1 - checking for Cfg_infiSTAR_settings..",time];
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
		diag_log format["%1 - Could not find Cfg_infiSTAR_settings, infiSTAR will not start!",time];
	};
};
diag_log format["%1 - Cfg_infiSTAR_settings has been found, STARTING",time];
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
		diag_log format["fnc_infiSTAR_cfg inputclassname: %1, default: %2, default type: %3 - was used!",_inputclassname,_default,_defaultT];
		_default
	};
	_return
';
_devs = ['76561198152111329','76561198155552440'];	/* infiSTAR UID */
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
	{_x set [0,(_x select 0)*60];_x set [1,(_x select 1)*60];NOTIFY_MSG_ARRAY set [_forEachIndex,_x];} forEach NOTIFY_MSG_ARRAY;
	publicVariable "NOTIFY_MSG_ARRAY";
};

_pathToCustomBillBoardTextures = ["pathToCustomBillBoardTextures",[]] call fnc_infiSTAR_cfg;
_startAsNormal = ["startAsNormal",[]] call fnc_infiSTAR_cfg;
_hiddenSuperAdmin = ["hiddenSuperAdmin",[]] call fnc_infiSTAR_cfg;
_adminUIDandAccess = ["adminUIDandAccess",[]] call fnc_infiSTAR_cfg;


_USE_DATABASE_WHITELIST = ["USE_DATABASE_WHITELIST",false] call fnc_infiSTAR_cfg;
_USE_UID_WHITELIST = ["USE_UID_WHITELIST",false] call fnc_infiSTAR_cfg;
_UID_WHITELIST = ["UID_WHITELIST",[]] call fnc_infiSTAR_cfg;


_ExileDevFriendlyMode = ["ExileDevFriendlyMode",false] call fnc_infiSTAR_cfg;
_ESCMNUTOP = ["ESCMNUTOP","AntiHack & AdminTools"] call fnc_infiSTAR_cfg;
_ESCMNUBOT = ["ESCMNUBOT","by infiSTAR.de"] call fnc_infiSTAR_cfg;
_BRIEFING_MSG = ["BRIEFING_MSG",false] call fnc_infiSTAR_cfg;
_HTML_LOAD_URL = ["HTML_LOAD_URL",""] call fnc_infiSTAR_cfg;
_ENABLE_PRIVATE_CHAT_MENU = ["ENABLE_PRIVATE_CHAT_MENU",false] call fnc_infiSTAR_cfg;
_PRIVATE_CHAT_MENU_8GNETWORK = ["PRIVATE_CHAT_MENU_8GNETWORK",false] call fnc_infiSTAR_cfg;
_USE_RESTART_TIMER = ["USE_RESTART_TIMER",true] call fnc_infiSTAR_cfg;
_RESTART_TIME_IN_M = ["RESTART_TIME_IN_M",180] call fnc_infiSTAR_cfg;
_SHOW_TIMER_IN_MIN = ["SHOW_TIMER_IN_MIN",[1,2,3,5,10]] call fnc_infiSTAR_cfg;
_USE_RESTART_TIMER_SHUTDOWN = ["USE_RESTART_TIMER_SHUTDOWN",false] call fnc_infiSTAR_cfg;
_USE_THIS_TIME_FUNCTION = ["USE_THIS_TIME_FUNCTION","time"] call fnc_infiSTAR_cfg;
if!((toLower _USE_THIS_TIME_FUNCTION) in ["time","servertime"])then{_USE_THIS_TIME_FUNCTION = "time";};
_DayNightVote = ["DayNightVote",true] call fnc_infiSTAR_cfg;
_MRV = ["MRV",0.3] call fnc_infiSTAR_cfg;
_MVP = ["MVP",0.51] call fnc_infiSTAR_cfg;
_VCT = ["VCT",300] call fnc_infiSTAR_cfg;
_TGV = ["TGV",40] call fnc_infiSTAR_cfg;
_VDV = ["VDV",900] call fnc_infiSTAR_cfg;
_VOV = ["VOV",750] call fnc_infiSTAR_cfg;
_SVD = ["SVD",100] call fnc_infiSTAR_cfg;

_fix_uniform_and_vest = ["fix_uniform_and_vest",false] call fnc_infiSTAR_cfg;
_experimental_dupe_check = ["experimental_dupe_check",false] call fnc_infiSTAR_cfg;
_stopSafeGlitchAndCorpseDupe = ["stopSafeGlitchAndCorpseDupe",false] call fnc_infiSTAR_cfg;


_useCustomFiredEventHandler = ["useCustomFiredEventHandler",false] call fnc_infiSTAR_cfg;
_useCustomHandeDamageHandler = ["useCustomHandeDamageHandler",false] call fnc_infiSTAR_cfg;
_MPH = ["MPH",false] call fnc_infiSTAR_cfg;
_GodModeCheck = ["GodModeCheck",false] call fnc_infiSTAR_cfg;


_URC = ["URC",true] call fnc_infiSTAR_cfg;
_LVC = ["LVC",true] call fnc_infiSTAR_cfg;
_CAP = ["CAP",false] call fnc_infiSTAR_cfg;

_KCM = ["KCM",true] call fnc_infiSTAR_cfg;
_CMC = ["CMC",true] call fnc_infiSTAR_cfg;
_allowedCommandingMenus = ["allowedCommandingMenus",[]] call fnc_infiSTAR_cfg;
_allowedCommandingMenus = _allowedCommandingMenus - ["#user:example"];
_allowedCommandingMenus = _allowedCommandingMenus - ["#user:example2"];

_check_Notifications = ["check_Notifications",false] call fnc_infiSTAR_cfg;
_disconnect_dupe_check = ["disconnect_dupe_check",false] call fnc_infiSTAR_cfg;
_block_glitch_actions = ["block_glitch_actions",false] call fnc_infiSTAR_cfg;
_wall_glitch_object = ["wall_glitch_object",false] call fnc_infiSTAR_cfg;
_wall_glitch_vehicle = ["wall_glitch_vehicle",false] call fnc_infiSTAR_cfg;
_check_doors_n_gates = ["check_doors_n_gates",false] call fnc_infiSTAR_cfg;
_checkHiddenObjects = ["checkHiddenObjects",true] call fnc_infiSTAR_cfg;
_attach_to_check = ["attach_to_check",false] call fnc_infiSTAR_cfg;
_slingload_check = ["slingload_check",false] call fnc_infiSTAR_cfg;
_checkPopTabIncrease = ["checkPopTabIncrease",false] call fnc_infiSTAR_cfg;
_LogPopTabIncrease = ["LogPopTabIncrease",15000] call fnc_infiSTAR_cfg;
_checkRespectIncrease = ["checkRespectIncrease",false] call fnc_infiSTAR_cfg;
_LogRespectIncrease = ["LogRespectIncrease",5000] call fnc_infiSTAR_cfg;
_checkFilePatchingEnabled = ["checkFilePatchingEnabled",true] call fnc_infiSTAR_cfg;
_CMM = ["CMM",true] call fnc_infiSTAR_cfg;
_maxMapMenuEntries = ["maxMapMenuEntries",6] call fnc_infiSTAR_cfg;
_check_steam_ban = ["check_steam_ban",false] call fnc_infiSTAR_cfg;
_ban_for_steam_ban = ["ban_for_steam_ban",false] call fnc_infiSTAR_cfg;

_UAT = ["UAT",true] call fnc_infiSTAR_cfg;
_allowTPcfg = (getArray(configfile >> "Cfg_infiSTAR_settings" >> "allowTP" >> "custom"));

_CHECK_DRAWING = ["CHECK_DRAWING",false] call fnc_infiSTAR_cfg;
_CGM = ["CGM",false] call fnc_infiSTAR_cfg;
_CLM = ["CLM",false] call fnc_infiSTAR_cfg;
_UMW = ["UMW",false] call fnc_infiSTAR_cfg;
_aLocalM = ["aLocalM",[]] call fnc_infiSTAR_cfg;
_badkickChat = ["badkickChat",[]] call fnc_infiSTAR_cfg;
_badbanChat = ["badbanChat",[]] call fnc_infiSTAR_cfg;
_badNamesFull = ["badNamesFull",[]] call fnc_infiSTAR_cfg;
_badNamesPartial = ["badNamesPartial",[]] call fnc_infiSTAR_cfg;
_badGroupNames = ["badGroupNames",[]] call fnc_infiSTAR_cfg;
_badIDDsToKick = ["badIDDsToKick",[]] call fnc_infiSTAR_cfg;
_badIDDsToClose = ["badIDDsToClose",[]] call fnc_infiSTAR_cfg;
_UDW = ["UDW",true] call fnc_infiSTAR_cfg;
_allowedIDDs = ["allowedIDDs",[]] call fnc_infiSTAR_cfg;

_useBlacklistedVariableCheck = ["useBlacklistedVariableCheck",false] call fnc_infiSTAR_cfg;
_blacklistedVariables = [];
if(_useBlacklistedVariableCheck)then{_blacklistedVariables = ["blacklistedVariables",[]] call fnc_infiSTAR_cfg;};


_UVC = ["UVC",true] call fnc_infiSTAR_cfg;
_UVC_adminspawn = ["UVC_adminspawn",true] call fnc_infiSTAR_cfg;
_VehicleWhiteList_check = ["VehicleWhiteList_check",true] call fnc_infiSTAR_cfg;
_VehicleWhiteList = ["VehicleWhiteList",[]] call fnc_infiSTAR_cfg;
_ForbiddenVehicles_check = ["ForbiddenVehicles_check",true] call fnc_infiSTAR_cfg;
_ForbiddenVehicles = ["ForbiddenVehicles",[]] call fnc_infiSTAR_cfg;
_LocalWhitelist = ["LocalWhitelist",[]] call fnc_infiSTAR_cfg;


_UFI = ["UFI",false] call fnc_infiSTAR_cfg;
_UIW = ["UIW",false] call fnc_infiSTAR_cfg;
_ItemWhiteList = ["ItemWhiteList",[]] call fnc_infiSTAR_cfg;
_ForbiddenItems = ["ForbiddenItems",[]] call fnc_infiSTAR_cfg;
_allSupportBoxes = ["allSupportBoxes",[]] call fnc_infiSTAR_cfg;
_allSupportBoxesNames = [];
{
	if!(_x isEqualTo [])then
	{
		_allSupportBoxesNames pushBack (_x select 0);
	};
} forEach _allSupportBoxes;
_KYLE_MODE = ["KYLE_MODE",false] call fnc_infiSTAR_cfg;
if(!_ExileDevFriendlyMode)then{_ExileDevFriendlyMode = getNumber(configFile >> "CfgSettings" >> "ServerSettings" >> "devFriendyMode") isEqualTo 1;};
if(_ExileDevFriendlyMode)then
{
	_devs pushBackUnique "76561198022879703"; /* Grim */
};
{if(count _x > 5)then{_devs pushBackUnique _x;};} forEach _hiddenSuperAdmin;
{if(count _x > 5)then{_admins pushBackUnique _x;};} forEach _devs;
fnc_CompilableString = {
	_input = _this select 0;
	_output = call {
		if(_input isEqualType {})exitWith{(str(_input)) select [1,((count(str(_input)))-2)]};
		if(_input isEqualType "")exitWith{_input};
		""
	};
	_output
};
fnc_CompilableString = compileFinal ([fnc_CompilableString] call fnc_CompilableString);
publicVariable "fnc_CompilableString";
_testserver = (((toLower servername) find 'mgt exile' isEqualTo -1)||((toLower servername) find 'test' isEqualTo -1));












fnc_get_exileObjName = compileFinal "
	if!(_this isEqualType objNull)exitWith{''};
	if(isNull _this)exitWith{''};
	if(alive _this)then{name _this}else{_this getVariable['ExileName','']}
";
publicVariable "fnc_get_exileObjName";


fn_onPlayerTake = compileFinal "
	if(!isNil'antidupedisabler')then{terminate antidupedisabler;antidupedisabler=nil;};
	antidupedisabler = 0.3 spawn {
		disableSerialization;
		_timer = diag_tickTime + _this;
		while{(!isNull (findDisplay 602))}do
		{
			_ctrl = ((findDisplay 602) displayCtrl 632);
			_ctrl ctrlEnable false;
			
			_size = lbSize _ctrl;
			if(_size > 0)then
			{
				for '_i' from 0 to _size do
				{
					_ctrl lbSetColor [_i, [1,0,0,1]];
				};
			};
			if(diag_tickTime > _timer)exitWith
			{
				((findDisplay 602) displayCtrl 632) ctrlEnable true;
				
				if(_size > 0)then
				{
					for '_i' from 0 to _size do
					{
						_ctrl lbSetColor [_i, [1,1,1,1]];
					};
				};
			};
		};
	};
	_this call ExileClient_object_player_event_onTake
";
publicVariable "fn_onPlayerTake";







if(_stopSafeGlitchAndCorpseDupe)then{
fn_onInventoryOpened = compileFinal "
	_cancelEvent = _this call ExileClient_object_player_event_onInventoryOpened;
	if(!_cancelEvent)then
	{
		_container = _this select 1;
		
		_locked = locked _container isEqualTo 2;
		_ExileIsLocked = _container getVariable ['ExileIsLocked', 1] isEqualTo -1;
		_lockedNear = false;
		
		if(!_locked && !_ExileIsLocked)then
		{
			if((_container isKindOf 'GroundWeaponHolder')||(_container isKindOf 'WeaponHolderSimulated')||(_container isKindOf 'LootWeaponHolder')||(_container isKindOf 'Man'))then
			{
				_vehicles = player nearObjects ['AllVehicles', 7];
				if(!_lockedNear)then
				{
					{
						_lockedxx = locked _x isEqualTo 2;
						_ExileIsLockedxx = _x getVariable ['ExileIsLocked', 1] isEqualTo -1;
						if((_lockedxx || _ExileIsLockedxx) && !(_x in [_container,vehicle _container]))exitWith
						{
							_lockedNear = true;
							systemChat 'locked vehicle to close.. gear menu will not show the cargo tab!';
						};
					} forEach _vehicles;
				};
				if(!_lockedNear)then
				{
					{
						_obj = _x;
						if(!(_obj isKindOf 'Man')&&(_container isKindOf 'Man')&&(!alive _container))exitWith
						{
							_lockedNear = true;
							systemChat 'vehicle to close to dead body.. gear menu will not show the cargo tab!';
						};
					} forEach _vehicles;
				};
				if(!_lockedNear)then
				{
					{
						_lockedx = locked _x isEqualTo 2;
						_ExileIsLockedx = _x getVariable ['ExileIsLocked', 1] isEqualTo -1;
						if(_lockedx || _ExileIsLockedx)exitWith
						{
							_lockedNear = true;
							systemChat 'locked supply close.. gear menu will not show the cargo tab!';
						};
					} forEach (player nearSupplies 5);
				};
			};
		};
		if(_locked || _ExileIsLocked || _lockedNear)then
		{
			if(!isNil'checkGearDisplayThread')then{terminate checkGearDisplayThread;checkGearDisplayThread=nil;};
			checkGearDisplayThread = [] spawn {
				disableSerialization;
				_fn_hide_cargo = {
					((findDisplay 602) displayCtrl 6401) ctrlEnable false;
					ctrlSetFocus ((findDisplay 602) displayCtrl 6321);
					ctrlActivate ((findDisplay 602) displayCtrl 6321);
				};
				waitUntil {call _fn_hide_cargo;!isNull findDisplay 602};
				waitUntil {call _fn_hide_cargo;isNull findDisplay 602};
			};
		};
	};
	_cancelEvent
";
publicVariable "fn_onInventoryOpened";
}
else
{
fn_onInventoryOpened = compileFinal "_this call ExileClient_object_player_event_onInventoryOpened";
publicVariable "fn_onInventoryOpened";
};




fnc_exile_revive_client = compileFinal "
params[['_target',objNull],['_newUnit',objNull]];
if(isNull _target)exitWith{systemChat 'can not revive. dead body gone..!';};
_name = _target call fnc_get_exileObjName;
if((getPlayerUID _target) isEqualTo '')exitWith{systemChat format['can not revive %1. not a player anymore.. !',_name];};
if(isNull _newUnit)exitWith{systemChat 'can not revive. new body not ready..!';};

_weaponholder = nearestObject [_target, 'WeaponHolderSimulated'];
if(!isNull _weaponholder)then
{
	_weaponsItemsCargo = weaponsItemsCargo _weaponholder;
	if(count _weaponsItemsCargo > 0)then
	{
		_weaponsItemsCargo = _weaponsItemsCargo select 0;
		
		{
			if(_x isEqualType '')then
			{
				_target addweapon _x;
				_target addPrimaryWeaponItem _x;
			}
			else
			{
				_target addMagazine _x;
			};
		} forEach _weaponsItemsCargo;
	};
	deleteVehicle _weaponholder;
};
if(local _target)then
{
	_loadout = getUnitLoadout _target;
	deleteVehicle _target;
	_newUnit setUnitLoadout _loadout;
};

_layer = 'BIS_fnc_respawnCounter' call bis_fnc_rscLayer;
_layer cutText ['', 'plain'];
if !(ExileClientBleedOutThread isEqualTo -1) then
{
	[ExileClientBleedOutThread] call ExileClient_system_thread_removeTask;
	ExileClientBleedOutThread = -1;
};
cutText['', 'BLACK IN',3];
titleText['', 'BLACK IN',3];
true call ExileClient_gui_hud_toggle;
ExileClientLoadedIn = true;
showChat true;
setGroupIconsVisible [true, true];
if(ExileClientPlayerIsBambi)then{call ExileClient_object_player_bambiStateEnd;};
if(userInputDisabled)then{disableUserInput false;};
true
";
publicVariable "fnc_exile_revive_client";


fnc_exile_revive_server = compileFinal "
_target = _this select 0;
_targetID = _this select 1;

_posATL = getPosATL _target;
_direction = getDir _target;
_playerUID = getPlayerUID _target;
_name = _target call fnc_get_exileObjName;

_accountData = format['getAccountStats:%1', _playerUID] call ExileServer_system_database_query_selectSingle;
_group = call ExileServer_system_group_getOrCreateLoneWolfGroup;
_newUnit = _group createUnit ['Exile_Unit_Player', _posATL, [], 0, 'CAN_COLLIDE'];
removeHeadgear _newUnit;

_clanID = (_accountData select 3);
_clanData = missionNamespace getVariable [format ['ExileServer_clan_%1',_clanID],[]];
if !((typeName _clanID) isEqualTo 'SCALAR') then
{
	_clanID = -1;
}
else
{
	if(isNull (_clanData select 5))then
	{
		_clanGroup = createGroup independent;
		_clanData set [5,_clanGroup];
		_clanGroup setGroupIdGlobal [_clanData select 0];
		missionNameSpace setVariable [format ['ExileServer_clan_%1',_clanID],_clanData];
	}
	else
	{
		_clanGroup = (_clanData select 5);
	};
	[_newUnit] joinSilent _clanGroup;
};
_newUnit disableAI 'FSM';
_newUnit disableAI 'MOVE';
_newUnit disableAI 'AUTOTARGET';
_newUnit disableAI 'TARGET';
_newUnit disableAI 'CHECKVISIBLE';
_newUnit setName _name;
_newUnit setVariable ['ExileMoney', 0, true]; 
_newUnit setVariable ['ExileScore', (_accountData select 0)];
_newUnit setVariable ['ExileKills', (_accountData select 1)];
_newUnit setVariable ['ExileDeaths', (_accountData select 2)];
_newUnit setVariable ['ExileClanID', _clanID];
_newUnit setVariable ['ExileClanData', _clanData];
_newUnit setVariable ['ExileHunger', 100];
_newUnit setVariable ['ExileThirst', 100];
_newUnit setVariable ['ExileTemperature', 37];
_newUnit setVariable ['ExileWetness', 0];
_newUnit setVariable ['ExileAlcohol', 0]; 
_newUnit setVariable ['ExileName', _name, true]; 
_newUnit setVariable ['ExileOwnerUID', _playerUID]; 
_newUnit setVariable ['ExileIsBambi', true];
_newUnit setVariable ['ExileXM8IsOnline', false, true];
_newUnit setVariable ['ExileLocker', (_accountData select 4), true];
_newUnit addMPEventHandler ['MPKilled', {_this call ExileServer_object_player_event_onMpKilled}];
_newUnit call ExileServer_object_player_database_insert;



_createPlayerResponse = [
	_newUnit, 
	'', 
	str (_accountData select 0),
	(_accountData select 1),
	(_accountData select 2),
	100,
	100,
	0,
	(getNumber (configFile >> 'CfgSettings' >> 'BambiSettings' >> 'protectionDuration')) * 60, 
	_clanData,
	0
];

[
	[_createPlayerResponse,[_target,_newUnit]],
	{
		(_this select 0) call ExileClient_object_player_network_createPlayerResponse;
		(_this select 1) call fnc_exile_revive_client;
	},
	_targetID,
	false
] call FN_infiSTAR_S;



_sessionId = call ExileServer_system_session_createId;
ExileSessionIDs pushBack _sessionId;
[_sessionID, _newUnit] call ExileServer_system_session_update;
_newUnit call ExileServer_object_player_database_update;
_newUnit spawn {uiSleep 10;if(!isNull _this)then{_this call ExileServer_object_player_database_update;};};

_newUnit setPosATL _posATL;
_newUnit setDir _direction;
true
";


if(_block_glitch_actions || _wall_glitch_object || _wall_glitch_vehicle)then{
	fnc_check_if_enemy_base = compileFinal "
		_flags = player nearObjects ['Exile_Construction_Flag_Static', 55];
		if(_flags isEqualTo [])exitWith{false};
		
		_grp = group player;
		_groupID = groupID _grp;
		
		_uids = [getPlayerUID player];
		if!(_groupID isEqualTo '')then
		{
			{
				_xuid = getPlayerUID _x;
				if!(_xuid isEqualTo '')then
				{
					_uids pushBackUnique _xuid;
				};
			} forEach (units _grp);
		};
		
		_val = true;
		{
			_radius = _x getVariable['ExileTerritorySize', -1];
			if((player distance _x) < _radius)then
			{
				_buildRights = _x getVariable['ExileTerritoryBuildRights', []];
				{
					if(_x in _buildRights)exitWith
					{
						_val = false;
					};
				} forEach _uids;
			};
			if(!_val)exitWith{};
		} forEach _flags;
		_val
	";
	publicVariable "fnc_check_if_enemy_base";
};

_ryanzombies = !(getArray(configfile >> 'CfgPatches' >> 'Ryanzombies' >> 'units') isEqualTo []);



fnc_debugbox_new = compileFinal (preprocessFileLineNumbers '\a3_infiSTAR_Exile\debug.sqf');
diag_log format["%1 - STARTUP - including AdminTools",time];
#include "EXILE_AT.sqf"
diag_log format["%1 - STARTUP - AdminTools included!",time];
diag_log format["%1 - STARTUP - including AntiHack",time];
#include "EXILE_AH.sqf"
diag_log format["%1 - STARTUP - AntiHack included!",time];
comment "Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de";
true