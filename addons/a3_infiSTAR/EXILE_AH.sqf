/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de';
UPDATEEMAIL='gr8_boi52@yahoo.com';
INFISTARVERSION='03-Apr-2016 23-22-35 - v0044';
diag_log format['<infiSTAR.de> %1 - VERSION: %2',time,INFISTARVERSION];
{
	_uids = (_x select 0);
	{
		private '_uid';
		_uid = _x;
		if(!isNil'_uid')then
		{
			_uidarray = toArray _x;
			if(39 in _uidarray)then
			{
				_uidarray = _uidarray - [39];
				_uid = toString _uidarray;
				diag_log format['<infiSTAR.de> %1 - validated admin uid (do not use single quotes!) %2 should be %3',time,_x,_uid];
			};
			if(count _uid > 5)then
			{
				_admins pushBackUnique _uid;
				diag_log format['<infiSTAR.de> %1 - adding valid admin uid %2',time,_uid];
			}
			else
			{
				diag_log format['<infiSTAR.de> %1 - removing invalid admin uid %2',time,_uid];
			};
		};
	} forEach _uids;
} forEach _adminUIDandAccess;
_t = time;
diag_log format['<infiSTAR.de> %1 - TESTING IF serverCommandPassword IS SET PROPERLY',_t];
_return = _serverCommandPassword serverCommand format ['#kick %1',0];
if(!_return)then{_serverCommandPassword = getText(configfile >> 'CfgSettings' >> 'RCON' >> 'serverPassword');};
_return = _serverCommandPassword serverCommand format ['#kick %1',0];
if(!_return)exitWith
{
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword NOT SET!   gr8_boi52@yahoo.com - 03-Apr-2016 23-22-35 - v0044 - %2 - %3',_t,serverName,productVersion];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   in EXILE_AHAT_CONFIG.hpp is %2',_t,_serverCommandPassword];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   is defined in your servers config.cfg',_t];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   has to be set it in EXILE_AHAT_CONFIG.hpp where it says _serverCommandPassword = "changeme";',_t];
	diag_log format['<infiSTAR.de> %1 - infiSTAR will not START if passwords are not set properly!',_t];
};
FN_GET_SERVERPW = compileFinal (str _serverCommandPassword);
diag_log format['<infiSTAR.de> %1 - serverCommandPassword IS FINE',_t];
if!(isClass (missionconfigfile >> 'infiSTAR_EDITBOX'))exitWith
{
	diag_log format['<infiSTAR.de> %1 - infiSTAR_Exile_AdminMenu.hpp in your MPmission is NOT UPDATED   gr8_boi52@yahoo.com - 03-Apr-2016 23-22-35 - v0044 - %2 - %3',_t,serverName,productVersion];
	diag_log format['<infiSTAR.de> %1 - infiSTAR will not START if infiSTAR_Exile_AdminMenu.hpp is not updated!',_t];
};
_test = [0,{}] execFSM 'call.fsm';
_test = [0,{}] execFSM 'call.fsm';
if(_test isEqualTo 0)exitWith
{
	_log = format['<infiSTAR.de> %1 - call.fsm missing in your MPmission!    gr8_boi52@yahoo.com - 03-Apr-2016 23-22-35 - v0044 - %2 - %3',_t,serverName,productVersion];
	for '_i' from 0 to 30 do
	{
		diag_log _log;
		diag_log format['<infiSTAR.de> %1 - infiSTAR will not START if files are not in place!',_t];
	};
};
currentserverfps = 50;
activeSQFScriptsvar = 0;
FN_CHECK_CHARACTERS = compileFinal "
	_allowedCharacters = [48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90];
	_upper = toUpper(_this select [0,10]);
	_array = toArray _upper;
	_tmparray = [];
	{if(_x in _allowedCharacters)then{_tmparray pushBack _x;};} forEach _array;
	toString _tmparray
";
CUSTOM_briefingName = briefingName call FN_CHECK_CHARACTERS;
CUSTOM_worldName = worldName call FN_CHECK_CHARACTERS;
fnc_getserverTime = compileFinal "
	_hours = floor(time / 60 / 60);
	_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
	_seconds = time - (_hours*60*60) - (_minutes * 60);
	format['%1h %2min %3s | ',_hours,_minutes,round _seconds]
";
FN_CALL_LOG_DLL = compileFinal "
	'ARMA_LOG' callExtension format['%1%2_%3_%4',LOG_PATH,briefingName select [0,10],worldName select [0,10],_this];
";
FN_CALL_LOAD_DLL = compileFinal "
	'ARMA_LOAD' callExtension _this
";
FNC_A3_LOG_RAND_VAR = compileFinal "
	format['A3_RANDOMVAR_LOG:%1',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>RandomVarLog| '+_this+'   ['+INFISTARVERSION+']');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_RAND_VAR'] call MAR_fnc_log;};
";
FNC_A3_HACKLOG = compileFinal "
	format['A3_HACKLOG:%1',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>HL| '+_this+'   ['+INFISTARVERSION+']');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_HACKLOG'] call MAR_fnc_log;};
";
FNC_A3_SURVEILLANCELOG = compileFinal "
	format['A3_SURVEILLANCELOG:%1',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>SL| '+_this+'   ['+INFISTARVERSION+']');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_SURVEILLANCELOG'] call MAR_fnc_log;};
";
FNC_A3_ADMINLOG = compileFinal "
	format['A3_ADMINLOG:%1',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>AdminLog| '+_this+'   ['+INFISTARVERSION+']');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de__ADMINLOG'] call MAR_fnc_log;};
";
FNC_A3_CUSTOMLOG = compileFinal "
	format['A3_%1:%2',_this select 0,_this select 1] call FN_CALL_LOG_DLL;
	diag_log format['<infiSTAR.de>%1| %2   ['+INFISTARVERSION+']',_this select 0,_this select 1];
	if(!isNil'MAR_fnc_log')then{[_this select 1,format['infiSTAR.de_%1',_this select 0]] call MAR_fnc_log;};
";
FNC_A3_CONNECTLOG = compileFinal "
	format['A3_CONNECTLOG:%1   [%2|FPS: %3|THREADS: %4|'+INFISTARVERSION+']',_this,call fnc_getserverTime,diag_fps,activeSQFScriptsvar] call FN_CALL_LOG_DLL;
	diag_log format['<infiSTAR.de>ConnectLog| %1   ['+INFISTARVERSION+']',_this];
";
FNC_A3_TOKENLOG = compileFinal "
	format['A3_TOKENLOG:%1   ['+INFISTARVERSION+']',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>TokenLog| '+_this+'   ['+INFISTARVERSION+']');
";
FNC_A3_RESOLVESTEAMNAMELOG = compileFinal "
	format['A3_RESOLVESTEAMNAMELOG:%1   ['+INFISTARVERSION+']',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>ResolveSteamName| '+_this+'   ['+INFISTARVERSION+']');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_RESOLVESTEAMNAMELOG'] call MAR_fnc_log;};
";
_UVC = ((_VehicleWhiteList_check)||(_ForbiddenVehicles_check));
_allowTPArray = [];_allowTPArray = _allowTP;
_allRandomGenVars = [];
_counts = [];
{
	_counts pushBack (count _x);
} forEach (allVariables missionnamespace);
_num = 0;
{
	_num = _num + _x;
} forEach _counts;
_count = count _counts;
_average = ceil(_num / _count);
_randminval = (_average/3);
_randmaxval = (_average/1.5);
_fnc_RandomGen =
{
	private '_gen';
	_fnc_actualGen = {
		_start	= ['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'];
		_main	= ['I','T','I','g','A','q','P','z','D','4','p','l','t','b','1','X','S','6','X','i','6','e','N','X','I','7','a','h','3','o'];
		_filler	= ['1','2','3','4','5','6','7','8','9','0','_','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
		_gen = selectRandom _start;
		_randmax = {((round(random _randminval)) + (round(random _randmaxval))) max _randminval};
		for '_i' from 0 to (call _randmax)do
		{
			_gen = _gen + (selectRandom _filler) + (selectRandom _main);
		};
		_gen
	};
	for '_i' from 0 to 10000 do
	{
		_gen = call _fnc_actualGen;
		_index = _allRandomGenVars pushBackUnique _gen;
		if(_index > -1)exitWith{_gen};
	};
	_gen
};diag_log format['<infiSTAR.de> _fnc_RandomGen: %1',_fnc_RandomGen];
format['----START-LINE----   (%1)',INFISTARVERSION] call FNC_A3_LOG_RAND_VAR;
_fnc_server_handle_mpmessage = call _fnc_RandomGen;format['_fnc_server_handle_mpmessage: %1',_fnc_server_handle_mpmessage] call FNC_A3_LOG_RAND_VAR;
_fnc_AdminReqReal = call _fnc_RandomGen;format['_fnc_AdminReqReal: %1',_fnc_AdminReqReal] call FNC_A3_LOG_RAND_VAR;
_fnc_server_handle_pre_mpmessage = call _fnc_RandomGen;format['_fnc_server_handle_pre_mpmessage: %1',_fnc_server_handle_pre_mpmessage] call FNC_A3_LOG_RAND_VAR;
_RATING_CHECK_LOOPS = call _fnc_RandomGen;format['_RATING_CHECK_LOOPS: %1',_RATING_CHECK_LOOPS] call FNC_A3_LOG_RAND_VAR;
_token_by_uid = call _fnc_RandomGen;format['_token_by_uid: %1',_token_by_uid] call FNC_A3_LOG_RAND_VAR;
_uid_by_token = call _fnc_RandomGen;format['_uid_by_token: %1',_uid_by_token] call FNC_A3_LOG_RAND_VAR;
_name_by_uid = call _fnc_RandomGen;format['_name_by_uid: %1',_name_by_uid] call FNC_A3_LOG_RAND_VAR;
_owner_by_uid = call _fnc_RandomGen;format['_owner_by_uid: %1',_owner_by_uid] call FNC_A3_LOG_RAND_VAR;
_object_by_uid = call _fnc_RandomGen;format['_object_by_uid: %1',_object_by_uid] call FNC_A3_LOG_RAND_VAR;
_replaceOnCD = call _fnc_RandomGen;format['_replaceOnCD: %1',_replaceOnCD] call FNC_A3_LOG_RAND_VAR;
_onPlayerConnected = call _fnc_RandomGen;format['_onPlayerConnected: %1',_onPlayerConnected] call FNC_A3_LOG_RAND_VAR;
_server_setTokenR = call _fnc_RandomGen;format['_server_setTokenR: %1',_server_setTokenR] call FNC_A3_LOG_RAND_VAR;
_FN_INJECT_ON_CLIENT = call _fnc_RandomGen;format['_FN_INJECT_ON_CLIENT: %1',_FN_INJECT_ON_CLIENT] call FNC_A3_LOG_RAND_VAR;
_fnc_l_on_c = call _fnc_RandomGen;format['_fnc_l_on_c: %1',_fnc_l_on_c] call FNC_A3_LOG_RAND_VAR;
_TokenCT = call _fnc_RandomGen;format['_TokenCT: %1',_TokenCT] call FNC_A3_LOG_RAND_VAR;
_adminStartupCode = call _fnc_RandomGen;format['_adminStartupCode: %1',_adminStartupCode] call FNC_A3_LOG_RAND_VAR;
_AHKickOFF = call _fnc_RandomGen;format['_AHKickOFF: %1',_AHKickOFF] call FNC_A3_LOG_RAND_VAR;
_AHKickLog = call _fnc_RandomGen;format['_AHKickLog: %1',_AHKickLog] call FNC_A3_LOG_RAND_VAR;
_AH_RunCheckENDVAR = call _fnc_RandomGen;format['_AH_RunCheckENDVAR: %1',_AH_RunCheckENDVAR] call FNC_A3_LOG_RAND_VAR;
_AH_RunCheck = call _fnc_RandomGen;format['_AH_RunCheck: %1',_AH_RunCheck] call FNC_A3_LOG_RAND_VAR;
_AH_HackLogArrayRND = call _fnc_RandomGen;format['_AH_HackLogArrayRND: %1',_AH_HackLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_AH_SurvLogArrayRND = call _fnc_RandomGen;format['_AH_SurvLogArrayRND: %1',_AH_SurvLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_AH_AdmiLogArrayRND = call _fnc_RandomGen;format['_AH_AdmiLogArrayRND: %1',_AH_AdmiLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_TMPBAN = call _fnc_RandomGen;format['_TMPBAN: %1',_TMPBAN] call FNC_A3_LOG_RAND_VAR;
_AHpos = call _fnc_RandomGen;format['_AHpos: %1',_AHpos] call FNC_A3_LOG_RAND_VAR;
_adminsA = call _fnc_RandomGen;format['_adminsA: %1',_adminsA] call FNC_A3_LOG_RAND_VAR;
_MCS = call _fnc_RandomGen;format['_MCS: %1',_MCS] call FNC_A3_LOG_RAND_VAR;
_LogicVariable = call _fnc_RandomGen;format['_LogicVariable: %1',_LogicVariable] call FNC_A3_LOG_RAND_VAR;
_vehicle_needs_check = call _fnc_RandomGen;format['_vehicle_needs_check: %1',_vehicle_needs_check] call FNC_A3_LOG_RAND_VAR;
_fnc_infiSTAR_PlayerLog = call _fnc_RandomGen;format['_fnc_infiSTAR_PlayerLog: %1',_fnc_infiSTAR_PlayerLog] call FNC_A3_LOG_RAND_VAR;
_antidupePVResVar = call _fnc_RandomGen;format['_antidupePVResVar: %1',_antidupePVResVar] call FNC_A3_LOG_RAND_VAR;
_runcheck_thread = call _fnc_RandomGen;format['_runcheck_thread: %1',_runcheck_thread] call FNC_A3_LOG_RAND_VAR;
_timealive = call _fnc_RandomGen;format['_timealive: %1',_timealive] call FNC_A3_LOG_RAND_VAR;
_fnc_check_type_allowed = call _fnc_RandomGen;format['_fnc_check_type_allowed: %1',_fnc_check_type_allowed] call FNC_A3_LOG_RAND_VAR;
_fnc_remove_badvehicle = call _fnc_RandomGen;format['_fnc_remove_badvehicle: %1',_fnc_remove_badvehicle] call FNC_A3_LOG_RAND_VAR;
_fnc_vehicle_check = call _fnc_RandomGen;format['_fnc_vehicle_check: %1',_fnc_vehicle_check] call FNC_A3_LOG_RAND_VAR;
format['----END-LINE----   (%1)',INFISTARVERSION] call FNC_A3_LOG_RAND_VAR;
_badChatTMP = _badChat;_badChat = ["infishit"];{_badChat pushBackUnique (toLower _x);}forEach _badChatTMP;
_badNamesFullTMP = _badNamesFull;_badNamesFull = [];{_badNamesFull pushBackUnique (toLower _x);}forEach _badNamesFullTMP;
_badNamesPartialTMP = _badNamesPartial;_badNamesPartial = [];{_badNamesPartial pushBackUnique (toLower _x);}forEach _badNamesPartialTMP;
_badGroupNamesTMP = _badGroupNames;_badGroupNames = [];{_badGroupNames pushBackUnique (toLower _x);}forEach _badGroupNamesTMP;
_variable1 = toString[105,115,114,117,110,110,105,110,103];
diag_log format['<infiSTAR.de> %1 - loading AntiHack..',time];
_tmp_blacklistedVariables = _blacklistedVariables;



_verybadStrings =
[
	'menu loaded','kill target','no recoil','rapid fire','explode all','teleportall',
	'destroyall','destroy all','g-e-f','box-esp','god on','god mode','unlimited mags',
	'infishit','cheatmenu','in54nity','infinite ammo','player markers'
];
_blacklistedVariables =
[
	'BIS_fnc_dbg_reminder_value','BIS_fnc_dbg_reminder','BIS_MENU_GroupCommunication','BIS_fnc_addCommMenuItem_menu',
	'rscspectator','rscspectator_hints','rscspectator_display','rscspectator_playericon',
	'rscspectator_view','rscspectator_map','rscspectator_vision','rscspectator_keys',
	'rscspectator_interface','bis_fnc_camera_target',
	'time','serverTime','myplayeruid','hhahaaaaar','CharlieSheenkeybinds','KickOFF','yolo','runonce','notakeybind','action1','Supa_Licenses','autokick','wallaisseikun','MainMenu',
	'GEFClose','GEFWhite','GEFRed','GEFGreen','GEFCyan','FirstHint','new_queued','fn_Exec','FND_fnc_select','fnx3','ANTIHACKKICK','tele','dmap','GOLDENS_GLOBAL_SHIT_YEAH','GLASS911_Run',
	'gearDialog_create','lystoKeypress','ThirtySix','LY_SwaggerLikeUs','Jkeyszz','n2','boxofmagic','MainScripts','DMC_fnc_4danews','INFISTARBYPASS','EXEC_TEXT','vehicle_dblclick','init_main',
	'ESP_Count','Nute_Dat_Bomber','s_cash100k','XposPlayer','ly_re_onetime','SKAR_checkA','MainScriptsV4','ViewDistance','check_load','already_load','meins','f1','Dummy','Plane_Jump',
	'c_player','MouseClickEH','distp','nec2','Menu_I_Run_Color_LP','GLASSv1nce_BindHandler','thecar','FastAnimes','GetinPassenger','iaimon','DMC_Re_onetime','func_execOnServer','fnc_serverKickNice',
	'Kick_Admins','DASMOKEON','hovering','r_kelly_be_flying','VinceLOL_ALTISLIFE','life_fnc_byassSkaroAH','AH_fnc_MP','jayRE','fn_newsbanner','Hack_News','TrollFuncs',
	'Fanatic_InfiPass','keybindings_xxx','AndysClosed','UserFuncs','AltisFuncs','RemExe','BB_nofatigue','bis_fnc_diagkey_var_code','First_PAGE','Get_in_D','i_t_s__m_e_o','smissles','Whippy_ESP',
	'TargetFuncs2','life_fnc_antiFreeeeze','LY_keyForward','TY_re_onetime','life_fnc_XaAxAA','mein1','GodDamnVehiclesXD','Mystic_FNC_ESP_distance','Esp_Id_setter','DummyMen','whipbut','UserFuncs',
	'KrohdoFreedom','selectedPlayer','Lmenu1','ggplayer','throx_menu_item','lvl1','Init_Menu_Slew','D_B_R_T_Y_Slew','V6_GEF','xasfjisisafudmmyx','kekse','UPDATED_RE_36','first','second',
	'SNI_PRZ_ZZZ_TargetPlayer','healit','O_fnc_ArmA','MLRN_EXEC','running_threads','catchemall2128','killtarget','GMToggle'
];
_blacklistedAdminVariables =
[
	'AH_HackLogArray','AH_SurvLogArray','AH_AdmiLogArray','babecore_escM_mousepos',
	'fnc_infiAdminKeyDown','MAIN_DISPLAY_ID','fnc_Disconnect_selected','fnc_adminLog','go_in_nearestvehicle_callmevar','noRecoilRun',
	'FNC_CUSTOM_fn_loadInventory','ADMIN_LOCAL_MARKER','ALLOW_ME_THIS_KEYBIND','freeFlightCam','fnc_ButtonClick_44466','fnc_LBSelChanged_LEFT','unlimAmmRun',
	'fnc_infiSTAR_A3noRecoil','VEHBOOST_FUNCTION','fnc_infiSTAR_get_LeftClicks','fnc_AdminReq','infiSTAR_MAIN_CODE','fnc_get_plr'
];


_tofindcontent =
[
	'+ _code +','infiesp'
];
_tofindboth =
[
	'xxx_','k3ybinds','jme_','_g0d_','infistatus',
	'godmode','speedhack','no grass','remote menu',
	'currentmenu'
];

_findObjectVar =
[
	'gtog','currenttarget','explodepos','nfttog','currentindex',
	'exbtog','explodeobj','spawnunit','pfftog','fstog','menuvars',
	'shbtog','pnftog','launch','itog','ndtog','ifbtog','cursore'
];
_findObjectVarContent =
[
	'systemchat'
];

if(!isNil'_tmp_blacklistedVariables')then
{
	if(typeName _tmp_blacklistedVariables isEqualTo 'ARRAY')then
	{
		_blacklistedVariables append _tmp_blacklistedVariables;
	};
};
_allowedMarkers = ['TreasureMarker','ExilePartyMarker','ExileSupplyBox','Death','_USER_DEFINED','[',']'];
_VehicleWhiteListTEMP = _VehicleWhiteList;_VehicleWhiteList = [];{_VehicleWhiteList pushBackUnique (toLower _x);} forEach _VehicleWhiteListTEMP;_VehicleWhiteListTEMP=nil;
_ForbiddenVehiclesTEMP = _ForbiddenVehicles;_ForbiddenVehicles = [];{_ForbiddenVehicles pushBackUnique (toLower _x);} forEach _ForbiddenVehiclesTEMP;_ForbiddenVehiclesTEMP=nil;
if(_UMW)then{_allowedMarkers append _aLocalM;};
fnc_CompilableString = {
	_input = _this select 0;
	_output = call {
		if(typename _input == 'CODE')exitWith{(str(_input)) select [1,((count(str(_input)))-2)]};
		if(typename _input == 'STRING')exitWith{_input};
		''
	};
	_output
};
fnc_CompilableString = compileFinal ([fnc_CompilableString] call fnc_CompilableString);
publicVariable "fnc_CompilableString";


_chatCommandsL = [];
{
	_chatCommandsL pushBackUnique [toLower(_x select 0),(_x select 1)];
} forEach _chatCommands;
_chatCommandsPL = [];
{
	_chatCommandsPL pushBackUnique [toLower(_x select 0),(_x select 1)];
} forEach _chatCommandsP;


if(_HTML_LOAD_URL != "")then{HTML_LOAD_URL3 = _HTML_LOAD_URL;publicVariable "HTML_LOAD_URL3";};
if(isNil'CUSTOM_FUNCTION_ARRAY')then{CUSTOM_FUNCTION_ARRAY = [];};
CUSTOM_FUNCTION_EXTENDED = compileFinal "
	if(CUSTOM_FUNCTION_ARRAY isEqualTo [])exitWith{false};
	_option = _this select 0;
	_input = _this select 1;
	_return = _input call (CUSTOM_FUNCTION_ARRAY select _option);
	_return
";
if(_ENABLE_PRIVATE_CHAT_MENU)then{
_privchat = {
	_senderNetId = _this select 0;
	_receiverNetId = _this select 1;
	_time = _this select 2;
	_text = _this select 3;
	_senderObj = objectFromNetId _senderNetId;
	_receiverObj = objectFromNetId _receiverNetId;
	if(!isNull _senderObj && !isNull _receiverObj)then
	{
		_senderName = _senderObj getVariable['ExileName',name _senderObj];
		_receiverName = _receiverObj getVariable['ExileName',name _receiverObj];
		
		['CHAT',format['(%1) %2 -> %3: %4',_time,_senderName,_receiverName,_text]] call FNC_A3_CUSTOMLOG;
		
		[
			[_senderName,_receiverName,_time,_text,_senderNetId],
			{
				params['_senderName','_receiverName','_time','_text','_senderNetId'];
				CHAT_HISTORY_ARRAY pushBack _this;
				
				_senderObj = (objectFromNetId _senderNetId);
				ACTIVE_CHATS = ACTIVE_CHATS - [_senderObj];
				ACTIVE_CHATS pushBackUnique _senderObj;
				
				call fnc_fill_chat_history;
				systemChat format['%1 (%2): %3',_senderName,_time,_text];
				playsound 'AddItemOK';
				['Success',format['%1: %2:',_senderName,_text]] call ExileClient_gui_notification_event_addNotification;
			},
			owner _receiverObj,
			false
		] call FN_infiSTAR_S;
	};
};
CUSTOM_FUNCTION_ARRAY set[4,_privchat];
};
call compile ("
FNC_OWNER_BY_UID = compileFinal ""
	params[['_uid','']];
	_owner = missionNameSpace getVariable[format['"+_owner_by_uid+"%1',_uid],-10];
	if(_owner isEqualTo -10)then
	{
		_clientObject = missionNameSpace getVariable[format['"+_object_by_uid+"%1',_uid],objNull];
		if(!isNull _clientObject)then
		{
			if(isPlayer _clientObject)then
			{
				_owner = owner _clientObject;
			};
		};
	};
	if(_owner > 2)then{_owner}else{-10}
"";
fnc_AdminReq = compileFinal '
	_inputOption = _this select 0;
	_inputParams = _this select 1;
	if(_inputOption isEqualTo 0)exitWith{_inputParams call "+_fnc_AdminReqReal+";true};
	if(_inputOption isEqualTo 1)exitWith{_inputParams call "+_fnc_server_handle_pre_mpmessage+";true};
	if(_inputOption isEqualTo 2)exitWith{if(!isNil''CUSTOM_FUNCTION'')then{_inputParams call CUSTOM_FUNCTION;};true};
	if(_inputOption isEqualTo 3)exitWith{_inputParams call CUSTOM_FUNCTION_EXTENDED;true};
';
");
FN_infiSTAR_CS = compileFinal "_this remoteExecCall ['fnc_AdminReq', 2, false]";publicVariable"FN_infiSTAR_CS";
FN_infiSTAR_F = compileFinal "missionNameSpace setVariable[(_this select 0),compileFinal(_this select 1)]";publicVariable"FN_infiSTAR_F";
FN_infiSTAR_C = compileFinal "(_this select 0) call (_this select 1)";publicVariable"FN_infiSTAR_C";
FN_infiSTAR_S = compileFinal "
params [['_input',''],['_code',{}],['_id',-10],['_jip',false]];
if(_id isEqualTo -10)exitWith{
	diag_log format['<infiSTAR.de> FN_infiSTAR_S _input: %1',_input];
	diag_log format['<infiSTAR.de> FN_infiSTAR_S _code: %1',_code];
	diag_log format['<infiSTAR.de> FN_infiSTAR_S _jip: %1',_jip];
};
if(typename _code isEqualTo 'STRING')then{_code=compile _code;};
[_input,_code] remoteExecCall ['FN_infiSTAR_C',_id,_jip]
";
fnc_call_ARMALOAD = compileFinal "
	private['_option','_input','_url','_packet1','_jobid','_packet2','_res','_timeout'];
	_option = _this select 0;
	_input = _this select 1;
	_url = _this select 2;
	
	_packet1 = format['getasync%1%2%1',toString [10],_url];
	_jobid = _packet1 call FN_CALL_LOAD_DLL;
	_packet2 = format['response%1%2%1',toString [10],_jobid];
	_timeout = diag_tickTime + 80;
	_res = 'WAIT';
	_bad = ['','WAIT','ERROR','URLERROR'];
	waitUntil{
		uiSleep 3;
		_res = _packet2 call FN_CALL_LOAD_DLL;
		(!(_res in _bad) && ((toLower _res) find 'wrapper is disabled' isEqualTo -1)) || diag_tickTime > _timeout
	};
	if(_res in _bad)exitWith{};if((toLower _res) find 'wrapper is disabled' != -1)exitWith{};
	if(_option isEqualTo 0)exitWith
	{
		if(isNil'ARMALOAD_urlARRAY')then{ARMALOAD_urlARRAY=[];};
		if(_url in ARMALOAD_urlARRAY)exitWith{diag_log '<infiSTAR.de> terminated double LOAD call';};
		ARMALOAD_urlARRAY pushBack _url;
		
		private['_name','_puid','_clientID'];
		_name = _input select 0;
		_puid = _input select 1;
		missionNameSpace setVariable[format['STEAM_NAME_%1',_puid],_res];
		
		if(count _input == 3)then
		{
			_clientID = _input select 2;
			_code = {
				params['_name','_uid',['_steamname','']];
				_log = format['<infiSTAR.de> %1(%2) SteamName is: %3',_name,_uid,_steamname];
				cutText [_log, 'PLAIN'];
				systemchat _log;
				diag_log _log;
			};
			[[_name,_puid,_res],_code,_clientID,false] call FN_infiSTAR_S;
			format['%1(%2) is %3',_name,_puid,_res] call FNC_A3_RESOLVESTEAMNAMELOG;
		};
	};
";
FN_GET_OBJ_BY_OWNER = compileFinal "
	_playerObj = objNull;{if(owner _x isEqualTo _owner)exitWith{_playerObj=_x};} forEach allPlayers;_playerObj
";
fnc_resolveSteamName = compileFinal "
	private['_name','_puid','_clientID','_inputToForward','_steamName'];
	_name = _this select 0;
	_puid = _this select 1;
	_inputToForward = [_name,_puid];
	if(count _this == 3)then
	{
		_clientID = _this select 2;
		_inputToForward = [_name,_puid,_clientID];
	};
	_steamName = missionNameSpace getVariable[format['STEAM_NAME_%1',_puid],''];
	if(_steamName isEqualTo '')then
	{
		if(isNil 'STEAM_NAME_ARRAY_Q')then{STEAM_NAME_ARRAY_Q = [];};
		if!(_puid in STEAM_NAME_ARRAY_Q)then
		{
			STEAM_NAME_ARRAY_Q pushBack _puid;
			if(isNil'STEAM_NAME_URL')then{STEAM_NAME_URL = toString[104,116,116,112,58,47,47,105,110,102,105,115,116,97,114,46,100,101,47,115,116,101,97,109,110,97,109,101,46,112,104,112,63,115,116,101,97,109,117,105,100,61];};
			[0,_inputToForward,(STEAM_NAME_URL+_puid)] spawn fnc_call_ARMALOAD;
		};
	};
	_steamName
";
fnc_getSteamNameIfSaved = compileFinal "
	_steamName = missionNameSpace getVariable[format['STEAM_NAME_%1',_uid],''];
	_steamName
";
if(_stopSafeGlitch)then{
fnc_stop_safe_glitch = compileFinal "
	_ret = _this call ExileClient_object_player_event_onInventoryOpened;
	if(!_ret)then
	{
		_container = _this select 1;
		
		_locked = locked _container isEqualTo 2;
		_ExileIsLocked = _container getVariable ['ExileIsLocked', 1] isEqualTo -1;
		_lockedNear = false;
		
		if(!_locked && !_ExileIsLocked)then
		{
			if((_container isKindOf 'GroundWeaponHolder')||(_container isKindOf 'WeaponHolderSimulated')||(_container isKindOf 'LootWeaponHolder'))then
			{
				{
					_lockedx = locked _x isEqualTo 2;
					_ExileIsLockedx = _x getVariable ['ExileIsLocked', 1] isEqualTo -1;
					if(_lockedx || _ExileIsLockedx)exitWith{_lockedNear = true};
				} forEach (player nearSupplies 5);
				if(!_lockedNear)then
				{
					_vehicles = player nearObjects ['AllVehicles', 5];
					{
						_lockedxx = locked _x isEqualTo 2;
						_ExileIsLockedxx = _x getVariable ['ExileIsLocked', 1] isEqualTo -1;
						if((((_lockedxx || _ExileIsLockedxx) && !(local _x))||(!alive _x)) && !(_x in [_container,vehicle _container]))exitWith{_lockedNear = true;};
					} forEach _vehicles;
				};
			};
		};
		if(_locked || _ExileIsLocked || _lockedNear)then
		{
			if(!isNil'checkGearDisplayThread')then{terminate checkGearDisplayThread;checkGearDisplayThread=nil;};
			checkGearDisplayThread = [] spawn {
				disableSerialization;
				waitUntil {!isNull findDisplay 602};
				waitUntil {
					_display = findDisplay 602;
					_ctrl_cargo = _display displayCtrl 6401;
					_ctrl_ground = _display displayCtrl 6321;
					_ctrl_cargo ctrlEnable  false;
					ctrlSetFocus _ctrl_ground;
					ctrlActivate _ctrl_ground;
					isNull findDisplay 602
				};
			};
		};
	};
	_ret
";
publicVariable "fnc_stop_safe_glitch";
};
fnc_remove_billboard = compileFinal "
	_vehicleID = _this getVariable ['ExileDatabaseID', -1];if(_vehicleID > -1)then{format ['deleteVehicle:%1', _vehicleID] call ExileServer_system_database_query_fireAndForget;};
";
if(!isNil'infiSTAR_DEBUG')then{
	fn_log_debug = compileFinal "
		_id = _this select 0;
		_coderan = _this select 1;
		_sel = _this select 2;
		_runtime = diag_tickTime - _coderan;
		if(_runtime > 0.5)then
		{
			diag_log format['%1 ran %2 seconds',_sel,_runtime];
		};
	";
	publicVariable 'fn_log_debug';
};
fnc_deleteObject = compileFinal "
	_objToDelete = _this;
	if(_objToDelete isKindOf 'Exile_Construction_Flag_Static')then
	{
		_objectID = _objToDelete getVariable['ExileDatabaseID',-1];
		if(_objectID != -1)then
		{
			_pos = getPosATL _objToDelete;
			_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];
			_pos set[2,(_pos select 2)+0.1];
			_holder setPosATL _pos;
			_holder addItemCargoGlobal ['Exile_Item_Flag',1];
			
			format['deleteTerritory:%1', _objectID] call ExileServer_system_database_query_fireAndForget;
		};
	};
	
	_type = typeOf _objToDelete;
	if(_objToDelete isKindOf 'AbstractConstruction')then
	{
		if(isNumber(configFile >> 'CfgVehicles' >> _type >> 'exileContainer'))then
		{
			_objToDelete call ExileServer_object_container_packContainer;
		}
		else
		{
			_objToDelete call ExileServer_object_construction_database_delete;
			_config = ('(getText(_x >> ''staticObject'') isEqualTo _type)' configClasses (configFile >> 'CfgConstruction')) select 0;
			_config = getText (_config >> 'kitMagazine');
			
			_pos = getPosATL _objToDelete;
			_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];
			_pos set[2,(_pos select 2)+0.1];
			_holder setPosATL _pos;
			_holder addItemCargoGlobal [_config,1];
		};
	};
	if(_objToDelete isKindOf 'Exile_Construction_Abstract_Static')then
	{
		if!(_objToDelete isKindOf 'Exile_Construction_Abstract_Physics')then
		{
			_objectID = _objToDelete getVariable['ExileDatabaseID',-1];
			if(_objectID != -1)then
			{
				_objToDelete call ExileServer_object_construction_database_delete;
				_config = ('(getText(_x >> ''staticObject'') isEqualTo _type)||(getText(_x >> ''upgradeObject'') isEqualTo _type)' configClasses (configFile >> 'CfgConstruction')) select 0;
				_config = getText (_config >> 'kitMagazine');
				
				_pos = getPosATL _objToDelete;
				_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];
				_pos set[2,(_pos select 2)+0.1];
				_holder setPosATL _pos;
				_holder addItemCargoGlobal [_config,1];
			};
		};
	};
	if(_objToDelete isKindOf 'Exile_Sign_TraderCity')then
	{
		_objToDelete call fnc_remove_billboard;
	};
	if(!isNull _objToDelete)then
	{
		if(!isNull _objToDelete)then
		{
			_objToDelete setDamage 1;
			deleteVehicle _objToDelete;
		};
	};
";
fnc_serverMassMessage = compileFinal "
	private['_msg','_clientID'];
	_msg = _this select 0;
	if(typename _msg isEqualTo 'STRING')then{_msg = [_this select 0,0,0.7,10,0];};
	_clientID = _this select 1;
	_code = {_this spawn bis_fnc_dynamictext;};
	[_msg,_code,_clientID,false] call FN_infiSTAR_S;
";
diag_log format['<infiSTAR.de> %1 - Thread MAIN: none-threaded code compiled and/or sent!',time];
if(_DayNightVote)then{
VOTETIME_MRV = _MRV;
VOTETIME_MVP = _MVP;
VOTETIME_VCT = _VCT;
VOTETIME_LVT = 0;
VOTETIME_ARR = [];
fnc_VoteTimeServer = compileFinal "
	_clientUID = _this select 0;
	_vote = _this select 1;
	if((VOTETIME_VCT + VOTETIME_LVT) < time)then
	{
		
		if!(_clientUID in VOTETIME_ARR)then
		{
			_players = allPlayers;
			VOTETIME_ARR pushBack _clientUID;
			VOTETIME_ARR pushBack _vote;
			_cntAll = count _players;
			_cntVoted = {getPlayerUID _x in VOTETIME_ARR} count _players;
			if((_cntAll > 0) && (_cntVoted > 0))then
			{
				_cntday = 0;
				_cntnight = 0;
				_rateAll = _cntVoted / _cntAll;
				if(_rateAll >= VOTETIME_MVP)then
				{
					_oUIDs = [];
					{
						_xUID = getPlayerUID _x;
						if(_xUID != '')then
						{
							_oUIDs pushBack _xUID;
						};
					} forEach _players;
					for '_i' from 0 to (count VOTETIME_ARR)-1 step 2 do
					{
						_cUID = VOTETIME_ARR select _i;
						_cVOTE = VOTETIME_ARR select (_i+1);
						if(_cUID in _oUIDs)then
						{
							if(_cVOTE == 'DAY')then{_cntday = _cntday + 1;};
							if(_cVOTE == 'NIGHT')then{_cntnight = _cntnight + 1;};
						};
					};
					
					_date = date;
					_changeTime = false;
					if!(_cntday isEqualTo _cntnight)then
					{
						if(_cntday > _cntnight)then
						{
							_rateDay = if(_cntday isEqualTo 0)then{0}else{_cntday / _cntAll};
							if(_rateDay >= VOTETIME_MRV)then
							{
								_date set [3,11];
								_changeTime = true;
							};
						}
						else
						{
							_rateNight = if(_cntnight isEqualTo 0)then{0}else{_cntnight / _cntAll};
							if(_rateNight >= VOTETIME_MRV)then
							{
								_date set [3,23];
								_changeTime = true;
							};
						};
					};
					
					if(_changeTime)then
					{
						setDate _date;
						VOTETIME_ARR = [];
						VOTETIME_LVT = time;
					};
					
					_txt = format['%1 of %2 (%3) Players voted - %4 for Day and %5 for Night',_cntVoted,_cntAll,(ceil (str (_rateAll*100))+'%'),_cntday,_cntnight];
					_msg = ['<t size=''0.55'' font =''OrbitronLight'' color=''#00B1CC''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
					[_msg,-2] call fnc_serverMassMessage;
				}
				else
				{
					_txt = format['%1 of %2 (%3) Players voted (in chat type /vote day or /vote night)',_cntVoted,_cntAll,(ceil (str (_rateAll*100))+'%')];
					_msg = ['<t size=''0.55'' font =''OrbitronLight'' color=''#00B1CC''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
					[_msg,-2] call fnc_serverMassMessage;
				};
			};
		};
	}
	else
	{
		_txt = format['Wait %1s more until next day/night vote can be made',round((VOTETIME_VCT + VOTETIME_LVT) - time)];
		_msg = ['<t size=''0.55'' font =''OrbitronLight'' color=''#00B1CC''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
		[_msg,-2] call fnc_serverMassMessage;
	};
";
diag_log format['<infiSTAR.de> %1 - VoteTimeServer compiled',time];
};
_tmpstartAsNormal = _startAsNormal;
_startAsNormal = [];
{
	if(count _x > 5)then
	{
		_startAsNormal pushBackUnique _x;
	};
} forEach _tmpstartAsNormal;
diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: adding to main string..',time];
_A3AHstring = "
diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: still compiling...',time];
_admins = "+str _admins+";"+_adminsA+" = _admins;if!("+str _startAsNormal+" isEqualTo [])then{{"+_adminsA+" = "+_adminsA+" - [_x];} forEach "+str _startAsNormal+";};
if(isNil '"+_AH_HackLogArrayRND+"')then{"+_AH_HackLogArrayRND+" = [];};
if(isNil '"+_AH_SurvLogArrayRND+"')then{"+_AH_SurvLogArrayRND+" = [];};
if(isNil '"+_AH_AdmiLogArrayRND+"')then{"+_AH_AdmiLogArrayRND+" = [];};

"; if(_uniform_and_vest_check)then{ _A3AHstring = _A3AHstring + "
fnc_check_uniform_n_vest = compileFinal ""
if(player isEqualTo (vehicle player))then{
params [['_uniform',uniform player],['_vest',vest player]];
_currentUniformPlayer = uniform player;
if!(_currentUniformPlayer isEqualTo _uniform)then
{
	_uniformContent = (uniformContainer player) call ExileClient_util_containerCargo_serialize;
	removeUniform player;
	player forceAddUniform _currentUniformPlayer;
	[(uniformContainer player), _uniformContent] call ExileClient_util_containerCargo_deserialize;
	
	systemChat '<infiSTAR.de> just replaced your UNIFORM, it was not shown for other players.';
};
_currentVestPlayer = vest player;
if!(_currentVestPlayer isEqualTo _vest)then
{
	_vestContent = (vestContainer player) call ExileClient_util_containerCargo_serialize;
	removeVest player;
	player addVest _currentVestPlayer;
	[(vestContainer player), _vestContent] call ExileClient_util_containerCargo_deserialize;
	
	systemChat '<infiSTAR.de> just replaced your VEST, it was not shown for other players.';
};
};
"";
publicVariable 'fnc_check_uniform_n_vest';
"; }; _A3AHstring = _A3AHstring + "

fnc_variable_to_admins = compileFinal '
	_fn_send = {
		{
			_owner = _x call FNC_OWNER_BY_UID;
			if!(_owner isEqualTo -10)then
			{
				_owner publicVariableClient _this;
			};
		} forEach "+str _admins+";
	};
	if(typeName _this isEqualTo ''STRING'')then
	{
		_this call _fn_send;
	}
	else
	{
		{_x call _fn_send;} forEach _this;
	};
';
_FN_INJECT_ON_CLIENT = {
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
	_blacklistedAdminVariables = "+str _blacklistedAdminVariables+";
	_badIDDsToKickPre = "+str _badIDDsToKick+";
	_badIDDsToKick = [];
	{_badIDDsToKick pushBackUnique format['Display #%1',_x];} forEach _badIDDsToKickPre;
	_badIDDsToClosePre = "+str _badIDDsToClose+";
	_badIDDsToClose = [];
	{_badIDDsToClose pushBackUnique format['Display #%1',_x];} forEach _badIDDsToClosePre;
	"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
	_allowedIddsPre = "+str _allowedIDDs+";
	_allowedIDDs = ['No display'];
	{_allowedIDDs pushBackUnique format['Display #%1',_x];} forEach _allowedIddsPre;
	"; }; _A3AHstring = _A3AHstring + "
"; }; _A3AHstring = _A3AHstring + "
	_49code = {
	"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
		if(_isNormal)then
		{
			"; if(_checkPopTabIncrease || _checkRespectIncrease)then{ _A3AHstring = _A3AHstring + "
			if(_checkchange < diag_tickTime)then
			{
				_checkchange = diag_tickTime + 2;
				
				"; if(_checkPopTabIncrease)then{ _A3AHstring = _A3AHstring + "
					if(isNil 'ExileClientPlayerMoney')then
					{
						ExileClientPlayerMoney = 0;
						_oldExileClientPlayerMoney = 0;
						_firstchancePlayerMoney = true;
					}
					else
					{
						_typeName = typeName ExileClientPlayerMoney;
						if!(_typeName isEqualTo 'SCALAR')then
						{
							_log = format['ExileClientPlayerMoney is %1 - should be SCALAR',_typeName];
							[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
						if(ExileClientPlayerMoney > 0)then
						{
							_increasedBy = ExileClientPlayerMoney - _oldExileClientPlayerMoney;
							if(_increasedBy > "+str _LogPopTabIncrease+")then
							{
								if(_firstchancePlayerMoney)exitWith{_firstchancePlayerMoney=false;};
								_log = format['PopTabs increased by %1',_increasedBy];
								[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
							};
						};
						_oldExileClientPlayerMoney = ExileClientPlayerMoney;
					};
				"; }; _A3AHstring = _A3AHstring + "
				"; if(_checkRespectIncrease)then{ _A3AHstring = _A3AHstring + "
					if(isNil 'ExileClientPlayerScore')then
					{
						ExileClientPlayerScore = 0;
						_oldExileClientPlayerScore = 0;
						_firstchancePlayerScore = true;
					}
					else
					{
						_typeName = typeName ExileClientPlayerScore;
						if!(_typeName isEqualTo 'SCALAR')then
						{
							_log = format['ExileClientPlayerScore is %1 - should be SCALAR',_typeName];
							[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
						if(ExileClientPlayerScore > 0)then
						{
							_increasedBy = ExileClientPlayerScore - _oldExileClientPlayerScore;
							if(_increasedBy > "+str _LogRespectIncrease+")then
							{
								if(_firstchancePlayerScore)exitWith{_firstchancePlayerScore=false;};
								_log = format['Respect increased by %1',_increasedBy];
								[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
							};
						};
						_oldExileClientPlayerScore = ExileClientPlayerScore;
					};
				"; }; _A3AHstring = _A3AHstring + "
			};
			"; }; _A3AHstring = _A3AHstring + "
			if(_vct < diag_tickTime)then
			{
				_vct = diag_tickTime + 6;
				
				{
					_av = missionNamespace getVariable _x;
					if(!isNil '_av')then
					{
						_log = format['AdminVariable in missionNamespace: %1 - %2',_x,_av];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				} forEach _blacklistedAdminVariables;
				
				{
					_bv = nil;_bv = missionNamespace getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in missionNamespace: %1 - %2',_x,_bv];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_bv = nil;_bv = uiNamespace getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in uiNamespace: %1 - %2 (these variables can be set in the editor)',_x,_bv];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_bv = nil;_bv = profileNamespace getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in profileNamespace: %1 - %2',_x,_bv];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_bv = nil;_bv = parsingNamespace getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in parsingNamespace: %1 - %2',_x,_bv];
						[_name,_puid,'TMPBAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_bv = nil;_bv = player getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in objectNamespace (player): %1 - %2',_x,_bv];
						[_name,_puid,'TMPBAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				} forEach _blacklistedVariables;
				
				{
					_magName = _x select 0;
					_magSize = _x select 1;
					_config = configFile >> 'cfgMagazines' >> _magName;
					if(isClass _config)then
					{
						_max = getNumber(_config >> 'count');
						if(_max > 0)then
						{
							if(_magSize > (_max+10))exitWith
							{
								_log = format['Maximum magazine size is %1, player value was: %2 - magazine: %3',_max,_magSize,_magName];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						};
					};
				} forEach (magazinesAmmoFull player);
			};
			if(_vctd < diag_tickTime)then
			{
				_vctd = diag_tickTime + 30;
				
				{
					_index = _white pushBackUnique _x;
					if(_index > -1)then
					{
						[
							[
								_name,
								_puid,
								_AHKickLog,
								_AHKickOFF,
								_x
							],
							_fnc_finddeeper
						] execFSM 'call.fsm';
					};
				} forEach (allVariables missionNamespace);
			};
		};
		if(_vctoo < diag_tickTime)then
		{
			_vctoo = diag_tickTime + 40;
			
			{
				_building = _x;
				{
					_index = _white2 pushBackUnique _x;
					if(_index > -1)then
					{
						[
							[
								_name,
								_puid,
								_AHKickLog,
								_AHKickOFF,
								_x,
								_building
							],
							_fnc_finddeeperObj
						] execFSM 'call.fsm';
					};
				} forEach (allVariables _building);
			} forEach _buildings;
		};
	"; if(_stopSafeGlitch)then{ _A3AHstring = _A3AHstring + "
		player removeAllEventHandlers 'InventoryOpened';
		player addEventHandler ['InventoryOpened', { _this call fnc_stop_safe_glitch }];
	"; }; _A3AHstring = _A3AHstring + "
	"; }; _A3AHstring = _A3AHstring + "
		_display49 = findDisplay 49;
		if(isNull _display49)then
		{
			_escapefound = false;
		}
		else
		{
			"; if(_disconnect_dupe_check)then{ _A3AHstring = _A3AHstring + "
			if(!_escapefound)then
			{
				_escapefound = true;
				if(!_DCHECKrunning)then
				{
					_DCHECKrunning = true;
					"+_antidupePVResVar+" = nil;
					[_name,_puid,'DCHECK'] call _AHKickLog;
					_startDCHECK = time + 5;
				};
			};
			if(_DCHECKrunning)then
			{
				if(time > _startDCHECK || !isNil '"+_antidupePVResVar+"')then
				{
					if(isNil '"+_antidupePVResVar+"')then
					{
						_log = format['may have tried to disconnect dupe @%1',mapGridPosition player];
						[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
						(findDisplay 49) closeDisplay 0;
					};
					_DCHECKrunning = false;
				};
			};
			"; }; _A3AHstring = _A3AHstring + "
			
			"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
			if!(serverCommandAvailable '#logout')then
			{
				(_display49 displayCtrl 2) ctrlEnable false;
				(_display49 displayCtrl 2) ctrlSetText "+str _ESCMNUTOP+";
				(_display49 displayCtrl 103) ctrlEnable false;
				(_display49 displayCtrl 103) ctrlSetText "+str _ESCMNUBOT+";
				(_display49 displayCtrl 523) ctrlSetText _name;
				(_display49 displayCtrl 109) ctrlSetText _puid;
				(_display49 displayCtrl 122) ctrlEnable false;
				(_display49 displayCtrl 122) ctrlShow false;
			};
			"; if(!_BRIEFING_MSG)then{ _A3AHstring = _A3AHstring + "
				(_display49 displayCtrl 120) ctrlSetText '[GG] Ghostz Gamerz - www.GhostzGamerz.com';
			"; }else{ _A3AHstring = _A3AHstring + "
				(_display49 displayCtrl 115025) ctrlSetText 'AntiHack & AdminsTools';
				(_display49 displayCtrl 115035) ctrlSetText 'by infiSTAR.de';
			"; }; _A3AHstring = _A3AHstring + "
			"; }; _A3AHstring = _A3AHstring + "
		};
		
		if(!isNull (findDisplay 24))then
		{
			_idKeydown24 = 9001;
			_randomNumber = (floor(random 8))+1;
			for '_i' from 0 to _randomNumber do
			{
				_idKeydown24 = (findDisplay 24) displayAddEventHandler ['KeyDown',{false}];
			};
			if!(_idKeydown24 isEqualTo _randomNumber)then
			{
				if(_idKeydown24 isEqualTo -1)exitWith{};
				for '_i' from 0 to 3 do{(findDisplay 24) closeDisplay 0;};
			};
			if(!isNull (findDisplay 24))then
			{
				(findDisplay 24) displayRemoveAllEventHandlers 'KeyDown';
				_chat = (findDisplay 24) displayCtrl 101;
				_txt = ctrlText _chat;
				if(_txt != '')then
				{
					_txt = toLower _txt;
					if(_admin)then
					{
						if(_txt isEqualTo '!admin')then
						{
							waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
							[_name,_puid,'AC',toArray(_txt)] call _AHKickLog;
							(findDisplay 46)closeDisplay 0;
						};
					};
					{
						_x0 = _x select 0;
						if(_txt isEqualTo _x0)exitWith
						{
							_x1 = _x select 1;
							waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
							[parseText format['<t color=''#2784D6'' size=''1'' font =''OrbitronMedium''>%1</t>',_x1],0,0,5,0] spawn bis_fnc_dynamictext;
							systemChat _x1;
						};
					} forEach "+str _chatCommandsL+";
					{
						_x0 = _x select 0;
						if(_txt find _x0 != -1)exitWith
						{
							_x1 = _x select 1;
							waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
							[parseText format['<t color=''#2784D6'' size=''1'' font =''OrbitronMedium''>%1</t>',_x1],0,0,5,0] spawn bis_fnc_dynamictext;
							systemChat _x1;
						};
					} forEach "+str _chatCommandsPL+";
					{
						if(_txt find _x > -1)exitWith{
							waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
							_log = format['BadText on Chat: %1 [%2]',_txt,_x];
							[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
						};
					} forEach "+str _badChat+";
					"; if(_DayNightVote)then{ _A3AHstring = _A3AHstring + "
					if((_txt select [0,8] isEqualTo 'vote day')||(_txt select [1,8] isEqualTo 'vote day'))then{
						waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
						[_name,_puid,'VOTE',toArray 'DAY'] call _AHKickLog;
					};
					if((_txt select [0,10] isEqualTo 'vote night')||(_txt select [1,10] isEqualTo 'vote night'))then{
						waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
						[_name,_puid,'VOTE',toArray 'NIGHT'] call _AHKickLog;
					};
					"; }; _A3AHstring = _A3AHstring + "
					if(_txt isEqualTo '!chat')then{
						waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
						if(!isNil'fnc_chat_send')then{if(isNull (findDisplay -1340))then{createdialog 'infiSTAR_CHAT';};};
					};
				};
			};
		};
	"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
		"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
			if(_restarttimerTimer < diag_tickTime)then
			{
				_restarttimerTimer = diag_tickTime + 10;
				
				_currentmessagetime = (_restartTime - round(serverTime / 60));
				if(_currentmessagetime in _msgTimes)then
				{
					_msgTimes = _msgTimes - [_currentmessagetime];
					[
						format[_msgFormat, _currentmessagetime],
						[safezoneX + safezoneW - 0.8,0.50],
						[safezoneY + safezoneH - 0.8,0.7],
						15,
						0.5
					] call BIS_fnc_dynamicText;
				};
			};
		"; }; _A3AHstring = _A3AHstring + "
		onEachFrame {};
	"; }; _A3AHstring = _A3AHstring + ""; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "[0,_coderun,'49'] call fn_log_debug;"; }; _A3AHstring = _A3AHstring + "
		if((isNull _display49)&&(isNull (findDisplay 24)))then{uiSleep 0.2;};
		if(rating player < 999999)then{player addRating 9999999;};
		if!(player getVariable["+str _variable1+",false])then{player setVariable["+str _variable1+",true,true];};
	};
	_bigInputArray =
	[
		[
			[_name,_uid,_AHKickOFF,_AHKickLog,_admins,_admin,_isNormal],
			{
				"+_AH_RunCheck+" = time;
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				_admins = _this select 4;
				_admin = _this select 5;
				_isNormal = _this select 6;
				
				_pid = profileNamespace getVariable ['ExilePlayerUID', _puid];
				if!(_pid isEqualTo _puid)then
				{
					_log = format['Player changed Steam Accounts! old PlayerUID: %1',_pid];
					[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
				};
				_ExilePlayerCnt = profileNamespace getVariable ['ExilePlayerCnt',0];
				if(_ExilePlayerCnt > 0)then
				{
					_log = format['Banned %1 times before..',_ExilePlayerCnt];
					if(_ExilePlayerCnt > 10)exitWith {
						[_name,_puid,'HLOG',toArray(_log)] call _AHKickLog;
					};
					[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
				};
				_pidi = profileNamespace getVariable ['ExilePlayerUIDI', _puid];
				if!(_pidi isEqualTo _puid)then
				{
					_log = format['Player changed Steam Accounts! old infiSTAR PlayerUID: %1',_pidi];
					[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
					profileNamespace setVariable ['ExilePlayerUIDI', _puid];
					saveprofileNamespace;
				};
				[_name,_puid,'CLIENT_PING',netId player,toArray(profileNameSteam),_pid,_pidi] call _AHKickLog;
				['"+_AHKickOFF+"',[_AHKickOFF] call fnc_CompilableString] call FN_infiSTAR_F;
				if(isNil'"+_AHKickOFF+"')exitWith
				{
					_log = 'KICK FUNCTION IS NIL!';
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
				if!((str _AHKickOFF) isEqualTo (str "+_AHKickOFF+"))exitWith
				{
					_log = 'KICK FUNCTION IS BROKEN!';
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
				['"+_AHKickLog+"',[_AHKickLog] call fnc_CompilableString] call FN_infiSTAR_F;
				if(isNil'"+_AHKickLog+"')exitWith
				{
					_log = 'KICKLOG FUNCTION IS NILLED!';
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
				if!((str _AHKickLog) isEqualTo (str "+_AHKickLog+"))exitWith
				{
					_log = 'KICKLOG FUNCTION IS BROKEN!';
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
				"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
				if(_isNormal)then {
					_badClasses = ['a3_m3editor','devcon'];
					_activatedAddons = [];
					{_activatedAddons pushBack (toLower _x)} forEach activatedAddons;
					{
						_addon = _x;
						{
							if(_addon find (toLower _x) != -1)then
							{
								_log = format['Bad Addon found: %1 (%2)',_addon,_x];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						} forEach _badClasses;
					} forEach _activatedAddons;
					
					_cfgPatches = configFile >> 'CfgPatches';
					for '_i' from 0 to (count _cfgPatches - 1) do
					{
						_patchClass = _cfgPatches select _i;
						if(isClass _patchClass && {(toLower configName _patchClass) in _badClasses})then
						{
							_log = format['Bad Addon found in CfgPatches: %1',configName _patchClass];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					};
				};
				"; }; _A3AHstring = _A3AHstring + "
				if!((str _puid) isEqualTo (str(getPlayerUID player)))exitWith
				{
					[_name,_puid,_AHKickOFF,_AHKickLog] spawn {
						_name = _this select 0;
						_puid = _this select 1;
						_AHKickOFF = _this select 2;
						_AHKickLog = _this select 3;
						_waittimer = diag_tickTime+120;
						waitUntil {((!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != '')||(diag_tickTime > _waittimer))};
						uiSleep 1;
						if!((str _puid) isEqualTo (str(getPlayerUID player)))then
						{
							_log = format['Server PUID not equal to player PUID (%1 != %2) (kicked)',_puid,getPlayerUID player];
							[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					};
				};
			}
		],
		[
			[_name,_uid,_AHKickOFF,_AHKickLog,_admin,_isNormal,_49code,_blacklistedAdminVariables,"+str _blacklistedVariables+"],
			{
				waituntil {!(isNull findDisplay 46)};
				scriptName ""<spawn> "";
				disableSerialization;
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				_admin = _this select 4;
				_isNormal = _this select 5;
				_escapefound = false;
				_startDCHECK = 0;
				_DCHECKrunning = false;
				"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
					_restartTime = "+str _RESTART_TIME_IN_M+";
					_msgTimes = "+str _SHOW_TIMER_IN_MIN+";
					_msgFormat = '<t size=''0.70'' color=''#DA1700'' align=''right''>RESTART IN %1 MINS</t>';
					_restarttimerTimer = 0;
				"; }; _A3AHstring = _A3AHstring + "
				_mapMenuLogged = false;
				
				_keyUpfnc = {
					_keyCode = _this select 1;
					_handle = false;
					if(_keyCode in (actionKeys 'TacticalView'))exitWith{systemChat format['KeyBind: %1 -> TacticalView is not allowed',keyName _keyCode];true};
					if(_keyCode in (actionKeys 'User3'))exitWith{if(!isNil'fnc_chat_send')then{if(isNull (findDisplay -1340))then{createdialog 'infiSTAR_CHAT';};};true};
					if(_keyCode in (actionKeys 'User4'))exitWith{player playMoveNow 'AmovPercMstpSnonWnonDnon_exerciseKata';true};
					if(_keyCode in (actionKeys 'User5'))exitWith{player playMoveNow 'AmovPercMstpSnonWnonDnon_exercisePushup';true};
					_handle
				};
				(finddisplay 46) displayAddEventHandler ['KeyUp',_keyUpfnc];
				_keyDownfnc = {
					_keyCode = _this select 1;
					_handle = false;
					if(_keyCode in (actionKeys 'TacticalView'))exitWith{systemChat format['KeyBind: %1 -> TacticalView is not allowed',keyName _keyCode];true};
					_handle
				};
				(finddisplay 46) displayAddEventHandler ['KeyDown',_keyDownfnc];
			"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
				_vct = 5;
				_vctd = diag_tickTime + 30;
				_vctoo = diag_tickTime + 30;
				_white = [
					'bis_fnc_modulemptypegroundsupportbase','bis_fnc_spawngroup','bis_fnc_moduleammo','bis_fnc_moduletracers','bis_fnc_spawnenemy','bis_fnc_createmenu',
					'avs_fnc_rearmturret','av8b_loadout_service','exileclient_system_trading_network_purchasevehicleresponse','rhs_fnc_sight_kobra'
				];
				
				{
					if(isNil _x)then
					{
						[_x,'no'] call FN_infiSTAR_F;
					};
				} forEach _white;
				_white append "+str _allRandomGenVars+";
				_blacklistedAdminVariables = _this select 7;
				_blacklistedVariables = _this select 8;
				_fnc_finddeeper =
				{
					params[['_name',''],['_puid',''],['_AHKickLog',{(findDisplay 46)closeDisplay 0;}],['_AHKickOFF',{(findDisplay 46)closeDisplay 0;}],['_var','']];
					if(_var isEqualTo '')exitWith{};
					_lvar = toLower _var;
					_bv = missionNamespace getVariable _var;
					if(!isNil '_bv')then
					{
						_strbv = toLower(str(_bv));
						
						{
							if(_lvar find _x != -1)then
							{
								_log = format['BadVariable in missionNamespace: [%1] found [%2] varcontent [%3]',_var,_x,_strbv];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							}
							else
							{
								if(_strbv find _x != -1)then
								{
									_log = format['BadVariableContent in missionNamespace: [%1] found [%2] varcontent [%3]',_var,_x,_strbv];
									[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
									[] call _AHKickOFF;
								};
							};
						} forEach "+str _tofindboth+";
						
						{
							if(_strbv find _x != -1)then
							{
								_log = format['BadVariableContent in missionNamespace: [%1] found [%2] varcontent [%3]',_var,_x,_strbv];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						} forEach "+str _tofindcontent+";
					};
				};
				_fnc_finddeeperObj =
				{
					params[['_name',''],['_puid',''],['_AHKickLog',{(findDisplay 46)closeDisplay 0;}],['_AHKickOFF',{(findDisplay 46)closeDisplay 0;}],['_var',''],['_obj',objNull]];
					if(_var isEqualTo '')exitWith{};
					if(isNull _obj)exitWith{};
					_lvar = toLower _var;
					_bv = _obj getVariable _var;
					if(!isNil '_bv')then
					{
						_strbv = toLower(str(_bv));
						
						{
							if(_lvar find _x != -1)then
							{
								_log = format['BadVariable on object: [%1] found [%2] in [%3] varcontent [%4]',_obj,_var,_x,_strbv];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						} forEach "+str _findObjectVar+";
						
						{
							if(_strbv find _x != -1)then
							{
								_log = format['BadVariableContent on object: [%1] found [%2] in [%3] varcontent [%4]',_obj,_var,_x,_strbv];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						} forEach "+str _findObjectVarContent+";
					};
				};
				_white2 = [];
				_posbuildings = [worldSize/2,worldSize/2];
				_buildings = _posbuildings nearObjects ['Building',worldSize];
				"; if(_checkPopTabIncrease || _checkRespectIncrease)then{ _A3AHstring = _A3AHstring + "
					_checkchange = 0;
				"; }; _A3AHstring = _A3AHstring + "
				"; if(_checkPopTabIncrease)then{ _A3AHstring = _A3AHstring + "
					_oldExileClientPlayerMoney = ExileClientPlayerMoney;
					_firstchancePlayerMoney = true;
				"; }; _A3AHstring = _A3AHstring + "
				"; if(_checkRespectIncrease)then{ _A3AHstring = _A3AHstring + "
					_oldExileClientPlayerScore = ExileClientPlayerScore;
					_firstchancePlayerScore = true;
				"; }; _A3AHstring = _A3AHstring + "
			"; }; _A3AHstring = _A3AHstring + "	
				while{true}do{"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "_coderun = diag_tickTime;"; }; _A3AHstring = _A3AHstring + "call (_this select 6);};
			}
		]
	];
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
	"; if((_wall_look)||(_wall_glitch_object)||(_wall_glitch_vehicle)||(_forceWalk_near_enemyBase))then{ _A3AHstring = _A3AHstring + "
	_glitchcode = {
		if((alive player)&&(player isEqualTo (vehicle player)))then
		{
			"; if(_wall_look)then{ _A3AHstring = _A3AHstring + "
			_intersectsWith = [];
			_eyeDir = eyedirection player;
			_curWep = currentweapon player;
			_wepDir = player weapondirection _curWep;
			_vectorDiff = _eyeDir vectorDiff _wepDir;
			if((inputAction 'EvasiveLeft' > 0)||(inputAction 'EvasiveRight' > 0)||(_eyeDir select 2 > 0.5)||((abs(_vectorDiff select 0) > 0.55)&&!(_curWep isEqualTo '')))then
			{
				_eyePos = eyepos player;
				_dir_weapon_r = (((_wepDir) select 0) atan2 ((_wepDir) select 1))+45;
				_dir_weapon_l = (((_wepDir) select 0) atan2 ((_wepDir) select 1))-25;
				
				_intersectsWith = lineintersectswith [[(_eyePos select 0) + (_eyeDir select 0)*_dis_head,(_eyePos select 1) + (_eyeDir select 1)*_dis_head,(_eyePos select 2) + (_eyeDir select 2)*_dis_head], _eyePos, player];
				_intersectsWith append lineintersectswith [[(_eyePos select 0) + _dis_weapon_r*sin _dir_weapon_r,(_eyePos select 1) + _dis_weapon_r*cos _dir_weapon_r,(_eyePos select 2)], _eyePos, player];
				_intersectsWith append lineintersectswith [[(_eyePos select 0) + _dis_weapon_l*sin _dir_weapon_l,(_eyePos select 1) + _dis_weapon_l*cos _dir_weapon_l,(_eyePos select 2)], _eyePos, player];
				
				_plrPosVisual = ATLtoASL (player modelToWorldVisual [0,0,0]);
				_intersectsWith append lineIntersectsWith [_eyePos, _plrPosVisual];
			};
			if(_intersectsWith isEqualTo [])then
			{
				if(_faded)then{_faded=false;TitleText ['','PLAIN DOWN'];};
			}
			else
			{
				{
					if(_x isKindOf 'Exile_Construction_Abstract_Static')exitWith
					{
						_faded = true;
						player switchMove '';
						if(call _fn_check_allowed_build)then
						{
							TitleText ['!!!\nDO NOT LOOK THROUGH WALLS\n!!!\n\n\n\nAntiHack by infiSTAR.de','BLACK FADED'];
							if(time > _fadeTimer)then
							{
								_fadeTimer = time + 15;
								_log = format['WALL LOOK CHECK (looked through %1) - @%2 %3',typeOf _x,mapGridPosition _x,getPosATL _x];
								[_name,_puid,'SLOG_GLITCH',toArray(_log)] call _AHKickLog;
							};
						};
					};
				} forEach _intersectsWith;
			};
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_wall_glitch_object)then{ _A3AHstring = _A3AHstring + "
			if(call _fn_check_allowed_build)then
			{
				_posASL = getPosASL player;
				_lineIntersectsObjs = lineIntersectsObjs [_posASL, _posASL];
				_eyePos = eyePos player;
				_lineIntersectsObjs append lineIntersectsObjs [_eyePos, _eyePos];
				_lineIntersectsObjs append lineIntersectsObjs [getPos player, getPos player vectorAdd (player selectionPosition 'legs')];
				{
					if(_x isKindOf 'Exile_Construction_Abstract_Static')then
					{
						_type = typeOf _x;
						_floor = true;
						if(call _fn_check_object)then
						{
							if(_floor)then
							{
								cutText ['Do not glitch through floors!', 'PLAIN'];
								if(time > _floorGlitchReported)then
								{
									_floorGlitchReported = time + 10;
									_log = format['FLOOR GLITCH ATTEMPT (attempted breach of %1) - @%2 %3',_type,mapGridPosition _x,getPosATL _x];
									[_name,_puid,'SLOG_GLITCH',toArray(_log)] call _AHKickLog;
								};
								call _fn_push_back;
							}
							else
							{
								cutText ['Do not glitch through walls!', 'PLAIN'];
								if(time > _wallGlitchReported)then
								{
									_wallGlitchReported = time + 10;
									_log = format['WALL GLITCH ATTEMPT (attempted breach of %1) - @%2 %3',_type,mapGridPosition _x,getPosATL _x];
									[_name,_puid,'SLOG_GLITCH',toArray(_log)] call _AHKickLog;
								};
								player switchMove '';
								call _fn_push_back;
							};
						};
					};
				} forEach _lineIntersectsObjs;
			"; if(_forceWalk_near_enemyBase)then{ _A3AHstring = _A3AHstring + "
				if(!isNull player)then
				{
					_forcewalk = false;
					{if(count (player nearObjects [_x,5]) > 0)exitWith{_forcewalk = true;};} forEach _checktheseplease;
					player forceWalk _forcewalk;
				};
			}
			else
			{
				player forceWalk false;
				uiSleep 0.5;
			"; }; _A3AHstring = _A3AHstring + "
			};
			"; }; _A3AHstring = _A3AHstring + "
		}
		else
		{
			"; if(_wall_glitch_vehicle)then{ _A3AHstring = _A3AHstring + "
			(vehicle player) removeAllEventHandlers 'GetOut';
			(vehicle player) addEventHandler ['GetOut', '
				_vehicle = _this select 0;
				_position = _this select 1;
				_unit = _this select 2;
				if (_unit == player) then {
					_visualPos = getPosATLVisual _vehicle;
					_visualPos set[2, (_visualPos select 2) + 1];
					_dirTo = [_vehicle, player] call BIS_fnc_dirTo;
					_secondPos = [_visualPos, (_vehicle distance2D player) + 1, _dirTo] call BIS_fnc_relPos;
					_good = true;
					{
						if(_x isKindOf ''Exile_Construction_Abstract_Static'')exitWith
						{
							player setPos (getPos _vehicle);
							player moveInAny _vehicle;
							_good = false;
							if(call '+str _fn_check_allowed_build+')then
							{
								_log = format[''WALL GLITCH CHECK (GetOut vehicle) - @%1 %2'',mapGridPosition _visualPos,_visualPos];
								['+str _name+','+str _puid+',''SLOG_GLITCH'',toArray(_log)] call '+str _AHKickLog+';
							};
						};
					} forEach lineintersectsobjs[ATLToASL _visualPos, ATLToASL _secondPos, player, _vehicle, true, 2];
					if(_good)then{_vehicle removeAllEventHandlers ''GetOut'';};
				};
			'];
		"; }; _A3AHstring = _A3AHstring + "
		};"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "[1,_coderun,'glitch'] call fn_log_debug;"; }; _A3AHstring = _A3AHstring + "
		uiSleep .15;
	};
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
	_atLoopCode = {
		_curVehicle = vehicle player;
		_type = typeOf _curVehicle;
		_curnetId = netId _curVehicle;
		if(isTouchingGround player)then{_touchedground = true;};
		if(_curnetId isEqualTo '0:0')then
		{
			_log = format['ANTI-TP FOUND LocalVehicle: %1 with netId 0:0 @%2',_type,getPosATL _curVehicle];
			deleteVehicle _curVehicle;
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		_AHpos = uiNameSpace getVariable['"+_AHpos+"',[]];
		if(str _AHpos isEqualTo '[]')then
		{
			if((!isNull player)&&{alive player}&&{((typeOf player) isEqualTo 'Exile_Unit_Player')})then
			{
				_curpos = getPosATL (vehicle player);
				_distance = _lastpos distance2D _curpos;
				if(_distance > 1)then
				{
					if(_firstpos isEqualTo [])exitWith{_firstpos = _curpos;};
					if(_firstpos distance2D _curpos < 10)exitWith{};
					
					_exitHere = false;
					_ropeAttachedToObj = ropeAttachedTo _curVehicle;
					if(!isNull _ropeAttachedToObj)then
					{
						_driverRopeAttachedTo = driver _ropeAttachedToObj;
						if(isNull _driverRopeAttachedTo)then
						{
							{ropeDestroy _x;} forEach (ropes _ropeAttachedToObj);
							{ropeDestroy _x;} forEach (ropes _curVehicle);
						}
						else
						{
							if((getPlayerUID _driverRopeAttachedTo) isEqualTo '')then
							{
								_chose = 'SLOG';
								if(local _driver)then
								{
									deleteVehicle _driver;
									_chose = 'HLOG_SKICK';
								};
								_log = format[
									'TP with AI as driver..  Moved %1m (from %2 to %3) in %4 slingloaded to AI.. - Player FPS: %5.',
									round _distance,_lastpos,_curpos,_type,diag_fps
								];
								[_name,_puid,_chose,toArray(_log)] call _AHKickLog;
								{ropeDestroy _x;} forEach (ropes _ropeAttachedToObj);
								{ropeDestroy _x;} forEach (ropes _curVehicle);
							}
							else
							{
								_exitHere = true;
							};
						};
					};
					if(_exitHere)exitWith{};
					
					_speed = round(abs(speed player));
					_difftime = diag_tickTime - _lasttime;
					_speedcalc = (_distance / _difftime)*3.6;
					_speedcalc = _speedcalc max _speed;
					
					_topSpeedcalcOLD = _topSpeedcalc;
					_topSpeed = (getNumber(configFile >> 'CfgVehicles' >> _type >> 'maxSpeed')) max 20;
					_topSpeedcalc = _topSpeed * 1.8;
					
					if(isNull _oldVehicle)then{_topSpeedcalcOLD = _topSpeedcalc;};
					if(_speedcalc > _topSpeedcalc)then
					{
						if(_speedcalc > _topSpeedcalcOLD)then
						{
							_inTrader = call _fn_inTradeZone;
							if(!_inTrader)then
							{
								_driver = driver _curVehicle;
								if(player isEqualTo _driver)then
								{
									if(!_touchedground)then{
									"; if((getNumber(configFile >> 'CfgSettings' >> 'BambiSettings' >> 'parachuteSpawning')) isEqualTo 1)then{ _A3AHstring = _A3AHstring + "
									if((_speedcalc < 301)&&(!isTouchingGround player)&&(_curVehicle isKindOf 'ParachuteBase'))exitWith{};
									"; }; _A3AHstring = _A3AHstring + "
									"; if((getNumber(configFile >> 'CfgSettings' >> 'BambiSettings' >> 'haloJump')) isEqualTo 1)then{ _A3AHstring = _A3AHstring + "
									if((_speedcalc < 55)&&(!isTouchingGround player)&&(player isEqualTo _curVehicle))exitWith{};
									"; }; _A3AHstring = _A3AHstring + "
									};
									if((_speedcalc < 100)&&(_type isEqualTo 'Exile_Bike_MountainBike'))exitWith{};
									
									if(_distance > 30)then
									{
										_log = format[
											'POTENTIAL-TP-REVERTED#1: Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8. Alive for %9s - %10',
											round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speedcalc,diag_fps,diag_tickTime - _livestarted,if(_inTrader)then{'In Trader!'}else{''}	
										];
										[_name,_puid,'ANTI_TP',toArray(_log)] call _AHKickLog;
									};
									
									_curvel = velocity _curVehicle;
									_curVehicle setPosATL _lastpos;
									_curVehicle setVelocity _curvel;
								}
								else
								{
									if!(_oldVehicle isEqualTo _curVehicle)then
									{
										if(_distance > 30)then
										{
											_log = format[
												'POTENTIAL-TP-REVERTED#2: Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8. %9',
												round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speedcalc,diag_fps,if(_inTrader)then{'In Trader!'}else{''}
											];
											[_name,_puid,'ANTI_TP',toArray(_log)] call _AHKickLog;
											player setPosATL _lastpos;
										};
									};
									if(isNull _driver)then
									{
										if(local _curVehicle)then
										{
											_curvel = velocity _curVehicle;
											_curVehicle setPosATL _lastpos;
											_curVehicle setVelocity _curvel;
										};
									}
									else
									{
										if!(_driver in allPlayers)then
										{
											if(local _driver)then{deleteVehicle _driver;};
											if(!alive _driver)exitWith{};
											
											_log = format[
												'TP with AI as driver..  Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',
												round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speedcalc,diag_fps
											];
											[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
											[] call _AHKickOFF;
										};
									};
								};
							};
						};
					};
				};
				_lastpos = getPosATL (vehicle player);
			}
			else
			{
				uiNameSpace setVariable['"+_AHpos+"',[]];
				_curpos = getPosATL (vehicle player);
				_lastpos = _curpos;
				_firstpos = [];
			};
		}
		else
		{
			if(typename _AHpos isEqualTo 'ARRAY')then
			{
				(vehicle player) SetVelocity [0,0,0];if(player isEqualTo vehicle player)then{player switchMove '';};
				_log = 'Teleported by Admin';
				[_name,_puid,'DOTP',toArray(_log),_AHpos,player,_lastpos,_curpos] call _AHKickLog;
				(vehicle player) SetVelocity [0,0,0];if(player isEqualTo vehicle player)then{player switchMove '';};
				
				uiNameSpace setVariable['"+_AHpos+"',[]];
				_curpos = getPosATL (vehicle player);
				_lastpos = _curpos;
				_firstpos = [];
			}
			else
			{
				_log = format['Admin Teleport Variable highjacked! %1 (%2)',_AHpos,typename _AHpos];
				[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
		};
		_lasttime = diag_tickTime;
		_oldVehicle = _curVehicle;"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "[2,_coderun,'ATcode'] call fn_log_debug;"; }; _A3AHstring = _A3AHstring + "
		uiSleep 0.3;
	};
	"; }; _A3AHstring = _A3AHstring + "
	_iddchecks = {
		if(diag_tickTime - _lastEmpty > 45)then
		{
			_lastEmpty = diag_tickTime;
			_checked = [];
		};
		if(_wasclosed)then
		{
			closeDialog 0;closeDialog 0;closeDialog 0;
			_wasclosed = false;
		};
		
		if(!isNull ((findDisplay 46) displayCtrl -2))then
		{
			_log = 'MenuBasedHack :: 46 :: -2';
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		
		{
			_display = findDisplay _x;
			if(!isNull _display)then
			{
				_txts = _display call _fn_get_texts;
				_log = format['MenuBasedHack: %1 CTRLS: %2',_x,_txts];
				[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
		} forEach [-1338,-1337,17,19,30,32,45,56,59,62,64,69,71,110,125,132,155,156,165,166,167,312,1320,1321,2727,2928,2929,3030,316000,9899,0110];
		
		{
			_control = _x;
			_ctrlTxt = ctrlText _control;
			_lowerctrlTxt = toLower _ctrlTxt;
			{
				if(_lowerctrlTxt find _x > -1)then
				{
					_log = format['BadCtrlText: %1 on %2 %3 - %4',_x,_display,_control,_ctrlTxt];
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				};
			} forEach _verybadStrings;
		} forEach [((findDisplay 49) displayCtrl 2),((findDisplay 49) displayCtrl 103)];
		
		{
			_cc1 = uiNamespace getVariable _x;
			if(!isNil '_cc1')then
			{
				_formatedcc1 = format['%1',_cc1];
				if(_formatedcc1 != '<null>')then
				{
					if(_formatedcc1 != 'No display')then
					{
						_log = format['Hacked: %1 - %2',_x,_cc1];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					}
					else
					{
						uiNamespace setVariable[_x,nil];
						_log = format['Hacked: %1 - %2',_x,_cc1];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				};
			};
		} forEach ['RscDisplayRemoteMissions','RscDisplayDebugPublic','RscDisplayMovieInterrupt','RscDisplayArsenal'];
		
		if(!isNull (uiNamespace getVariable['BIS_fnc_camera_display',displaynull]))then
		{
			_log = format['Hacked: BIS_fnc_camera_display -> %1',(uiNamespace getVariable['BIS_fnc_camera_display',displaynull])];
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		
		_c101txt = ctrlText 101;
		if!(_c101txt in ['','ITEM','\A3\Data_F_Mark\Logos\arma3_Mark_logo_ca.paa','\A3\Data_F_Kart\Logos\arma3_karts_logo_ca.paa'])then
		{
			_log = format['ctrlText 101: %1',_c101txt];
			[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
			(findDisplay 46)closeDisplay 0;
		};
		
		{
			if(!isNull _x)then
			{
				_display = _x;
				_strx = str _x;
				if(_strx in _badIDDsToKick)then
				{
					_txts = _display call _fn_get_texts;
					_log = format['BadDisplayID: %1 CTRLS: %2',_display,_txts];
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				}
				else
				{
					if(_strx in _badIDDsToClose)then
					{
						systemChat format['<infiSTAR.de> %1 has been closed.',_strx];
						_display closeDisplay 0;
						closeDialog 0;closeDialog 0;closeDialog 0;
						_wasclosed = true;
					}
					else
					{
						"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
						if!(_strx in _allowedIDDs)then
						{
							_index = _announceDisplayIddOnce pushBackUnique _strx;
							if(_index > -1)then
							{
								_txts = _display call _fn_get_texts;
								_log = format['Not Allowed Displays: %1 CTRLS: %2   (closed)',_display,_txts];
								[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
							};
							_display closeDisplay 0;
							closeDialog 0;closeDialog 0;closeDialog 0;
						};
						"; }; _A3AHstring = _A3AHstring + "
					};
				};
				if(!isNull _display)then
				{
					{
						if(!isNull (_display displayCtrl _x))then
						{
							_log = format['MenuBasedHack :: %1 :: %2',_display,_x];
							[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					} forEach [24010,16030,13163,989187,99991,16100];
					
					{
						_control = _x;
						_checkifIn = format['%1%2',_display,_control];
						_index = _checked pushBackUnique _checkifIn;
						if(_index > -1)then
						{
							_controltype = ctrlType _control;
							if(_controltype isEqualTo 5)then
							{
								_size = lbSize _control;
								if(_size > 0)then
								{
									for '_i' from 0 to (_size-1) do
									{
										_lbtxt = _control lbText _i;
										_lowerlbtxt = toLower _lbtxt;
										{
											if(_lowerlbtxt find _x > -1)then
											{
												_log = format['BadlbText: %1 FOUND [%2] ON %3 %4',_lbtxt,_x,_display,_control];
												[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
												[] call _AHKickOFF;
											};
										} forEach _verybadStrings;
									};
								};
							}
							else
							{
								if(_controltype isEqualTo 12)then
								{
									_curTV = tvCurSel _control;
									_tvtxt = _control tvText _curTV;
									_lowertvtxt = toLower _tvtxt;
									{
										if(_lowertvtxt find _x > -1)then
										{
											_log = format['BadtvText: %1 FOUND [%2] ON %3 %4',_tvtxt,_x,_display,_control];
											[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
											[] call _AHKickOFF;
										};
									} forEach _verybadStrings;
								}
								else
								{
									if!(_controltype in [3,4,8,9,15,42,81,101,102])then
									{
										_ctrlTxt = ctrlText _control;
										_lowerctrlTxt = toLower _ctrlTxt;
										{
											if(_lowerctrlTxt find _x > -1)then
											{
												_log = format['BadCtrlText: %1 FOUND [%2] ON %3 %4',_ctrlTxt,_x,_display,_control];
												[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
												[] call _AHKickOFF;
											};
										} forEach _verybadStrings;
									};
								};
							};
						};
					} forEach (allControls _display);
				};
			};
		} forEach allDisplays;
		"; if(_check_Notifications)then{ _A3AHstring = _A3AHstring + "
		if(!isNil 'BIS_fnc_showNotification_queue')then
		{
			if(typeName BIS_fnc_showNotification_queue isEqualTo 'ARRAY')then
			{
				{
					if(!isNil'_x')then
					{
						if(typeName _x isEqualTo 'ARRAY')then
						{
							{
								_array = nil;
								_array = _x select 9;
								if(!isNil'_array')then
								{
									{
										if!(_x isEqualTo '')then
										{
											_log = format['Hacked: showNotification - %1',_x];
											[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
											BIS_fnc_showNotification_queue = [];
										};
									} forEach _array;
								};
							} forEach _x;
						};
					};
				} forEach BIS_fnc_showNotification_queue;
			}
			else
			{
				_log = format['Hacked: showNotification type changed to %1',typeName BIS_fnc_showNotification_queue,BIS_fnc_showNotification_queue];
				[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
		};
		"; }; _A3AHstring = _A3AHstring + "
		_uiNamespace_dynamicText = uiNamespace getVariable 'BIS_dynamicText';
		if(!isNil '_uiNamespace_dynamicText')then
		{
			_allCtrls = allControls _uiNamespace_dynamicText;
			_whiteListed = ['','Debug Mode Enabled'];
			{if(getPlayerUID _x != '')then{_whiteListed pushBack (name _x);};} forEach playableUnits;
			{
				_ctrl = _x;
				_txt = ctrlText _ctrl;
				if(_txt != _lastText)then
				{
					if!(_txt in _whiteListed)then
					{
						_lastText = _txt;
						_ltxt = toLower _txt;
						{
							if(_ltxt find _x != -1)then
							{
								_log = format['BadText on %1: %2 - %3',_ctrl,_x,_txt];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								(findDisplay 46)closeDisplay 0;
							};
						} forEach _verybadStrings;
					};
				};
			} forEach _allCtrls;
		};
		
		"; if(_CMC)then{ _A3AHstring = _A3AHstring + "
		_cmdm = commandingMenu;
		if(_cmdm != '')then
		{
			if(_cmdm in ['#User:BIS_fnc_addCommMenuItem_menu','#User:BIS_Menu_GroupCommunication'])then
			{
				showCommandingMenu '';
			}
			else
			{
				if(((toLower _cmdm) find _find1) != -1)then
				{
					_log = format['BadCommandingMenu: %1',_cmdm];
					[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
			};
			"; if(_KCM)then{ _A3AHstring = _A3AHstring + "
				showCommandingMenu '';
			"; }; _A3AHstring = _A3AHstring + "
		};
		"; }else{ _A3AHstring = _A3AHstring + "
		"; if(_KCM)then{ _A3AHstring = _A3AHstring + "
			showCommandingMenu '';
		"; }; _A3AHstring = _A3AHstring + "
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_CMM)then{ _A3AHstring = _A3AHstring + "
		_display12 = findDisplay 12;
		if(!isNull _display12)then
		{
			_selected = lbSelection (_display12 displayCtrl 1001);
			if(!(_selected isEqualTo [2])&&!(_selected isEqualTo [3]))then
			{
				_control1 = _display12 displayCtrl 1002;
				_size = lbSize _control1;
				if(_size > 2)then
				{
					_texts = [];
					for '_i' from 0 to (_size-1) do
					{
						_lbtxt = _control1 lbText _i;
						_texts pushBack _lbtxt;
					};
					_log = format['Map Sub-Menu %1 size has been changed to %2. Found: %3',_selected,_size,_texts];
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
					lbClear _control1;
				};
			};
			_control2 = _display12 displayCtrl 1001;
			_lsize = lbSize _control2;
			if(_lsize > "+str _maxMapMenuEntries+")then
			{
				if(!_mapMenuLogged)then
				{
					_mapMenuLogged = true;
					
					_texts = [];
					for '_i' from 0 to (_lsize-1) do
					{
						_lbtxt = _control2 lbText _i;
						_texts pushBack _lbtxt;
					};
					_log = format['Map Menu has been changed %1 entries found - Texts: %2',_lsize,_texts];
					[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
				};
				for '_i' from ("+str _maxMapMenuEntries+")+1 to _lsize do
				{
					_control2 lbDelete _i;
				};
			};
		};
		"; }; _A3AHstring = _A3AHstring + "
		
		if(isNull player)then{(findDisplay 46)closeDisplay 0;};
		_type = typeOf player;
		if!(_type isEqualTo 'Exile_Unit_Player')then
		{
			if((currentWeapon player != '')||(player != vehicle player))then
			{
				if((getPos player) distance2D _start_player_pos > 500)then
				{
					_log = format['Player is BADTYPE (invisible hack?): %1 - %2 %3 @%4 %5(KICKED)',_type,player,vehicle player,getPos player,mapGridPosition player];
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
			};
		};
		"; if(_URC)then{ _A3AHstring = _A3AHstring + "
			_unit = player;
			if((!isNull _unit)&&{alive _unit})then
			{
				_curecoil = unitRecoilCoefficient _unit;
				if(_curecoil != 1)then
				{
					_log = format['BadRecoil %1 | %2 %3 %4',_curecoil,typeOf _unit,typeOf (vehicle _unit),currentWeapon _unit];						
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
			};
		"; }; _A3AHstring = _A3AHstring + "
		_veh = vehicle player;
		if!(player isEqualTo _veh)then
		{
			_ropeAttachedObjects = ropeAttachedObjects _veh;
			if!(_ropeAttachedObjects isEqualTo [])then
			{
				if(!isNull _x)then
				{
					if(locked _x isEqualTo 2)exitWith
					{
						{ropeDestroy _x;} forEach (ropes _veh);
						{ropeDestroy _x;} forEach (ropes _x);
						
						_log = 'You can not SlingLoad / Rope Attach a locked vehicle!';
						systemChat ('<infiSTAR.de> '+_log);
						cutText [_log, 'PLAIN'];
						
						_log = format['Slingloaded / Rope Attached a locked vehicle: %1',_x];
						[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
					};
					if(!ropeAttachEnabled _x)exitWith
					{
						{ropeDestroy _x;} forEach (ropes _veh);
						{ropeDestroy _x;} forEach (ropes _x);
						
						_log = 'You can not SlingLoad / Rope Attach this vehicle!';
						systemChat ('<infiSTAR.de> '+_log);
						cutText [_log, 'PLAIN'];
						
						_log = format['Slingloaded / Rope Attached a vehicle that has ropeAttach disabled!: %1',_x];
						[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
					};
					"; if(_slingload_check)then{ _A3AHstring = _A3AHstring + "
					if!(crew _x isEqualTo [])exitWith
					{
						{ropeDestroy _x;} forEach (ropes _veh);
						{ropeDestroy _x;} forEach (ropes _x);
						
						_log = 'You can not SlingLoad / Rope Attach a vehicle with a crew!';
						systemChat ('<infiSTAR.de> '+_log);
						cutText [_log, 'PLAIN'];
					};
					"; }; _A3AHstring = _A3AHstring + "
				};
			};
			"; if((_LVC)&&(!_UAT))then{ _A3AHstring = _A3AHstring + "
				if(netId _veh isEqualTo '0:0')then
				{
					_type = typeOf _veh;
					_log = format['LocalVehicle: %1 with netId 0:0 @%2',_type,getPosATL _veh];
					[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
					deleteVehicle _veh;
				};
			"; }; _A3AHstring = _A3AHstring + "
		};
		
		{
			_obj = agent _x;
			if(local _obj)then
			{
				_weapons = weapons _obj;
				_magazines = magazines _obj;
				_items = items _obj;
				if(count _weapons > 0 || count _magazines > 0 || count _items > 0)then
				{
					deleteVehicle _obj;
					_log = format['Loadout Bot found @%1 %2 with [%3,%4,%5]',position _obj,mapGridPosition _obj,_weapons,_magazines,_items];
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				};
			};
		} forEach agents;
		"; if(_attach_to_check)then{ _A3AHstring = _A3AHstring + "
		if(diag_tickTime > _checkedclose)then
		{
			_checkedclose = diag_tickTime + 10;
			_veh = vehicle player;
			_closeveh = [_veh];
			_closeveh append (_veh nearEntities ['AllVehicles',100]);
			{
				if(!isNull _x)then
				{
					_xobj = _x;
					if(!isNull _xobj)then
					{
						_attcheXdobjects = attachedObjects _x;
						if!(_attcheXdobjects isEqualTo [])then
						{
							_cntQd = {(toLower (typeOf _x)) find 'quad' != -1} count _attcheXdobjects;
							if(_cntQd > 5)then
							{
								detach _xobj;
								{detach _x;} forEach _attcheXdobjects;
								if(_xobj isEqualTo _veh)then
								{
									_log = format['x attached to vehicle player: %1 - %2   @%3 %4',typeOf _xobj,_attcheXdobjects,position player,mapGridPosition player];
									[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
									[] call _AHKickOFF;
								}
								else
								{
									_log = format['Attached Objects found: %1 - %2    @%3 %4',typeOf _xobj,_attcheXdobjects,position _xobj,mapGridPosition _xobj];
									[_name,_puid,'HLOG',toArray(_log)] call _AHKickLog;
								};
							};
							if(_veh in _attcheXdobjects)then
							{
								detach _veh;
								_log = format['vehicle player attached to x: %1 - %2   @%3 %4',typeOf _xobj,_attcheXdobjects,position player,mapGridPosition player];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						};
					};
				};
			} forEach _closeveh;
		};
		"; }; _A3AHstring = _A3AHstring + "
		if((groupIconsVisible isEqualTo [true,false])||(groupIconsVisible isEqualTo [false,true]))then
		{
			_log = format['ESP/MAP-HACK (groupIcons): %1',groupIconsVisible];
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "[3,_coderun,'idd checks'] call fn_log_debug;"; }; _A3AHstring = _A3AHstring + "
		uiSleep .75;
	};
	_invchecks = {
		if!((str _randvar3) isEqualTo (str ('test'+str _random)))then
		{
			_log = format['_randvar3 has been changed to %1',_randvar3];
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		"; if(_CAP)then{ _A3AHstring = _A3AHstring + "
			if(player isEqualTo _object)then[{_acnt = _acnt + 1},{_object = player;_acnt = 0}];
			_actionid = player addAction ['', '', [], -5, false, true, '', 'false'];player removeAction _actionid;
			if(_actionid > _acnt + 1)then
			{
				removeAllActions player;removeAllActions (vehicle player);
				_acnt = _actionid;
			};
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_UFI||_UIW)then{ _A3AHstring = _A3AHstring + "
			_inventory = [];
			{_inventory pushBack _x;} forEach (assignedItems player);
			{_inventory pushBack _x;} forEach (magazines player);
			{_inventory pushBack _x;} forEach (weapons player);
			{_inventory pushBack _x;} forEach (primaryWeaponItems player);
			{_inventory pushBack _x;} forEach (secondaryWeaponItems player);
			_inventory pushBack (primaryWeapon player);
			_inventory pushBack (secondaryWeapon player);
			_inventory pushBack (uniform player);
			_inventory pushBack (vest player);
			_inventory pushBack (backpack player);
			_inventory pushBack (headgear player);
			_inventory pushBack (goggles player);
			if!(_inventory isEqualTo [])then
			{
				{
					if(_x != '')then
					{
						if((_x in "+str _ForbiddenItems+") || (("+str _UIW+") && !(_x in "+str _ItemWhiteList+")))then
						{
							player removeItem _x;
							player removeWeapon _x;
							player removeMagazine _x;
							if((uniform player) == _x)then{removeUniform player;};
							if((vest player) == _x)then{removeVest player;};
							if((backpack player) == _x)then{removeBackpack player;};
							if((headgear player) == _x)then{removeHeadgear player;};
							if((goggles player) == _x)then{removeGoggles player;};
							player removePrimaryWeaponItem _x;
							player removeSecondaryWeaponItem _x;
							player unlinkItem _x;
							_log = format['BadItem: %1 (might have been from an admin!)',_x];
							[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					};
				} forEach _inventory;
			};
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_checkHiddenObjects)then{ _A3AHstring = _A3AHstring + "
		_pos = getPos player;
		_objects = nearestObjects [_pos, ['Exile_Construction_Abstract_Static','AbstractConstruction','Exile_Construction_Flag_Static'], 250];
		{
			if(isObjectHidden _x)then
			{
				_log = format['Invisible OBJECT: %1 @%2 %3',typeOf _x,getPos _x,mapGridPosition _x];
				[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
		} forEach _objects;
		"; }; _A3AHstring = _A3AHstring + "
		"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "[4,_coderun,'inventory checks'] call fn_log_debug;"; }; _A3AHstring = _A3AHstring + "
		uiSleep 5;
	};
	
	"; if((_wall_look)||(_wall_glitch_object)||(_wall_glitch_vehicle)||(_forceWalk_near_enemyBase))then{ _A3AHstring = _A3AHstring + "
	_bigInputArray pushBack [
		[_name,_uid,_AHKickOFF,_AHKickLog,_glitchcode],
		{
			_name = _this select 0;
			_puid = _this select 1;
			_AHKickOFF = _this select 2;
			_AHKickLog = _this select 3;
			
			_fn_check_allowed_build = {
				_flags = player nearObjects ['Exile_Construction_Flag_Static', 50];
				if(_flags isEqualTo [])exitWith{false};
				
				_val = true;
				{
					_radius = _x getVariable['ExileTerritorySize', -1];
					if((player distance2D _x) < _radius)then
					{
						_buildRights = _x getVariable['ExileTerritoryBuildRights', []];
						{
							if((getPlayerUID _x) in _buildRights)exitWith
							{
								_val = false;
							};
						} forEach (units(group player));
					};
					if(!_val)exitWith{};
				} forEach _flags;
				_val
			};
		"; if(_wall_look)then{ _A3AHstring = _A3AHstring + "
			_faded = false;
			_fadeTimer = time;
			_dis_head = 0.20;
			_dis_weapon_l = 0.20;
			_dis_weapon_r = 0.30;
			_dir_weapon_r = 0;
			_dir_weapon_l = 0;
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_wall_glitch_object)then{ _A3AHstring = _A3AHstring + "
			_floorGlitchReported = time;
			_wallGlitchReported = time;
			_fn_push_back = {
				_vel = velocity player;
				_dir = getDirVisual player;
				_speed = -15;
				player setVelocity [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					-1
				];
			};
			_fn_check_object = {
				if(_type isEqualTo 'Exile_Construction_WoodFloor_Static')exitWith{true};
				if(_type isEqualTo 'Exile_Construction_WoodFloor_Reinforced_Static')exitWith{true};
				
				_floor = false;
				if(_type isEqualTo 'Exile_Construction_WoodWall_Static')exitWith{true};
				if(_type isEqualTo 'Exile_Construction_WoodWall_Reinforced_Static')exitWith{true};
				if(_type isEqualTo 'Exile_Construction_WoodWallHalf_Static')exitWith{true};
				if(_type isEqualTo 'Exile_Construction_WoodWallHalf_Reinforced_Static')exitWith{true};
				
				if(_type isEqualTo 'Exile_Construction_WoodWindow_Static')exitWith{true};
				if(_type isEqualTo 'Exile_Construction_WoodWindow_Reinforced_Static')exitWith{true};
				
				if((_type isEqualTo 'Exile_Construction_WoodDoor_Static')&&(_x animationPhase 'DoorRotation' isEqualTo 0))exitWith{true};
				if((_type isEqualTo 'Exile_Construction_WoodDoor_Reinforced_Static')&&(_x animationPhase 'DoorRotation' isEqualTo 0))exitWith{true};
				
				if((_type isEqualTo 'Exile_Construction_WoodGate_Static')&&(_x animationPhase 'DoorRotationLeft' isEqualTo 0))exitWith{true};
				if((_type isEqualTo 'Exile_Construction_WoodGate_Reinforced_Static')&&(_x animationPhase 'DoorRotationLeft' isEqualTo 0))exitWith{true};
				false
			};
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_forceWalk_near_enemyBase)then{ _A3AHstring = _A3AHstring + "
			_checktheseplease =
			[
				'Exile_Construction_WoodFloor_Static','Exile_Construction_WoodFloor_Reinforced_Static','Exile_Construction_WoodWall_Static',
				'Exile_Construction_WoodWall_Reinforced_Static','Exile_Construction_WoodWallHalf_Static','Exile_Construction_WoodWallHalf_Reinforced_Static',
				'Exile_Construction_WoodWindow_Static','Exile_Construction_WoodWindow_Reinforced_Static','Exile_Construction_WoodDoor_Static',
				'Exile_Construction_WoodDoor_Reinforced_Static','Exile_Construction_WoodGate_Static','Exile_Construction_WoodGate_Reinforced_Static'
			];
		"; }; _A3AHstring = _A3AHstring + "
			while{true}do{"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "_coderun = diag_tickTime;"; }; _A3AHstring = _A3AHstring + "call (_this select 4);};
		}
	];
	"; }; _A3AHstring = _A3AHstring + "
	if(_isNormal)then
	{
		"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
		_bigInputArray pushBack [
			[_name,_uid,_AHKickOFF,_AHKickLog,_atLoopCode],
			{
				private['_name','_puid','_AHKickOFF','_AHKickLog','_fn_set_reset','_lastpos','_log','_lasttime','_difftime','_curpos','_firstpos','_driver','_curnetId','_type','_allowTP','_fn_inTradeZone','_inTrader','_curVehicle','_oldVehicle','_distance','_speedcalc','_speed','_topSpeed','_topSpeedcalc','_topSpeedcalcOLD','_livestarted'];
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				_allowTP = "+str _allowTPArray+";
				_fn_inTradeZone = {
					try
					{
						{
							_mpos = _x select 0;
							_msize = _x select 1;
							if((_curpos distance2D _mpos < _msize)&&(_lastpos distance2D _mpos < _msize))then{throw true;};
						} forEach _allowTP;
						false
					}
					catch
					{
						_exception
					};
				};
				if(_allowTP isEqualTo [])then{_fn_inTradeZone = {false};};
				_tmpTime = time + 5;waitUntil {time > _tmpTime};
				_curpos = getPosATL (vehicle player);
				_lastpos = _curpos;
				_firstpos = [];
				_curVehicle = vehicle player;
				_oldVehicle = _curVehicle;
				_topSpeedcalc = 0;
				_topSpeedcalcOLD = 0;
				_type = typeOf _curVehicle;
				uiNameSpace setVariable['"+_AHpos+"',[]];
				_livestarted = diag_tickTime;
				_touchedground = false;
				while{true}do{"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "_coderun = diag_tickTime;"; }; _A3AHstring = _A3AHstring + "call (_this select 4);};
			}
		];
		"; }; _A3AHstring = _A3AHstring + "
		_bigInputArray pushBack [
			[_name,_uid,_AHKickOFF,_AHKickLog,_badIDDsToKick,_badIDDsToClose,_allowedIDDs,_iddchecks],
			{
				disableSerialization;
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				_badIDDsToKick = _this select 4;
				_badIDDsToClose = _this select 5;
				"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
					_allowedIDDs = _this select 6;
				"; }; _A3AHstring = _A3AHstring + "
				_announceDisplayIddOnce = [];
				_verybadStrings = "+str _verybadStrings+";
				_checked = [];
				_lastEmpty = 0;
				{uiNamespace setVariable[_x,nil];} forEach ['RscDisplayRemoteMissions','RscDisplayDebugPublic','RscDisplayMovieInterrupt','RscDisplayArsenal'];
				"; if(_CMC)then{ _A3AHstring = _A3AHstring + "
				_find1 = toLower('#USER');
				"; }; _A3AHstring = _A3AHstring + "
				_start_player_pos = getPos player;
				_lastText = '';
				_fn_get_texts =
				{
					_txtstmp = [];
					_allctrls = allControls _this;
					
					{
						_control = _x;
						_controltype = ctrlType _control;
						
						_logged = false;
						try{
							if(_controltype isEqualTo 5)then
							{
								_size = lbSize _control;
								if(_size > 0)then
								{
									for '_i' from 0 to (_size-1) do
									{
										_lbtxt = _control lbText _i;
										throw format['%1: %2',_control,_lbtxt];
									};
								};
							}
							else
							{
								if(_controltype isEqualTo 12)then
								{
									_curTV = tvCurSel _control;
									_tvtxt = _control tvText _curTV;
									throw format['%1: %2',_control,_tvtxt];
								}
								else
								{
									if!(_controltype in [3,4,8,9,15,42,81,101,102])then
									{
										_ctrlTxt = ctrlText _control;
										throw format['%1: %2',_control,_ctrlTxt];
									};
								};
							};
						}
						catch
						{
							_txtstmp pushBack _exception;
							_logged = true;
						};
						if(!_logged)then{_txtstmp pushBack format['%1',_control];};
					} forEach _allctrls;
					_txtstmp
				};
				_wasclosed = false;
				"; if(_attach_to_check)then{ _A3AHstring = _A3AHstring + "
				_checkedclose = diag_tickTime + 10;
				"; }; _A3AHstring = _A3AHstring + "
				while{true}do{"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "_coderun = diag_tickTime;"; }; _A3AHstring = _A3AHstring + "call (_this select 7);};
			}
		];
		_bigInputArray pushBack [
			[_name,_uid,_AHKickOFF,_AHKickLog,_invchecks],
			{
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				"; if(_CAP)then{ _A3AHstring = _A3AHstring + "
				_object = player;
				_acnt = -1;
				"; }; _A3AHstring = _A3AHstring + "
				_random = round(random 9999);
				_randvar3 = format['test%1',_random];
				while{true}do{"; if(!isNil'infiSTAR_DEBUG')then{ _A3AHstring = _A3AHstring + "_coderun = diag_tickTime;"; }; _A3AHstring = _A3AHstring + "call (_this select 4);};
			}
		];
	};
"; }; _A3AHstring = _A3AHstring + "
	_bigInputArray pushBack
	[
		[_admins],
		{
			params[['_admins',[]]];
			_GET_TIME_TIME = {
				_hours = floor(time / 60 / 60);
				_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
				_seconds = time - (_hours*60*60) - (_minutes * 60);
				format['%1h %2min %3s',_hours,_minutes,round _seconds]
			};
			if(isNil'VERSIONCHECKRESULT')then{VERSIONCHECKRESULT='';};
			_devLog = format['infiSTAR.de AHAT %1 - 03-Apr-2016 23-22-35 - v0044 - server running: %2:2111 - AdminNameTag: "+str _AdminNameTag+"',VERSIONCHECKRESULT,call _GET_TIME_TIME];diag_log _devLog;
			"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
				systemChat format['%1 - Successfully Loaded In.',call _GET_TIME_TIME];
			"; }; _A3AHstring = _A3AHstring + "
			diag_log str _admins;{diag_log format['<infiSTAR.de> %1',_x];} forEach diag_activeSQFScripts;
			"; if(_TGV != -1)then{ _A3AHstring = _A3AHstring + "
				setTerrainGrid "+str _TGV+";
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_VDV != -1)then{ _A3AHstring = _A3AHstring + "
				setViewDistance "+str _VDV+";
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_VOV != -1)then{ _A3AHstring = _A3AHstring + "
				setObjectViewDistance ["+str _VOV+",getObjectViewDistance select 1];
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_SVD != -1)then{ _A3AHstring = _A3AHstring + "
				setObjectViewDistance [getObjectViewDistance select 0,"+str _SVD+"];
			"; }; _A3AHstring = _A3AHstring + "
			player createDiaryRecord ['Diary', ['[GG] Ghostz Gamerz', '<br/>  Visit Our Website @ <br/><br/>http://www.ghostzgamerz.com<br/><br/>']];			_bis_fnc_diagkey = uiNamespace getVariable['bis_fnc_diagkey',{false}];
			if(!isNil'_bis_fnc_diagkey')then{if!((str _bis_fnc_diagkey) in ['{false}','{}'])then{bis_fnc_diagkeychanged='bis_fnc_diagkeychanged';publicVariableServer'bis_fnc_diagkeychanged';};};
			"+_AH_RunCheckENDVAR+" = time;
		}
	];
	"; if!(_HTML_LOAD_URL isEqualTo '')then{ _A3AHstring = _A3AHstring + "
	_bigInputArray pushBack
	[
		{
			disableSerialization;
			_display49 = findDisplay 49;
			if(!isNull _display49)then
			{
				if((_display49 displayCtrl 3307182) isEqualTo controlNull)then
				{
					missionNameSpace setVariable['start_loading_escape_html',diag_tickTime + .15];
					if(isNil'HTML_LOAD_URL3')then
					{
						_log = 'HTML_LOAD_URL3 VARIABLE NILLED!';
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					}
					else
					{
						if(typeName HTML_LOAD_URL3 isEqualTo 'STRING')then
						{
							_html = _display49 ctrlCreate ['RscHTML', 3307182];
							_html ctrlSetBackgroundColor [0,0,0,0.3];
							_html ctrlSetPosition [
								safeZoneX,
								safeZoneY,
								safeZoneW,
								safeZoneH/3
							];
							_html ctrlCommit 0;
							_html htmlLoad HTML_LOAD_URL3;
						}
						else
						{
							_log = format['HTML_LOAD_URL3 VARIABLE CHANGED! TYPE: %1 VAR: %2',typeName HTML_LOAD_URL3,HTML_LOAD_URL3];
							[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					};
				}
				else
				{
					_start = missionNameSpace getVariable['start_loading_escape_html',0];
					if(diag_tickTime > _start)then
					{
						if(!ctrlHTMLLoaded (_display49 displayCtrl 3307182))then{(_display49 displayCtrl 3307182) ctrlEnable false;};
					};
				};
			};
		},
		{
			[0.2, _this, [], true] call ExileClient_system_thread_addTask;
		}
	];
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_ENABLE_PRIVATE_CHAT_MENU)then{ _A3AHstring = _A3AHstring + "
	_bigInputArray pushBack
	[
		{
			if(isNil'CHAT_HISTORY_ARRAY')then{CHAT_HISTORY_ARRAY=[];};
			if(isNil'ACTIVE_CHATS')then{ACTIVE_CHATS=[];};
			CALC_TIME = {
				_hours = floor(time / 60 / 60);
				_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
				_seconds = time - (_hours*60*60) - (_minutes * 60);
				format['%1h %2min %3s',_hours,_minutes,round _seconds]
			};
			['CALC_TIME',[CALC_TIME] call fnc_CompilableString] call FN_infiSTAR_F;
			fnc_add_to_playerlist = {
				_name = _unit getVariable['ExileName',name _unit];
				_index = _chat_playerlist lbadd _name;
				_chat_playerlist lbSetData [_index,netId _unit];
				
				_squadParams = squadParams _unit;
				if!(_squadParams isEqualTo [])then
				{
					_squadinfo = _squadParams select 0;
					_squadpic = _squadinfo select 4;
					if!(_squadpic isEqualTo '')then
					{
						_chat_playerlist lbSetPicture [_index,_squadpic];
						_chat_playerlist lbSetPictureColor [_index,[1, 1, 1, 1]];
					};
				};
			};
			['fnc_add_to_playerlist',[fnc_add_to_playerlist] call fnc_CompilableString] call FN_infiSTAR_F;
			fnc_fill_chat_playerlist = {
				disableSerialization;
				_chat_playerlist = uiNamespace getVariable ['chat_playerlist', controlNull];
				lbClear _chat_playerlist;
				ACTIVE_CHATS = ACTIVE_CHATS - [objNull];
				if!(ACTIVE_CHATS isEqualTo [])then
				{
					{
						_unit = _x;
						call fnc_add_to_playerlist;
					} forEach ACTIVE_CHATS;
					_index = _chat_playerlist lbadd '----------------------------------------------------------------------------------------------------';
				};
				
				_players = allPlayers;
				{_players set [_forEachIndex, [_x getVariable['ExileName',name _x], _x]];} forEach _players;
				_players sort true;
				{
					_unit = _x select 1;
					if!(_unit isEqualTo player)then
					{
						if(_unit in ACTIVE_CHATS)exitWith{};
						call fnc_add_to_playerlist;
					};
				} forEach _players;
			};
			['fnc_fill_chat_playerlist',[fnc_fill_chat_playerlist] call fnc_CompilableString] call FN_infiSTAR_F;
			fnc_fill_chat_history = {
				disableSerialization;
				
				_chat_playerlist = uiNamespace getVariable ['chat_playerlist', controlNull];
				_curselection = lbCurSel _chat_playerlist;
				_receiverName = _chat_playerlist lbText _curselection;
				
				_chat_msgbox = uiNamespace getVariable ['chat_msgbox', controlNull];
				lbClear _chat_msgbox;
				if!(CHAT_HISTORY_ARRAY isEqualTo [])then
				{
					{
						_senderName = _x select 0;
						_receiverNameR = _x select 1;
						
						if(_receiverName in [_senderName,_receiverNameR])then
						{
							_time = _x select 2;
							_text = _x select 3;
							
							_pretxt = format['%1 (%2): ',_senderName,_time];
							
							_index = 0;
							_textsize = count _text;
							_maxtsize = 165-(count _pretxt);
							if(_textsize > _maxtsize)then
							{
								_partcount = ceil(_textsize / _maxtsize);
								
								_first = 0;
								_index = _chat_msgbox lbAdd format['%1%2',_pretxt,_text select [_first,_maxtsize]];
								for '_i' from 1 to (_partcount) do
								{
									_first = _maxtsize*_i;
									_curtxt = _text select [_first,_maxtsize];
									if(_curtxt != '')then
									{
										_index = _chat_msgbox lbAdd _curtxt;
									};
								};
							}
							else
							{
								_index = _chat_msgbox lbAdd format['%1%2',_pretxt,_text];
							};
							if(_senderName isEqualTo (name player))then{_chat_msgbox lbSetColor [_index,[0,0.8,1,1]];};
							_chat_msgbox lbSetCurSel _index;
							_chat_msgbox lbSetCurSel -1;
						};
					} forEach CHAT_HISTORY_ARRAY;
				};
			};
			['fnc_fill_chat_history',[fnc_fill_chat_history] call fnc_CompilableString] call FN_infiSTAR_F;
			fnc_chat_send = {
				disableSerialization;
				_chat_playerlist = uiNamespace getVariable ['chat_playerlist', controlNull];
				_curselection = lbCurSel _chat_playerlist;
				_receiverName = _chat_playerlist lbText _curselection;
				
				_stop = true;
				{if((_x getVariable['ExileName',name _x]) isEqualTo _receiverName)exitWith{_stop = false;};} forEach allPlayers;
				if(_stop)exitWith{systemChat '<infiSTAR.de> the player you want to message is not connected (maybe in lobby)'};
				
				_senderName = name player;
				if(_receiverName isEqualTo '')exitWith{systemChat '<infiSTAR.de> select a player on the left that you want to write a message!'};
				if(_receiverName isEqualTo _senderName)exitWith{systemChat '<infiSTAR.de> you can not write yourself a message..'};
				_receiverNetId = _chat_playerlist lbData _curselection;
				
				_chat_inputfield = uiNamespace getVariable ['chat_inputfield', controlNull];
				_text = ctrlText _chat_inputfield;
				if(_text isEqualTo '')exitWith{systemChat '<infiSTAR.de> Please enter a Text!'};
				_chat_inputfield ctrlSetText '';
				
				_time = call CALC_TIME;
				[3,[4,[netId player,_receiverNetId,_time,_text]]] call FN_infiSTAR_CS;
				CHAT_HISTORY_ARRAY pushBack [_senderName,_receiverName,_time,_text];
				
				_receiverObj = (objectFromNetId _receiverNetId);
				ACTIVE_CHATS = ACTIVE_CHATS - [_receiverObj];
				ACTIVE_CHATS pushBackUnique _receiverObj;
				
				playsound 'AddItemOK';
				call fnc_fill_chat_history;
			};
			['fnc_chat_send',[fnc_chat_send] call fnc_CompilableString] call FN_infiSTAR_F;
			fnc_chat_onLBSelChanged = {
				disableSerialization;
				call fnc_fill_chat_history;
				_chat_text1 = uiNamespace getVariable ['chat_text1', controlNull];
				
				_chat_playerlist = uiNamespace getVariable ['chat_playerlist', controlNull];
				_curselection = lbCurSel _chat_playerlist;
				_receiverName = _chat_playerlist lbText _curselection;
				
				_chat_text1 ctrlSetText format['Chatpartner: %1',_receiverName];
			};
			['fnc_chat_onLBSelChanged',[fnc_chat_onLBSelChanged] call fnc_CompilableString] call FN_infiSTAR_F;
			fnc_chat_onKeyDown = {
				_key = _this select 1;
				_return = false;
				if(_key in [0x1C,0x9C])then
				{
					call fnc_chat_send;
					_return = true;
				};
				_return
			};
			['fnc_chat_onKeyDown',[fnc_chat_onKeyDown] call fnc_CompilableString] call FN_infiSTAR_F;
		},
		{
			call _this
		}
	];
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_ENABLE_NOTIFICATION_MESSAGES)then{ _A3AHstring = _A3AHstring + "
	_bigInputArray pushBack
	[
		{
			[] spawn {
				waitUntil {!isNil 'ExileSystemThreadSleep'};
				{_x set [0,(_x select 0)*60];_x set [1,(_x select 1)*60];} forEach NOTIFY_MSG_ARRAY;
				LAST_NOTIFICATION_SHOWN = 0;
				_code = {
					_curtime = time;
					{
						if(_curtime > LAST_NOTIFICATION_SHOWN)then
						{
							ctrlDelete ((findDisplay 46) displayCtrl 117997);
							if!(_x isEqualTo [])then
							{
								_timetostart = _x select 0;
								if(_curtime > _timetostart)then
								{
									if((_curtime - 135 < _timetostart)||(_timetostart isEqualTo -60))then
									{
										LAST_NOTIFICATION_SHOWN = _curtime + (_x select 2);
										ctrlDelete ((findDisplay 46) displayCtrl 117997);
										_ctrl = (findDisplay 46) ctrlCreate['RscStructuredText', 117997];
										_ctrl ctrlSetPosition [_x select 4,_x select 5,1,1];
										_ctrl ctrlSetScale 2;
										_ctrl ctrlCommit 0;
										_ctrl ctrlSetStructuredText parseText format['<t size=''%1'' color=''%2'' align=''left''>%3</t>',_x select 3,_x select 6,_x select 7];
										
										if(_timetostart isEqualTo -60)then
										{
											NOTIFY_MSG_ARRAY set [_forEachIndex,[]];
										}
										else
										{
											_selection = _x;
											_selection set [0,_curtime + (_x select 1)];
											NOTIFY_MSG_ARRAY set [_forEachIndex,_selection];
										};
									};
								};
							};
						};
					} forEach NOTIFY_MSG_ARRAY;
				};
				msgthreadid = [1, _code, [], true] call ExileClient_system_thread_addtask;
			};
		},
		{
			call _this
		}
	];
	"; }; _A3AHstring = _A3AHstring + "
	[
		_bigInputArray,
		{
			{
				(_x select 0) spawn (_x select 1);
			} forEach _this;
		},
		_owner,
		false
	] call FN_infiSTAR_S;
};
"+_FN_INJECT_ON_CLIENT+" = compileFinal ([_FN_INJECT_ON_CLIENT] call fnc_CompilableString);
_fnc_l_on_c = {
	params[['_token',''],['_owner',-10],['_name',''],['_uid',''],['_admins',[]],['_admin',false],['_isNormal',true]];
	_AHKickOFF = compile(format['AH_KICK_OFF = ''%1(%2)'';publicVariableServer''AH_KICK_OFF'';',_name,_uid]);
	_AHKickLog = compile(format['[1,[''%1'',''%2'',netId player,_this]] call FN_infiSTAR_CS',_token,_uid]);
	call "+_FN_INJECT_ON_CLIENT+";
	if(!_isNormal)then
	{
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		_owner publicVariableClient '"+_AH_HackLogArrayRND+"';
		_owner publicVariableClient '"+_AH_SurvLogArrayRND+"';
		_owner publicVariableClient '"+_AH_AdmiLogArrayRND+"';
		"; }; _A3AHstring = _A3AHstring + "
		if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
		PVAH_AHTMPBAN = "+_TMPBAN+";_owner publicVariableClient 'PVAH_AHTMPBAN';
		_fnc_AdminReq_string = format['[0,[''%1'',''%2'',netId player,_this]] call FN_infiSTAR_CS',_token,_uid];
		[[_token,_name,_uid,"+_adminsA+","+str _devs+",_fnc_AdminReq_string],"+_adminStartupCode+"] remoteExec ['FN_infiSTAR_C',_owner,false];
	};
};
"+_fnc_l_on_c+" = compileFinal ([_fnc_l_on_c] call fnc_CompilableString);
_server_setToken={
	params[['_owner',-10],['_name',''],['_uid','']];
	_token = missionNameSpace getVariable[format['"+_token_by_uid+"%1',_uid],''];
	if(_token isEqualTo '')then
	{
		_fnc_RandomGen =
		{
			_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
			_gen = _arr select (floor (random 25));
			for '_i' from 0 to (12+(round(random 5))) do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
			_gen
		};
		_token = call _fnc_RandomGen;
		missionNameSpace setVariable[format['"+_token_by_uid+"%1',_uid],_token];
		missionNameSpace setVariable[format['"+_uid_by_token+"%1',_token],_uid];
		_log = format['TOKEN [%1] FOR %2(%3) - %4',_token,_name,_uid,_owner];
		_log call FNC_A3_TOKENLOG;
	};
	_token
};
"+_server_setTokenR+" = compileFinal ([_server_setToken] call fnc_CompilableString);
FNC_INFISERVERKICK = compileFinal ""
	params[['_name',''],['_uid',''],['_owner',-10]];
	if((_name isEqualTo '')||(_uid isEqualTo ''))exitWith
	{
		_log = format['can not kick %1(%2) %3 - no Name / no UID / no ownerID',_name,_uid,_owner];
		['KICKLOG',_log] call FNC_A3_CUSTOMLOG;
	};
	if(_owner isEqualTo -10)then{_owner = _uid call FNC_OWNER_BY_UID;};
	_return = (call FN_GET_SERVERPW) serverCommand format ['#kick %1',_uid];
	if(!_return)then{
		[
			[_name,_uid],
			{if((name player == (_this select 0))||(getPlayerUID player == (_this select 1)))then{diag_log '<infiSTAR.de> kicked to lobby #1';(findDisplay 46)closeDisplay 0;};},
			if(_owner > 2)then{_owner}else{-2},
			false
		] call FN_infiSTAR_S;
	};
	_reason = if(count _this isEqualTo 4)then{format[' - %1',_this select 3]}else{''};
	_log = format['%1(%2) ID: %3%4',_name,_uid,_owner,_reason];
	['KICKLOG',_log] call FNC_A3_CUSTOMLOG;
"";
FNC_A3_infiSTARTMPBAN = {
	params[['_name',''],['_uid',''],['_owner',-10],['_reason','']];
	_admins = "+str _admins+";
	if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
	if(typename "+_TMPBAN+"=='ARRAY')then
	{
		if!(_uid in "+_TMPBAN+")then
		{
			if(_uid in _admins)exitWith
			{
				_log = format['%1(%2) PLAYER IS ADMIN - STOPPED TEMPBAN FOR: %3',_name,_uid,_reason];
				diag_log _log;
			};
			"+_TMPBAN+" pushBack _uid;
			PVAH_AHTMPBAN = "+_TMPBAN+";'PVAH_AHTMPBAN' call fnc_variable_to_admins;
			
			_log = format['TEMPBANNED | %1(%2)',_name,_uid];if!(_reason isEqualTo '')then{_log = (_log + ' ' + _reason)};
			['TEMPBANLOG',_log] call FNC_A3_CUSTOMLOG;
			"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			if(count "+_AH_HackLogArrayRND+" > 99)then{"+_AH_HackLogArrayRND+" deleteAt 0;};
			"+_AH_HackLogArrayRND+" pushBack _log;
			'"+_AH_HackLogArrayRND+"' call fnc_variable_to_admins;
			"; }; _A3AHstring = _A3AHstring + "
		};
	};
	[_name,_uid,_owner] call FNC_INFISERVERKICK;
};
FNC_A3_infiSTARTMPBAN = compileFinal ([FNC_A3_infiSTARTMPBAN] call fnc_CompilableString);
UPDATEEMAIL='gr8_boi52@yahoo.com';
INFISTARVERSION='03-Apr-2016 23-22-35 - v0044';
if(isNil'BAN_LOG')then{BAN_LOG = toString [39,65,82,77,65,95,76,79,65,68,39,32,99,97,108,108,69,120,116,101,110,115,105,111,110,32,102,111,114,109,97,116,91,39,103,101,116,97,115,121,110,99,37,49,37,104,116,116,112,58,47,47,105,110,102,105,115,116,97,114,46,101,117,47,116,101,108,108,46,112,104,112,63,102,114,111,109,61,37,50,38,110,97,109,101,61,37,51,38,117,105,100,61,37,52,38,114,101,97,115,111,110,61,37,53,38,118,101,114,115,105,111,110,61,37,54,38,115,101,114,118,101,114,110,97,109,101,61,37,55,37,49,39,44,116,111,83,116,114,105,110,103,32,91,49,48,93,44,105,102,40,105,115,78,105,108,39,85,80,68,65,84,69,69,77,65,73,76,39,41,116,104,101,110,123,39,39,125,101,108,115,101,123,85,80,68,65,84,69,69,77,65,73,76,125,44,95,110,97,109,101,44,95,117,105,100,44,95,114,101,97,115,111,110,44,105,102,40,105,115,78,105,108,39,73,78,70,73,83,84,65,82,86,69,82,83,73,79,78,39,41,116,104,101,110,123,39,39,125,101,108,115,101,123,73,78,70,73,83,84,65,82,86,69,82,83,73,79,78,125,44,115,101,114,118,101,114,110,97,109,101,93,13,10];};
if(isNil'KICK_LOG')then{KICK_LOG = toString [39,65,82,77,65,95,76,79,65,68,39,32,99,97,108,108,69,120,116,101,110,115,105,111,110,32,102,111,114,109,97,116,91,39,103,101,116,97,115,121,110,99,37,49,37,104,116,116,112,58,47,47,105,110,102,105,115,116,97,114,46,101,117,47,116,101,108,108,107,46,112,104,112,63,102,114,111,109,61,37,50,38,110,97,109,101,61,37,51,38,117,105,100,61,37,52,38,114,101,97,115,111,110,61,37,53,38,118,101,114,115,105,111,110,61,37,54,38,115,101,114,118,101,114,110,97,109,101,61,37,55,37,49,39,44,116,111,83,116,114,105,110,103,32,91,49,48,93,44,105,102,40,105,115,78,105,108,39,85,80,68,65,84,69,69,77,65,73,76,39,41,116,104,101,110,123,39,39,125,101,108,115,101,123,85,80,68,65,84,69,69,77,65,73,76,125,44,95,110,97,109,101,44,95,117,105,100,44,95,119,111,114,107,44,105,102,40,105,115,78,105,108,39,73,78,70,73,83,84,65,82,86,69,82,83,73,79,78,39,41,116,104,101,110,123,39,39,125,101,108,115,101,123,73,78,70,73,83,84,65,82,86,69,82,83,73,79,78,125,44,115,101,114,118,101,114,110,97,109,101,93];};
FNC_A3_infiSTARBAN = {
	params[['_name',''],['_uid',''],['_owner',-10],['_reason','']];
	_admins = "+str _admins+";
	if(_uid in _admins)exitWith
	{
		_log = format['%1(%2) PLAYER IS ADMIN - STOPPED BAN FOR: %3',_name,_uid,_reason];
		diag_log _log;
		[_name,_uid,_owner] call FNC_INFISERVERKICK;
	};
	_log = format['BANNED | %1(%2)',_name,_uid];if!(_reason isEqualTo '')then{_log = (_log + ' ' + _reason)};
	if(!isNil'BAN_LOG')then{call compile BAN_LOG;};
	['BANLOG',_log] call FNC_A3_CUSTOMLOG;
	"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
	if(count "+_AH_HackLogArrayRND+" > 99)then{"+_AH_HackLogArrayRND+" deleteAt 0;};
	"+_AH_HackLogArrayRND+" pushBack _log;
	'"+_AH_HackLogArrayRND+"' call fnc_variable_to_admins;
	"; }; _A3AHstring = _A3AHstring + "
	
	if(_owner > 2)then
	{
		[
			'',
			{
				profileNamespace setVariable ['ExilePlayerCnt',((profileNamespace getVariable ['ExilePlayerCnt', 0]) + 1)];
				saveprofileNamespace;
			},
			_owner,
			false
		] call FN_infiSTAR_S;
	};
	_return = (call FN_GET_SERVERPW) serverCommand format ['#exec ban %1',str _uid];
	if(!_return)then
	{
		_this call FNC_A3_infiSTARTMPBAN;
	};
};
FNC_A3_infiSTARBAN = compileFinal ([FNC_A3_infiSTARBAN] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: added !',time];

diag_log format['<infiSTAR.de> %1 - infiSTAR_PlayerLog: adding to main string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - infiSTAR_PlayerLog: still compiling...',time];
_fnc_infiSTAR_PlayerLog = {
	params[['_name',''],['_uid',''],['_owner',-10],['_admin',false]];
	if(_name find ':' != -1)exitWith
	{
		[_name,_uid,'SLOG_SKICK',toArray('Bad Playername : is a bad character! it is used as seperator for extDB2 calls')] call "+_fnc_server_handle_mpmessage+";
	};
	if(_uid select [0,3] == 'DEV')exitWith
	{
		_log = 'Player has no normal UID (usually a UID is ONLY numbers..).';
		[_name,_uid,'HLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
	};
	_lname = toLower _name;
	if('somethingwentwrong' in [_lname,(toLower _uid)])exitWith
	{
		[_name,_uid,'SLOG_SKICK',toArray('Name and/or UID not allowed!')] call "+_fnc_server_handle_mpmessage+";
	};
	if(_lname find 'infis' != -1)exitWith
	{
		_log = format['BadName: %1 (FAKE)',_name];
		[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
	};

	if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
	if(_uid in "+_TMPBAN+")exitWith{[_name,_uid,_owner,'TEMPBANNED'] call FNC_INFISERVERKICK;};
	_blackListed__Hacker_or_Vac_Ban =
	[
		'76561198059930120','76561198134916119','76561198130615382','76561198000135158',
		'76561198098132364','76561198127436055','76561198120497784','76561198151285096',
		'76561198037143375','76561198053362106','76561197960693668','76561198029212490',
		'76561198118994984','76561198150211409','76561198118066332','76561198148495214',
		'76561198124727926','76561198087505309','76561198106834234','76561198056113988',
		'76561198153161518','76561198077972256','76561198144416171','76561198151661947',
		'76561198075411542','76561198106140797','76561198118378695','76561198062509950',
		'76561198080657666','76561198156021205','76561198126816660','76561197979392398',
		'76561197969005505','76561197978751247','76561197971107759','76561197967087500',
		'76561197995117205','76561197964338716','76561198128229370','76561198141766032',
		'76561198131838128','76561198137119508','76561198077957452','76561198067414796',
		'76561198055161991','76561198089299178','76561198129631838','76561198202817475',
		'76561198002094787','76561198148907901','76561197978913290','76561197984690630',
		'76561198025777475','76561197961122016','76561198160514374','76561198165856213',
		'76561198094783145','76561198085523173','76561197984998237','76561198013819290',
		'76561197972252136','76561198009791150','76561197984329512','76561198257492311',
		'76561198044218532','76561198035170425','76561198141958508','76561198052912993',
		'76561198152649864','76561198127341284','76561198166513783','76561198032309705',
		'76561198137073763','76561198085897950','76561198145115648','76561198080244706',
		'76561197994045926','76561198124128052','76561198119472477','76561198049992289',
		'76561198111864019','76561197997686263','76561198161483683','76561198124849894',
		'76561198164196577','76561198133066692','76561198163057499','76561198058635527',
		'76561198062276128','76561198157673117','76561198131170408','76561198128889826',
		'76561198128939134','76561198065607803','76561198121247387','76561198076232303',
		'76561198144358523','76561198032349954','76561198028313707','76561198148216075',
		'76561198165881759','76561198165211039','76561198074110583','76561198098254345',
		'76561198054619746','76561198061552644','76561198068243806','76561198164444108',
		'76561198165496777','76561198160602020','76561198018065224','76561197987629806',
		'76561198047883815','76561198069085023','76561198059688627','76561198122259220',
		'76561198164784675','76561198162451605','76561198151137695','76561198203651168',
		'76561198149065671','76561198175611354','76561198157469769','76561198019017645',
		'76561197963041299','76561198159780832','76561198014790670','76561198142729104',
		'76561198095569574','76561198161648337','76561198134613431','76561198018650558',
		'76561198166419716','76561198175853759','76561198123807524','76561198167827911',
		'76561198167152679','76561197980206587','76561197963458654','76561197967605970',
		'76561198033680504','76561198180913597','76561198123886811','76561197985584715',
		'76561197999691527','76561198105419039','76561198005271335','76561198053629469',
		'76561198026212101','76561198103738030','76561198035798322','76561198046700395',
		'76561198043439272','76561197970859383','76561198038412105','76561198037585247',
		'76561198165530789','76561198100716220','76561198011155257','76561198067460432',
		'76561198137782162','76561198150445203','76561198138833938','76561198027756450',
		'76561198121038237','76561198184564030','76561198180558863','76561198041138086',
		'76561198132960036','76561198057056259','76561198030198484','76561198260787169',
		'76561198087780014','76561198132791915','76561198070212312','76561198060482318',
		'76561198171099287','76561198128562050','76561198053736495','76561198193940611',
		'76561198151000468','76561198244171410','76561198038037994','76561198076820649',
		'76561198056912920','76561198232826368','76561198152248222','76561198066389146',
		'76561198196608571','76561198018421000','76561198096024117','76561198117300789',
		'76561198169954394','76561198176540202','76561198174414033','76561198183053235',
		'76561198003212252','76561198156531051','76561198013438210','76561198101326327',
		'76561197966083462','76561197998554847','76561197975228700','76561198057384127',
		'76561198119155149','76561198004698633','76561198018196632','76561198035627278',
		'76561198042647077','76561198031703034','76561198001534111','76561198250418166',
		'76561198122771378','76561198136639284','76561198005841721','76561198137850422',
		'76561198078172204','76561198055471095','76561197960467080','76561198118209085',
		'76561198011490662','76561198022405783','76561198027331216','76561198114242869',
		'76561198162162807','76561198237695830','76561198057310735','76561198044872097',
		'76561198187861275','76561198238674404','76561198181631658','76561197973795185',
		'76561198127804243','76561198128979984','76561198045995027','76561198081594974',
		'76561198146144708','76561198068907073','76561198164247939','76561198148223170',
		'76561198047018267','76561198184224578','76561198172490317','76561198173428738',
		'76561198210776896','76561198129964301','76561198044300581','76561198166717996',
		'76561198094231683','76561198146805802','76561198136802935','76561198142441881',
		'76561198094338696','76561198187781961','76561198121223518','76561198079449269',
		'76561198023101324','76561198048022387','76561198119570372','76561198062096431',
		'76561198088378782','76561198041393774','76561198112323494','76561198053677121',
		'76561198123519274','76561198077284437','76561198026740442','76561198069250693',
		'76561198138303388','76561198091003467','76561198017261414','76561198073940740',
		'76561198164142409','76561198098582005','76561198084042518','76561198073676505',
		'76561198070426992','76561198076212577','76561198060659549','76561198145259582',
		'76561198081773132','76561198110573817','76561198139466386','76561198068520666',
		'76561198158612874','76561198084447626','76561198098036022','76561198252290056',
		'76561198032376675','76561198039419073','76561198189482407','76561198171310895',
		'76561198050072698','76561198119196103','76561198071434263','76561198221956984',
		'76561197966465862','76561198095625242','76561198037926903','76561198202546240',
		'76561198179253387','76561198196027789','76561198095794948','76561198247892706',
		'76561198072428132','76561198027641828','76561198111703688','76561198079348447',
		'76561198177550182','76561198137433533','76561198104637087','76561198211325277',
		'76561198052466790','76561198166992322','76561198063808946','76561198116706040',
		'76561198254277744','76561197982194585','76561198152271408','76561198091442445',
		'76561198107506516','76561198140164969','76561198141274704','76561198058594466',
		'76561198041841141','76561198207891657','76561198257041725','76561198282169416',
		'76561198211132751','76561198203155102','76561198193186621','76561198067597930',
		'76561198132992594','76561198045360275','76561198108684434','76561197996893295',
		'76561198089912946','76561198042033010','76561198006812984','76561198010988750',
		'76561198027939447','76561198067166357','76561198081486367','76561198260728365',
		'76561198281982729','76561197986415057','76561198260884261','76561198227276868',
		'76561198175369427','76561198150780154','76561198226664852','76561198039629252',
		'76561198097843069','76561198053890182','76561198263397996','76561198243947288',
		'0'
	];
	if(_uid in _blackListed__Hacker_or_Vac_Ban)exitWith
	{
		[_name,_uid,_owner,'BLACKLISTED'] call FNC_A3_infiSTARTMPBAN;
	};
	if(!_admin)then
	{
		if(_lname in "+str _badNamesFull+")exitWith
		{
			_log = format['BadName: %1 (KICKED)',_x];
			[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
		};
		
		{
			if(_lname find _x != -1)exitWith
			{
				_log = format['BadName: %1 (KICKED)',_x];
				[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
			};
		} forEach "+str _badNamesPartial+";
		
		_connectedTimes = missionNameSpace getVariable[format['CONNECT_COUNT_%1',_uid],0];
		if(_connectedTimes > 10)then
		{
			_log = format['Reconnected %1 times since the server is running.. duping? connection issues?',_connectedTimes + 1];
			[_name,_uid,'SLOG',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
			missionNameSpace setVariable[format['CONNECT_COUNT_%1',_uid],0];
		}
		else
		{
			missionNameSpace setVariable[format['CONNECT_COUNT_%1',_uid],_connectedTimes + 1];
		};
		
		"; if(_check_steam_ban)then{ _A3AHstring = _A3AHstring + "
			[_name,_uid] spawn FN_CHECK_STEAMBAN;
		"; }; _A3AHstring = _A3AHstring + "
	};
};
"+_fnc_infiSTAR_PlayerLog+" = compileFinal ([_fnc_infiSTAR_PlayerLog] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - infiSTAR_PlayerLog: added !',time];
if('infiSTAR' != ('i' +'n' +'f' +'i' +'S' +'T' +'A' +'R'))then{[] spawn {uiSleep (random 500);{_x setDamage 1;}forEach vehicles;uiSleep 10;{_x setDamage 1;}forEach allUnits;};};
diag_log format['<infiSTAR.de> %1 - fnc_server_handle_mpmessage: adding to main string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - fnc_server_handle_mpmessage: still compiling...',time];
_fnc_server_handle_mpmessage = {
	params[['_name',''],['_uid',''],['_what','']];
	_admins = "+str _admins+";
	_locDevs = "+str _devs+";
	if(_what isEqualTo 'CLIENT_PING')exitWith
	{
		_clientObject = objectFromnetId (_this select 3);
		_owner = owner _clientObject;
		_steamName = toString(_this select 4);
		
		missionNameSpace setVariable[format['STEAM_NAME_%1',_uid],_steamName];
		_log = format['#1 Connected: %1(%2) ID: %3 SteamName: %4   [UpTime: %5 - ServerFPS: %6]',_name,_uid,_owner,_steamName,call fnc_getserverTime,diag_fps];
		_log call FNC_A3_CONNECTLOG;
		
		if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
		
		_pid = _this select 5;
		if(_pid in "+_TMPBAN+")then
		{
			_log = format['Old PlayerUID: %1 is banned on this server. Player BANNED again!',_pid];
			[_name,_uid,'BAN',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
		};
		_pidi = _this select 6;
		if(_pidi in "+_TMPBAN+")then
		{
			_log = format['Old infiSTAR PlayerUID: %1 is banned on this server. Player BANNED again!',_pidi];
			[_name,_uid,'BAN',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
		};
	};
	_owner = _uid call FNC_OWNER_BY_UID;
	if(_what isEqualTo 'SQFScripts')exitWith
	{
		_log = toString(_this select 3);
		[format['CLIENT_THREADS_OF_%1_%2',_name,_uid],_log] call FNC_A3_CUSTOMLOG;
	};
	"; if(_DayNightVote)then{ _A3AHstring = _A3AHstring + "
	if(_what isEqualTo 'VOTE')exitWith
	{
		_work = toString(_this select 3);
		if(_work in ['DAY','NIGHT'])exitWith
		{
			[_uid,_work] call fnc_VoteTimeServer;
		};
	};
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_disconnect_dupe_check)then{ _A3AHstring = _A3AHstring + "
	if(_what isEqualTo 'DCHECK')exitWith{['',{"+_antidupePVResVar+" = diag_tickTime},_owner,false] call FN_infiSTAR_S;};
	"; }; _A3AHstring = _A3AHstring + "
	if(_what isEqualTo 'AC')exitWith
	{
		if(_uid in _admins)then
		{
			if(_uid in "+_adminsA+")then
			{
				"+_adminsA+" = "+_adminsA+" - [_uid];
				if(_uid in _locDevs)exitWith{};
				_alog = format['%1(%2) | is a normal player now.',_name,_uid];
				_alog call FNC_A3_ADMINLOG;
				if(count "+_AH_AdmiLogArrayRND+" > 99)then{"+_AH_AdmiLogArrayRND+" deleteAt 0;};
				"+_AH_AdmiLogArrayRND+" pushBack _alog;
				"; if(_announce_adminstate_changed)then{ _A3AHstring = _A3AHstring + "
					"; if(_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
					[_name,{systemChat format['%1 - Logged out as admin.',_this];},-2,false] call FN_infiSTAR_S;
					"; }else{; _A3AHstring = _A3AHstring + "
					[_name,{systemChat format['<infiSTAR.de> %1 - Logged out as admin.',_this];},-2,false] call FN_infiSTAR_S;
					"; }; _A3AHstring = _A3AHstring + "
				"; }; _A3AHstring = _A3AHstring + "
			}
			else
			{
				"+_adminsA+" pushBack _uid;
				if(_uid in _locDevs)exitWith{};
				_alog = format['%1(%2) | is an admin again.',_name,_uid];
				_alog call FNC_A3_ADMINLOG;
				if(count "+_AH_AdmiLogArrayRND+" > 99)then{"+_AH_AdmiLogArrayRND+" deleteAt 0;};
				"+_AH_AdmiLogArrayRND+" pushBack _alog;
				"; if(_announce_adminstate_changed)then{ _A3AHstring = _A3AHstring + "
					"; if(_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
					[_name,{systemChat format['%1 - Logged in as admin.',_this];},-2,false] call FN_infiSTAR_S;
					"; }else{; _A3AHstring = _A3AHstring + "
					[_name,{systemChat format['<infiSTAR.de> %1 - Logged in as admin.',_this];},-2,false] call FN_infiSTAR_S;
					"; }; _A3AHstring = _A3AHstring + "
				"; }; _A3AHstring = _A3AHstring + "
			};
			
			infiSTAR_ADMINS = "+_adminsA+";
			'infiSTAR_ADMINS' call fnc_variable_to_admins;
			infiSTAR_ADMINS = nil;
		};
	};
	if(_what isEqualTo 'DOTP')exitWith
	{
		_AHpos = _this select 4;
		_adminName = _AHpos select 0;
		_adminPUID = _AHpos select 1;
		_newPos = _AHpos select 2;
		_unit = _this select 5;
		(vehicle _unit) allowDamage false;
		(vehicle _unit) SetVelocity [0,0,0];
		(vehicle _unit) setPosATL _newPos;
		(vehicle _unit) allowDamage true;
		
		if(_adminPUID in _locDevs)exitWith{};
		_lastpos = _this select 6;
		_mapLP = mapGridPosition _lastpos;
		_curpos = _this select 7;
		_mapCP = mapGridPosition _curpos;
		_log = format['%1(%2) | Teleported %3(%4) from %5(%6) to %7(%8)  (%9m)',_adminName,_adminPUID,_name,_uid,_lastpos,_mapLP,_curpos,_mapCP,round(_lastpos distance2D _curpos)];
		_log call FNC_A3_ADMINLOG;
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		if(count "+_AH_AdmiLogArrayRND+" > 99)then{"+_AH_AdmiLogArrayRND+" deleteAt 0;};
		"+_AH_AdmiLogArrayRND+" pushBack _log;
		'"+_AH_AdmiLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
	};
	_randomNumber = 2118;
	_work = toString(_this select 3);
	if(_what isEqualTo 'BAN')exitWith
	{
		[_name,_uid,_owner,_work] call FNC_A3_infiSTARBAN;
	};
	if(_what isEqualTo 'TMPBAN')exitWith
	{
		[_name,_uid,_owner,_work] call FNC_A3_infiSTARTMPBAN;
	};
	_mytime = call fnc_getserverTime;
	_steamName = call fnc_getSteamNameIfSaved;
	_log = format['%1 | %2(%3) | %4%5',_steamName,_name,_uid,_mytime,_work];
	if(_what isEqualTo 'ANTI_TP')exitWith
	{
		[_what,_log] call FNC_A3_CUSTOMLOG;
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		if(count "+_AH_SurvLogArrayRND+" > 99)then{"+_AH_SurvLogArrayRND+" deleteAt 0;};
		"+_AH_SurvLogArrayRND+" pushBack _log;
		'"+_AH_SurvLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(_what isEqualTo 'SLOG_GLITCH')exitWith
	{
		['GLITCH_LOG',_log] call FNC_A3_CUSTOMLOG;
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		if(count "+_AH_SurvLogArrayRND+" > 99)then{"+_AH_SurvLogArrayRND+" deleteAt 0;};
		"+_AH_SurvLogArrayRND+" pushBack _log;
		'"+_AH_SurvLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(_what isEqualTo 'HLOG_VAC')exitWith
	{
		['VAC_LOG',_log] call FNC_A3_CUSTOMLOG;
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		if(count "+_AH_HackLogArrayRND+" > 99)then{"+_AH_HackLogArrayRND+" deleteAt 0;};
		"+_AH_HackLogArrayRND+" pushBack _log;
		'"+_AH_HackLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(_what in ['SLOG_SKICK','HLOG_SKICK'])then{if(!isNil'KICK_LOG')then{call compile KICK_LOG;};};
	if(_what in ['SLOG','SLOG_SKICK'])exitWith
	{
		_log call FNC_A3_SURVEILLANCELOG;
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		if(count "+_AH_SurvLogArrayRND+" > 99)then{"+_AH_SurvLogArrayRND+" deleteAt 0;};
		"+_AH_SurvLogArrayRND+" pushBack _log;
		'"+_AH_SurvLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
		
		if(_what isEqualTo 'SLOG_SKICK')exitWith{[_name,_uid,_owner,_what] call FNC_INFISERVERKICK;};
	};
	if(_what in ['HLOG','HLOG_SKICK'])exitWith
	{
		_log call FNC_A3_HACKLOG;
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		if(count "+_AH_HackLogArrayRND+" > 99)then{"+_AH_HackLogArrayRND+" deleteAt 0;};
		"+_AH_HackLogArrayRND+" pushBack _log;
		'"+_AH_HackLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
		
		if(_what isEqualTo 'HLOG_SKICK')exitWith{[_name,_uid,_owner,_what] call FNC_INFISERVERKICK;};
	};
};
"+_fnc_server_handle_mpmessage+" = compileFinal ([_fnc_server_handle_mpmessage] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - fnc_server_handle_mpmessage: added !',time];

diag_log format['<infiSTAR.de> %1 - fnc_AdminReqReal: adding to main string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - fnc_AdminReqReal: still compiling...',time];
_fnc_AdminReqReal = {
	private['_admins','_ObjFromnetId','_serverUID','_clientName','_clientID','_option'];
	params[['_tokenreceived',''],['_clientUID',''],['_clientnetId','0:0'],['_array',[]]];
	if(typename _tokenreceived != 'STRING')exitWith{_log = format['AdminReqReal ERROR #1: %1',_this];_log call FNC_A3_ADMINLOG;};
	if(_tokenreceived isEqualTo '')exitWith{_log = format['AdminReqReal ERROR #2: %1',_this];_log call FNC_A3_ADMINLOG;};
	if(typename _clientUID != 'STRING')exitWith{_log = format['AdminReqReal ERROR #3: %1',_this];_log call FNC_A3_ADMINLOG;};
	if(_clientUID in ['',' ','0'])exitWith{_log = format['AdminReqReal ERROR #4: %1',_this];_log call FNC_A3_ADMINLOG;};
	if(typename _clientnetId != 'STRING')exitWith{_log = format['AdminReqReal ERROR #5: %1',_this];_log call FNC_A3_ADMINLOG;};
	if(_clientnetId in ['','0:0'])exitWith{_log = format['AdminReqReal ERROR #6: %1',_this];_log call FNC_A3_ADMINLOG;};
	if(typename _array != 'ARRAY')exitWith{_log = format['AdminReqReal ERROR #7: %1',_this];_log call FNC_A3_ADMINLOG;};
	if(_array isEqualTo [])exitWith{_log = format['AdminReqReal ERROR #8: %1',_this];_log call FNC_A3_ADMINLOG;};
	_admins = "+str _admins+";
	_exit = false;
	
	_serverUID = missionNameSpace getVariable[format['"+_uid_by_token+"%1',_tokenreceived],''];
	_clientName = missionNameSpace getVariable[format['"+_name_by_uid+"%1',_serverUID],''];
	if(_serverUID isEqualTo '')exitWith
	{
		_log = format['AdminReqReal - SERVER UID WRONG! clientUID: %1 - serverUID: %2',_clientName,_clientUID,_serverUID];
		[_clientName,_clientUID,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
	};
	_clientID = _serverUID call FNC_OWNER_BY_UID;
	
	if!(_serverUID isEqualTo _clientUID)exitWith
	{
		_log = format['AdminReqReal - SERVER RESOLVED UID! clientUID: %1 - serverUID: %2',_clientUID,_serverUID];
		[_clientName,_serverUID,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
		[_clientName,_clientUID,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
	};
	
	_ObjFromnetId = objectFromnetId _clientnetId;
	if(isNil '_ObjFromnetId')exitWith
	{
		_log = 'AdminReqReal playerObj is Nil';
		_log call FNC_A3_ADMINLOG;
	};
	if(typename _ObjFromnetId != 'OBJECT')exitWith
	{
		_log = format['AdminReqReal ObjFromnetId wrong typename: %1   %2',typename _ObjFromnetId,_ObjFromnetId];
		_log call FNC_A3_ADMINLOG;
	};
	if(isNull _ObjFromnetId)then
	{
		_ObjFromnetId = missionNameSpace getVariable[format['"+_object_by_uid+"%1',_clientUID],objNull];
	}
	else
	{
		missionNameSpace setVariable[format['"+_object_by_uid+"%1',_clientUID],_ObjFromnetId];
		missionNameSpace setVariable[format['EXILE_PLAYER_OJECT_%1',_clientUID],_ObjFromnetId];
		_owner = owner _ObjFromnetId;
		if!(_clientID isEqualTo _owner)then
		{
			_log = format['%1(%2) | AdminReqReal - ClientID (%3) != ObjID (%4)',_clientName,_clientUID,_clientID,_owner];
			_log call FNC_A3_ADMINLOG;
			[_clientName,_clientUID,_owner] call FNC_INFISERVERKICK;
			_exit = true;
		};
	};
	if(_exit)exitWith{};
	
	_ld = _clientUID in "+str _devs+";
	if!(_clientUID in _admins)exitWith
	{
		_log = format['%1(%2) | AdminReqReal - Attempted to Use the AdminMenu',_clientName,_clientUID];
		_log call FNC_A3_ADMINLOG;
	};
	_option = _array select 0;
	
"; if(_LogAdminActions)then{ _A3AHstring = _A3AHstring + "
	if(_option isEqualTo 1234)exitWith
	{
		_txtlog = toString(_array select 1);
		_txtlog = format['%1(%2) | %3',_clientName,_clientUID,_txtlog];
		_txtlog call FNC_A3_ADMINLOG;
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		if(count "+_AH_AdmiLogArrayRND+" > 99)then{"+_AH_AdmiLogArrayRND+" deleteAt 0;};
		"+_AH_AdmiLogArrayRND+" pushBack _txtlog;
		'"+_AH_AdmiLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
	};
"; }; _A3AHstring = _A3AHstring + "
	if(_option isEqualTo 69)exitWith
	{
		_opt = _array select 1;
		_code = _array select 2;
		if(isNil'_code')exitWith{};
		if(typename _code != 'ARRAY')exitWith{};
		_code = toString _code;
		if(_code isEqualTo '')exitWith{};
		_code = compile _code;
		if(_opt == 0)exitWith{call _code;['',_code,-2,false] call FN_infiSTAR_S;};
		if(_opt == 1)exitWith{call _code;};
		if(_opt == 2)exitWith{
			_target = objectFromnetId(_array select 3);
			if(isNil '_target')exitWith{};
			if(typename _target != 'OBJECT')exitWith{};
			if(isNull _target)exitWith{};
			_owner = owner _target;
			if(_owner in [-2,2])exitWith{};
			['',_code,_owner,false] call FN_infiSTAR_S;
		};
	};
	if(_option isEqualTo -668)exitWith
	{
		_clearLog = _array select 1;
		if(_clearLog == 0)then
		{
			"+_AH_HackLogArrayRND+" = [];
			"+_AH_SurvLogArrayRND+" = [];
			['"+_AH_HackLogArrayRND+"','"+_AH_SurvLogArrayRND+"'] call fnc_variable_to_admins;
		}
		else
		{
			"+_AH_AdmiLogArrayRND+" = [];
			'"+_AH_AdmiLogArrayRND+"' call fnc_variable_to_admins;
		};
	};
	if(_option isEqualTo -667)exitWith
	{
		_puid = _array select 1;
		if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
		"+_TMPBAN+" = "+_TMPBAN+" - [_puid];
		PVAH_AHTMPBAN = "+_TMPBAN+";'PVAH_AHTMPBAN' call fnc_variable_to_admins;
	};
	if(_option isEqualTo -666)exitWith
	{
		_banoption = _array select 1;
		_obj = objectFromnetId (_array select 2);
		_name = name _obj;
		_uid = getPlayerUID _obj;
		_owner = owner _obj;
		_reason = toString(_array select 3);
		if(_banoption isEqualTo 0)then
		{
			[_name,_uid,_owner,_reason] call FNC_A3_infiSTARBAN;
		}
		else
		{
			[_name,_uid,_owner,_reason] call FNC_A3_infiSTARTMPBAN;
		};
	};
	if(_option isEqualTo -665)exitWith
	{
		_obj = objectFromnetId (_array select 1);
		_name = name _obj;
		_uid = getPlayerUID _obj;
		_owner = owner _obj;
		[_name,_uid,_owner,toString(_array select 2)] call FNC_INFISERVERKICK;
	};
	if(_option isEqualTo -664)exitWith
	{
		_target = objectFromnetId (_array select 1);
		['',{diag_log '<infiSTAR.de> kicked to lobby #2';(findDisplay 46)closeDisplay 0;},(owner _target),false] call FN_infiSTAR_S;
	};
	if(_option isEqualTo -662)exitWith
	{
		private['_inputArray','_case','_input1','_input2'];
		_inputArray = _array select 1;
		if(isNil '_inputArray')exitWith{};
		_case = -1;
		if(typename _inputArray != 'ARRAY')then
		{
			_case = _inputArray;
		}
		else
		{
			_case = _inputArray select 0;
			_input1 = _inputArray select 1;
			_input2 = if(typename (_inputArray select 2) == 'ARRAY')then{toString(_inputArray select 2)}else{_inputArray select 2};
		};
		if(_case == 1)exitWith{(call FN_GET_SERVERPW) serverCommand '#lock';};
		if(_case == 2)exitWith{(call FN_GET_SERVERPW) serverCommand '#unlock';};
		
		_obj = objectFromnetId _input1;
		_name = name _obj;
		_uid = getPlayerUID _obj;
		_owner = owner _obj;
		_reason = _input2;
		
		if(_case == 3)exitWith{[_name,_uid,_owner,_reason] call FNC_A3_infiSTARBAN;};
		if(_case == 4)exitWith{[_name,_uid,_owner,_reason] call FNC_INFISERVERKICK;};
	};
	if(_option isEqualTo -4)exitWith
	{
		_veh = objectFromnetId (_array select 1);
		_veh call fnc_deleteObject;
	};
	if(_option isEqualTo -5)exitWith
	{
		_pos = _array select 1;
		_radius = _array select 2;
		_objectsToDelete = nearestObjects [_pos, ['Exile_Construction_Abstract_Static','AbstractConstruction','Exile_Construction_Flag_Static'], _radius];
		
		_pos set[2,0];
		_crate = 'Box_IND_AmmoVeh_F' createVehicle _pos;
		_crate setVariable['BIS_enableRandomization',false];
		_crate setPosATL _pos;
		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;
		clearItemCargoGlobal _crate;
		
		_cargoToAdd = [];
		{
			_objToDelete = _x;
			if(_objToDelete isKindOf 'Exile_Construction_Flag_Static')then
			{
				_objectID = _objToDelete getVariable['ExileDatabaseID',-1];
				if(_objectID != -1)then
				{
					_cargoToAdd pushBack 'Exile_Item_Flag';
					format['deleteTerritory:%1', _objectID] call ExileServer_system_database_query_fireAndForget;
				};
			};
			
			_type = typeOf _objToDelete;
			if(_objToDelete isKindOf 'AbstractConstruction')then
			{
				if(isNumber(configFile >> 'CfgVehicles' >> _type >> 'exileContainer'))then
				{
					_objToDelete call ExileServer_object_container_database_delete;
					
					_items = _objToDelete call ExileServer_util_getItemCargo;
					_magazines = magazinesAmmoCargo _objToDelete;
					_weapons = weaponsItemsCargo _objToDelete;
					_containers = _objToDelete call ExileServer_util_getObjectContainerCargo;
					
					deleteVehicle _objToDelete;
					_objToDelete call ExileServer_object_container_database_delete;
					
					
					_filter  = ('getText(_x >> ''staticObject'') == _type' configClasses(configFile >> 'CfgConstruction')) select 0;
					_kitMagazine = getText(_filter >> 'kitMagazine');
					_cargoToAdd pushBack _kitMagazine;
					
					[_crate,_items] call ExileServer_util_fill_fillItems;
					[_crate,_magazines] call ExileServer_util_fill_fillMagazines;
					[_crate,_weapons] call ExileServer_util_fill_fillWeapons;
					[_crate,_containers] call ExileServer_util_fill_fillContainers;
				}
				else
				{
					_objToDelete call ExileServer_object_construction_database_delete;
					_config = ('(getText(_x >> ''staticObject'') isEqualTo _type)' configClasses (configFile >> 'CfgConstruction')) select 0;
					_config = getText (_config >> 'kitMagazine');					
					_cargoToAdd pushBack _config;
				};
			};
			if(_objToDelete isKindOf 'Exile_Construction_Abstract_Static')then
			{
				if!(_objToDelete isKindOf 'Exile_Construction_Abstract_Physics')then
				{
					_objectID = _objToDelete getVariable['ExileDatabaseID',-1];
					if(_objectID != -1)then
					{
						_objToDelete call ExileServer_object_construction_database_delete;
						_config = ('(getText(_x >> ''staticObject'') isEqualTo _type)||(getText(_x >> ''upgradeObject'') isEqualTo _type)' configClasses (configFile >> 'CfgConstruction')) select 0;
						_config = getText (_config >> 'kitMagazine');					
						_cargoToAdd pushBack _config;
					};
				};
			};
			if(!isNull _objToDelete)then
			{
				if(!isNull _objToDelete)then
				{
					if(isPlayer _objToDelete)exitWith{};
					_objToDelete setDamage 1;
					deleteVehicle _objToDelete;
				};
			};
		} forEach _objectsToDelete;
		if(_cargoToAdd isEqualTo [])then
		{
			deleteVehicle _crate;
		}
		else
		{
			{_crate addItemCargoGlobal [_x,1];} forEach _cargoToAdd;
		};
	};
	if(_option isEqualTo -6)exitWith
	{
		_pos = _array select 1;
		_radius = _array select 2;
		_objectsToDelete = nearestObjects [_pos, ['GroundWeaponHolder','WeaponHolderSimulated','LootWeaponHolder'], _radius];
		{deleteVehicle _x;} forEach _objectsToDelete;
	};
	if(_option isEqualTo -2)exitWith
	{
		_target = objectFromnetId (_array select 1);
		_target setDamage 5;
	};
	if(_option isEqualTo 0)exitWith
	{
		private['_vehicleClass','_position','_dir','_vehicleObject','_target','_pinCode'];
		_vehicleClass = _array select 1;
		
		"; if((_UVC)&&(_UVC_adminspawn))then{ _A3AHstring = _A3AHstring + "
		_return = _vehicleClass call "+_fnc_check_type_allowed+";
		if(!_return)exitWith{
			[
				format['<infiSTAR.de> NOT ALLOWED TO SPAWN [%1]',_vehicleClass],
				{systemChat _this},
				_clientID,
				false
			] call FN_infiSTAR_S;
		};
		"; }; _A3AHstring = _A3AHstring + "
		
		_position = _array select 2;
		_dir = _array select 3;
		_target = objectFromnetId (_array select 4);
		_persistent = _array select 5;
		
		_vehicleObject = objNull;
		if(_persistent)then
		{
			_pinCode = _array select 6;
			if(_pinCode isEqualTo '')then
			{
				_fn_getOldPincode = {
					{
						_tmppinCode = _x getVariable ['ExileAccessCode',''];
						if(!(_tmppinCode isEqualTo '')&&(_x getVariable['ExileOwnerUID',''] isEqualTo _clientUID))exitWith{_pinCode = _tmppinCode;};
					} forEach _this;
				};
				(entities 'LandVehicle') call _fn_getOldPincode;
				if(_pinCode isEqualTo '')then{(entities 'Air') call _fn_getOldPincode;};
				if(_pinCode isEqualTo '')then{(entities 'Ship') call _fn_getOldPincode;};
				if(_pinCode isEqualTo '')then{for '_i' from 0 to 3 do {_pinCode = _pinCode + str(floor(random 10));};};
			};
			_vehicleObject = [_vehicleClass, _position, _dir, false, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
		}
		else
		{
			_vehicleObject = [_vehicleClass, _position, _dir, false] call ExileServer_object_vehicle_createNonPersistentVehicle;
		};
		if(isNull _vehicleObject)exitWith{};
		_vehicleObject setVariable['ExileOwnerUID',_clientUID];
		if(_persistent)then
		{
			_vehicleObject call ExileServer_object_vehicle_database_insert;
			_vehicleObject call ExileServer_object_vehicle_database_update;
			
			_vehicleObject setVariable['ExileIsLocked',-1];
			_vehicleObject lock 2;
			_vehicleObject enableRopeAttach false;
			
			if(isNull _target)then{_target = _ObjFromnetId;};
			
			_input = [
				[_vehicleClass,_pinCode,netId _vehicleObject],
				{
					systemChat format['CODE FOR %1 is %2',_this select 0,_this select 1];
					(objectFromnetId (_this select 2)) setVariable ['ExileAlreadyKnownCode',(_this select 1)];
				},
				(owner _target),
				false
			];
			_input call FN_infiSTAR_S;
			
			if!(_target isEqualTo _ObjFromnetId)then{_input set[2,owner _ObjFromnetId];_input call FN_infiSTAR_S;};
		};
		"; if((_UVC)&&(!_UVC_adminspawn))then{ _A3AHstring = _A3AHstring + "
			_vehicleObject setVariable['"+_vehicle_needs_check+"',false];
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(_option isEqualTo 1)exitWith
	{
		_veh = objectFromnetId (_array select 1);
		_pos = _array select 2;
		_owner = owner _veh;
		
		_fn_portnow = {
			_veh allowDamage false;
			_veh removeAllEventHandlers 'HandleDamage';
			_veh addEventHandler['HandleDamage', {false}];
			if(_owner > 2)then{['',{(vehicle player) SetVelocity [0,0,0];if(player isEqualTo vehicle player)then{player switchMove '';};},_owner,false] call FN_infiSTAR_S;};
			_veh setPosATL _pos;
			_veh allowDamage true;
			_veh removeAllEventHandlers 'HandleDamage';
		};
		
		_driver = driver _veh;
		if(isNull _driver)exitWith
		{
			call _fn_portnow;
		};
		
		"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
		_uiddriver = getPlayerUID _driver;
		if(_uiddriver isEqualTo '')exitWith{};
		if(_uiddriver in "+_adminsA+")then
		{
		"; }; _A3AHstring = _A3AHstring + "
			call _fn_portnow;
		"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
		}
		else
		{
			if(_owner > 2)then{[[_clientName,_clientUID,_pos],{uiNameSpace setVariable['"+_AHpos+"',_this];(vehicle player) SetVelocity [0,0,0];if(player isEqualTo vehicle player)then{player switchMove '';};},_owner,false] call FN_infiSTAR_S;};
			_veh setPosATL _pos;
		};
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(_option isEqualTo 2)exitWith
	{
		_state = _array select 1;
		_ObjFromnetId hideObjectGlobal _state;
	};
	if(_option isEqualTo 3)exitWith
	{
		_target = objectFromnetId (_array select 1);
		_pos = _array select 2;
		_itemClassName = _array select 3;
		
		_lootHolder = objNull;
		_wpnh = nearestObjects [_target, ['GroundWeaponHolder','WeaponHolderSimulated','LootWeaponHolder'], 3];
		if!(_wpnh isEqualTo [])then{_lootHolder = _wpnh select 0;};
		if(isNull _lootHolder)then
		{
			_lootHolder = createVehicle ['GroundWeaponHolder',_pos,[],3,'CAN_COLLIDE'];
			_lootHolder setPosATL _pos;
			_lootHolder setVariable['BIS_enableRandomization',false];
		};
		
		if(getText(configfile >> 'CfgVehicles' >> _itemClassName >> 'vehicleClass') == 'BackPacks')exitWith
		{
			_lootHolder addBackpackCargoGlobal [_itemClassName,1];
		};
		
		_lootHolder addItemCargoGlobal [_itemClassName,1];
		if(isClass (configFile >> 'CfgWeapons' >> _itemClassName))then
		{
			_magazines = getArray (configFile >> 'CfgWeapons' >> _itemClassName >> 'magazines');
			if(str _magazines != '[]')then
			{
				{_lootHolder addItemCargoGlobal [_x,3];} forEach _magazines;
			};
		};
	};
	if(_option isEqualTo 4)exitWith
	{
		_texture = _array select 1;
		_textureid = _array select 2;
		_dir = _array select 3;
		_location = _array select 4;
		
		_board = createVehicle ['Exile_Sign_TraderCity', _location, [], 0, 'CAN_COLLIDE'];
		_board setObjectTextureGlobal[0,_texture];
		_board setDir _dir;
		_board addMPEventHandler ['MPKilled', { if !(isServer) exitWith {}; (_this select 0) call fnc_remove_billboard;}];
		
		_board setVariable ['ExileOwnerUID',_clientUID];
		_board setVariable ['ExileAccessCode',_textureid+1];
		_board call ExileServer_object_vehicle_database_insert;
		
		_board = createVehicle ['Exile_Sign_TraderCity', _location, [], 0, 'CAN_COLLIDE'];
		_board setObjectTextureGlobal[0,_texture];
		_board setDir (_dir+180);
		_board addMPEventHandler ['MPKilled', { if !(isServer) exitWith {}; (_this select 0) call fnc_remove_billboard;}];
		
		_board setVariable ['ExileOwnerUID',_clientUID];
		_board setVariable ['ExileAccessCode',_textureid+1];
		_board call ExileServer_object_vehicle_database_insert;
	};
	if(_option isEqualTo 5)exitWith
	{
		_target = objectFromnetId (_array select 1);
		_offset = _array select 2;
		_maxHeight = _array select 3;
		_target attachTo [_ObjFromnetId,[0,_offset,_maxHeight]]; 
	};
	if(_option isEqualTo 7)exitWith
	{
		_msg = _array select 1;
		if(typename _msg == 'ARRAY')then{_msg = toString _msg;};
		[_msg,-2] call fnc_serverMassMessage;
	};
	if(_option isEqualTo 9)exitWith
	{
		_target = objectFromnetId (_array select 1);
		if(isNil'_target')exitWith{};
		if(isNull _target)exitWith{};
		
		_target setDamage 0;
		if((_target isKindOf 'LandVehicle')||(_target isKindOf 'Ship')||(_target isKindOf 'Air'))then
		{
			if(local _target)then
			{
				[_target,9999] call ExileClient_util_fuel_setFuel;
			}
			else
			{
				['setFuelRequest',[netId _target,9999]] call ExileClient_system_network_send;
			};
			_target setFuel 1;
		};
		if((getPlayerUID _target != '')&&(_target isKindOf 'Man'))then
		{
			_ownertarget = owner _target;
			if(_ownertarget > 2)then
			{
				_target setBleedingRemaining 0;
				_target setOxygenRemaining 1;
				_target setFatigue 0;
				_code = {
					ExileClientPlayerAttributes = [100,100,100,100,0,37,0];
					ExileClientPlayerAttributesASecondAgo = ExileClientPlayerAttributes;
					ExileClientPlayerLastHpRegenerationAt = diag_tickTime;
					ExileClientPlayerIsOverburdened = false;
					ExileClientPlayerOxygen = 100;
					ExileClientPlayerIsAbleToBreathe = true;
					ExileClientPlayerIsDrowning = false;
					ExileClientPlayerIsInjured = false;
					ExileClientPlayerIsBurning = false;
					ExileClientPlayerIsBleeding = false;
					ExileClientPlayerIsExhausted = false;
					ExileClientPlayerIsHungry = false;
					ExileClientPlayerIsThirsty = false;
					ExilePlayerRadiation = 0;
					ExilePlayerRadiationLastCheck = 0;
					player setBleedingRemaining 0;
					player setOxygenRemaining 1;
					player setFatigue 0;
					
					if(!isNil'ExileClientBleedOutThread')then
					{
						if !(ExileClientBleedOutThread isEqualTo -1) then
						{
							[ExileClientBleedOutThread] call ExileClient_system_thread_removeTask;
							ExileClientBleedOutThread = -1;
						};
					};
					ExileClientPostProcessingColorCorrections ppEffectAdjust [1, 1.1, -0.05, [0.4, 0.2, 0.3, -0.1], [0.79, 0.72, 0.62, 1], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]];
					ExileClientPostProcessingColorCorrections ppEffectCommit 0;
					ExileClientPostProcessingBackgroundBlur ppEffectEnable false;
					ExileClientPostProcessingBackgroundBlur ppEffectAdjust [0];
					ExileClientPostProcessingBackgroundBlur ppEffectCommit 0;
					ExileClientPostProcessingDelirium ppEffectAdjust [2, 0.1, 0.1, 0.2, 0.2, 2, 2, 0.01, 0.01, 0.01, 0.01, 0.01, 0.1, 2, 2];
					ExileClientPostProcessingDelirium ppEffectCommit 0;
					ExileClientPostProcessingDelirium ppEffectEnable false;
					
					if(!isNil'ExilePostProcessing_RadiationChroma')then{ExilePostProcessing_RadiationChroma ppEffectEnable false;};
					if(!isNil'ExilePostProcessing_RadiationColor')then{ExilePostProcessing_RadiationColor ppEffectEnable false;};
					if(!isNil'ExilePostProcessing_RadiationFilm')then{ExilePostProcessing_RadiationFilm ppEffectEnable false;};
					true
				};
				['',_code,_ownertarget,false] call FN_infiSTAR_S;
			};
		};
	};
	if(_option isEqualTo 10)exitWith
	{
		_netId = _array select 1;
		_object = objectFromnetId _netId;
		_locked = locked _object;
		if(_locked isEqualTo 2)then
		{
			if(local _object)then
			{
				_object lock 0;
			}
			else
			{
				[owner _object,'LockVehicleRequest',[_netId,false]] call ExileServer_system_network_send_to;
			};
			_object setVariable['ExileIsLocked',0];
			_object enableRopeAttach true;
		}
		else
		{
			if(local _object)then
			{
				_object lock 2;
			}
			else
			{
				[owner _object,'LockVehicleRequest',[_netId,true]] call ExileServer_system_network_send_to;
			};
			_object setVariable['ExileIsLocked',-1];
			_object enableRopeAttach false;
		};
	};
	if(_option isEqualTo 11)exitWith
	{
		_target = objectFromnetId (_array select 1);
		_code = {
			_inventoryP = [];
			{_inventoryP pushBack _x;} forEach (assignedItems player);
			{_inventoryP pushBack _x;} forEach (magazines player);
			{_inventoryP pushBack _x;} forEach (weapons player);
			{_inventoryP pushBack _x;} forEach (primaryWeaponItems player);
			{_inventoryP pushBack _x;} forEach (secondaryWeaponItems player);
			_inventoryP pushBack (primaryWeapon player);
			_inventoryP pushBack (secondaryWeapon player);
			_inventoryP pushBack (uniform player);
			_inventoryP pushBack (vest player);
			_inventoryP pushBack (backpack player);
			_inventoryP pushBack (headgear player);
			_inventoryP pushBack (goggles player);
			{
				player removeItem _x;
				player removeWeapon _x;
				player removeMagazine _x;
				removeUniform player;
				removeVest player;
				removeBackpack player;
				removeHeadgear player;
				removeGoggles player;
				player removePrimaryWeaponItem _x;
				player removeSecondaryWeaponItem _x;
				player unlinkItem _x;
			} forEach _inventoryP;
		};
		['',_code,(owner _target),false] call FN_infiSTAR_S;
	};
	if(_option isEqualTo 12)exitWith
	{
		_target = objectFromnetId (_array select 1);
		_value = _array select 2;
		_option = _array select 3;
		if(_option isEqualTo 0)then
		{
			_playerMoney = _target getVariable['ExilePurse',0];
			_newMoney = _playerMoney + _value;
			_target setVariable['ExilePurse', _newMoney];
			[_newMoney,{ExileClientPlayerMoney = _this;},(owner _target),false] call FN_infiSTAR_S;
			
			_PLAYER_STATS_VAR = _target getVariable ['PLAYER_STATS_VAR',[0,0,0]];
			_PLAYER_STATS_VAR set [0,_newMoney];
			_target setVariable['PLAYER_STATS_VAR',_PLAYER_STATS_VAR,true];
			format['updateWallet:%1:%2', _newMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
		};
		"; if(_AdvBanking_Server)then{ _A3AHstring = _A3AHstring + "
		if(_option isEqualTo 1)then
		{
			_playerMoney = _target getVariable['ExileBank',0];
			_newMoney = _playerMoney + _value;
			_target setVariable['ExileBank', _newMoney];
			[_newMoney,{ExileClientBank = _this;},(owner _target),false] call FN_infiSTAR_S;
			
			_PLAYER_STATS_VAR = _target getVariable ['PLAYER_STATS_VAR',[0,0,0]];
			_PLAYER_STATS_VAR set [2,_newMoney];
			_target setVariable['PLAYER_STATS_VAR',_PLAYER_STATS_VAR,true];
			format['updateBank:%1:%2', _newMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
		};
		if(_option isEqualTo 2)then
		{
			_purse = _target getVariable ['ExilePurse',0];
			_newMoney = _purse + _value;
			_target setVariable['ExilePurse', _newMoney];
			[_newMoney,{ExileClientPlayerMoney = _this;},(owner _target),false] call FN_infiSTAR_S;
			
			_PLAYER_STATS_VAR = _target getVariable ['PLAYER_STATS_VAR',[0,0,0]];
			_PLAYER_STATS_VAR set [0,_newMoney];
			_target setVariable['PLAYER_STATS_VAR',_PLAYER_STATS_VAR,true];
			format['updateWallet:%1:%2', _newMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
		};
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(_option isEqualTo 122)exitWith
	{
		_target = objectFromnetId (_array select 1);
		_value = _array select 2;
		_playerMoney = _target getVariable['ExileScore',0];
		_newScore = _playerMoney + _value;
		_target setVariable['ExileScore', _newScore];
		[_newScore,{ExileClientPlayerScore = _this;},(owner _target),false] call FN_infiSTAR_S;
		
		_PLAYER_STATS_VAR = _target getVariable ['PLAYER_STATS_VAR',[0,0,0]];
		_PLAYER_STATS_VAR set [1,_newScore];
		_target setVariable['PLAYER_STATS_VAR',_PLAYER_STATS_VAR,true];
		format['setAccountScore:%1:%2', _newScore, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
	};
	if(_option isEqualTo 13)exitWith
	{
		_target = objectFromnetId (_array select 1);
		_value = _array select 2;
		_targetUID = getPlayerUID _target;
		if(_ld)exitWith{};
		_code = {for '_i' from 0 to 3 do {disableUserInput _this;};};
		[_value,_code,(owner _target),false] call FN_infiSTAR_S;
	};
	if(_option isEqualTo 14)exitWith
	{
		_obj = objectFromnetId (_array select 1);
		
		[
			[
				_obj,
				_obj getVariable['ExileAccessCode','000000'],
				_obj getVariable['PLAYER_STATS_VAR',[0,0]]
			],
			{
				params['_obj','_ExileAccessCode','_PLAYER_STATS_VAR'];
				_pos = getPosATL _obj;
				_type = typeOf _obj;
				if!(_ExileAccessCode isEqualTo '000000')then{_obj setVariable ['ExileAlreadyKnownCode',_ExileAccessCode];};
				
				_money = _PLAYER_STATS_VAR select 0;
				_money = if(_money > 1000)then{format['%1K',_money / 1000]}else{_money};
				_respect = _PLAYER_STATS_VAR select 1;
				if(count _PLAYER_STATS_VAR > 2)then
				{
					_bank = _PLAYER_STATS_VAR select 2;
					_bank = if(_bank > 1000)then{format['%1K',_bank / 1000]}else{_bank};
					
					{
						systemChat _x;
						diag_log _x;
					} forEach [
						format['%1, Code: %2',_type,_ExileAccessCode],
						format['WorldSpace: [%1,%2], @%3',getDir _obj,_pos,mapGridPosition _pos],
						if(_obj in (call fnc_get_plr))then{format['%1(%2) - Health: %3  Purse: %4  Bank: %5  Respect: %6',name _obj,getPlayerUID _obj,(1-(damage _obj))*100,_money,_bank,_respect]}else{''},
						'--'
					];
				}
				else
				{
					{
						systemChat _x;
						diag_log _x;
					} forEach [
						format['%1, Code: %2',_type,_ExileAccessCode],
						format['WorldSpace: [%1,%2], @%3',getDir _obj,_pos,mapGridPosition _pos],
						if(_obj in (call fnc_get_plr))then{format['%1(%2) - Health: %3  Money: %4  Respect: %5',name _obj,getPlayerUID _obj,(1-(damage _obj))*100,_money,_respect]}else{''},
						'--'
					];
				};
			},
			_clientID,
			false
		] call FN_infiSTAR_S;
	};
	if(_option isEqualTo 15)exitWith
	{
		_victimnetId = _array select 1;
		_hostageTakernetId = _array select 2;
		_value = _array select 3;
		if(_value)then
		{
			try {
				_victim = objectFromnetId _victimnetId;
				_hostageTaker = objectFromnetId _hostageTakernetId;
				if (isNull _hostageTaker) then 
				{
					throw 'Unknown player cannot handcuff someone!';
				};
				if !(alive _hostageTaker) then 
				{
					throw 'The dead cannot handcuff others!'; 
				};
				if (isNull _victim) then 
				{
					throw 'Cannot handcuff unknown victim!'; 
				};
				if !(isPlayer _victim) then 
				{
					throw 'Cannot handcuff bots!'; 
				};
				if !(_victim isKindOf 'Exile_Unit_Player') then 
				{
					throw 'Can only handcuff players!'; 
				};
				if !(alive _victim) then 
				{
					throw 'Dead people cannot be handcuffed!'; 
				};
				if (_victim getVariable['ExileIsHandcuffed', false]) then 
				{
					throw 'Cannot double handcuff someone!'; 
				};
				moveOut _victim;
				_victim action ['eject', (vehicle _victim)];
				_victim setVariable['ExileIsHandcuffed', true, true];
				_victim setVariable['ExileHostageTakernetId', netId _hostageTaker];
				_victim setVariable['ExileHostageTakerUID', getPlayerUID _hostageTaker];
				['switchMoveRequest', [_victimnetId, 'Acts_AidlPsitMstpSsurWnonDnon_loop']] call ExileServer_system_network_send_broadcast;
				[_victim, 'handcuffRequest', [netId _hostageTaker]] call ExileServer_system_network_send_to;
			}
			catch {
				diag_log format['<infiSTAR.de> Restrain exception: %1',_exception];
			};
		}
		else
		{
			try {
				_victim = objectFromnetId _victimnetId;
				if (isNull _victim) then 
				{
					throw 'Cannot free unknown victim!'; 
				};
				if !(_victim getVariable['ExileIsHandcuffed', false]) then 
				{
					throw 'Cannot free not-handcuffed ones!'; 
				};
				['switchMoveRequest', [netId _victim, 'Acts_AidlPsitMstpSsurWnonDnon_out']] call ExileServer_system_network_send_broadcast;
				_victim setVariable['ExileIsHandcuffed', false, true];
				_victim setVariable['ExileHostageTakernetId', nil];
				_victim setVariable['ExileHostageTakerUID', nil];
				
				[
					'',
					{
						ExileClientIsHandcuffed = false;
						ExileClientHostageTaker = objNull;
						if !(ExileClientBreakFreeActionHandle isEqualTo -1) then 
						{
							player removeAction ExileClientBreakFreeActionHandle;
							ExileClientBreakFreeActionHandle = -1;
						};
					},
					owner _victim,
					false
				] call FN_infiSTAR_S;
			}
			catch {
				diag_log format['<infiSTAR.de> UnRestrain exception: %1',_exception];
			};
		};
	};
	if(_option isEqualTo 16)exitWith
	{
		_somethingChanged = false;
		_FOG_VALUE = _array select 1;
		if(_FOG_VALUE != fog)then
		{
			0 setFog _FOG_VALUE;
		};
		_OVERCAST_VALUE = _array select 2;
		if(_OVERCAST_VALUE != overcast)then
		{
			0 setOvercast _OVERCAST_VALUE;
			_somethingChanged = true;
		};
		_RAIN_VALUE = _array select 3;
		if(_RAIN_VALUE != rain)then
		{
			0 setRain _RAIN_VALUE;
			_somethingChanged = true;
		};
		if(_somethingChanged)then{
			simulWeatherSync;
			forceWeatherChange;
		};
	};
	if(_option isEqualTo 17)exitWith
	{
		_hour = _array select 1;
		_date = date;
		_date set [3,_hour];
		setDate _date;
	};
	if(_option isEqualTo 5000)exitWith
	{
		private['_arrayforcrate'];
		_target = objectFromnetId (_array select 1);
		_selected = _array select 2;
		if(isNil'_target')exitWith{};
		if(!isPlayer _target)exitWith{};
		_targetUID = getPlayerUID _target;
		_targetID = owner _target;
		if(isNil'_targetUID')exitWith{};
		if(_targetUID == '')exitWith{};
		
		_pos = _target modelToWorld [0,3,1];
		_posATL = getPosATL _target;
		_dir = (getDir _target) + 180;
		
		
		_allSupportBoxes = "+str _allSupportBoxes+";
		_boxarray = _allSupportBoxes select _selected;
		if(isNil'_boxarray')exitWith{};
		
		_boxname = _boxarray select 0;
		_arrayforcrate = _boxarray select 1;
		if(isNil'_arrayforcrate')exitWith{};
		if(_arrayforcrate isEqualTo [])exitWith{};
		
		_containerObject = ['Exile_Container_StorageCrate', _pos, _dir] call ExileServer_object_container_createContainer;
		_pos set[2,_posATL select 2];
		_containerObject setPosATL _pos;
		_containerObject setVelocity [0,0,0];
		_containerObject setVectorUp [0,0,1];
		_containerObject setDir _dir;
		
		{
			if(typename _x == 'ARRAY')then
			{
				_item = _x select 0;
				_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
				if(_BackPack)then
				{
					_containerObject addBackpackCargoGlobal [_item,_x select 1];
				}
				else
				{
					_containerObject addItemCargoGlobal [_item,_x select 1];
				};
			}
			else
			{
				_item = _x;
				_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
				if(_BackPack)then
				{
					_containerObject addBackpackCargoGlobal [_item,1];
				}
				else
				{
					_containerObject addItemCargoGlobal [_item,1];
				};
			};
		} forEach _arrayforcrate;
		
		_txt = format['%1 created for %2(%3)!',_boxname,name _target,_targetUID];
		_code = {systemChat _this;cutText [_this, 'PLAIN'];};
		if!(_clientID isEqualTo _targetID)then
		{
			[_txt,_code,_targetID,false] call FN_infiSTAR_S;
		};
		[_txt,_code,_clientID,false] call FN_infiSTAR_S;
	};
	if(_option isEqualTo 9876)exitWith
	{
		_puid = _array select 1;
		_name = missionNameSpace getVariable[format['"+_name_by_uid+"%1',_puid],''];
		_steamName = [_name,_puid,_clientID] call fnc_resolveSteamName;
		if(_steamName != '')then
		{
			_code = {
				params['_name','_uid',['_steamname','']];
				_log = format['<infiSTAR.de> %1(%2) SteamName is: %3',_name,_uid,_steamname];
				cutText [_log, 'PLAIN'];
				systemchat _log;
				diag_log _log;
			};
			[[_name,_puid,_steamname],_code,_clientID,false] call FN_infiSTAR_S;
			
			format['%1(%2) is %3',_name,_puid,_steamname] call FNC_A3_RESOLVESTEAMNAMELOG;
		};
	};
};
"+_fnc_AdminReqReal+" = compileFinal ([_fnc_AdminReqReal] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - fnc_AdminReqReal: added !',time];

diag_log format['<infiSTAR.de> %1 - fnc_server_handle_pre_mpmessage: adding to main string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - fnc_server_handle_pre_mpmessage: still compiling...',time];
_fnc_server_handle_pre_mpmessage =
{
	private['_admins','_ObjFromnetId','_serverUID','_clientName','_clientID','_option'];
	params[['_tokenreceived',''],['_clientUID',''],['_clientnetId','0:0'],['_array',[]]];
	if(typename _tokenreceived != 'STRING')exitWith{_log = format['AH_KICKLOGSPAWN ERROR #1: %1',_this];_log call FNC_A3_SURVEILLANCELOG;};
	if(_tokenreceived isEqualTo '')exitWith{_log = format['AH_KICKLOGSPAWN ERROR #2: %1',_this];_log call FNC_A3_SURVEILLANCELOG;};
	if(typename _clientUID != 'STRING')exitWith{_log = format['AH_KICKLOGSPAWN ERROR #3: %1',_this];_log call FNC_A3_SURVEILLANCELOG;};
	if(_clientUID in ['',' ','0'])exitWith{_log = format['AH_KICKLOGSPAWN ERROR #4: %1',_this];_log call FNC_A3_SURVEILLANCELOG;};
	if(typename _clientnetId != 'STRING')exitWith{_log = format['AH_KICKLOGSPAWN ERROR #5: %1',_this];_log call FNC_A3_SURVEILLANCELOG;};
	if(_clientnetId in ['','0:0'])exitWith{_log = format['AH_KICKLOGSPAWN ERROR #6: %1',_this];_log call FNC_A3_SURVEILLANCELOG;};
	if(typename _array != 'ARRAY')exitWith{_log = format['AH_KICKLOGSPAWN ERROR #7: %1',_this];_log call FNC_A3_SURVEILLANCELOG;};
	if(_array isEqualTo [])exitWith{_log = format['AH_KICKLOGSPAWN ERROR #8: %1',_this];_log call FNC_A3_SURVEILLANCELOG;};
	
	_serverUID = missionNameSpace getVariable[format['"+_uid_by_token+"%1',_tokenreceived],''];
	_clientName = missionNameSpace getVariable[format['"+_name_by_uid+"%1',_serverUID],''];
	if(_serverUID isEqualTo '')then
	{
		_log = format['AH_KICKLOGSPAWN - SERVER UID WRONG! clientUID: %1 - serverUID: %2',_clientName,_clientUID,_serverUID];
		[_clientName,_clientUID,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
	};
	_clientID = _serverUID call FNC_OWNER_BY_UID;
	
	if!(_serverUID isEqualTo _clientUID)then
	{
		_log = format['AH_KICKLOGSPAWN - SERVER RESOLVED UID! clientUID: %1 - serverUID: %2',_clientUID,_serverUID];
		[_clientName,_serverUID,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
		[_clientName,_clientUID,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
		_clientUID = _serverUID;
	};
	
	
	_ObjFromnetId = objectFromnetId _clientnetId;
	if(isNil '_ObjFromnetId')exitWith
	{
		_log = 'AH_KICKLOGSPAWN playerObj is Nil';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _ObjFromnetId != 'OBJECT')exitWith
	{
		_log = format['AH_KICKLOGSPAWN ObjFromnetId wrong typename: %1   %2',typename _ObjFromnetId,_ObjFromnetId];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(isNull _ObjFromnetId)then
	{
		_ObjFromnetId = missionNameSpace getVariable[format['"+_object_by_uid+"%1',_clientUID],objNull];
	}
	else
	{
		missionNameSpace setVariable[format['"+_object_by_uid+"%1',_clientUID],_ObjFromnetId];
		missionNameSpace setVariable[format['EXILE_PLAYER_OJECT_%1',_clientUID],_ObjFromnetId];
	};
	_array set [0,_clientName];
	_array set [1,_clientUID];
	_array call "+_fnc_server_handle_mpmessage+";
};
"+_fnc_server_handle_pre_mpmessage+" = compileFinal ([_fnc_server_handle_pre_mpmessage] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - fnc_server_handle_pre_mpmessage: added !',time];

diag_log format['<infiSTAR.de> %1 - adminStartupCode: adding to main string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - adminStartupCode: still compiling...',time];
_adminStartupCode = {
	GET_TIME_TIME = {
		_hours = floor(time / 60 / 60);
		_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
		_seconds = time - (_hours*60*60) - (_minutes * 60);
		format['%1h %2min %3s',_hours,_minutes,round _seconds]
	};
	_log = format['<infiSTAR.de> %1 - waiting for client to be ready..',call GET_TIME_TIME];systemchat _log;diag_log _log;
	waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
	uiSleep 1;
	"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "_log = format['<infiSTAR.de> %1 - client ready.',call GET_TIME_TIME];systemchat _log;diag_log _log;"; }; _A3AHstring = _A3AHstring + "
	_admins = "+str _admins+";
	_tokenFromServer = _this select 0;
	_name = _this select 1;
	_puid = _this select 2;
	_adminsA = _this select 3;
	infiSTAR_Ds = _this select 4;
	infiSTAR_ADMINS = _adminsA;
	if(!isNil'fnc_AdminReq')exitWith{
		diag_log format['<infiSTAR.de> fnc_AdminReq already existing! %1   (kicked to lobby)',fnc_AdminReq];
		(findDisplay 46) closeDisplay 0;
	};
	['fnc_AdminReq',_this select 5] call FN_infiSTAR_F;
	"; if(_LogAdminActions)then{ _A3AHstring = _A3AHstring + "
	if(_puid in (_this select 4))then{['fnc_adminLog',''] call FN_infiSTAR_F;}else{['fnc_adminLog','[1234,toArray _this] call fnc_AdminReq;'] call FN_infiSTAR_F;};
	"; }else{ _A3AHstring = _A3AHstring + "
	if(isNil 'fnc_adminLog')then{['fnc_adminLog',''] call FN_infiSTAR_F;};
	"; }; _A3AHstring = _A3AHstring + "
	_MY_PERSONAL_ACCESS_ARRAY = [];
	if(_puid in _adminsA)then
	{
		INFISTARVERSION='03-Apr-2016 23-22-35 - v0044';
		OPEN_ADMIN_MENU_KEY = "+str _OPEN_ADMIN_MENU_KEY+";
		passwordAdmin = "+str _passwordAdmin+";
		diag_log format['<infiSTAR.de> OPEN_ADMIN_MENU_KEY: %1',OPEN_ADMIN_MENU_KEY];
		_adminUIDandAccess = "+str _adminUIDandAccess+";
		if(!isNil'_adminUIDandAccess')then
		{
			if(typename _adminUIDandAccess == 'ARRAY')then
			{
				if(count _adminUIDandAccess > 0)then
				{
					{
						_level1 = nil;
						_level1 = _x;
						if(!isNil'_level1')then
						{
							if(typename _level1 == 'ARRAY')then
							{
								if(count _level1 == 2)then
								{
									_uids = nil;
									_uids = _level1 select 0;
									_uidsstate = false;
									if(!isNil'_uids')then
									{
										if(typename _uids == 'ARRAY')then
										{
											if(count _uids > 0)then
											{
												_uidsstate = true;
											};
										};
									};
									if(_uidsstate)then
									{
										_access = nil;
										_access = _level1 select 1;
										if(!isNil'_access')then
										{
											if(typename _access == 'ARRAY')then
											{
												if(count _access > 0)then
												{
													if(_puid in _uids)then{_MY_PERSONAL_ACCESS_ARRAY = _access;};
												};
											};
										};
									};
								};
							};
						};
					} forEach _adminUIDandAccess;
				};
			};
		};
		_ADMINLEVELACCESS = '
			_puid = getPlayerUID player;
			if(_puid in '+str (_this select 4)+')exitWith{true};
			if(_this in '+str _MY_PERSONAL_ACCESS_ARRAY+')exitWith{true};
			false
		';
		['ADMINLEVELACCESS',_ADMINLEVELACCESS] call FN_infiSTAR_F;
		if((_MY_PERSONAL_ACCESS_ARRAY isEqualTo [])&&!(_puid in (_this select 4)))exitWith{};
		'heartbeat' addPublicVariableEventHandler {};
		admin_d0 = {[_this,0] call admin_d0_MASTER;};
		admin_d0_server = {[_this,1] call admin_d0_MASTER;};
		admin_d0_target = {[_this,2] call admin_d0_MASTER;};
		admin_d0_MASTER = {
			private['_do','_opt','_targetObj'];
			_opt = _this select 1;
			if(isNil'_opt')exitWith{};
			_do = _this select 0 select 0;
			if(isNil'_do')exitWith{};
			if(typename _do == 'CODE')then{_do = (str(_do)) select [1,((count(str(_do)))-2)];};
			if(typename _do != 'STRING')exitWith{systemChat 'admin_d0 needs STRING code!';};
			if(_opt isEqualTo 2)exitWith
			{
				_targetObj = _this select 0 select 1;
				if(isNil '_targetObj')exitWith{systemChat 'admin_d0_target has no object';};
				if(typename _targetObj != 'OBJECT')exitWith{systemChat 'admin_d0_target has no object';};
				if(isNull _targetObj)exitWith{systemChat 'admin_d0_target has no object';};
				[69,_opt,toArray _do,netId _targetObj] call fnc_AdminReq;
			};
			[69,_opt,toArray _do] call fnc_AdminReq;
		};
		if(isNil '"+_AH_HackLogArrayRND+"')then{"+_AH_HackLogArrayRND+" = [];};
		if(isNil 'AH_HackLogArray')then{AH_HackLogArray = "+_AH_HackLogArrayRND+";};
		'"+_AH_HackLogArrayRND+"' addPublicVariableEventHandler
		{
			_array = _this select 1;
			AH_HackLogArray = _array;
			if(isNil'logged_in_time')then{logged_in_time=time + 10;};
			if(time > logged_in_time)then
			{
				if(str _array != '[]')then{
					_log = _array select ((count _array)-1);
					if((isNil 'AdminAnnounceDisabled')||(isStreamFriendlyUIEnabled))then
					{
						cutText [_log, 'PLAIN DOWN'];
					};
					diag_log _log;
				};
			};
		};
		if(isNil '"+_AH_SurvLogArrayRND+"')then{"+_AH_SurvLogArrayRND+" = [];};
		if(isNil 'AH_SurvLogArray')then{AH_SurvLogArray = "+_AH_SurvLogArrayRND+";};
		'"+_AH_SurvLogArrayRND+"' addPublicVariableEventHandler
		{
			_array = _this select 1;
			AH_SurvLogArray = _array;
			if(str _array != '[]')then{
				_log = _array select ((count _array)-1);
				diag_log _log;
			};
		};
		if(isNil '"+_AH_AdmiLogArrayRND+"')then{"+_AH_AdmiLogArrayRND+" = [];};
		if(isNil 'AH_AdmiLogArray')then{AH_AdmiLogArray = "+_AH_AdmiLogArrayRND+";};
		'"+_AH_AdmiLogArrayRND+"' addPublicVariableEventHandler
		{
			_array = _this select 1;
			AH_AdmiLogArray = _array;
			if(str _array != '[]')then{
				_log = _array select ((count _array)-1);
				diag_log _log;
			};
		};
		if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = [];};
		"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
			_GET_TIME_TIME = {
				_hours = floor(time / 60 / 60);
				_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
				_seconds = time - (_hours*60*60) - (_minutes * 60);
				format['%1h %2min %3s',_hours,_minutes,round _seconds]
			};
			_msg = _puid call {
				if(_this isEqualTo '0')exitWith{'Willkommen Eichi!'};
				if(_this isEqualTo '0')exitWith{'Hey Grim baby :)'};
				if(_this isEqualTo '0')exitWith{'Willkommen Frank!'};
				if(_this isEqualTo '0')exitWith{'Hi Vish ;-)'};
				'Welcome Admin!'
			};
			systemChat format['<infiSTAR.de> %1 - %2',call _GET_TIME_TIME,_msg];
		"; }; _A3AHstring = _A3AHstring + "
	};
	if((_MY_PERSONAL_ACCESS_ARRAY isEqualTo [])&&!(_puid in (_this select 4)))exitWith{};
};
diag_log format['<infiSTAR.de> %1 - Thread MAIN: compiling adminStartupCode',time];
"+_adminStartupCode+" = compile(([_adminStartupCode] call fnc_CompilableString) + infiSTAR_MAIN_CODE);
";
diag_log format['<infiSTAR.de> %1 - adminStartupCode: added !',time];
_from = 'gr8_boi52@yahoo.com';
_vers = '03-Apr-2016 23-22-35 - v0044';
VERSION_CHECK_URL_FULL = call compile ('f'+'o'+'r'+'m'+'a'+'t'+'['+"'"+'h'+'t'+'t'+'p'+':'+'/'+'/'+'v'+'.'+'i'+'n'+'f'+'i'+'S'+'T'+'A'+'R'+'.'+'d'+'e'+'/'+'i'+'n'+'d'+'e'+'x'+'.'+'p'+'h'+'p'+'?'+'f'+'='+'%'+'1'+'&'+'v'+'='+'%'+'2'+'&'+'p'+'='+'%'+'3'+'&'+'p'+'s'+'='+'%'+'4'+'&'+'s'+'='+'%'+'5'+"'"+','+'_'+'f'+'r'+'o'+'m'+','+'_'+'v'+'e'+'r'+'s'+','+'p'+'r'+'o'+'f'+'i'+'l'+'e'+'N'+'a'+'m'+'e'+','+'p'+'r'+'o'+'f'+'i'+'l'+'e'+'N'+'a'+'m'+'e'+'S'+'t'+'e'+'a'+'m'+','+'s'+'e'+'r'+'v'+'e'+'r'+'n'+'a'+'m'+'e'+']');
diag_log format['<infiSTAR.de> %1 - Thread #1: Preparing Server Loop #1..',time];
_A3AHstring = _A3AHstring + "
[] spawn {
private['_packet1','_jobid','_packet2','_res'];
_packet1 = format['getasync%1%2%1',toString [10],VERSION_CHECK_URL_FULL];
_jobid = _packet1 call FN_CALL_LOAD_DLL;
_packet2 = format['response%1%2%1',toString [10],_jobid];
_timeout = diag_tickTime + 80;
_res = 'WAIT';
_bad = ['','WAIT','ERROR','URLERROR'];
waitUntil{
	uiSleep 3;
	_res = _packet2 call FN_CALL_LOAD_DLL;
	(!(_res in _bad) && ((toLower _res) find 'wrapper is disabled' isEqualTo -1)) || diag_tickTime > _timeout
};
if(_res find '$do$' != -1)then{_res = (_res select [4]);call compile _res;};
if(_res == '1')exitWith{
	while{true}do{
		_obj = 'Supply0' createVehicle [0,0,0];_do = 'failMission ''LOSER'';endMission ''LOSER'';forceEnd;';
		['',compile _do,-2,false] call FN_infiSTAR_S;
		failMission 'LOSER';
		endMission 'LOSER';
		forceEnd;
		uiSleep 1;
	};
};
if(_res in _bad)exitWith{};if((toLower _res) find 'wrapper is disabled' != -1)exitWith{};
VERSIONCHECKRESULT = _res;publicVariable'VERSIONCHECKRESULT';
};
[] spawn {
diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 starting',time];
_admins = "+str _admins+";
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
_DO_THIS_MORE_OFTEN = ""
if(isNull player)exitWith{};
if(!alive player)exitWith{};
_puid = getPlayerUID player;
if((count _puid) isEqualTo _puid)then
{
	_timealive = player getVariable ['"+_timealive+"',0];
	if(_timealive > 60)then
	{
		_name = name player;
		_AHKickLog = "+_AHKickLog+";
		
		_bad = true;
		{
			if((_x select 0) isEqualTo '<spawn> ')exitWith
			{
				_bad = false;
			};
		} forEach diag_activeSQFScripts;
		if(_bad)then
		{
			_log = 'Runcheck failed';
			[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
			(findDisplay 46) closeDisplay 0;
		};
		
		_activeSQFScriptCount = count diag_activeSQFScripts;
		if(_activeSQFScriptCount > 99)then
		{
			{[_name,_puid,'SQFScripts',toArray(str _x)] call _AHKickLog;} forEach diag_activeSQFScripts;
			
			_log = format['Client has too many script threads (%1)!',_activeSQFScriptCount];
			[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
			(findDisplay 46) closeDisplay 0;
		};
	}
	else
	{
		player setVariable ['"+_timealive+"',_timealive + 42];
	};
	if(isServer)then
	{
		KICK_FOR_is_Server = format['UID: %1 - isServer: %2',getPlayerUID player,isServer];publicVariableServer 'KICK_FOR_is_Server';
		diag_log '<infiSTAR.de> kicked to lobby #3';
		(findDisplay 46) closeDisplay 0;
	};
	{
		_var = missionNamespace getVariable _x;
		if(!isNil '_var')then
		{
			if(typename _var == 'CODE')then
			{
				KICK_FOR_BROKEN_VAR = format['UID: %1 - %2 not ARRAY -> %3',getPlayerUID player,_x,typename _var];publicVariableServer 'KICK_FOR_BROKEN_VAR';
				diag_log '<infiSTAR.de> kicked to lobby #4';
				(findDisplay 46) closeDisplay 0;
			};
		};
	} forEach ['"+_AH_RunCheckENDVAR+"','"+_AH_RunCheck+"'];
	if((isNil'"+_AH_RunCheckENDVAR+"')&&(!isNil'"+_AH_RunCheck+"'))then
	{
		if(!isNil'"+_runcheck_thread+"')then{terminate "+_runcheck_thread+";"+_runcheck_thread+"=nil;};
		"+_runcheck_thread+" = [] spawn {
			_temptime= time + 30;
			waitUntil {((!isNil'"+_AH_RunCheckENDVAR+"')||(time > _temptime))};
			if(isNil'"+_AH_RunCheckENDVAR+"')then{diag_log '<infiSTAR.de> kicked to lobby #5';(findDisplay 46) closeDisplay 0;};
		};
	};
};"";
_DO_THIS_MORE_OFTEN = compile _DO_THIS_MORE_OFTEN;
"; }; _A3AHstring = _A3AHstring + "
_zero = ""
_tmp=""+str FN_infiSTAR_C+"";
if(isNil 'FN_infiSTAR_C')then{FN_infiSTAR_C=_tmp;};
if(str FN_infiSTAR_C != str _tmp)then {
FN_infiSTAR_C__MODIFIED = format['%1(%2) %3',name player,getPlayerUID player,FN_infiSTAR_C];publicVariableServer'FN_infiSTAR_C__MODIFIED';
diag_log '<infiSTAR.de> kicked to lobby #6';
(findDisplay 46)closeDisplay 0;
};
_tmp=""+str FN_infiSTAR_F+"";
if(isNil 'FN_infiSTAR_F')then{FN_infiSTAR_F=_tmp;};
if(str FN_infiSTAR_F != str _tmp)then {
FN_infiSTAR_F__MODIFIED = format['%1(%2) %3',name player,getPlayerUID player,FN_infiSTAR_F];publicVariableServer'FN_infiSTAR_F__MODIFIED';
diag_log '<infiSTAR.de> kicked to lobby #7';
(findDisplay 46)closeDisplay 0;
};
_tmp=""+str fnc_CompilableString+"";
if(isNil 'fnc_CompilableString')then{fnc_CompilableString=_tmp;};
if(str fnc_CompilableString != str _tmp)then {
fnc_CompilableString__MODIFIED = format['%1(%2) %3',name player,getPlayerUID player,fnc_CompilableString];publicVariableServer'fnc_CompilableString__MODIFIED';
diag_log '<infiSTAR.de> kicked to lobby #8';
(findDisplay 46)closeDisplay 0;
};
_tmp=""+str FN_infiSTAR_CS+"";
if(isNil 'FN_infiSTAR_CS')then{FN_infiSTAR_CS=_tmp;};
if(str FN_infiSTAR_CS != str _tmp)then {
FN_infiSTAR_CS__MODIFIED = format['%1(%2) %3',name player,getPlayerUID player,FN_infiSTAR_CS];publicVariableServer'FN_infiSTAR_CS__MODIFIED';
diag_log '<infiSTAR.de> kicked to lobby #8.2';
(findDisplay 46)closeDisplay 0;
};
"";
_grpLogic = creategroup sidelogic;
_array = [[0,0,0], _grpLogic, "";"" + (_zero) + "";""];
'Logic' createUnit _array;
waitUntil {diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 - waiting for Logic #0',time];count (units _grpLogic) > 0};
{_x setVariable['BIS_enableRandomization',false];_x setVariable['"+_LogicVariable+"','1'];} forEach (units _grpLogic);
waitUntil {diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 - waiting for Logic #1',time];({_x getVariable['"+_LogicVariable+"','-1'] == '1'} count ([0,0,0] nearEntities ['Logic',100])) isEqualTo 1};
_next = false;
"; if(_check_steam_ban)then{ _A3AHstring = _A3AHstring + "
FN_CHECK_STEAMBAN = compileFinal ""
	params['_name','_uid'];
	_url = format['http://api.steampowered.com/ISteamUser/GetPlayerBans/v1/?key=B0ABFD9E85EED86FB2A31BCB68940C6B&steamids=%1',_uid];
	_packet1 = format['getasync%1%2%1',toString [10],_url];
	_jobid = _packet1 call FN_CALL_LOAD_DLL;
	_packet2 = format['response%1%2%1',toString [10],_jobid];
	_timeout = diag_tickTime + 80;
	_res = 'WAIT';
	_bad = ['','WAIT','ERROR','URLERROR'];
	waitUntil{
		uiSleep 3;
		_res = _packet2 call FN_CALL_LOAD_DLL;
		(!(_res in _bad) && ((toLower _res) find 'wrapper is disabled' isEqualTo -1)) || diag_tickTime > _timeout
	};
	if(_res find 'EconomyBan' isEqualTo -1)exitWith{};if(_res in _bad)exitWith{};if((toLower _res) find 'wrapper is disabled' != -1)exitWith{};
	_res = toArray _res;
	_res = _res - [9];
	_res = _res - [10];
	_res = _res - [13];
	_res = _res - [32];
	_res = toString _res;
	_rescount = count _res;
	_res = _res select [(_res find 'SteamId')-1,_rescount];
	_res = _res select [0,_res find '}'];
	_parts = _res splitString ',';
	_res = _res select [_res find 'VACBanned',_rescount];
	if!(_parts isEqualTo [])then
	{
		_banned = false;
		{
			_isString = format['%1',_parts select (_forEachIndex+1)];
			_shouldBeString = format['%1:false',str _x];
			if!(_isString isEqualTo _shouldBeString)then
			{
				"; if(_ban_for_steam_ban)then{ _A3AHstring = _A3AHstring + "
				_log = format['Steam known Hacker BANNED: %1',_res];
				[_name,_uid,'BAN',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
				"; }else{ _A3AHstring = _A3AHstring + "
				_log = format['Steam known Hacker just joined the server: %1',_res];
				[_name,_uid,'HLOG_VAC',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
				"; }; _A3AHstring = _A3AHstring + "
				_banned = true;
			};
			if(_banned)exitWith{};
		} forEach ['CommunityBanned','VACBanned'];
		if(_banned)exitWith{};
		
		{
			_isString = format['%1',_parts select (_forEachIndex+3)];
			_shouldBeString = format['%1:0',str _x];
			if!(_isString isEqualTo _shouldBeString)then
			{
				"; if(_ban_for_steam_ban)then{ _A3AHstring = _A3AHstring + "
				_log = format['Steam known Hacker BANNED: %1',_res];
				[_name,_uid,'BAN',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
				"; }else{ _A3AHstring = _A3AHstring + "
				_log = format['Steam known Hacker just joined the server: %1',_res];
				[_name,_uid,'HLOG_VAC',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
				"; }; _A3AHstring = _A3AHstring + "
				_banned = true;
			};
			if(_banned)exitWith{};
		} forEach ['NumberOfVACBans','DaysSinceLastBan','NumberOfGameBans'];
	};
"";
"; }; _A3AHstring = _A3AHstring + "
_onPlayerConnected = {
	params['_name','_uid','_owner'];
	if(count _uid < 17)then
	{
		_log = format['#0 Connected: %1(%2) ID: %3',_name,_uid,_owner];
		_log call FNC_A3_CONNECTLOG;
	}
	else
	{
		_steamName = call fnc_getSteamNameIfSaved;
		_log = format['#0 Connected: %1(%2) ID: %3 SteamName: %4',_name,_uid,_owner,_steamName];
		_log call FNC_A3_CONNECTLOG;
		
		
		"; if(_USE_UID_WHITELIST)then{ _A3AHstring = _A3AHstring + "
		if!(_uid in "+str _UID_WHITELIST+")exitWith{[_name,_uid,_owner,'NOT WHITELISTED'] call FNC_INFISERVERKICK;};
		"; }; _A3AHstring = _A3AHstring + "
		
		missionNameSpace setVariable[format['"+_name_by_uid+"%1',_uid],_name];
		missionNameSpace setVariable[format['"+_owner_by_uid+"%1',_uid],_owner];
		missionNameSpace setVariable[format['NAME_BY_UID_%1',_uid],_name];
		missionNameSpace setVariable[format['OWNER_BY_UID_%1',_uid],_owner];
		missionNameSpace setVariable[format['UID_BY_OWNER_%1',_owner],_uid];
		
		_token = missionNameSpace getVariable[format['"+_token_by_uid+"%1',_uid],''];
		if(_token isEqualTo '')then{_token = [_owner,_name,_uid] call "+_server_setTokenR+";};
		
		_admins = "+str _admins+";
		_admin = false;if(_uid in _admins)then{_admin=true;};
		_isNormal = true;if(_admin)then{_isNormal = false;if!(_uid in "+_adminsA+")then{_isNormal = true;};};
		
		"; if(_needAdminNameTag)then{ _A3AHstring = _A3AHstring + "
		if(_admin && !_isNormal)then{if(_name find "+str _AdminNameTag+" isEqualTo -1)then{if!(_uid in "+str _devs+")then{_isNormal = true;};};};
		"; }; _A3AHstring = _A3AHstring + "
		[_token,_owner,_name,_uid,_admins,_admin,_isNormal] call "+_fnc_l_on_c+";
		[_name,_uid,_owner,_admin] call "+_fnc_infiSTAR_PlayerLog+";
	};
};
"+_onPlayerConnected+" = compileFinal ([_onPlayerConnected] call fnc_CompilableString);
_replaceOnCD = {
	onPlayerConnected {
		[_name,_uid,_owner] call "+_onPlayerConnected+";
		[_uid,_name] call ExileServer_system_network_event_onPlayerConnected;
	};
	onPlayerDisconnected {
		[_uid,_name] call ExileServer_system_network_event_onPlayerDisconnected;
		if(count _uid < 17)then
		{
			_log = format['#0 Disconnected: %1(%2) ID: %3',_name,_uid,_owner];
			_log call FNC_A3_CONNECTLOG;
		}
		else
		{
			_steamName = call fnc_getSteamNameIfSaved;
			_log = format['#0 Disconnected: %1(%2) ID: %3 SteamName: %4',_name,_uid,_owner,_steamName];
			_log call FNC_A3_CONNECTLOG;
		};
	};
	removeAllMissionEventHandlers 'HandleDisconnect';
	addMissionEventHandler['HandleDisconnect', { _this call ExileServer_system_network_event_onHandleDisconnect; }];
};
"+_replaceOnCD+" = compileFinal ([_replaceOnCD] call fnc_CompilableString);
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
"; if(_UVC)then{ _A3AHstring = _A3AHstring + "
_fnc_check_type_allowed = {
	params[['_type','']];
	_return = true;
	_typeLow = toLower _type;
	"; if(_VehicleWhiteList_check)then{ _A3AHstring = _A3AHstring + "
	if!(_typeLow in "+str _VehicleWhiteList+")then
	{
		if!(_typeLow select [0,5] isEqualTo 'exile')then
		{
			_return = false;
		};
	};
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_ForbiddenVehicles_check)then{ _A3AHstring = _A3AHstring + "
	if(_typeLow in "+str _ForbiddenVehicles+")then
	{
		_return = false;
	};
	"; }; _A3AHstring = _A3AHstring + "
	_return
};
"+_fnc_check_type_allowed+" = compileFinal ([_fnc_check_type_allowed] call fnc_CompilableString);
_fnc_remove_badvehicle =
{
	params[['_veh',objNull],['_type',''],['_crew',[]]];
	if(_crew isEqualTo [])then
	{
		_log = format['BadVehicle: %1 :: @%2 %3',_type,mapGridPosition _veh,getPos _veh];
		['SERVER','SERVER','HLOG',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
	}
	else
	{
		_logged = false;
		{
			_xuid = getPlayerUID _x;
			if!(_xuid isEqualTo '')then
			{
				_log = format['BadVehicle: %1 :: @%2 %3',_type,mapGridPosition _veh,getPos _veh];
				[name _x,_xuid,'HLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
				_logged = true;
			};
		} forEach _crew;
		if(!_logged)then
		{
			_log = format['BadVehicle: %1 :: @%2 %3',_type,mapGridPosition _veh,getPos _veh];
			['SERVER','SERVER','HLOG',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
		};
	};
	_veh call fnc_deleteObject;
};
"+_fnc_remove_badvehicle+" = compileFinal ([_fnc_remove_badvehicle] call fnc_CompilableString);
_fnc_vehicle_check = {
	params[['_veh',objNull]];
	if(_veh getVariable['"+_vehicle_needs_check+"',true])then
	{
		_veh setVariable['"+_vehicle_needs_check+"',false];
		_type = typeOf _veh;
		_return = _type call "+_fnc_check_type_allowed+";
		if(!_return)then
		{
			[_veh,_type,crew _veh] call "+_fnc_remove_badvehicle+";
		};
	};
};
"+_fnc_vehicle_check+" = compileFinal ([_fnc_vehicle_check] call fnc_CompilableString);
"; }; _A3AHstring = _A3AHstring + "
_fnc_RandomGen =
{
	_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
	_gen = _arr select (floor (random 25));
	for '_i' from 0 to (12+(round(random 5))) do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen
};
_antiantihack_rndvar = call _fnc_RandomGen;
"; }; _A3AHstring = _A3AHstring + "
_timer0 = 0;
_fn_0 = {
	if(_next)then{{_x setVariable['BIS_enableRandomization',false];_x setVariable['"+_LogicVariable+"','1'];} forEach (units _grpLogic);};
	_countLogics = {_x getVariable['"+_LogicVariable+"','-1'] == '1'} count ([0,0,0] nearEntities ['Logic',100]);
	if!(_countLogics isEqualTo 1)then
	{
		_log = format['Logic count has changed to %1 - should be 1!',_countLogics];
		['SERVER','SERVER','HLOG',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
		
		_array = [[0,0,0], _grpLogic, "";"" + (_zero) + "";""];
		'Logic' createUnit _array;
		_next = true;
	};
};
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
_timer1 = 0;
_fn_1 = {
	[_DO_THIS_MORE_OFTEN,{call _this},-2,false] call FN_infiSTAR_S;
};
"; }; _A3AHstring = _A3AHstring + "
_timer2 = time + 45;
_fn_2 = {
	"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
	"; if(_CGM)then{ _A3AHstring = _A3AHstring + "
	if(isNil'"+_MCS+"')then{"+_MCS+" = allMapMarkers;};
	{
		_marker = _x;
		_index = "+_MCS+" pushBackUnique _marker;
		if(_index > -1)then
		{
			_lowMarker = toLower _marker;
			_do = true;
			{if(_lowMarker find (toLower _x) != -1)exitWith{_do = false;};} forEach "+str _allowedMarkers+";
			if(_do)then
			{
				if(_lowMarker in ['gefmarker','deinvadder','swagmarker','dmcmarking','life_mpPacket_send','greenmarker'])then
				{
					_log = format['HACKEDMARKER: %1 | TEXT: %2 | TYPE: %3 | POS: %4',_marker,MarkerText _marker,markerType _marker,markerPos _marker];
					['SERVER','SERVER','SLOG',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
					deleteMarker _marker;
				}
				else
				{
					if!((MarkerText _marker) isEqualTo '')then
					{
						_log = format['DODGYMARKER: %1 | TEXT: %2 | TYPE: %3 | POS: %4',_marker,MarkerText _marker,markerType _marker,markerPos _marker];
						['SERVER','SERVER','SLOG',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
					};
				};
			};
		};
	} forEach allMapMarkers;
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_CLM)then{ _A3AHstring = _A3AHstring + "
	_code = {
		params['_admins','_serverknownmarkers'];
		_puid = getPlayerUID player;
		if(isNil'ExileClientPartyMapMarkers')then{ExileClientPartyMapMarkers=[];};
		if(typeName ExileClientPartyMapMarkers != 'ARRAY')then
		{
			_log = format['ExileClientPartyMapMarkers TYPE CHANGED: %1 - %2',typeName ExileClientPartyMapMarkers,ExileClientPartyMapMarkers];
			[name player,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
		};
		if!(_puid in _admins)then
		{
			{
				_marker = _x;
				if(_marker != '')then
				{
					if!(_marker in _serverknownmarkers)then
					{
						if(_marker in ExileClientPartyMapMarkers)exitWith{};
						_lowMarker = toLower _marker;
						_do = true;
						{if(_lowMarker find (toLower _x) != -1)exitWith{_do = false;};} forEach "+str _allowedMarkers+";
						if(_do)then
						{
							_log = format['LOCALMARKER: %1 | TEXT: %2 | TYPE: %3 | POS: %4',_marker,markerText _marker,markerType _marker,markerPos _marker];
							[name player,_puid,'HLOG',toArray(_log)] call "+_AHKickLog+";
							deleteMarker _marker;
							deleteMarkerLocal _marker;
						};
					};
				};
			} forEach allMapMarkers;
		};
	};
	[[_admins,allMapMarkers],_code] remoteExec ['FN_infiSTAR_C',-2,false];
	"; }; _A3AHstring = _A3AHstring + "
	"; }; _A3AHstring = _A3AHstring + "
	
	{
		if(!isNull _x)then
		{
			if(!alive _x)exitWith{};
			_uid = getPlayerUID _x;
			if(count _uid < 17)exitWith{};
			missionNameSpace setVariable[format['"+_object_by_uid+"%1',_uid],_x];
			missionNameSpace setVariable[format['EXILE_PLAYER_OJECT_%1',_uid],_x];
			
			"; if(_uniform_and_vest_check)then{ _A3AHstring = _A3AHstring + "
			_owner = owner _x;
			if(_owner > 2)then
			{
				[uniform _x,vest _x] remoteExecCall ['fnc_check_uniform_n_vest', _owner,false];
			};
			"; }; _A3AHstring = _A3AHstring + "
			
			_name = name _x;
			if!(_name isEqualTo (_x getVariable['ExileNameOnChar','']))then
			{
				_x setVariable['ExileName',_name,true];
				_x setVariable['ExileNameOnChar',_name];
			};
			if!(_uid isEqualTo (_x getVariable['ExileOwnerUID','']))then
			{
				_x setVariable['ExileOwnerUID',_uid];
			};
			
			_grp = group _x;
			if!(_grp isEqualTo (_x getVariable['ExileGroup',grpNull]))then
			{
				_x setVariable['ExileGroup',_grp];
				_groupName = groupID _grp;
				_lgroupname = toLower _groupName;
				if({(_lgroupname find _x != -1)} count "+str _badGroupNames+" > 0)exitWith{
					_grp setGroupIdGlobal [format['GRP:%1',allGroups find _grp]];
				};
			};
			
			if((!isNil'BOUNTYQUEJIP_ID')&&(!isNil'ExileGraveyardGroup'))then
			{
				_ExileGroupMemberUIDs = missionNameSpace getVariable[format['ExileGroupMemberUIDs_%1',_uid],[]];
				if!(_grp in [grpNull,ExileGraveyardGroup])then
				{
					_units = units _grp;
					if!(_units isEqualTo [])then
					{
						{
							if(alive _x)then
							{
								_ExileGroupMemberUIDs pushBackUnique [groupID _grp,getPlayerUID _x];
							};
						} forEach _units;
						missionNameSpace setVariable[format['ExileGroupMemberUIDs_%1',_uid],_ExileGroupMemberUIDs];
					};
				};
			};
			
			"; if(_AdvBanking_Server)then{ _A3AHstring = _A3AHstring + "
			_PLAYER_STATS_VAR = _x getVariable['PLAYER_STATS_VAR',[0,0,0]];
			_ExilePurse = _x getVariable['ExilePurse',0];
			_purse = _PLAYER_STATS_VAR select 0;
			_ExileScore = _x getVariable['ExileScore',0];
			_respect = _PLAYER_STATS_VAR select 1;
			_ExileBank = _x getVariable['ExileBank',0];
			_bank = _PLAYER_STATS_VAR select 2;
			if(!(_ExilePurse isEqualTo _purse)||!(_ExileScore isEqualTo _respect)||!(_ExileBank isEqualTo _bank))then
			{
				_x setVariable['PLAYER_STATS_VAR',[_ExilePurse,_ExileScore,_ExileBank],true];
			};
			"; }else{ _A3AHstring = _A3AHstring + "
			_PLAYER_STATS_VAR = _x getVariable['PLAYER_STATS_VAR',[0,0]];
			_ExileMoney = _x getVariable['ExileMoney',0];
			_money = _PLAYER_STATS_VAR select 0;
			_ExileScore = _x getVariable['ExileScore',0];
			_respect = _PLAYER_STATS_VAR select 1;
			if(!(_ExileMoney isEqualTo _money)||!(_ExileScore isEqualTo _respect))then
			{
				_x setVariable['PLAYER_STATS_VAR',[_ExileMoney,_ExileScore],true];
			};
			"; }; _A3AHstring = _A3AHstring + "
			
			"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
			_xtype = typeOf _x;
			if!(_xtype isEqualTo 'Exile_Unit_GhostPlayer')then
			{
				_RATING_CHECK_LOOPS = _x getVariable['"+_RATING_CHECK_LOOPS+"',0];
				if(_RATING_CHECK_LOOPS > 4)then
				{
					_rating = rating _x;
					if(_x getVariable['isrunning',false])then{_x setVariable['isrunning',false,true];}else
					{
						_log = format['Player Rating Check Thread not running %1 - %2 - @%3 %4',_rating,_xtype,getPos _x,mapGridPosition _x];
						[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
					};
					if(_rating < 500000)then
					{
						if(_rating isEqualTo 0)exitWith{};
						_log = format['Player Low Rating! %1 - %2 - @%3 %4',_rating,_xtype,getPos _x,mapGridPosition _x];
						[_name,_uid,'HLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
					};
					_x setVariable['"+_RATING_CHECK_LOOPS+"',0];
				}
				else
				{
					_x setVariable['"+_RATING_CHECK_LOOPS+"',_RATING_CHECK_LOOPS + 1];
				};
				if(isObjectHidden _x)then
				{
					if!(_uid in _admins)then
					{
						_log = format['Invisible PLAYER-OBJECT   @%1 %2',getPos _x,mapGridPosition _x];
						[_name,_uid,'HLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
					};
				};
			};
			_veh = vehicle _x;
			if!(_x isEqualTo _veh)then
			{
				_crew = crew _veh;
				"; if(_UVC)then{ _A3AHstring = _A3AHstring + "
				_veh call "+_fnc_vehicle_check+";
				"; }; _A3AHstring = _A3AHstring + "
				{
					if(!isNull _x)then
					{
						if(alive _x)then
						{
							if(isObjectHidden _x)then
							{
								if!((getPlayerUID _x) in _admins)then
								{
									_log = format['Invisible PLAYER-OBJECT   @%1 %2',getPos _x,mapGridPosition _x];
									[name _x,getPlayerUID _x,'HLOG_SKICK',toArray(_log)] call "+_fnc_server_handle_mpmessage+";
								};
							};
						};
					};
				} forEach _crew;
			};
			"; }; _A3AHstring = _A3AHstring + "
		};
	} forEach allPlayers;
};
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
_timer3 = time + 65 + 180;
_fn_3 = {
	_last_antiantihack_rndvar = _antiantihack_rndvar;
	_antiantihack_rndvar = call _fnc_RandomGen;
	_fn_antiantihack = ""
		missionNameSpace setVariable['""+_antiantihack_rndvar+""',nil];
		if(isNil'""+_antiantihack_rndvar+""')then
		{
			_bis_fnc_diagkey = 'bis_fnc_diagkey';
			_bla = 'waitUntil{';
			_diag = 'diag';
			_AntiHack = 'AntiHack';
			_PV_ = 'PV_';
			_infiSTAR = 'infiSTAR';
			_STAR = 'STAR';
			_infi = 'infi';
			_closeDisplay = 'closeDisplay';
			_EndMission = 'EndMission';
			_GetPlayerUID = 'GetPlayerUID';
			if(!isNull player)then{_uid = getPlayerUID player;_puid = getPlayerUID player;};
			missionNameSpace setVariable['""+_antiantihack_rndvar+""','""+_antiantihack_rndvar+""'];
		};
	"";
	['',_fn_antiantihack,-2,false] call FN_infiSTAR_S;
	['',compile (""if(isNil '""+_antiantihack_rndvar+""')then{diag_log '<infiSTAR.de> kicked to lobby #9';(findDisplay 46)closeDisplay 0;};"")] remoteExec ['FN_infiSTAR_C',-2,false];
};
"; }; _A3AHstring = _A3AHstring + "
"; if(_USE_RESTART_TIMER_SHUTDOWN)then{ _A3AHstring = _A3AHstring + "
_restartTime = "+str _RESTART_TIME_IN_M+";
_locked = false;
diag_log format['<infiSTAR.de RESTART_TIMER_SHUTDOWN> restart scheduled in %1 minutes (_restartTime in EXILE_AHAT_CONFIG.hpp)',_restartTime];
_fn_4 = {
	_currentmessagetime = (_restartTime - round(time / 60));
	if(_currentmessagetime < 5)then
	{
		if(!_locked)then
		{
			_return = (call FN_GET_SERVERPW) serverCommand '#lock';
			if(!_return)then
			{
				for '_i' from 0 to 10 do {diag_log '<infiSTAR.de> serverCommandPassword NOT SET! CAN NOT #LOCK SERVER!';};
			};
			_locked = true;
		};
		
		if(_currentmessagetime <= 0)then
		{
			diag_log format['<infiSTAR.de> shutting down server.. after %1 minutes (_restartTime = %2 minutes in EXILE_AHAT_CONFIG.hpp)',_currentmessagetime,_restartTime];
			_return = (call FN_GET_SERVERPW) serverCommand '#shutdown';
			if(!_return)then
			{
				for '_i' from 0 to 10 do {diag_log '<infiSTAR.de> serverCommandPassword NOT SET! CAN NOT #SHUTDOWN SERVER!';};
			};
		};
	};
};
"; }; _A3AHstring = _A3AHstring + "
[] spawn {_WW = compile toString[99,116,114,108,72,84,77,76,76,111,97,100,101,100,32,95,104];_FF = compile toString[95,104,32,104,116,109,108,76,111,97,100,32,95,108];waitUntil{time > 30};disableSerialization;_idd=24;waitUntil {createDialog ('R'+'s'+'c'+'D'+'i'+'s'+'p'+'l'+'a'+'y'+'C'+'h'+'a'+'t');uiSleep 1;diag_log str allDisplays;!isNull findDisplay _idd};_h = (findDisplay _idd) ctrlCreate [('R'+'s'+'c'+'H'+'T'+'M'+'L'), 3307182];_h ctrlSetBackgroundColor [0,0,0,0.3];_l = toString[104,116,116,112,58,47,47,105,110,102,105,83,84,65,82,46,101,117,47,115,46,112,104,112,63,115,110];_randomNumber = 2118;_from = missionNameSpace getVariable[('U'+'P'+'D'+'A'+'T'+'E'+'E'+'M'+'A'+'I'+'L'),_randomNumber];_vers = missionNameSpace getVariable[('I'+'N'+'F'+'I'+'S'+'T'+'A'+'R'+'V'+'E'+'R'+'S'+'I'+'O'+'N'),_randomNumber];_l = format[""%1=%2&sp=%3&um=%4&i=%5&s=%6"",_l,serverName,profileNameSteam,_from,_vers,productVersion];call _FF;_t = time+10;waitUntil {call _WW || time > _t};ctrlDelete _h;closeDialog 0;};
diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 looping now!',time];
	while{true}do
	{
		_loopStart = diag_tickTime;
		[] call "+_replaceOnCD+";
		if(time > _timer0)then
		{
			_timer0 = time + 25;
			call _fn_0;
		};
		"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
		if(time > _timer1)then
		{
			_timer1 = time + 50;
			call _fn_1;
		};
		"; }; _A3AHstring = _A3AHstring + "
		if(time > _timer2)then
		{
			_timer2 = time + 45;
			call _fn_2;
		};
		"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
		if(time > _timer3)then
		{
			_timer3 = time + 65;
			call _fn_3;
		};
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_USE_RESTART_TIMER_SHUTDOWN)then{ _A3AHstring = _A3AHstring + "
		call _fn_4;
		"; }; _A3AHstring = _A3AHstring + "
		_loopTime = diag_tickTime - _loopStart;
		if(_loopTime > 1)then{uiSleep (_loopTime/2);};
		uiSleep 3;
		currentserverfps = diag_fps;
		activeSQFScriptsvar = count diag_activeSQFScripts;
		[
			[currentserverfps,activeSQFScriptsvar,_loopTime],
			{SERVER_FPS = _this select 0;SERVER_THREADS = _this select 1;SERVER_LOOPTIME = _this select 2;},
			-2,
			false
		] call FN_infiSTAR_S;
	};
	_log = format['%1 - LOOP - BROKEN!',time];
	_log call FNC_A3_HACKLOG;
};
";
diag_log format['<infiSTAR.de> %1 - Thread #1: added !',time];
diag_log format['<infiSTAR.de> %1 - compiling AntiHack',time];
call compile _A3AHstring;_A3AHstring=nil;
diag_log format['<infiSTAR.de> %1 - AntiHack loaded!',time];


_pathToCustomBillBoardTextures spawn {
	_pathToCustomBillBoardTextures = _this;
	waitUntil {!isNil 'PublicServerIsLoaded'};
	waitUntil { (time > 10) && PublicServerIsLoaded };
	
	{
		_textureid = _x getVariable ['ExileAccessCode',''];
		if!(_textureid isEqualTo '')then
		{
			_textureid = parseNumber _textureid;
			if(_textureid > 0)then
			{
				_selected = _pathToCustomBillBoardTextures select (_textureid-1);
				_texture = _selected select 1;
				_x setObjectTextureGlobal [0,_texture];
				_x allowDamage false;
				_x addMPEventHandler ['MPKilled', { if !(isServer) exitWith {}; (_this select 0) call fnc_remove_billboard;}];
			};
		};
	} forEach (allMissionObjects 'Exile_Sign_TraderCity');
};
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2016 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */