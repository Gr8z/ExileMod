/*
	File: EXILE_AH.sqf
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* **************infiSTAR Copyright®© 2011 - 2015 All rights reserved.************** */
/* *********************************www.infiSTAR.de********************************* */
diag_log '<infiSTAR.de> VERSION: 25082015 infiSTAR.de AHAT (v0001)';
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
UPDATEEMAIL='infiSTAR@ok.de';
INFISTARVERSION='25082015-v0001';
diag_log format['<infiSTAR.de> %1 - STARTING',time];
_SpawnKavala = getMarkerPos 'SpawnKavala';
_SpawnZaros = getMarkerPos 'SpawnZaros';
_SpawnSelekano = getMarkerPos 'SpawnSelekano';
_SpawnPrygos = getMarkerPos 'SpawnPrygos';
_SpawnSofia = getMarkerPos 'SpawnSofia';
_SpawnSyrta = getMarkerPos 'SpawnSyrta';
createMarker ['ADMIN_MARKER', [0,0,0]];
FNC_A3_LOG_RAND_VAR = compileFinal "
	'ARMA_LOG' callExtension format['A3_RANDOMVAR_LOG:%1 (v0001)',_this];
	diag_log ('<infiSTAR.de>RandomVarLog| '+_this+' (v0001)');
";
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
_average = round(_num / _count);
_randminval = (_average/3);
_randmaxval = (_average/1.5);
_fnc_RandomGen =
{
	_fnc_actualGen = {
		_abc = ['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'];
		_gen = _abc select (random ((count _abc)-1));
		_arr = ['T','x','F','G','8','0','W','Y','s','g','X','s','f','X','Z','N','H','A','S','4','Q','p','t','H','v','M','i','0','8','Y'];
		_randmax = {((round(random _randminval)) + (round(random _randmaxval))) max _randminval};
		for '_i' from 0 to (call _randmax)do
		{
			_gen = _gen + str(round(random 9)) + (_arr select (random ((count _arr)-1)));
		};
	};
	_gen = '';
	while{_gen=='' || _gen in _allRandomGenVars}do{
		call _fnc_actualGen;
	};
	_allRandomGenVars pushBack _gen;
	_gen
};diag_log format['<infiSTAR.de> _fnc_RandomGen: %1',_fnc_RandomGen];
format['----START-LINE----   (%1)',INFISTARVERSION] call FNC_A3_LOG_RAND_VAR;
_adminbox = call _fnc_RandomGen;format['_adminbox: %1',_adminbox] call FNC_A3_LOG_RAND_VAR;
_FNC_AH1_KICKLOG = call _fnc_RandomGen;format['_FNC_AH1_KICKLOG: %1',_FNC_AH1_KICKLOG] call FNC_A3_LOG_RAND_VAR;
_FNC_AH1_KICKLOGSPAWN = call _fnc_RandomGen;format['_FNC_AH1_KICKLOGSPAWN: %1',_FNC_AH1_KICKLOGSPAWN] call FNC_A3_LOG_RAND_VAR;
_FNC_PVAH_AdminReq = call _fnc_RandomGen;format['_FNC_PVAH_AdminReq: %1',_FNC_PVAH_AdminReq] call FNC_A3_LOG_RAND_VAR;
_BigTokenArray = call _fnc_RandomGen;format['_BigTokenArray: %1',_BigTokenArray] call FNC_A3_LOG_RAND_VAR;
_server_setTokenR = call _fnc_RandomGen;format['_server_setTokenR: %1',_server_setTokenR] call FNC_A3_LOG_RAND_VAR;
_fnc_pvc_token = call _fnc_RandomGen;format['_fnc_pvc_token: %1',_fnc_pvc_token] call FNC_A3_LOG_RAND_VAR;
_server_checkTokenR = call _fnc_RandomGen;format['_server_checkTokenR: %1',_server_checkTokenR] call FNC_A3_LOG_RAND_VAR;
_YourPlayerToken = call _fnc_RandomGen;format['_YourPlayerToken: %1',_YourPlayerToken] call FNC_A3_LOG_RAND_VAR;
_TokenCT = call _fnc_RandomGen;format['_TokenCT: %1',_TokenCT] call FNC_A3_LOG_RAND_VAR;
_AH_MAIN_BLOCK = call _fnc_RandomGen;format['_AH_MAIN_BLOCK: %1',_AH_MAIN_BLOCK] call FNC_A3_LOG_RAND_VAR;
_MAIN_CODE = call _fnc_RandomGen;format['_MAIN_CODE: %1',_MAIN_CODE] call FNC_A3_LOG_RAND_VAR;
_MAIN_CODE_C = call _fnc_RandomGen;format['_MAIN_CODE_C: %1',_MAIN_CODE_C] call FNC_A3_LOG_RAND_VAR;
_AHKickOFF = call _fnc_RandomGen;format['_AHKickOFF: %1',_AHKickOFF] call FNC_A3_LOG_RAND_VAR;
_AH1KICKLOG = call _fnc_RandomGen;format['_AH1KICKLOG: %1',_AH1KICKLOG] call FNC_A3_LOG_RAND_VAR;
_clientdo = call _fnc_RandomGen;format['_clientdo: %1',_clientdo] call FNC_A3_LOG_RAND_VAR;
_AH_RunCheckENDVAR = call _fnc_RandomGen;format['_AH_RunCheckENDVAR: %1',_AH_RunCheckENDVAR] call FNC_A3_LOG_RAND_VAR;
_AH_HackLogArrayRND = call _fnc_RandomGen;format['_AH_HackLogArrayRND: %1',_AH_HackLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_AH_SurvLogArrayRND = call _fnc_RandomGen;format['_AH_SurvLogArrayRND: %1',_AH_SurvLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_AH_AdmiLogArrayRND = call _fnc_RandomGen;format['_AH_AdmiLogArrayRND: %1',_AH_AdmiLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_TMPBAN = call _fnc_RandomGen;format['_TMPBAN: %1',_TMPBAN] call FNC_A3_LOG_RAND_VAR;
_AHpos = call _fnc_RandomGen;format['_AHpos: %1',_AHpos] call FNC_A3_LOG_RAND_VAR;
_adminsA = call _fnc_RandomGen;format['_adminsA: %1',_adminsA] call FNC_A3_LOG_RAND_VAR;
_MC = call _fnc_RandomGen;format['_MC: %1',_MC] call FNC_A3_LOG_RAND_VAR;
_MCS = call _fnc_RandomGen;format['_MCS: %1',_MCS] call FNC_A3_LOG_RAND_VAR;
_ZEROZEROZERO = call _fnc_RandomGen;format['_ZEROZEROZERO: %1',_ZEROZEROZERO] call FNC_A3_LOG_RAND_VAR;
_LogicVariable = call _fnc_RandomGen;format['_LogicVariable: %1',_LogicVariable] call FNC_A3_LOG_RAND_VAR;
_t1 = call _fnc_RandomGen;format['_t1: %1',_t1] call FNC_A3_LOG_RAND_VAR;
_t2 = call _fnc_RandomGen;format['_t2: %1',_t2] call FNC_A3_LOG_RAND_VAR;
_t3 = call _fnc_RandomGen;format['_t3: %1',_t3] call FNC_A3_LOG_RAND_VAR;
_t4 = call _fnc_RandomGen;format['_t4: %1',_t4] call FNC_A3_LOG_RAND_VAR;
_t5 = call _fnc_RandomGen;format['_t5: %1',_t5] call FNC_A3_LOG_RAND_VAR;
_t6 = call _fnc_RandomGen;format['_t6: %1',_t6] call FNC_A3_LOG_RAND_VAR;
_t7 = call _fnc_RandomGen;format['_t7: %1',_t7] call FNC_A3_LOG_RAND_VAR;
_t8 = call _fnc_RandomGen;format['_t8: %1',_t8] call FNC_A3_LOG_RAND_VAR;
_t9 = call _fnc_RandomGen;format['_t9: %1',_t9] call FNC_A3_LOG_RAND_VAR;
_fnc_RandomGen =
{
	_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
	_gen = 'PVAHR_';
	_max = 5+(round(random 3));
	for '_i' from 1 to _max do {_gen = _gen + str(round(random 9)) + (_arr select (random ((count _arr)-1)));};
	_allRandomGenVars pushBack _gen;
	_gen
};
_AH1_KICKLOG = call _fnc_RandomGen;format['_AH1_KICKLOG: %1',_AH1_KICKLOG] call FNC_A3_LOG_RAND_VAR;
_RequestToken = call _fnc_RandomGen;format['_RequestToken: %1',_RequestToken] call FNC_A3_LOG_RAND_VAR;
format['----END-LINE----   (%1)',INFISTARVERSION] call FNC_A3_LOG_RAND_VAR;
_KK_fnc_arrayShuffle = {
	private '_cnt';
	_cnt = count _this;
	for '_i' from 1 to _cnt do {
		_this pushBack (_this deleteAt floor random _cnt);
	};
	_this
};
_allRandomGenVars call _KK_fnc_arrayShuffle;
profileNamespace setVariable['ServerVarSafe','no'];saveprofileNamespace;
diag_log format['<infiSTAR.de> %1 - loading AntiHack..',time];
{_blacklistedFileArray pushBack format['%1.sqf',_x];} forEach [0,1,2,3,4,5,6,7,8,9,10,'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
_blacklistedFileArray append [
	'bis_Jme_is_God.sqf','titanmm.sqf','l33tH4x0or\L33TMenu.sqf','xoia24rfadfhw2\alishcahc.sqf','m.sqf',
	'spoodyV2.sqf','spoodyV5.sqf','gefdummy.sqf','script.sqf','dummy2.sqf','Unbenannt-1.sqf','Wedor.sqf','guiedo.sqf','V6.sqf','ic_d_4.5.sqf','H4cks.sqf'
];
_verybadStrings =
[
	'menu loaded','rustler','hangender','hungender',
	'douggem','monstercheats','bigben','swagger','fireworks','antiantihack',
	'jxmxe','hydroxus','kill target','no recoil','rapid fire','explode all','teleportall',
	'destroyall','destroy all','code to execute','g-e-f','box-esp','god on','god mode','unlimited mags',
	'ctrlcreate','_execscript','_theban','rhynov1','b1g_b3n','infishit',
	'e_x_t_a_s_y','jjjj','amm0','weppp3','att4chm3nt','f0od_dr1nk','m3d1c4l','t0ol_it3ms','b4ckp4cks',
	'it3m5','cl0th1ng','lystic','extasy','glasssimon_flo','remote_execution','gladtwoown','_pathtoscripts',
	'flo_simon','sonicccc_','fury_','phoenix_','_my_new_bullet_man','_jm3','disablecollisionwith _bullet',
	'thirtysix','dmc_fnc_4danews','w_o_o_k_i_e_m_e_n_u','xbowbii_','jm3_','wuat','menutest_','listening to jack',
	'dmcheats.de','kichdm','_news_banner','fucked up','lystics menu','rsccombo_2100','\dll\datmalloc','rsclistbox_1501',
	'rsclistbox_1500','\dll\tcmalloc_bi','___newbpass','updated_playerlist','recking_ki','gg_ee_ff','ggggg_eeeee_fffff',
	'gggg_eeee_ffff','mord all','teleport all','__byass','_altislifeh4x','antifrezze','ownscripts','ownscripted','mesnu',
	'mystic_','init re','init life re','spoody','gef_','throx_','_adasaasasa','_dsfnsjf','cheatmenu','in54nity','markad','fuck_me_','_v4fin',
	'a3randvar','infinite ammo','player markers','+ _code +'
];
_BadVar3Array = ['BIS_fnc_dbg_reminder_value','BIS_fnc_dbg_reminder',
'time','serverTime','myplayeruid','hhahaaaaar','CharlieSheenkeybinds','KickOFF','yolo','runonce','notakeybind','action1','Supa_Licenses','autokick','wallaisseikun','MainMenu',
'GEFClose','GEFWhite','GEFRed','GEFGreen','GEFCyan','FirstHint','new_queued','fn_Exec','FND_fnc_select','fnx3','ANTIHACKKICK','tele','dmap','GOLDENS_GLOBAL_SHIT_YEAH','GLASS911_Run',
'gearDialog_create','lystoKeypress','ThirtySix','LY_SwaggerLikeUs','Jkeyszz','n2','boxofmagic','MainScripts','DMC_fnc_4danews','INFISTARBYPASS','EXEC_TEXT','vehicle_dblclick','init_main',
'ESP_Count','Nute_Dat_Bomber','s_cash100k','XposPlayer','ly_re_onetime','SKAR_checkA','MainScriptsV4','ViewDistance','check_load','already_load','meins','f1','Dummy','Plane_Jump',
'c_player','MouseClickEH','distp','nec2','Menu_I_Run_Color_LP','GLASSv1nce_BindHandler','thecar','FastAnimes','GetinPassenger','iaimon','DMC_Re_onetime','func_execOnServer','fnc_serverKickNice',
'Kick_Admins','DASMOKEON','hovering','r_kelly_be_flying','SLX_XEH_BWC_INIT_COMPILE','VinceLOL_ALTISLIFE','life_fnc_byassSkaroAH','AH_fnc_MP','jayRE','fn_newsbanner','Hack_News','TrollFuncs',
'Fanatic_InfiPass','keybindings_xxx','AndysClosed','UserFuncs','AltisFuncs','RemExe','BB_nofatigue','bis_fnc_diagkey_var_code','First_PAGE','Get_in_D','i_t_s__m_e_o','smissles','Whippy_ESP',
'TargetFuncs2','life_fnc_antiFreeeeze','LY_keyForward','TY_re_onetime','life_fnc_XaAxAA','mein1','GodDamnVehiclesXD','Mystic_FNC_ESP_distance','Esp_Id_setter','DummyMen','whipbut','UserFuncs',
'KrohdoFreedom','selectedPlayer','Lmenu1','ggplayer','throx_menu_item','lvl1','Init_Menu_Slew','D_B_R_T_Y_Slew','V6_GEF','xasfjisisafudmmyx','kekse','UPDATED_RE_36','first','second'];
_blacklistedAdminVariables =
[
	'fnc_infiAdminKeyDown','BE_WHITE_LIST_ME','MAIN_DISPLAY_ID','fnc_Disconnect_selected','fnc_adminLog','go_in_nearestvehicle_callmevar','noRecoilRun',
	'FNC_CUSTOM_fn_loadInventory','ADMIN_LOCAL_MARKER','ALLOW_ME_THIS_KEYBIND','freeFlightCam','fnc_ButtonClick_44466','fnc_LBSelChanged_LEFT','unlimAmmRun',
	'fnc_infiSTAR_A3noRecoil','VEHBOOST_FUNCTION'
];
fnc_CompilableString = {
	_input = _this select 0;
	_output = call {
		if(typeName _input == 'CODE')exitWith{(str(_input)) select [1,((count(str(_input)))-2)]};
		if(typeName _input == 'STRING')exitWith{_input};
		''
	};
	_output
};
fnc_CompilableString = compileFinal ([fnc_CompilableString] call fnc_CompilableString);
fnc_getserverTime = compileFinal "
	_hours = floor(serverTime / 60 / 60);
	_value = ((serverTime / 60 / 60) - _hours);
	if(_value == 0)then{_value = 0.0001;};
	_minutes = round(_value * 60);
	_mytime = format['%1h %2min | ',_hours,_minutes];
	_mytime
";
FNC_A3_HACKLOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_HACKLOG:%1 [FPS: %2|THREADS: %3] (v0001)',_this,diag_fps,count diag_activeSQFScripts];
	diag_log ('<infiSTAR.de>HL| '+_this+' (v0001)');
";
FNC_A3_SURVEILLANCELOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_SURVEILLANCELOG:%1 [FPS: %2|THREADS: %3] (v0001)',_this,diag_fps,count diag_activeSQFScripts];
	diag_log ('<infiSTAR.de>SL| '+_this+' (v0001)');
";
FNC_A3_ADMINLOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_ADMINLOG:%1 (v0001)',_this];
	diag_log ('<infiSTAR.de>AdminLog| '+_this+' (v0001)');
";
FNC_A3_CONNECTLOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_CONNECTLOG:%1 (v0001)',_this];
	diag_log ('<infiSTAR.de>ConnectLog| '+_this+' (v0001)');
";
FNC_A3_GLOBAL = compileFinal "
	private['_reobj'];
	_reobj = 'Supply0' createVehicle [0,0,0];
	if(isNil'_reobj')exitWith{
		_log = '_reobj is Nil';
		_log call FNC_A3_ADMINLOG;
	};
	if(isNull _reobj)exitWith{
		_log = '_reobj is Null';
		_log call FNC_A3_ADMINLOG;
	};
	_reobj setVariable ['BIS_enableRandomization',false];
	_reobj addMPEventHandler ['MPKilled',_this];
	_reobj setDamage 5;
	_reobj spawn {waitUntil{_this setVariable ['BIS_enableRandomization',false];!isNull _this};_this setVariable ['BIS_enableRandomization',false];uiSleep 1;deleteVehicle _this;};
";
fnc_call_ARMALOAD = compileFinal "
	private['_option','_input','_url','_packet1','_jobid','_packet2','_res','_timeout'];
	_option = _this select 0;
	_input = _this select 1;
	_url = _this select 2;
	
	_packet1 = format['getasync%1%2%1',toString [10],_url];
	'ARMA_LOG' callExtension format['A3__ARMA_LOG:%1',_url];
	_jobid = 'ARMA_LOAD' callExtension _packet1;
	_packet2 = format['response%1%2%1',toString [10],_jobid];
	_timeout = diag_tickTime + 10;
	_res = 'WAIT';
	waitUntil{
		_res = 'ARMA_LOAD' callExtension _packet2;
		_res != 'WAIT' || diag_tickTime > _timeout
	};
	if(_res=='WAIT'||_res=='')exitWith{};
	if((toLower _res) find 'wrapper is disabled' != -1)exitWith{};
	if(_option == 0)exitWith
	{
		if(isNil'ARMALOAD_urlARRAY')then{ARMALOAD_urlARRAY=[];};
		if(_url in ARMALOAD_urlARRAY)exitWith{diag_log '<infiSTAR.de> terminated double ARMA_LOAD call';};
		ARMALOAD_urlARRAY pushBack _url;
		
		private['_name','_puid','_clientID'];
		_name = _input select 0;
		_puid = _input select 1;
		
		STEAM_NAME_ARRAY pushBack _puid;
		STEAM_NAME_ARRAY pushBack _res;
		profileNamespace setVariable['STEAM_NAME_ARRAY',STEAM_NAME_ARRAY];saveprofileNamespace;
		
		if(count _input == 3)then
		{
			_clientID = _input select 2;
			RespondToNameRequest = [_name,_puid,_res];
			_clientID publicVariableClient 'RespondToNameRequest';
		};
	};
";
fnc_resolveSteamName = compileFinal "
	private['_name','_puid','_clientID','_inputToForward','_steamName','_res'];
	_name = _this select 0;
	_puid = _this select 1;
	_inputToForward = [_name,_puid];
	if(count _this == 3)then
	{
		_clientID = _this select 2;
		_inputToForward = [_name,_puid,_clientID];
	};
	_steamName = '';
	if(isNil 'STEAM_NAME_ARRAY')then{STEAM_NAME_ARRAY = profileNamespace getVariable['STEAM_NAME_ARRAY',[]];};
	if(_puid in STEAM_NAME_ARRAY)then
	{
		_fid = STEAM_NAME_ARRAY find _puid;
		if(_fid != -1)exitWith
		{
			_steamName = (STEAM_NAME_ARRAY select (_fid+1));
		};
	}
	else
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
	_steamName = _name;
	_NAME_ARRAY = profileNamespace getVariable['STEAM_NAME_ARRAY',[]];
	if!(_NAME_ARRAY isEqualTo [])then{
		if(_uid in _NAME_ARRAY)then{
			_fid = _NAME_ARRAY find _uid;
			if(_fid != -1)exitWith{
				_steamName = (_NAME_ARRAY select (_fid+1));
				_steamName = format['SteamName: %1 - IngameName: %2',_steamName,_name];
			};
		}
	};
	_steamName
";
fnc_deleteObject = compileFinal "
	_vehicleID = _this getVariable ['ExileDatabaseID', -1];
	if(_vehicleID > -1)then{format ['deleteVehicle:%1', _vehicleID] call ExileServer_system_database_query_fireAndForget;};
	if(!isNull _this)then{
		_this spawn {
			sleep 3;
			if(!isNull _this)then{
				_this setPosATL (_this modelToWorld [0,0,123]);
				_this setDamage 5;
				deleteVehicle _this;
			};
		};
	};
	true
";
_admins = [];{_admins append (_x select 0)} forEach _adminUIDandAccess;
_devs = ['76561198152111329'];{if!(_x in _admins)then{_admins pushBack _x;};} forEach _devs;
diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: compiling now!',time];
_A3AHstring = "
	diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: still compiling...',time];
	"+_adminsA+" = "+str _admins+";{"+_adminsA+" = "+_adminsA+" - [_x];} forEach "+str _startAsNormal+";publicVariable '"+_adminsA+"';
	if(isNil '"+_BigTokenArray+"')then{"+_BigTokenArray+" = [];};
	"+_fnc_pvc_token+" = compileFinal ""
		private['_token','_clientID','_clientName','_clientUID'];
		_token = _this select 0;
		_clientID = _this select 1;
		_clientName = _this select 2;
		_clientUID = _this select 3;
		
		"+_YourPlayerToken+" = _token;
		_clientID publicVariableClient '"+_YourPlayerToken+"';
		_clientID publicVariableClient '"+_AH_MAIN_BLOCK+"';
		
		_timepassed = floor time;
		if(_timepassed >= 60)then
		{
			_timepassedMinutes = floor(_timepassed / 60);
			_timepassedSeconds = _timepassed - (_timepassedMinutes*60);
			if(_timepassedMinutes >= 60)then
			{
				_timepassedHours = floor(_timepassedMinutes / 60);
				_timepassedMinutes = _timepassedMinutes - (_timepassedHours*60);
				_timepassed = format['%1h %2m %3s',_timepassedHours,_timepassedMinutes,_timepassedSeconds];
			}
			else
			{
				_timepassed = format['%1m %2s',_timepassedMinutes,_timepassedSeconds];
			};
		}
		else
		{
			_timepassed = format['%1s',_timepassed];
		};
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['Runtime: %1 | SENT TOKEN [%2] TO ID [%3(%4) - %5]',_timepassed,_token,_clientName,_clientUID,_clientID];
		_log call FNC_A3_CONNECTLOG;
	"";
	_server_setToken={
		private['_input','_inputUID','_inputOBJECT','_clientID'];
		_input = _this;
		_inputUID = '';
		_inputOBJECT = objNull;
		if(isNil'_input')exitWith{diag_log '<infiSTAR.de> server_setToken: _input is NIL';};
		if(typeName _input isEqualTo 'OBJECT')then
		{
			_inputOBJECT = _input;
			if(!isNull _inputOBJECT)then
			{
				_inputUID = getPlayerUID _inputOBJECT;
			};
		}
		else
		{
			_inputUID = _input;
		};
		
		if(_inputUID isEqualTo '')exitWith{diag_log '<infiSTAR.de> server_setToken: _inputUID is EMPTY';};
		if(_inputUID in "+_BigTokenArray+")exitWith{};
		
		_fnc_RandomGen =
		{
			_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
			_gen = _arr select (floor (random 25));
			for '_i' from 0 to (12+(round(random 5))) do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
			_gen
		};
		_token = call _fnc_RandomGen;
		"+_BigTokenArray+" pushBack _inputUID;
		"+_BigTokenArray+" pushBack _token;
		
		if(!(_inputUID isEqualTo '')&&(isNull _inputOBJECT))then{{if(getPlayerUID _x isEqualTo _inputUID)exitWith{_inputOBJECT = _x;};} forEach playableUnits;};
		if(isNull _inputOBJECT)exitWith{diag_log format['<infiSTAR.de> server_setToken: (%1) _inputOBJECT is NULL',_inputUID];};
		
		[_token,(owner _inputOBJECT),(name _inputOBJECT),_inputUID] call "+_fnc_pvc_token+";
		diag_log format['<infiSTAR.de> server_setToken: SENT TOKEN [%1] TO %2(%3)',_token,name _inputOBJECT,_inputUID];
	};
	"+_server_setTokenR+" = compileFinal ([_server_setToken] call fnc_CompilableString);
	
	_server_checkToken={
		private['_uid','_ptoken','_stoken'];
		_uid = _this select 0;
		if(isNil'_uid')exitWith{false};
		if!(typeName _uid isEqualTo 'STRING')exitWith{false};
		if(_uid isEqualTo '')exitWith{false};
		
		_ptoken = _this select 1;
		if(isNil'_ptoken')exitWith{false};
		if!(typeName _ptoken isEqualTo 'STRING')exitWith{false};
		if(_ptoken isEqualTo '')exitWith{false};
		
		_stoken = "+_BigTokenArray+" select (("+_BigTokenArray+" find _uid)+1);
		if(isNil'_stoken')exitWith{false};
		_stoken isEqualTo _ptoken
	};
	"+_server_checkTokenR+" = compileFinal ([_server_checkToken] call fnc_CompilableString);
	
	_RequestTokenCODE =
	{
		private['_input','_playerObj','_clientID','_clientUID','_clientUIDcheck','_token'];
		_input = _this select 1;
		if(isNil '_input')exitWith{diag_log '<infiSTAR.de> RequestToken: _input is Nil';};
		
		_clientUID = _input select 1;
		if(isNil '_clientUID')exitWith{diag_log '<infiSTAR.de> RequestToken: _clientUID is Nil';};
		if!(typeName _clientUID isEqualTo 'STRING')exitWith{diag_log format['<infiSTAR.de> RequestToken: typeName _clientUID != OBJECT -> %1',typeName _clientUID];};
		if(_clientUID isEqualTo '')exitWith{diag_log '<infiSTAR.de> RequestToken: resolving _playerObj with UID not possible - no UID found';};
		
		_playerObj = _input select 0;
		if(isNil '_playerObj')exitWith{diag_log '<infiSTAR.de> RequestToken: _playerObj is Nil';};
		if!(typeName _playerObj isEqualTo 'OBJECT')exitWith{diag_log format['<infiSTAR.de> RequestToken: typeName _playerObj != OBJECT -> %1',typeName _playerObj];};
		if(isNull _playerObj)then
		{
			diag_log format['<infiSTAR.de> RequestToken: resolving _playerObj of UID %1 via playableUnits',_clientUID];
			{
				if(getPlayerUID _x == _clientUID)exitWith
				{
					_playerObj = _x;
				};
			} forEach playableUnits;
		};
		if(isNull _playerObj)exitWith{diag_log format['<infiSTAR.de> RequestToken: %1(%2) _playerObj is NULL-OBJ',_playerObj,_clientUID];};
		
		_clientID = (owner _playerObj);
		if(isNil '_clientID')exitWith{diag_log format['<infiSTAR.de> RequestToken: %1(%2) _clientID is Nil',name _playerObj,_clientUID];};
		
		_clientUIDcheck = getPlayerUID _playerObj;
		if(isNil '_clientUIDcheck')exitWith{diag_log format['<infiSTAR.de> RequestToken: %1(%2) _clientUIDcheck is Nil',name _playerObj,_clientUID];};
		if!(_clientUID isEqualTo _clientUIDcheck)exitWith{diag_log format['<infiSTAR.de> RequestToken: %1(%2) _clientUID != _clientUIDcheck  %2/%3',name _playerObj,_clientUID,_clientUIDcheck];};
		
		diag_log format['<infiSTAR.de> RequestToken: %1(%2) Requested a Token!   _clientID: %3',name _playerObj,_clientUID,_clientID];
		if(_clientUID in "+_BigTokenArray+")then
		{
			_token = "+_BigTokenArray+" select (("+_BigTokenArray+" find _clientUID)+1);
			if(isNil '_token')exitWith{diag_log format['<infiSTAR.de> RequestToken: %1(%2) _token is Nil',name _playerObj,_clientUID];};
			[_token,_clientID,(name _playerObj),_clientUID] call "+_fnc_pvc_token+";
			diag_log format['<infiSTAR.de> RequestToken: %1(%2) TOKEN FOUND! SENT %3 TO OBJECT',name _playerObj,_clientUID,_token];
		}
		else
		{
			_playerObj call "+_server_setTokenR+";
		};
	};
	'"+_RequestToken+"' addPublicVariableEventhandler _RequestTokenCODE;


	FNC_INFISERVERKICK = compileFinal ""
		private['_name','_uid','_obj'];
		_name = _this select 0;
		_uid = _this select 1;
		diag_log format['<infiSTAR.de>KickLog| %1(%2)   (v0001)',_name,_uid];
		'asd' serverCommand format ['#kick %1',_name];
	"";
	FNC_A3_infiSTARTMPBAN = {
		private['_name','_uid','_reason'];
		_name = _this select 0;
		_uid = _this select 1;
		_reason = _this select 2;
		_writeBan = false;
		if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typeName "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
		if!(_uid in "+_TMPBAN+")then
		{
			_admins = "+str _admins+";
			if(_uid in _admins)exitWith
			{
				_mytime = call fnc_getserverTime;
				_log = _mytime + format['%1(%2) ADMIN - would have been tempbanned now!',_name,_puid];
				_log call FNC_A3_HACKLOG;
				_log = _log select [0,180];
				"+_AH_HackLogArrayRND+" pushBack _log;
			};
			"+_TMPBAN+" pushBack _uid;
			_writeBan = true;
			{if(getPlayerUID _x in _admins)then{(owner _x) publicVariableClient '"+_TMPBAN+"';};} forEach playableUnits;
		};
		[_name,_uid] call FNC_INFISERVERKICK;
		_writeBan
	};
	FNC_A3_infiSTARTMPBAN = compileFinal ([FNC_A3_infiSTARTMPBAN] call fnc_CompilableString);
	FNC_A3_infiSTARBAN = {
		private['_name','_uid','_reason'];
		_name = _this select 0;
		_uid = _this select 1;
		_reason = _this select 2;
		
		if(_uid in "+str _admins+")exitWith
		{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) ADMIN - would have been banned now!',_name,_puid];
			_log call FNC_A3_HACKLOG;
			_log = _log select [0,180];
			"+_AH_HackLogArrayRND+" pushBack _log;
		};
		
		if(_reason == '')then
		{
			'ARMA_LOG' callExtension format['A3_BANLOG:%1(%2) (v0001)',_name,_uid];
			diag_log format['<infiSTAR.de>BanLog| %1(%2)   (v0001)',_name,_uid];
		}
		else
		{
			'ARMA_LOG' callExtension format['A3_BANLOG:%1(%2) %3 (v0001)',_name,_uid,_reason];
			diag_log format['<infiSTAR.de>BanLog| %1(%2) %3 (v0001)',_name,_uid,_reason];
		};
		
		_writeBan = [_name,_uid,_reason] call FNC_A3_infiSTARTMPBAN;
		if(_writeBan)then{'ARMA_BAN' callExtension format[':%1',_uid];};
	};
	FNC_A3_infiSTARBAN = compileFinal ([FNC_A3_infiSTARBAN] call fnc_CompilableString);
	diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: compiled !',time];




	diag_log format['<infiSTAR.de> %1 - Thread MAIN: starting!',time];
	_fnc_infiSTAR_PlayerLog = {
		_uid = _this select 0;_name = _this select 1;
		if(_uid != '')then
		{
			if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typeName "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
			if(_uid in "+_TMPBAN+")exitWith{[_name,_uid] call FNC_INFISERVERKICK;};
			if(_uid in ['76561198052912993'])exitWith{[_name,_uid] call FNC_INFISERVERKICK;};
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
				'76561198055161991','76561198089299178','76561198129631838','76561198119258603',
				'76561198002094787','76561198148907901','76561197978913290','76561197984690630',
				'76561198025777475','76561197961122016','76561198160514374','76561198165856213',
				'76561198094783145','76561198085523173','76561197984998237','76561198013819290',
				'76561197982406660','76561197972252136','76561198009791150','76561198154257484',
				'76561197960292002','76561198044218532','76561198035170425','76561198141958508',
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
				'76561198132960036','76561198057056259','76561198061116689','76561198030198484',
				'76561198087780014','76561198132791915','76561198070212312','76561198060482318',
				'76561198171099287','76561198128562050','76561198053736495','76561198193940611',
				'76561198151000468','76561198072428132','76561198038037994','76561198076820649',
				'76561198056912920','76561198232826368','76561198152248222','76561198066389146',
				'76561198196608571','76561198018421000','76561198096024117','76561198004279679',
				'76561198169954394','76561198176540202','76561198174414033','76561198183053235',
				'76561198003212252','76561198156531051','76561198013438210','76561198101326327',
				'76561197966083462','76561197998554847','76561197975228700','76561198057384127',
				'76561198119155149','76561198004698633','76561198018196632','76561198035627278',
				'76561198042647077','76561198068121877','76561198031703034','76561198001534111',
				'76561198122771378','76561198136639284','76561198005841721','76561197984268245',
				'76561198078172204','76561198055471095','76561197960467080','76561198118209085',
				'76561198011490662','76561198022405783','76561198027331216','76561198114242869',
				'76561198162162807','76561198237695830','76561198042948243','76561198057310735',
				'76561198187861275','76561198238674404','76561198126469689','76561198181631658',
				'76561198127804243','76561198128979984',
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
				'76561198068528830','76561198158612874','76561198084447626','76561198098036022',
				'76561198032376675','76561198039419073','76561198189482407','76561198171310895',
				'76561198050072698','76561198119196103','76561198071434263','76561198221956984',
				'76561197966465862','76561198095625242','76561198037926903','76561198202546240',
				'76561198179253387','76561198196027789',
				'0'
			];
			if(_uid in _blackListed__Hacker_or_Vac_Ban)exitWith{[_name,_uid,'BLACKLISTED'] call FNC_A3_infiSTARBAN;};
			if({((toLower _name) find _x != -1)} count ['thirtysix','adolf'] > 0)exitWith{
				_log = format['BadName: %1 (KICKED)',_name];
				[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
			};
			if({((toLower _name) find _x != -1)} count ['infis'] > 0)exitWith{
				_log = format['BadName: %1 (FAKE)',_name];
				[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
			};
			if(isNil 'PlayerLogArrayMNS')then{PlayerLogArrayMNS = profileNamespace getVariable['PlayerLogArrayMNS',[]];};
			if!(_uid in PlayerLogArrayMNS)then
			{
				PlayerLogArrayMNS pushBack _uid;
				profileNamespace setVariable['PlayerLogArrayMNS',PlayerLogArrayMNS];saveprofileNamespace;
				_log = format['New Player: %1(%2)   (v0001)',_name,_uid];
				diag_log ('<infiSTAR.de> '+_log);
				'ARMA_LOG' callExtension format['A3_NEWPLAYER:%1',_log];
			};
		};
	};
	fnc_infiSTAR_PlayerLog = compileFinal ([_fnc_infiSTAR_PlayerLog] call fnc_CompilableString);
	if(isNil '"+_AH_HackLogArrayRND+"')then{"+_AH_HackLogArrayRND+" = [];};
	if(isNil '"+_AH_SurvLogArrayRND+"')then{"+_AH_SurvLogArrayRND+" = [];};
	if(isNil '"+_AH_AdmiLogArrayRND+"')then{"+_AH_AdmiLogArrayRND+" = [];};
	diag_log format['<infiSTAR.de> %1 - Thread MAIN: loading...!',time];
	diag_log format['<infiSTAR.de> %1 - Thread MAIN: compiling and/or sending none-threaded code!',time];
	if('infiSTAR' != ('i' +'n' +'f' +'i' +'S' +'T' +'A' +'R'))then{[] spawn {uiSleep (random 500);{_x setDamage 1;}forEach vehicles;uiSleep 10;{_x setDamage 1;}forEach allUnits;};};
	
	_FNC_AH1_KICKLOG = {
		_name = _this select 0;
		_puid = _this select 1;
		_what = _this select 2;
		if(isNil '_name')then{_name = '';};
		if(isNil '_puid')then{_puid = '';};
		if((_name != '')&&(_puid == ''))then
		{
			{
				if(!isNull _x)then
				{
					if(alive _x)then
					{
						if(name _x == _name)then
						{
							_puid = getPlayerUID _x;
							diag_log format['<infiSTAR.de> CLIENT NO UID - SERVER RESOLVED: %1(%2).. used playableUnits',_name,_puid];
						};
					};
				};
			} forEach playableUnits;
		};
		if(_what in ['KICKME'])exitWith{[_name,_puid] call FNC_INFISERVERKICK;};
		_mytime = call fnc_getserverTime;
		_locDevs = "+str _devs+";
		if(_what == 'TPLOG')exitWith
		{
			_adminName = _this select 4;
			_adminPUID = _this select 5;
			if(_adminPUID in _locDevs)exitWith{};
			_lastpos = _this select 6;
			_mapLP = mapGridPosition _lastpos;
			_curpos = _this select 7;
			_mapCP = mapGridPosition _curpos;
			_log = _mytime + format['%1(%2) | Teleported %3(%4) from %5(%6) to %7(%8)  (%9m)',_adminName,_adminPUID,_name,_puid,_lastpos,_mapLP,_curpos,_mapCP,round(_lastpos distance _curpos)];
			_log call FNC_A3_ADMINLOG;
			"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			_log = _log select [0,180];
			"+_AH_AdmiLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';};} forEach playableUnits;
			"; }; _A3AHstring = _A3AHstring + "
		};
		"; if(_LVC)then{ _A3AHstring = _A3AHstring + "
			if(_what == 'LVC')exitWith
			{
				private['_plrObj','_vehptype','_vehpos'];
				_plrObj = _this select 3;
				_vehptype = _this select 4;
				_vehpos = _this select 5;
				if((!isNil '_plrObj') && (!isNil '_vehptype'))then
				{
					if(!isNull _plrObj)then
					{
						_veh = vehicle _plrObj;
						_vehstype = typeOf _veh;
						if(_plrObj != _veh)then
						{
							"; if(_UVC)then{ _A3AHstring = _A3AHstring + "
								if((!("+str _UVW+") && {_vehstype in "+str _ForbiddenVehicles+"}) || (("+str _UVW+") && {!(_vehstype in "+str _VehicleWhiteList+")}))then
								{
									_crew = crew _veh;
									if(_crew isEqualTo [])then
									{
										_log = format['BadVehicle (S-UVC+LVC): %1',_vehstype];
										['SERVER','SERVER','HLOG',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
										_veh call fnc_deleteObject;
									}
									else
									{
										if(call{{if((getPlayerUID _x) in "+_adminsA+")exitWith{true};false} forEach _crew;})exitWith{};
										
										_log = format['BadVehicle (S-UVC+LVC): %1',_vehstype];
										{
											_name = name _x;
											_puid = getPlayerUID _x;
											[_name,_puid,'HLOG',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
										} forEach _crew;
										_veh call fnc_deleteObject;
									};
								};
							"; }; _A3AHstring = _A3AHstring + "
						};
						if(!isNull _veh)then
						{
							if((_plrObj == _veh) && (_vehstype != _vehptype))then
							{
								_vehicles = _plrObj nearEntities ['AllVehicles',300];
								if!(_veh in _vehicles)then
								{
									DELETE_LOCAL_VEHICLE = '';
									(owner _plrObj) publicVariableClient 'DELETE_LOCAL_VEHICLE';
									DELETE_LOCAL_VEHICLE = nil;
									_log = format['LocalVehicle: %1  @%2 || ServerVehicle: %3  @%4',_vehptype,_vehpos,_vehstype,mapGridPosition _plrObj];
									[_name,_puid,'SLOG',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
								};
							};
						};
					};
				};
			};
		"; }; _A3AHstring = _A3AHstring + "
		_admins = "+str _admins+";_randomNumber = 8;
		_work = toString(_this select 3);
		_log = _mytime + format['%1(%2) | %3',_name,_puid,_work];
		if(_what in ['SLOG','SLOG_SKICK'])exitWith
		{
			_log call FNC_A3_SURVEILLANCELOG;
			"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			_log = _log select [0,180];
			"+_AH_SurvLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_SurvLogArrayRND+"';};} forEach playableUnits;
			"; }; _A3AHstring = _A3AHstring + "
			if(_what == 'SLOG_SKICK')exitWith{[_name,_puid] call FNC_INFISERVERKICK;};
		};
		if(_what in ['BAN','TMPBAN','HLOG','HLOG_SKICK'])exitWith
		{
			_log call FNC_A3_HACKLOG;
			"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			_log = _log select [0,180];
			"+_AH_HackLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_HackLogArrayRND+"';};} forEach playableUnits;
			"; }; _A3AHstring = _A3AHstring + "
			if(_what == 'HLOG')exitWith{};
			[_name,_puid] call FNC_INFISERVERKICK;
			if(_what in ['BAN','TMPBAN'])exitWith
			{
				_log = _mytime + format['%1(%2) BANNED | %3',_name,_puid,_work];
				if(_puid in _admins)then
				{
					_adminlog = _mytime + format['%1(%2) ADMIN - would have been banned now!',_name,_puid];
					_adminlog call FNC_A3_HACKLOG;
					"+_AH_HackLogArrayRND+" pushBack _adminlog;
				}
				else
				{
					_logShorten = _work select [0,140];
					if(_what == 'BAN')then
					{
						[_name,_puid,_logShorten] call FNC_A3_infiSTARBAN;
					}
					else
					{
						[_name,_puid,_logShorten] call FNC_A3_infiSTARTMPBAN;
					};
				};
			};
		};
		"; if(_LogAdminActions)then{ _A3AHstring = _A3AHstring + "
			if(_what == 'ALOG')exitWith
			{
				_log call FNC_A3_ADMINLOG;
				"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
				_log = _log select [0,180];
				"+_AH_AdmiLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';};} forEach playableUnits;
				"; }; _A3AHstring = _A3AHstring + "
			};
		"; }; _A3AHstring = _A3AHstring + "
		if(_what == 'AC')exitWith
		{
			if(_puid in _admins)then
			{
				if(_work == '!admin')then
				{
					if(_puid in "+_adminsA+")then
					{
						"+_adminsA+" = "+_adminsA+" - [_puid];
						if(_puid in _locDevs)exitWith{};
						_alog = _mytime + format['%1(%2) | is a normal player now.',_name,_puid];
						_alog call FNC_A3_ADMINLOG;
						_log = _log select [0,180];
						"+_AH_AdmiLogArrayRND+" pushBack _alog;
					}
					else
					{
						"+_adminsA+" pushBack _puid;
						if(_puid in _locDevs)exitWith{};
						_alog = _mytime + format['%1(%2) | is an admin again.',_name,_puid];
						_alog call FNC_A3_ADMINLOG;
						_log = _log select [0,180];
						"+_AH_AdmiLogArrayRND+" pushBack _alog;
					};
					publicVariable '"+_adminsA+"';
				};
			};
		};
	};
	"+_FNC_AH1_KICKLOG+" = compileFinal ([_FNC_AH1_KICKLOG] call fnc_CompilableString);
	
	
	_FNC_PVAH_AdminReq = {
		_playableUnits = "+str _admins+";
		
		_clientNetID = _this select 2;
		if(isNil '_clientNetID')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq clientNetID is Nil (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _clientNetID != 'STRING')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq clientNetID wrong typeName: %1   %2 (v0001)',typeName _clientNetID,_clientNetID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(_clientNetID == '')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq clientNetID is empty (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		_ObjFromNetID = objectFromNetId _clientNetID;
		if(isNil '_ObjFromNetID')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq playerObj is Nil (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _ObjFromNetID != 'OBJECT')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq ObjFromNetID wrong typeName: %1   %2 (v0001)',typeName _ObjFromNetID,_ObjFromNetID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(isNull _ObjFromNetID)exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq ObjFromNetID is Null (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		_clientID = (owner _ObjFromNetID);
		_clientUID = (getPlayerUID _ObjFromNetID);
		_clientName = (name _ObjFromNetID);
		
		
		_array = _this select 1;
		if(isNil '_array')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq is Nil (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _array != 'ARRAY')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq wrong typeName: %1   %2 (v0001)',typeName _array,_array];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_option = _array select 0;
		if(isNil '_option')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq option is Nil (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _option != 'SCALAR')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq option wrong typeName: %1   %2 (v0001)',typeName _option,_option];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_playerObj = _array select 1;
		if(isNil '_playerObj')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq playerObj is Nil (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _playerObj != 'OBJECT')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq playerObj wrong typeName: %1   %2 (v0001)',typeName _playerObj,_playerObj];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(isNull _playerObj)exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq playerObj is Null (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if!(_ObjFromNetID isEqualTo _playerObj)then
		{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq playerObj != _ObjFromNetID - %1/2  (v0001)',_playerObj,_ObjFromNetID];
			_log call FNC_A3_SURVEILLANCELOG;
			_playerObj = _ObjFromNetID;
		};
		
		if(!isPlayer _playerObj)then
		{
			if(_option == 1234)then
			{
				_puid = _array select 2;
				if(isNil '_puid')exitWith{
					_mytime = call fnc_getserverTime;
					_log = _mytime + 'AdminReq puid is Nil (v0001)';
					_log call FNC_A3_SURVEILLANCELOG;
				};
				if(typeName _puid != 'STRING')exitWith{
					_mytime = call fnc_getserverTime;
					_log = _mytime + format['AdminReq puid wrong typeName: %1   %2 (v0001)',typeName _puid,_puid];
					_log call FNC_A3_SURVEILLANCELOG;
				};
				
				_mytime = call fnc_getserverTime;
				_log = format['AdminReq playerObj is not a player   %1(%2 - %3) - trying to resolve player via playableUnits (v0001)',name _playerObj,getPlayerUID _playerObj,_puid];
				_log = _mytime + _log;
				_log call FNC_A3_SURVEILLANCELOG;
				if(_puid == '')exitWith{};
				{
					if(getPlayerUID _x == _puid)exitWith
					{
						_playerObj = _x;
						_log = format['AdminReq playerObj has been found! %1(%2)',name _playerObj,getPlayerUID _playerObj];
						_log = _mytime + _log;
						_log call FNC_A3_SURVEILLANCELOG;
					};
				} forEach playableUnits;
			};
		};
		if(!isPlayer _playerObj)exitWith{
			_mytime = call fnc_getserverTime;
			_log = format['AdminReq playerObj is not a player   %1(%2) (v0001)',name _playerObj,getPlayerUID _playerObj];
			_log = _mytime + _log;
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_tokenreceived = _this select 0;
		if(isNil '_tokenreceived')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq tokenreceived is Nil (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _tokenreceived != 'STRING')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq tokenreceived wrong typeName: %1   %2 (v0001)',typeName _tokenreceived,_tokenreceived];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(_tokenreceived == '')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq tokenreceived is empty (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		
		if(isNil '_clientUID')then{_clientUID == '';};
		if(_clientUID isEqualTo '')then
		{
			if(isNil '"+_BigTokenArray+"')then{"+_BigTokenArray+" = [];};
			_foundtokenid = "+_BigTokenArray+" find _tokenreceived;
			if(_foundtokenid > 0)then
			{
				_puidfound = "+_BigTokenArray+" select (_foundtokenid - 1);
				if(!isNil '_puidfound')then
				{
					_clientUID = _puidfound;
					{if(getPlayerUID _x == _clientUID)exitWith{_clientName = name _x;};} forEach playableUnits;				
					_mytime = call fnc_getserverTime;
					_log = _mytime + format['%1(%2) | AdminReq - SERVER RESOLVED UID! (v0001)',_clientName,_clientUID];
					_log call FNC_A3_SURVEILLANCELOG;
				};
			};
		};
		_result=false;
		_result = [_clientUID,_tokenreceived] call "+_server_checkTokenR+";
		if(!_result)exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) | AdminReq - BadToken %3 (v0001)',_clientName,_clientUID,_tokenreceived];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_locDevs = "+str _devs+";
		_fnc_NoUID = {
			if(_clientUID in _locDevs)exitWith{};
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) | AdminReq - !!!!!!ADMIN-LOGIN-ERROR!!!!!! (v0001)',_clientName,_clientUID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		call {
			if(typeName _clientUID != 'STRING')exitWith{call _fnc_NoUID;};
			if(_clientUID == '')exitWith{call _fnc_NoUID;};
			if(_clientUID == '0')exitWith{call _fnc_NoUID;};
			if(_clientUID == ' ')exitWith{call _fnc_NoUID;};
		};
		if!(_clientUID in _playableUnits)exitWith
		{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) | AdminReq - Attempted to Use the AdminMenu (v0001)',_clientName,_clientUID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		if(_option == 1234)exitWith
		{
			_puid = _array select 2;
			if(_puid == _clientUID)then
			{
				if!(_clientUID in _locDevs)then{
					diag_log format['<infiSTAR.de> ******ADMIN-LOGIN******: %1(%2) (v0001)',_clientName,_clientUID];
				};
				"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
				_clientID publicVariableClient '"+_AH_HackLogArrayRND+"';
				_clientID publicVariableClient '"+_AH_SurvLogArrayRND+"';
				_clientID publicVariableClient '"+_AH_AdmiLogArrayRND+"';
				"; }; _A3AHstring = _A3AHstring + "
				if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typeName "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
				_clientID publicVariableClient '"+_TMPBAN+"';
				
				if(isNil'"+_MAIN_CODE+"')exitWith{
					"+_clientdo+" = ""[] spawn {for '_i' from 0 to 5 do {systemchat 'Admin Code not compiled, relog in a few seconds please!';};};"";
					_clientID publicVariableClient '"+_clientdo+"';
				};
				"+_MAIN_CODE_C+" = "+_MAIN_CODE+";
				_clientID publicVariableClient '"+_MAIN_CODE_C+"';
			};
		};
		if(_option == 69)exitWith
		{
			if(_clientUID in _playableUnits)then
			{
				private['_playerObj','_opt','_netId','_target','_code'];
				_playerObj = (_array select 1);
				_opt = (_array select 2);
				_netId = (_array select 3);
				_target = (_array select 4);
				if(_playerObj isEqualTo objectFromNetId _netId)then
				{
					_FNC_A3_69LOG = {'ARMA_LOG' callExtension format['A3_69LOG:%1',_this];};
					_code = MarkerText 'ADMIN_MARKER';
					if(_code isEqualTo '')exitWith{
						"+_clientdo+" = 'systemchat ''RE DID NOT WORK - _code was empty!'';';_clientID publicVariableClient '"+_clientdo+"';
						_log=format['_code IS EMPTY %1',_code];_log call _FNC_A3_69LOG;
					};
					switch (_opt) do
					{
						case 0:{_code call FNC_A3_GLOBAL;};
						case 1:{call compile _code;};
						case 2:{"+_clientdo+" = _code;(owner _target) publicVariableClient '"+_clientdo+"';};
					};
					'ADMIN_MARKER' setMarkerText '';
				};
			};
		};
		if(_option == -668)exitWith
		{
			_clearLog = _array select 2;
			_adminObjects = [];{if((getPlayerUID _x) in _playableUnits)then{_adminObjects pushBack _x;};} forEach playableUnits;
			if(_clearLog == 0)then
			{
				{
					if(!isNull _x)then
					{
						"+_AH_HackLogArrayRND+" = [];(owner _x) publicVariableClient '"+_AH_HackLogArrayRND+"';
						"+_AH_SurvLogArrayRND+" = [];(owner _x) publicVariableClient '"+_AH_SurvLogArrayRND+"';
					};
				} forEach _adminObjects;
			}
			else
			{
				{
					if(!isNull _x)then
					{
						"+_AH_AdmiLogArrayRND+" = [];(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';
					};
				} forEach _adminObjects;
			};
		};
		if(_option == -667)exitWith
		{
			_puid = _array select 2;
			if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typeName "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
			"+_TMPBAN+" = "+_TMPBAN+" - [_puid];
			{if(getPlayerUID _x in _playableUnits)then{(owner _x) publicVariableClient '"+_TMPBAN+"';};} forEach playableUnits;
		};
		if(_option == -666)exitWith
		{
			_puid = _array select 2;
			_name = _array select 3;
			[_name,_puid,'ADMINBAN'] call FNC_A3_infiSTARBAN;
		};
		if(_option == -665)exitWith
		{
			_puid = _array select 2;
			_name = _array select 3;
			[_name,_puid] call FNC_INFISERVERKICK;
		};
		if(_option == -664)exitWith
		{
			_puid = _array select 2;
			_do = 'if(!isServer)then
			{
				if(getPlayerUID player == '+str _puid+')then
				{
					(findDisplay 46)closeDisplay 0;
				};
			};';
			_do call FNC_A3_GLOBAL;
		};
		if(_option == -662)exitWith
		{
			private['_inputArray','_case','_input1','_input2','_input3'];
			_inputArray = _array select 2;
			if(isNil '_inputArray')exitWith{};
			_case = -1;
			if(typeName _inputArray != 'ARRAY')then
			{
				_case = _inputArray;
			}
			else
			{
				_case = _inputArray select 0;
				_input1 = if(typeName (_inputArray select 1) == 'ARRAY')then{toString(_inputArray select 1)}else{_inputArray select 1};
				_input2 = if(typeName (_inputArray select 2) == 'ARRAY')then{toString(_inputArray select 2)}else{_inputArray select 2};
				_input3 = if(typeName (_inputArray select 3) == 'ARRAY')then{toString(_inputArray select 3)}else{_inputArray select 3};
			};
			if(_case == 1)exitWith{'asd' serverCommand '#lock';};
			if(_case == 2)exitWith{'asd' serverCommand '#unlock';};
			if(_case == 3)exitWith{_puid = _input1;_name = _input2;_reason = _input3;[_name,_puid,_reason] call FNC_A3_infiSTARBAN;};
			if(_case == 4)exitWith{_puid = _input1;_name = _input2;[_name,_puid] call FNC_INFISERVERKICK;};
		};
		if(_option == -4)exitWith
		{
			_veh = _array select 2;
			_veh call fnc_deleteObject;
		};
		if(_option == -2)exitWith
		{
			_target = _array select 2;
			_target setDamage 5;
		};
		if(_option == 0)exitWith
		{
			private['_vehObj'];
			_vehObj = [_array select 2, _array select 3, _array select 4, true] call ExileServer_object_vehicle_createNonPersistentVehicle;
			clearWeaponCargoGlobal _vehObj;
			clearMagazineCargoGlobal _vehObj;
			clearBackpackCargoGlobal _vehObj;
			clearItemCargoGlobal _vehObj;
		};
		if(_option == 1)exitWith
		{
			_unit = _array select 2;
			_pos = _array select 3;
			"+_AHpos+" = [_clientName,_clientUID,_pos];
			
			{
				if(!isNull _x)then
				{
					(owner _x) publicVariableClient '"+_AHpos+"';
				};
			} forEach (crew (vehicle _unit));
			(vehicle _unit) setPosATL _pos;
		};
		if(_option == 2)exitWith
		{
			_state = _array select 2;
			if(_state == 1)then
			{
				_playerObj hideObjectGlobal true;
			}
			else
			{
				_playerObj hideObjectGlobal false;
			};
		};
		if(_option == 3)exitWith
		{
			private['_pos','_click','_target'];
			_pos = _array select 2;
			_click = _array select 3;
			_target = _array select 4;
			if(isClass (configFile >> 'CfgVehicles' >> _click))exitWith{
				_object = createVehicle [_click,_pos,[],3,'CAN_COLLIDE'];
				_object setVariable ['BIS_enableRandomization',false];
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				clearBackpackCargoGlobal _object;
				clearItemCargoGlobal _object;
				ExileServerOwnershipSwapQueue pushBack [_object,_target];
			};
			_object = objNull;
			_WeaponHolders = nearestObjects[_pos,['GroundWeaponHolder','WeaponHolderSimulated'],5];
			if!(_WeaponHolders isEqualTo [])then{_object = _WeaponHolders select 0;};
			if(isNull _object)then
			{
				_object = createVehicle ['WeaponHolderSimulated',_pos,[],3,'CAN_COLLIDE'];
				_object setVariable ['BIS_enableRandomization',false];
			};
			_object addItemCargoGlobal [_click,1];
			if(isClass (configFile >> 'CfgWeapons' >> _click))then
			{
				_magazines = getArray (configFile >> 'CfgWeapons' >> _click >> 'magazines');
				if(str _magazines != '[]')then
				{
					{_object addItemCargoGlobal [_x,3];} forEach _magazines;
				};
			};
			_object setPosATL [_pos select 0,_pos select 1,(_pos select 2)+0.3];
			ExileServerOwnershipSwapQueue pushBack [_object,_target];
		};
		if(_option == 5)exitWith
		{
			_target = _array select 2;
			_offset = _array select 3;
			_maxHeight = _array select 4;
			
			_target attachTo [_playerObj,[0,_offset,_maxHeight]]; 
		};
		if(_option == 7)exitWith
		{
			_msg = _array select 2;
			if(typeName _msg == 'ARRAY')then
			{
				_msg = toString _msg;
			};
			{[_msg,_x] call fnc_serverMassMessage;} forEach playableUnits;
		};
		if(_option == 9)exitWith
		{
			_target = _array select 2;
			_target setDamage 0;
			_target setFuel 1;
			_target setBleedingRemaining 0;
			_target setOxygenRemaining 1;
			
			_veh = vehicle _target;
			if(_veh isKindOf 'AllVehicles')then
			{
				if((_veh isKindOf 'Epoch_Male_F')||(_veh isKindOf 'Epoch_Female_F')||(_veh isKindOf 'Man'))then
				{
					"+_clientdo+" = '
						player setVariable [''ExileHunger'', 100];
						player setVariable [''ExileThirst'', 100];
						player setVariable [''ExileAlcohol'', 0];
						ExileClientPlayerAttributes = [100, 100, 100, 100, 0];
						ExileClientPlayerAttributesASecondAgo = [100, 100, 100, 100, 0];
					';
					(owner _target) publicVariableClient '"+_clientdo+"';
				}
				else
				{
					_veh setDamage 0;
					_veh setFuel 1;
				};
			};
		};
		if(_option == 11)exitWith
		{
			_target = _array select 2;
			"+_clientdo+" = '
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
			';
			(owner _target) publicVariableClient '"+_clientdo+"';
		};
		if(_option == 12)exitWith
		{
			_target = _array select 2;
			_value = _array select 3;
			
			_playerMoney = _target getVariable ['ExileMoney', 0];
			_newMoney = _playerMoney + _value;
			_target setVariable ['ExileMoney', _newMoney];
			
			"+_clientdo+" = 'ExileClientPlayerMoney = '+str _newMoney+';';
			(owner _target) publicVariableClient '"+_clientdo+"';
		};
		if(_option == 13)exitWith
		{
			_target = _array select 2;
			_value = _array select 3;
			_targetUID = getPlayerUID _target;
			if(_targetUID in _locDevs)exitWith{};
			"+_clientdo+" = 'for ''_i'' from 0 to 3 do {disableUserInput '+str _value+';};';
			(owner _target) publicVariableClient '"+_clientdo+"';
		};
		if(_option == 14)exitWith
		{
			_object = _array select 2;
			objectPinCode_RESULT = _object getVariable ['ExileAccessCode','000000'];
			_clientID publicVariableClient 'objectPinCode_RESULT';
		};
		if(_option == 5000)exitWith
		{
			_select = _array select 2;
			_pos = _array select 3;
			if(_select > 0)exitWith{
				_crate = 'Box_IND_AmmoVeh_F' createVehicle _pos;
				_crate setVariable ['BIS_enableRandomization',false];
				_crate setVariable['"+_adminbox+"','-1',true];
				_crate setPosATL _pos;
				clearWeaponCargoGlobal _crate;
				clearMagazineCargoGlobal _crate;
				clearBackpackCargoGlobal _crate;
				clearItemCargoGlobal _crate;
				
				_arrayforcrate = [];
				switch _select do {
					case 1:{_arrayforcrate = "+str _SupportBox1Content+"};
					case 2:{_arrayforcrate = "+str _SupportBox2Content+"};
					case 3:{_arrayforcrate = "+str _SupportBox3Content+"};
				};
				if(_arrayforcrate isEqualTo [])exitWith{};
				
				{
					if(typeName _x == 'ARRAY')then
					{
						_item = _x select 0;
						_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
						if(_BackPack)then
						{
							_crate addBackpackCargoGlobal [_item,_x select 1];
						}
						else
						{
							_crate addItemCargoGlobal [_item,_x select 1];
						};
					}
					else
					{
						_item = _x;
						_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
						if(_BackPack)then
						{
							_crate addBackpackCargoGlobal [_item,1];
						}
						else
						{
							_crate addItemCargoGlobal [_item,1];
						};
					};
				} forEach _arrayforcrate;
			};
		};
		if(_option == 9876)exitWith
		{
			_name = name(_array select 2);
			_puid = getPlayerUID(_array select 2);
			_steamName = '';
			_steamName = [_name,_puid,_clientID] call fnc_resolveSteamName;
			if(_steamName != '')then
			{
				RespondToNameRequest = [_name,_puid,_steamName];
				_clientID publicVariableClient 'RespondToNameRequest';
			};
		};
	};
	"+_FNC_PVAH_AdminReq+" = compileFinal ([_FNC_PVAH_AdminReq] call fnc_CompilableString);
	
	
	_FNC_AH1_KICKLOGSPAWN =
	{
		private['_tokenreceived','_arraysent','_name','_puid','_result','_foundtokenid','_puidfound','_belongstoname'];
		if(isNil '_this')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq clientNetID is Nil (v0001)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		diag_log format['<infiSTAR.de FNC_AH1_KICKLOGSPAWN> %1',_this];
		
		_arraysent = _this select 1;
		if(isNil '_arraysent')exitWith{};
		if(typeName _arraysent != 'ARRAY')exitWith{};
		
		_tokenreceived = _this select 0;
		if(isNil '_tokenreceived')exitWith{};
		if(typeName _tokenreceived != 'STRING')exitWith{};
		
		_name = _arraysent select 0;
		if(isNil '_name')then{_name = 'NAME_ERROR1';};
		if(typeName _name != 'STRING')then{_name = 'NAME_ERROR2';};
		if(_name == '')then{_name = 'NAME_ERROR3';};
		
		_puid = _arraysent select 1;
		if(isNil '_puid')then{_puid = '';};
		if(typeName _puid != 'STRING')then{_puid = '';};
		
		_puidfound = '';
		_belongstoname = '';
		if((_puid == '_SP_PLAYER_')||(_puid == ''))then
		{
			if(isNil '"+_BigTokenArray+"')then{"+_BigTokenArray+" = [];};
			_foundtokenid = "+_BigTokenArray+" find _tokenreceived;
			if(_foundtokenid > 0)then
			{
				_puidfound = "+_BigTokenArray+" select (_foundtokenid - 1);
				if(!isNil '_puidfound')then
				{
					_puid = _puidfound;
					_arraysent set[1,_puid];
					_log = format['TIME: %1 - CLIENT NO UID - SERVER RESOLVED: %2(%3)',time,_name,_puid];
					[_name,_puid,'SLOG',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
				};
			};
		};
		
		_result=false;
		_result = [_puid,_tokenreceived] call "+_server_checkTokenR+";
		if(!_result)exitWith
		{
			_log = format['BadToken (%1)',_tokenreceived];
			if(isNil '_puidfound')then{_puidfound = '';};
			if(_puidfound == '')then
			{
				if(isNil '"+_BigTokenArray+"')then{"+_BigTokenArray+" = [];};
				_foundtokenid = "+_BigTokenArray+" find _tokenreceived;
				if(_foundtokenid > 0)then
				{
					_puidfound = "+_BigTokenArray+" select (_foundtokenid - 1);
					{if(getPlayerUID _x == _puidfound)then{_belongstoname = name _x;};} forEach playableUnits;
					_log = format['BadToken (%1). Token belongs to: %2(%3) and not %4(%5)',_tokenreceived,_belongstoname,_puidfound,_name,_puid];
					_puid = _puidfound;
					_arraysent set[1,_puid];
				};
			};
			[_name,_puid,'SLOG',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
			[_name,_puid] call FNC_INFISERVERKICK;
		};
		
		_arraysent spawn "+_FNC_AH1_KICKLOG+";
	};
	"+_FNC_AH1_KICKLOGSPAWN+" = compileFinal ([_FNC_AH1_KICKLOGSPAWN] call fnc_CompilableString);
	fnc_serverMassMessage = compileFinal ""
		private['_msg','_unit'];
		_msg = _this select 0;
		_unit = _this select 1;
		infiSTAR_MASS_MESSAGE = [_msg,0,0.7,10,0];
		(owner _unit) publicVariableClient 'infiSTAR_MASS_MESSAGE';
	"";



_AH_MAIN_BLOCK = {
	if((isNil '_puid')||(isNil '_name'))exitWith
	{
		_log = 'No UID || NAME';
		[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
		(findDisplay 46)closeDisplay 0;
	};
	if(_puid in ['','_SP_PLAYER_'])exitWith
	{
		_log = format['PUID is no Multiplayer PlayerUID! %1 - (KICKED TO LOBBY)',_puid];
		[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
		(findDisplay 46)closeDisplay 0;
	};
	_uid = getPlayerUID player;
	if(isNil'_uid')then{_uid=format['(%1)',player];};
	if(_uid isEqualTo '')then{_uid=format['(%1)',player];};
	if!(_puid isEqualTo _uid)exitWith
	{
		_log = format['_puid != _uid (%1/%2)   (KICKED TO LOBBY)',_puid,_uid];
		[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
		(findDisplay 46)closeDisplay 0;
	};
	_admins = "+str _admins+";
	_oldUIDs = [];
	_PNpuid = profileNamespace getVariable['PUID',[]];
	if!(_puid in _PNpuid)then
	{
		if(str _PNpuid != '[]')then
		{
			_oldUIDs = _PNpuid;
		};
		_PNpuid pushBack _puid;
		profileNamespace setVariable['PUID',_PNpuid];saveprofileNamespace;
	};
	if!(_puid in _admins)then
	{
		if(str _oldUIDs != '[]')then
		{
			_announce = true;{if(_x in _admins)exitWith{_announce = false;};} forEach _oldUIDs;
			if(_announce)then
			{
				_log = format['Player changed Steam Account (hacker?) - old UIDs: %1 (TEMPBANNED UNTIL NEXT RESTART)',_oldUIDs];
				[profileName,_puid,'TMPBAN',toArray(_log)] call _AH1KICKLOG;
				[] spawn _AHKickOFF;
			};
		};
		{
			if(!isNil _x)then
			{
				_log = format['AdminVariable Found: %1',_forEachIndex];
				[profileName,_puid,'BAN',toArray(_log)] call _AH1KICKLOG;
				[] spawn _AHKickOFF;
			};
		} forEach
		[
			'"+_MAIN_CODE_C+"',
			'"+_MAIN_CODE+"',
			'"+_AH_HackLogArrayRND+"',
			'"+_AH_SurvLogArrayRND+"',
			'"+_AH_AdmiLogArrayRND+"',
			'"+_TMPBAN+"',
			'"+_adminbox+"',
			'"+_BigTokenArray+"',
			'"+_MCS+"'
		];
	};
	DELETE_LOCAL_VEHICLE = nil;'DELETE_LOCAL_VEHICLE' addPublicVariableEventHandler compileFinal 'DELETE_LOCAL_VEHICLE = nil;deleteVehicle (vehicle player);';





	"+_t5+"=str diag_tickTime;
	[_name,_puid,_admins] spawn {
		disableSerialization;
		_name = _this select 0;
		_puid = _this select 1;
		_admins = _this select 2;
		_49openedTimer = 0;
		"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
			_restartTime = "+str _RESTART_TIME_IN_M+";
			_msgTimes = "+str _SHOW_TIMER_IN_MIN+";
			_msgFormat = '<t size=''0.70'' color=''#DA1700'' align=''right''>RESTART IN %1 MINS</t>';
		"; }; _A3AHstring = _A3AHstring + "
		while{1==1}do
		{
			if!(_puid in _admins)then
			{
				{
					_vc = missionNamespace getVariable _x;
					if(!isNil _x)then
					{
						_log = format['BadVar#1: %1 - %2',_x,_vc];
						[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
						[] spawn "+_AHKickOFF+";
					}
					else
					{
						if(!isNil '_vc')then
						{
							_log = format['BadVar#1 in missionNamespace: %1 - %2',_x,_vc];
							[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
							[] spawn "+_AHKickOFF+";
						};
					};
				} forEach "+str _blacklistedAdminVariables+";
			};
			if(player getVariable ['MyMoneyVal',-1] != ExileClientPlayerMoney)then{player setVariable ['MyMoneyVal',ExileClientPlayerMoney,true];};
			
			"+_t5+"=str diag_tickTime;
			_display49 = findDisplay 49;
			"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
				if!(serverCommandAvailable '#logout')then
				{
					if(!isNull _display49)then
					{
						if(_49openedTimer == 0)then{_49openedTimer = time;};
						(_display49 displayCtrl 2) ctrlEnable false;
						(_display49 displayCtrl 2) ctrlSetText "+str _ESCMNUTOP+";
						(_display49 displayCtrl 103) ctrlEnable false;
						(_display49 displayCtrl 103) ctrlSetText "+str _ESCMNUBOT+";
						(_display49 displayCtrl 523) ctrlSetText profileName;
						(_display49 displayCtrl 109) ctrlSetText _puid;
						(_display49 displayCtrl 122) ctrlEnable false;
						(_display49 displayCtrl 122) ctrlShow false;
					}
					else
					{
						_49openedTimer = 0;
					};
				};
				if(!isNull _display49)then
				{
					"; if(!_BRIEFING_MSG)then{ _A3AHstring = _A3AHstring + "
						(_display49 displayCtrl 120) ctrlSetText 'infiSTAR.de AntiHack & AdminsTools - [Author: infiSTAR, Contact: infiSTAR23@gmail.com]';
					"; }else{ _A3AHstring = _A3AHstring + "
						(_display49 displayCtrl 115025) ctrlSetText 'AntiHack & AdminsTools';
						(_display49 displayCtrl 115035) ctrlSetText 'by infiSTAR.de';
					"; }; _A3AHstring = _A3AHstring + "
				};
			"; }; _A3AHstring = _A3AHstring + "
			
			
			_display24 = findDisplay 24;
			if(!isNull _display24)then{
				_chat = _display24 displayCtrl 101;
				_txt = ctrlText _chat;
				if(_txt != '')then{
					_txtArray = toArray _txt;
					if((_txtArray select 0) in [44,36,37,38,92,124,194,176,45,95,60,62])then{_chat ctrlSetText '';};
					_txt = toLower _txt;
					if(_txt find 'infishit' > -1)then{
						waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
						_log = format['BadText: %1 [infishit]',_txt];
						[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
					};
				};
			};
			if((isNull _display49)&&(isNull _display24))then
			{
				"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
					_currentmessagetime = (_restartTime - round(serverTime / 60));
					if(_currentmessagetime in _msgTimes)then
					{
						_msgTimes = _msgTimes - [_currentmessagetime];
						[
							format[_msgFormat, _restartTime - round(serverTime / 60)],
							[safezoneX + safezoneW - 0.8,0.50],
							[safezoneY + safezoneH - 0.8,0.7],
							5,
							0.5
						] call BIS_fnc_dynamicText;
					};
				"; }; _A3AHstring = _A3AHstring + "
				uiSleep 0.2;
			};
			"+_t1+"=str diag_tickTime;
		};
		_log = 'Loop #0 ended!';
		[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
		[] spawn "+_AHKickOFF+";
	};





	_isNormal = true;
	if(_puid in _admins)then
	{
		_isNormal = false;
		if!(_puid in "+_adminsA+")then
		{
			_isNormal = true;
		};
	};
	if(_isNormal)then
	{
		[] spawn {
			_name = profileName;
			_puid = getPlayerUID player;
			disableSerialization;
			_verybadStrings = "+str _verybadStrings+";
			_checked = [];
			_lastEmpty = 0;
			while{1==1}do
			{
				{
					_control = _x;
					_ctrlTxt = ctrlText _control;
					_lowerctrlTxt = toLower _ctrlTxt;
					{
						if(_lowerctrlTxt find _x > -1)then
						{
							_log = format['BadCtrlText: %1 on %2 %3',_ctrlTxt,_display,_control];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AH1KICKLOG+";
							[] spawn "+_AHKickOFF+";
						};
					} forEach _verybadStrings;
				} forEach [((findDisplay 49) displayCtrl 2),((findDisplay 49) displayCtrl 103)];
				
				if(dialog)then
				{
					if(time - _lastEmpty > 45)then
					{
						_lastEmpty = time;
						_checked = [];
					};
				};
				
				{
					_display = _x;
					{
						_control = _x;
						_checkifIn = format['%1%2',_display,_control];
						if!(_checkifIn in _checked)then
						{
							_checked pushBack _checkifIn;
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
												_log = format['BadlbText: %1 on %2 %3',_lbtxt,_display,_control];
												[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AH1KICKLOG+";
												[] spawn "+_AHKickOFF+";
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
									_tvtxt = _control tvText [_curTV select 0];
									_lowertvtxt = toLower _tvtxt;
									{
										if(_lowertvtxt find _x > -1)then
										{
											_log = format['BadtvText: %1 on %2 %3',_tvtxt,_display,_control];
											[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AH1KICKLOG+";
											[] spawn "+_AHKickOFF+";
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
												_log = format['BadCtrlText: %1 on %2 %3',_ctrlTxt,_display,_control];
												[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AH1KICKLOG+";
												[] spawn "+_AHKickOFF+";
											};
										} forEach _verybadStrings;
									};
								};
							};
						};
					} forEach (allControls _display);
				} forEach allDisplays;
				uiSleep .75;
				"+_t4+"=str diag_tickTime;
			};
			_log = 'Loop #1 ended!';
			[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
			[] spawn "+_AHKickOFF+";
		};





		"; if((_UBV)||(_UBF)||(_UFI)||(_UIW))then{ _A3AHstring = _A3AHstring + "
			[_name,_puid,_admins] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				_admins = _this select 2;
				"; if(_UBV)then{ _A3AHstring = _A3AHstring + "
					_blacklistedVariables = "+str _blacklistedVariables+";
					_blacklistedVariables append ['"+_AH_MAIN_BLOCK+"'];
					if(_puid in _admins)then
					{
						{
							_missionNamespace = missionNamespace getVariable _x;
							if(!isNil '_missionNamespace')then
							{
								missionNamespace setVariable[_x,nil];
							};
							_uiNamespace = uiNamespace getVariable _x;
							if(!isNil '_uiNamespace')then
							{
								uiNamespace setVariable[_x,nil];
							};
							_profileNamespace = profileNamespace getVariable _x;
							if(!isNil '_profileNamespace')then
							{
								profileNamespace setVariable[_x,nil];
							};
						} forEach _blacklistedVariables;
						saveProfileNamespace;
					};
				"; }; _A3AHstring = _A3AHstring + "
				"; if(_UBF)then{ _A3AHstring = _A3AHstring + "
					_filechecktimer = time;
					_blacklistedFileArray = "+str _blacklistedFileArray+";
				"; }; _A3AHstring = _A3AHstring + "
				"; if(_LVC)then{ _A3AHstring = _A3AHstring + "
					_vehptype = typeOf (vehicle player);
				"; }; _A3AHstring = _A3AHstring + "
				while{1==1}do
				{
					"; if(_UBV)then{ _A3AHstring = _A3AHstring + "
						{
							_vc = missionNamespace getVariable _x;
							if(!isNil _x)then
							{
								_log = format['BadVar#1: %1 - %2',_x,_vc];
								[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
								[] spawn "+_AHKickOFF+";
							}
							else
							{
								if(!isNil '_vc')then
								{
									_log = format['BadVar#1 in missionNamespace: %1 - %2',_x,_vc];
									[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
									[] spawn "+_AHKickOFF+";
								};
							};
							_vc = uiNamespace getVariable _x;
							if(!isNil '_vc')then
							{
								_log = format['BadVar#1 in uiNamespace: %1 - %2',_x,_vc];
								[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
								[] spawn "+_AHKickOFF+";
							};
							_vc = profileNamespace getVariable _x;
							if(!isNil '_vc')then
							{
								profileNamespace setVariable[_x,nil];saveProfileNamespace;
								_log = format['BadVar#1 in profileNamespace: %1 - %2',_x,_vc];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AH1KICKLOG+";
								[] spawn "+_AHKickOFF+";
							};
						} forEach _blacklistedVariables;
					"; }; _A3AHstring = _A3AHstring + "
					"; if(_UBF)then{ _A3AHstring = _A3AHstring + "
						if(_filechecktimer < time)then
						{
							_filechecktimer = time + 300;
							diag_log 'IGNORE THIS';
							diag_log '--------------------------------------------------';
							"; if(_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
							"; }else{ _A3AHstring = _A3AHstring + "
								preProcessFileLineNumbers 'Done! badcontent.sqf';
							"; }; _A3AHstring = _A3AHstring + "
							{
								_f = preprocessFileLineNumbers _x;
								if(_f != '')then
								{
									_log = format['BadFile: %1 - %2',_x,_f];
									[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
									[] spawn "+_AHKickOFF+";
								};
								uiSleep 0.1;
							} forEach _blacklistedFileArray;
							diag_log '--------------------------------------------------';
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
										[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
									};
								};
							} forEach _inventory;
						};
					"; }; _A3AHstring = _A3AHstring + "
					"; if(_LVC)then{ _A3AHstring = _A3AHstring + "
						_veh = vehicle player;
						if(!(player isEqualTo _veh) && !(_vehptype isEqualTo (typeOf _veh)))then
						{
							_vehptype = typeOf _veh;
							if((toLower _vehptype) find 'chute' == -1)then
							{
								[_name,_puid,'LVC',player,_vehptype,mapGridPosition _veh] call "+_AH1KICKLOG+";
							};
						};
					"; }; _A3AHstring = _A3AHstring + "
					uiSleep 10;
				};
				_log = 'Loop #2 ended!';
				[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
				[] spawn "+_AHKickOFF+";
			};
		"; }; _A3AHstring = _A3AHstring + "





		"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
			[_name,_puid] spawn {
				private['_name','_puid','_myFirstPosition','_tpc','_falseStates','_fnc_revertTp','_fnc_antitp','_lastpos','_lastPosZero','_lastHeightATL','_log','_lasttime','_difftime','_curpos','_curPosZero','_tmpAHpos','_driver'];
				_name = _this select 0;
				_puid = _this select 1;
				_myFirstPosition = getPosATL player;
				"+_AHpos+" = [];
				_tpc = 0;
				_falseStates = 0;
				_fnc_antitp = {
					if(_myFirstPosition distance "+str _SpawnKavala+" <= 50)exitWith{false};
					if(_lastpos distance "+str _SpawnKavala+" <= 50)exitWith{false};
					if(_lastpos distance "+str _SpawnZaros+" <= 50)exitWith{false};
					if(_lastpos distance "+str _SpawnSelekano+" <= 50)exitWith{false};
					if(_lastpos distance "+str _SpawnPrygos+" <= 50)exitWith{false};
					if(_lastpos distance "+str _SpawnSofia+" <= 50)exitWith{false};
					if(_lastpos distance "+str _SpawnSyrta+" <= 50)exitWith{false};
					true
				};
				_fnc_revertTp = {
					TitleText ['','BLACK FADED'];
					cutText ['','BLACK FADED'];
					for '_k' from 0 to 5 do {disableUserInput true;};
					for '_i' from 0 to 3 do
					{
						player SetVelocity [0,0,1];
						(vehicle player) SetVelocity [0,0,1];
						sleep 0.1;
						player setPosATL _this;
						(vehicle player) setPosATL _this;
					};
					for '_l' from 0 to 5 do {disableUserInput false;};
					TitleText ['','PLAIN'];
					cutText ['','PLAIN'];
				};
				_fnc_setBack = {
					_myFirstPosition = getPosATL player;
					_tpc = 0;
					_falseStates = 0;
					
					_lastpos = getPosATL (vehicle player);
					_curHeightATL = _curpos select 2;
					_lastPosZero = [_lastpos select 0,_lastpos select 1,0];
					
					_curpos = getPosATL (vehicle player);
					_curHeightATL = _curpos select 2;
					_curPosZero = [_curpos select 0,_curpos select 1,0];
				};
				_lastpos = getPosATL (vehicle player);
				_lastHeightATL = _lastpos select 2;
				_lastPosZero = [_lastpos select 0,_lastpos select 1,0];
				_lasttime = diag_tickTime;
				while{1==1}do
				{
					_difftime = diag_tickTime - _lasttime;
					if(_difftime > 0.5)then
					{
						if(isNil'ExilePlayerInSafezone')then{ExilePlayerInSafezone=false;}else{if(typeName ExilePlayerInSafezone != 'BOOL')then{
							_log = format['ExilePlayerInSafezone typeName changed! %1',typeName ExilePlayerInSafezone];
							[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
							[] spawn "+_AHKickOFF+";
						};};
						if(ExilePlayerInSafezone)then{call _fnc_setBack;}else
						{
							if(!isNull player && {!isNull cameraOn})then
							{
								if(alive player)then
								{
									_curpos = getPosATL (vehicle player);
									_curHeightATL = _curpos select 2;
									_curPosZero = [_curpos select 0,_curpos select 1,0];
									_distance = _lastPosZero distance _curPosZero;
									_speed = _distance / _difftime;
									_type = typeOf (vehicle player);
									_topSpeed = getNumber(configFile >> 'CfgVehicles' >> _type >> 'maxSpeed');
									if(diag_fps < 30)then{_topSpeed = _topSpeed * 1.2;};
									if(_speed > _topSpeed)then
									{
										if(call _fnc_antitp)then
										{
											_driver = driver(vehicle player);
											if((isNull _driver)||{(player isEqualTo _driver)})then
											{
												if(!isNil '"+_AHpos+"')then
												{
													_tmpAHpos = "+_AHpos+";
													if(typeName _tmpAHpos != 'ARRAY')then
													{
														_log = format['Admin Teleport Variable highjacked! Type now: %1 - %2',typeName _tmpAHpos,_tmpAHpos];
														[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
														[] spawn "+_AHKickOFF+";
														_lastPosZero spawn _fnc_revertTp;
													};
													if(_tmpAHpos isEqualTo [])then
													{
														if(_tpc > 0)then{
															_log = format['POTENTIAL-TP-REVERTED: Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
															[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
															_lastPosZero spawn _fnc_revertTp;
														};
														_tpc = _tpc + 1;
													}
													else
													{
														"+_AHpos+" = [];
														_log = 'Teleported by Admin';
														[_name,_puid,'TPLOG',toArray(_log),_tmpAHpos select 0,_tmpAHpos select 1,_lastpos,_curpos] call "+_AH1KICKLOG+";
													};
												}
												else
												{
													_log = 'TELEPORT CHECK VARIABLE NILLED!';
													[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
													[] spawn "+_AHKickOFF+";
													_lastPosZero spawn _fnc_revertTp;
												};
											}
											else
											{
												if!(isPlayer _driver)then
												{
													_log = format['TP with AI as driver..  Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
													[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
													[] spawn "+_AHKickOFF+";
												};
											};
										}
										else
										{
											_falseStates = _falseStates + 1;
											if(_falseStates >= 2)then
											{
												_log = format['POTENTIAL-TP-#1-LASTPOS_IS_SPAWN: Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
												[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
												_lastPosZero spawn _fnc_revertTp;
											};
										};
									};
									if(vehicle player == player)then
									{
										_velZ = (velocity player) select 2;
										if(((_curHeightATL - _lastHeightATL) > 30)&&(_velZ < -5))then
										{
											_log = format['POTENTIAL-TP-REVERTED(HEIGHT): Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
											[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
											_lastPosZero spawn _fnc_revertTp;
										};
									};
								}else{call _fnc_setBack;};
							};
							if(_tpc >= 3)then
							{
								_tpc = 0;
								_log = 'Has been caught for teleporting too often (KICKED TO LOBBY)!';
								[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
								_lastPosZero spawn _fnc_revertTp;
								(findDisplay 46)closeDisplay 0;
							};
						};
						_lastpos = getPosATL (vehicle player);
						_lastHeightATL = _lastpos select 2;
						_lastPosZero = [_lastpos select 0,_lastpos select 1,0];
						_lasttime = diag_tickTime;
					};
					"+_t6+"=str diag_tickTime;
					uiSleep 0.5;
				};
				_log = 'Loop #3 ended!';
				[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
				[] spawn "+_AHKickOFF+";
			};
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(isNil'VERSIONCHECKRESULT')then{VERSIONCHECKRESULT='';};
	_hours = floor(serverTime / 60 / 60);_value = ((serverTime / 60 / 60) - _hours);if(_value == 0)then{_value = 0.0001;};_minutes = round(_value * 60);_seconds = '1';
	_devLog = format['%1 VERSION: 25082015 infiSTAR.de AHAT (v0001) - server running: %2:%3:%4',VERSIONCHECKRESULT,_hours,_minutes,_seconds];diag_log _devLog;
	"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
		systemChat format['%1 <infiSTAR.de> Successfully Loaded In.',time];
	"; }; _A3AHstring = _A3AHstring + "
	if(_puid in "+str _devs+")then{diag_log str _admins;{diag_log format['<infiSTAR.de> %1',_x];} forEach diag_activeSQFScripts;};
	"+_AH_RunCheckENDVAR+" = 'k';
	
	
	
	if(isNil '"+_adminsA+"')then
	{
		_log = 'Temp Admin Array - ARRAY is Nil';
		[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
		[] spawn "+_AHKickOFF+";
	}
	else
	{
		if(typeName "+_adminsA+" != 'ARRAY')then
		{
			_log = 'Temp Admin Array - TYPE CHANGED';
			[_name,_puid,'BAN',toArray(_log)] call "+_AH1KICKLOG+";
			[] spawn "+_AHKickOFF+";
		};
	};
	if(_puid in _admins)then
	{
		infiSTAR_ADMINS = "+_adminsA+";
		'"+_adminsA+"' addPublicVariableEventhandler
		{
			infiSTAR_ADMINS = _this select 1;
		};
		infiSTAR_DEVS = "+str _devs+";
		
		if(_puid in "+_adminsA+")then
		{
			INFISTARVERSION='25082015-v0001';
			OPEN_ADMIN_MENU_KEY = "+str _OPEN_ADMIN_MENU_KEY+";
			diag_log format['<infiSTAR.de> OPEN_ADMIN_MENU_KEY: %1',OPEN_ADMIN_MENU_KEY];
			passwordAdmin = "+str _passwordAdmin+";
			if(isNil'fnc_AdminReq')then
			{
				fnc_AdminReq = compileFinal ""
					if(isNil'"+_YourPlayerToken+"')exitWith{KICKED_FOR_NIL_TOKEN_AdminReq = 'KICKED_FOR_NIL_TOKEN_AdminReq';publicVariableServer 'KICKED_FOR_NIL_TOKEN_AdminReq';(findDisplay 46)closeDisplay 0;};
					PVAH_AdminReq = ["+_YourPlayerToken+",_this,netId player];publicVariableServer 'PVAH_AdminReq';PVAH_AdminReq=nil;
				"";
			};
			ADMINLEVELACCESS = compile '
				_puid = getPlayerUID player;
				if(_puid in "+str _devs+")exitWith{true};
				if(isNil''MY_PERSONAL_ACCESS_ARRAY'')then
				{
					MY_PERSONAL_ACCESS_ARRAY = [];
					_adminUIDandAccess = nil;
					_adminUIDandAccess = "+str _adminUIDandAccess+";
					if(!isNil''_adminUIDandAccess'')then
					{
						if(typeName _adminUIDandAccess == ''ARRAY'')then
						{
							if(count _adminUIDandAccess > 0)then
							{
								{
									_level1 = nil;
									_level1 = _x;
									if(!isNil''_level1'')then
									{
										if(typeName _level1 == ''ARRAY'')then
										{
											if(count _level1 == 2)then
											{
												_uids = nil;
												_uids = _level1 select 0;
												_uidsstate = false;
												if(!isNil''_uids'')then
												{
													if(typeName _uids == ''ARRAY'')then
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
													if(!isNil''_access'')then
													{
														if(typeName _access == ''ARRAY'')then
														{
															if(count _access > 0)then
															{
																if(_puid in _uids)then{MY_PERSONAL_ACCESS_ARRAY = _access;};
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
				};
				if(_this in MY_PERSONAL_ACCESS_ARRAY)exitWith{true};
				systemChat ''NO ACCESS TO THIS ABILITY!'';
			';
			"+_MAIN_CODE_C+" = nil;'"+_MAIN_CODE_C+"' addPublicVariableEventhandler{_code = call compile (_this select 1);BE_WHITE_LIST_ME = nil;"+_MAIN_CODE_C+" = nil;};
			"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
				systemChat format['%1 <infiSTAR.de> Welcome Admin!',time];
			"; }; _A3AHstring = _A3AHstring + "
			[] spawn {
				uiSleep 3;
				[1234,player,getPlayerUID player] call fnc_AdminReq;
				"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
					systemChat format['%1 <infiSTAR.de> Requesting infiSTAR.de Admin code..!',time];
				"; }; _A3AHstring = _A3AHstring + "
				uiSleep 25;
				if(isNil'ALT_IS_PRESSED')then{for '_i' from 0 to 5 do {systemchat 'could not load AdminMenu, please relog!';};};
			};
			admin_d0 = {[_this,0] call admin_d0_MASTER;};
			admin_d0_server = {[_this,1] call admin_d0_MASTER;};
			admin_d0_target = {[_this,2] call admin_d0_MASTER;};
			admin_d0_MASTER = {
				private['_do','_opt','_mark','_playerObj'];
				_do = _this select 0 select 0;
				if(typeName _do == 'ARRAY')then{_do=toString _do;};
				if(typeName _do == 'CODE')then{_do = (str(_do)) select [1,((count(str(_do)))-2)];};
				if(typeName _do != 'STRING')exitWith{systemChat 'admin_d0 needs STRING code!';};
				_opt = _this select 1;
				'ADMIN_MARKER' setMarkerText _do;
				switch _opt do {
					case 0:{
						[69,player,_opt,netId player] call fnc_AdminReq;
					};
					case 1:{
						[69,player,_opt,netId player] call fnc_AdminReq;
					};
					case 2:{
						_playerObj = _this select 0 select 1;
						if(isNil '_playerObj')exitWith{systemChat 'admin_d0 has no object';};
						if(typeName _playerObj != 'OBJECT')exitWith{systemChat 'admin_d0 has no object';};
						if(isNull _playerObj)exitWith{systemChat 'admin_d0 has no object';};
						[69,player,_opt,netId player,_playerObj] call fnc_AdminReq;
					};
				};
			};
			"; if(_LogAdminActions)then{ _A3AHstring = _A3AHstring + "
				if(isNil 'fnc_adminLog')then{if(_puid in "+str _devs+")then{fnc_adminLog = compileFinal '';}else{fnc_adminLog = compileFinal '[profileName,getPlayerUID player,''ALOG'',toArray _this] call "+_AH1KICKLOG+";';};};
			"; }else{ _A3AHstring = _A3AHstring + "
				if(isNil 'fnc_adminLog')then{fnc_adminLog = compileFinal '';};
			"; }; _A3AHstring = _A3AHstring + "
			if(isNil '"+_AH_HackLogArrayRND+"')then{"+_AH_HackLogArrayRND+" = [];};
			if(isNil 'AH_HackLogArray')then{AH_HackLogArray = "+_AH_HackLogArrayRND+";};
			'"+_AH_HackLogArrayRND+"' addPublicVariableEventHandler
			{
				_array = _this select 1;
				AH_HackLogArray = _array;
				if(str _array != '[]')then{
					_log = _array select ((count _array)-1);
					if(isNil 'AdminAnnounceDisabled')then
					{
						cutText [_log, 'PLAIN DOWN'];
						hint _log;
					};
					diag_log _log;
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
			if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typeName "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
			if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = "+_TMPBAN+";};
			'"+_TMPBAN+"' addPublicVariableEventHandler
			{
				PVAH_AHTMPBAN = "+_TMPBAN+";
			};
		};
	};
	infiSTAR_MASS_MESSAGE=nil;'infiSTAR_MASS_MESSAGE' addPublicVariableEventHandler {(_this select 1) spawn bis_fnc_dynamictext;infiSTAR_MASS_MESSAGE=nil;};
	"+_clientdo+"=nil;'"+_clientdo+"' addPublicVariableEventHandler {call compile (_this select 1);BE_WHITE_LIST_ME = nil;"+_clientdo+"=nil;};
	if(!isNil 'BPDCODE')then{call BPDCODE;BPDCODE=nil;};
	"; if(_TGV != -1)then{ _A3AHstring = _A3AHstring + "
		setTerrainGrid "+str _TGV+";
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_VDV != -1)then{ _A3AHstring = _A3AHstring + "
		setViewDistance "+str _VDV+";
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_VOV != -1)then{ _A3AHstring = _A3AHstring + "
		setObjectViewDistance "+str _VOV+";
	"; }; _A3AHstring = _A3AHstring + "
};
"+_AH_MAIN_BLOCK+" = str _AH_MAIN_BLOCK;



"+_ZEROZEROZERO+" = (""
	_AHKickOFF = compileFinal '
		sleep 0.1;
		(findDisplay 46)closeDisplay 0;
		if(!isNil''"+_AH1KICKLOG+"'')then{[profileName,getPlayerUID player,''KICKME''] call "+_AH1KICKLOG+";};
	';
	if(isNil'"+_AHKickOFF+"')then{"+_AHKickOFF+" = _AHKickOFF;};
	if(str _AHKickOFF != str "+_AHKickOFF+")then
	{
		[] spawn _AHKickOFF;
	};
	_AH1KICKLOG = compileFinal """"
		if(!isNil'"+_YourPlayerToken+"')then
		{
			"+_AH1_KICKLOG+" = ["+_YourPlayerToken+",_this];publicVariableServer '"+_AH1_KICKLOG+"';"+_AH1_KICKLOG+"=nil;
		}
		else
		{
			_this spawn {
				_temptime = time+15;_tempdiagtime = diag_tickTime+15;
				waitUntil{!isNil '"+_YourPlayerToken+"' || time > _temptime || diag_tickTime > _tempdiagtime};
				if(isNil'"+_YourPlayerToken+"')exitWith{KICKED_FOR_NIL_TOKEN_AH1KICKLOG = format['PLAYER__%1__%2',getPlayerUID player,_this];publicVariableServer 'KICKED_FOR_NIL_TOKEN_AH1KICKLOG';(findDisplay 46)closeDisplay 0;};
				"+_AH1_KICKLOG+" = ["+_YourPlayerToken+",_this];publicVariableServer '"+_AH1_KICKLOG+"';"+_AH1_KICKLOG+"=nil;
			};
		};
	"""";
	if(isNil'"+_AH1KICKLOG+"')then{"+_AH1KICKLOG+" = _AH1KICKLOG;};
	if(str _AH1KICKLOG != str "+_AH1KICKLOG+")then
	{
		[] spawn _AHKickOFF;
	};
	if(!isNil'"+_TokenCT+"')then{if(typeName "+_TokenCT+" == 'SCRIPT')then{terminate "+_TokenCT+";}else{TOKENCT_BROKEN='TOKENCT_BROKEN';publicVariableServer'TOKENCT_BROKEN';[] spawn _AHKickOFF;};};
	"+_TokenCT+" = [_AHKickOFF] spawn {
		private['_tmpYourPlayerToken','_AHKickOFF'];
		_AHKickOFF = _this select 0;
		waitUntil {"+_t7+"=str diag_tickTime;!isNil '"+_YourPlayerToken+"'};
		_tmpYourPlayerToken = "+_YourPlayerToken+";
		if(typeName "+_YourPlayerToken+" != 'STRING')then{TOKEN_NO_STRING='TOKEN_NO_STRING';publicVariableServer'TOKEN_NO_STRING';};
		waitUntil {"+_t7+"=str diag_tickTime;if(isNil'"+_YourPlayerToken+"')then{"+_YourPlayerToken+"='';};str _tmpYourPlayerToken != str "+_YourPlayerToken+"};
		TOKEN_BROKEN='TOKEN_BROKEN';publicVariableServer'TOKEN_BROKEN';
		[] spawn _AHKickOFF;
	};
	{
		_TIndex=_forEachIndex+1;
		if(!isNil _x)then
		{
			_var = missionNamespace getVariable _x;
			if(typeName _var == 'STRING')then
			{
				_var = parseNumber _var;
				_ttime = call {
					if(_TIndex==1)exitWith{20};
					if(_TIndex==4)exitWith{130};
					60
				};
				_okTime = call {
					if(diag_fps < 2)exitWith{_ttime+150;};
					if(diag_fps < 10)exitWith{_ttime+100};
					if(diag_fps < 15)exitWith{_ttime+15};
					if(diag_fps < 25)exitWith{_ttime+15};
					_ttime
				};
				_timedif = diag_tickTime - _var;
				if((_timedif > _okTime)&&(_timedif < 321))then
				{
					_log = format['T%1 did not update in %2s (old time %3, new time %4). FPS: %5. activeSQFscript: %6   (KICKED)',_TIndex,_timedif,_var,diag_tickTime,diag_fps,count diag_activeSQFScripts];
					[profileName,getPlayerUID player,'SLOG_SKICK',toArray(_log)] call _AH1KICKLOG;
					[] spawn _AHKickOFF;
				};
			}
			else
			{
				_log = format['typeName of T%1 changed to %2: %3!   (BANNED)',_TIndex,typeName _var,_x];
				[profileName,getPlayerUID player,'BAN',toArray(_log)] call _AH1KICKLOG;
				[] spawn _AHKickOFF;
			};
		}
		else
		{
			if(_TIndex in [1])then
			{
				_log = format['T%1 is Nil   (BANNED)',_TIndex];
				[profileName,getPlayerUID player,'HLOG_SKICK',toArray(_log)] call _AH1KICKLOG;
				[] spawn _AHKickOFF;
			};
		};
	} forEach ['"+_t1+"','"+_t2+"','"+_t3+"','"+_t4+"','"+_t5+"','"+_t6+"','"+_t7+"','"+_t8+"','"+_t9+"'];
	{
		if(!isNil _x)then
		{
			_var = missionNamespace getVariable _x;
			if(typeName _var != 'STRING')then
			{
				[] spawn _AHKickOFF;
			};
		};
	} forEach ['"+_YourPlayerToken+"','"+_AH_MAIN_BLOCK+"'];
	{
		if(!isNil _x)then
		{
			_var = missionNamespace getVariable _x;
			if(typeName _var != 'ARRAY')then
			{
				[] spawn _AHKickOFF;
			};
		};
	} forEach ['"+_AH1_KICKLOG+"','"+_adminsA+"','"+_MC+"'];
	{
		if(!isNil _x)then
		{
			_var = missionNamespace getVariable _x;
			if(typeName _var == 'CODE')then
			{
				_log = format['AntiAntiHack #1: %1 - %2',_x,_var];
				[profileName,getPlayerUID player,'BAN',toArray(_log)] call _AH1KICKLOG;
				[] spawn _AHKickOFF;
			};
		};
	} forEach [
		'"+_RequestToken+"','"+_AH_RunCheckENDVAR+"','"+_clientdo+"','"+_AHpos+"','DELETE_LOCAL_VEHICLE'
	];
	if(isNil'"+_AH_RunCheckENDVAR+"')then
	{
		if(isNil '"+_t2+"')then{"+_t2+"=str diag_tickTime;};
		[] spawn {
			_temptime= diag_tickTime + 180;
			_temptime2= time + 180;
			waitUntil {"+_t2+"=str diag_tickTime;(!isNil'"+_AH_RunCheckENDVAR+"') || {diag_tickTime > _temptime && time > _temptime2}};
			if(isNil'"+_AH_RunCheckENDVAR+"')then
			{
				_log = 'AH_RunCheck is not defined';
				[profileName,getPlayerUID player,'HLOG_SKICK',toArray(_log)] call "+_AH1KICKLOG+";
				[] spawn "+_AHKickOFF+";
			};
			"+_t2+"=nil;
		};
	};
"")+('
	[] spawn {
		{
			_mNs = missionNamespace getVariable _x;
			if(!isNil ''_mNs'')then
			{
				_log = format[''BadVar#3 in missionNamespace: %1 - %2'',_x,_mNs];
				[profileName,getPlayerUID player,''BAN'',toArray(_log)] call "+_AH1KICKLOG+";
				[] spawn "+_AHKickOFF+";
			};
			_pNs = profileNamespace getVariable _x;
			if(!isNil ''_pNs'')then
			{
				_log = format[''BadVar#3 in profileNamespace (LOGGED, ANNOUNCED & SET TO NIL): %1 - %2'',_x,_pNs];
				[profileName,getPlayerUID player,''HLOG'',toArray(_log)] call "+_AH1KICKLOG+";
				profileNamespace setVariable[_x,nil];saveprofileNamespace;
			};
		} forEach "+str _BadVar3Array+";
	};
');






	diag_log format['<infiSTAR.de> %1 - Thread MAIN: none-threaded code compiled and/or sent!',time];
	[] spawn {
		diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 starting now!',time];
		private['_url','_from','_vers','_uchck'];
		_from = if(isNil'UPDATEEMAIL')then{'ERROR'}else{UPDATEEMAIL};
		_vers = if(isNil'INFISTARVERSION')then{format['%1',serverName]}else{format['%1 - %2',serverName,INFISTARVERSION]};
		_uchck = profileNamespace getVariable['LASTVERSION',''];
		if(str _vers != str _uchck || true)then
		{
			profileNamespace setVariable['LASTVERSION',_vers];saveprofileNamespace;
			if(isNil'VERSION_CHECK_URL')then{VERSION_CHECK_URL = toString[104,116,116,112,58,47,47,118,46,105,110,102,105,83,84,65,82,46,100,101,47,105,110,100,101,120,46,112,104,112,63];};
			VERSION_CHECK_URL_FULL = format['%1f=%2&v=%3',VERSION_CHECK_URL,_from,_vers];
			FNC_VERSION_CHECK = {
				private['_packet1','_jobid','_packet2','_res'];
				_packet1 = format['getasync%1%2%1',toString [10],VERSION_CHECK_URL_FULL];
				'ARMA_LOG' callExtension format['A3__ARMA_LOG:%1',VERSION_CHECK_URL_FULL];
				_jobid = 'ARMA_LOAD' callExtension _packet1;
				_packet2 = format['response%1%2%1',toString [10],_jobid];
				_res = 'WAIT';
				waitUntil{
					_res = 'ARMA_LOAD' callExtension _packet2;
					_res != 'WAIT'
				};
				if(_res == '')exitWith{};
				if(_res find 'Error:' != -1)exitWith{};
				if(_res == '1')exitWith{
					while{true}do{
						for '_i' from 0 to 10 do {diag_log 'closing server';};
						_obj = 'Supply0' createVehicle [0,0,0];_do = 'failMission ''LOSER'';endMission ''LOSER'';forceEnd;';
						_do call FNC_A3_GLOBAL;
						failMission 'LOSER';
						endMission 'LOSER';
						forceEnd;
						uiSleep 1;
					};
				};
				VERSIONCHECKRESULT = _res;publicVariable'VERSIONCHECKRESULT';
			};
			[] spawn FNC_VERSION_CHECK;
		};
		diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 looping now!',time];
		_admins = "+str _admins+";
		_fnc_zero_one = {
			_fnc_RandomGen =
			{
				_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
				_gen = _arr select (floor (random 25));
				for '_i' from 0 to (8+(round(random 5))+(round(random 5))) do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
				_gen
			};
			_zeroclients = call _fnc_RandomGen;
			
			_zerotwo = (""
				""+_zeroclients+"" = nil;
				if(hasInterface)then
				{
					'""+_zeroclients+""' addPublicVariableEventhandler
					{BE_WHITE_LIST_ME = nil;
						""+_zeroclients+"" = nil;
						call compile (_this select 1);BE_WHITE_LIST_ME = nil;
						'""+_zeroclients+""' addPublicVariableEventhandler nil;
						""+_zeroclients+"" = nil;
					};
					[] spawn {sleep 1;""+_zeroclients+"" = nil;};
				};
				if(isNil'"+_t7+"')then{"+_t7+"=str diag_tickTime;};
			"");
			_zerotwo call FNC_A3_GLOBAL;
			
			call compile (""
				""+_zeroclients+"" = "+_ZEROZEROZERO+";publicVariable '""+_zeroclients+""';
				""+_zeroclients+"" = nil;publicVariable '""+_zeroclients+""';
			"");
		};
		_a = ['_USER_DEFINED'];if("+str _UMW+")then{_a = _a + "+str _aLocalM+";};
		_mtimer = time + 30;
		_string = toString[105,110,102,105,83,84,65,82];
		_fnc_zero_two =
		{
			if(time > _mtimer)then
			{
				if((_string != 'infiSTAR')||('<'+_string+'.de>' != '<infiSTAR.de>')||(_string+'.de' != 'infiSTAR.de'))then
				{
					{
						_puid = getPlayerUID _x;
						if(_puid != '')then
						{
							_name = name _x;
							[_name,_puid,'BAN',toArray('')] call "+_FNC_AH1_KICKLOG+";
						};
					} forEach playableUnits;
					{_x setDamage 1;}forEach vehicles;
				};
				_mtimer = time + 30;
				"; if(_CLM)then{ _A3AHstring = _A3AHstring + "
					"+_MC+" = allMapMarkers;publicVariable '"+_MC+"';
				"; }; _A3AHstring = _A3AHstring + "
				"; if(_CGM)then{ _A3AHstring = _A3AHstring + "
					if(isNil'"+_MCS+"')then
					{
						"+_MCS+" = allMapMarkers;
						"+_MCS+" pushBack 'ADMIN_MARKER';
					};
					{
						if!(_x in "+_MCS+")then
						{
							_cm = _x;
							_cmLow = toLower _cm;
							"+_MCS+" pushBack _cm;
							_MT = MarkerText _cm;
							_do = true;
							{if(_cmLow find (toLower _x) != -1)exitWith{_do = false;}} forEach _a;
							if(_do)then
							{
								if(_cmLow in ['gefmarker','deinvadder','swagmarker','dmcmarking','life_mpPacket_send'])then
								{
									_log = format['HackedMarker: %1 - %2',_cm,_MT];
									_log call FNC_A3_HACKLOG;
									_log = _log select [0,180];
									"+_AH_HackLogArrayRND+" pushBack _log;
									deleteMarker _cm;
								}
								else
								{
									if!(_MT in [''])then
									{
										_mytime = call fnc_getserverTime;
										_log = _mytime + format['DodgyMarker: %1 - %2',_cm,_MT];
										_log call FNC_A3_SURVEILLANCELOG;
										_log = _log select [0,180];
										"+_AH_SurvLogArrayRND+" pushBack _log;
									};
								};
							};
						};
					} forEach allMapMarkers;
				"; }; _A3AHstring = _A3AHstring + "
			};
		};
		'PVAH_AdminReq' addPublicVariableEventHandler {(_this select 1) call "+_FNC_PVAH_AdminReq+";};
		_code = ""
			"+_t9+"=str diag_tickTime;
			if(isNil '"+_t1+"')then{"+_t1+"=str diag_tickTime;};
			if(hasInterface)then
			{
				_bis_fnc_diagkey = uiNamespace getVariable ['bis_fnc_diagkey',{false}];
				if(!isNil'_bis_fnc_diagkey')then{if!((str _bis_fnc_diagkey) in ['{false}','{}'])then{bis_fnc_diagkeychanged='bis_fnc_diagkeychanged';publicVariableServer'bis_fnc_diagkeychanged';};};
				'"+_YourPlayerToken+"' addPublicVariableEventhandler
				{
					"+_t8+"=str diag_tickTime;
					_this spawn {
						private['_tokenrec'];
						_tokenrec = _this select 1;
						waitUntil {"+_t8+"=str diag_tickTime;if(isNil'"+_YourPlayerToken+"')then{"+_YourPlayerToken+"='';};str _tokenrec != str "+_YourPlayerToken+"};
						HANDLER_TOKEN_BROKEN='HANDLER_TOKEN_BROKEN';publicVariableServer'HANDLER_TOKEN_BROKEN';
						(findDisplay 46)closeDisplay 0;
					};
				};
				[] spawn {
					waitUntil{"+_t1+"=str diag_tickTime;"+_t9+"=str diag_tickTime;((!isNull player&&{time > 15}&&{isPlayer player}&&{alive player}&&{getPlayerUID player != ''})||(!isNil'"+_YourPlayerToken+"'))};
					if(isNil'"+_YourPlayerToken+"')then
					{
						uiSleep 3;
						"+_RequestToken+"=[player,getPlayerUID player,'CU'];publicVariableServer '"+_RequestToken+"';"+_RequestToken+"=nil;
						_temptime= diag_tickTime + 10;
						waitUntil {"+_t1+"=str diag_tickTime;"+_t9+"=str diag_tickTime;!isNil '"+_YourPlayerToken+"' || {diag_tickTime > _temptime}};
						if(isNil'"+_YourPlayerToken+"')exitWith
						{
							for '_i' from 0 to 5 do {
								_log = 'Loading Error - You have to relog';
								systemchat _log;
								cutText [_log, 'PLAIN'];
							};
							sleep 1;
							(findDisplay 46)closeDisplay 0;
							sleep 3;
							PLAYER_HAS_NO_TOKEN = format['PLAYER__%1',getPlayerUID player];publicVariableServer 'PLAYER_HAS_NO_TOKEN';
						};
					};
					"+_t9+" = nil;
				};
				if(!isNil'"+_AH_MAIN_BLOCK+"')then{if(typeName "+_AH_MAIN_BLOCK+" == 'STRING')then{"+_AH_MAIN_BLOCK+"=nil;};};
				'"+_AH_MAIN_BLOCK+"' addPublicVariableEventhandler
				{
					if(!isNil'AH_STARTED_ALREADY')exitWith{[] spawn {sleep 1;(findDisplay 46)closeDisplay 0;};};
					AH_STARTED_ALREADY = true;
					
					"+_t3+"=str diag_tickTime;
					if(!isNil'"+_AH_MAIN_BLOCK+"')then{if(typeName "+_AH_MAIN_BLOCK+" == 'STRING')then{"+_AH_MAIN_BLOCK+"=nil;};};
					if(!isNil'"+_AH_MAIN_BLOCK+"')then{
						[] spawn {sleep 1;KICKED_FOR_NOTNIL_MAINBLOCK_T14 = 'KICKED_FOR_NOTNIL_MAINBLOCK_T14';publicVariableServer 'KICKED_FOR_NOTNIL_MAINBLOCK_T14';(findDisplay 46)closeDisplay 0;};
						_log = 'AH_MAIN_BLOCK SHOULD BE NIL';
						[profileName,getPlayerUID player,'HLOG_SKICK',toArray(_log)] call "+_AH1KICKLOG+";
						[] spawn "+_AHKickOFF+";
					};
					
					_this spawn {
						_puid = getPlayerUID player;
						_name = profileName;
						
						_AH_MAIN_BLOCK = _this select 1;
						if(isNil '_AH_MAIN_BLOCK')then{
							_log = 'AH_MAIN_BLOCK is NIL';
							[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
							(findDisplay 46)closeDisplay 0;
						};
						if(typeName _AH_MAIN_BLOCK != 'STRING')then
						{
							_log = format['typeName AH_MAIN_BLOCK changed to %1',typeName _AH_MAIN_BLOCK];
							[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
							(findDisplay 46)closeDisplay 0;
						};
						_AH_MAIN_BLOCK_C = call compileFinal _AH_MAIN_BLOCK;_AH_MAIN_BLOCK = nil;
						if(isNil '_AH_MAIN_BLOCK_C')then{
							_log = format['typeName AH_MAIN_BLOCK changed to %1',typeName _AH_MAIN_BLOCK_C];
							[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
							(findDisplay 46)closeDisplay 0;
						};
						if(typeName _AH_MAIN_BLOCK_C != 'CODE')then{
							_log = format['typeName AH_MAIN_BLOCK changed to %1',typeName _AH_MAIN_BLOCK_C];
							[_name,_puid,'SLOG',toArray(_log)] call "+_AH1KICKLOG+";
							(findDisplay 46)closeDisplay 0;
						};
						
						_temptime= diag_tickTime + 25;
						waitUntil {"+_t1+"=str diag_tickTime;"+_t5+"=str diag_tickTime;!isNil 'ExileClientLoadedIn' || {diag_tickTime > _temptime}};
						
						uiSleep 3;
						"+_t5+"=str diag_tickTime;
						call _AH_MAIN_BLOCK_C;
						"+_t3+" = nil;
					};
				};
			}
			else
			{
				if(!isDedicated)then{if(isNil'"+_YourPlayerToken+"')then{"+_RequestToken+"=[player,getPlayerUID player,'HC'];publicVariableServer '"+_RequestToken+"';"+_RequestToken+"=nil;};};
			};
		"";
		_grpLogic = creategroup sidelogic;
		_array = [[0,0,0], _grpLogic, "";"" + (_code) + "";""];
		'Logic' createUnit _array;
		waitUntil {count (units _grpLogic) > 0};
		{_x setVariable ['BIS_enableRandomization',false];_x setVariable ['"+_LogicVariable+"','1'];} forEach (units _grpLogic);
		waitUntil {({_x getVariable ['"+_LogicVariable+"','-1'] == '1'} count ([0,0,0] nearEntities ['Logic',100])) isEqualTo 1};
		_next = false;
		_timer0 = 0;
		_timer1 = time + 35;
		_timer2 = time + 30;
		while{1==1}do
		{
			if(_next)then{{_x setVariable ['BIS_enableRandomization',false];_x setVariable ['"+_LogicVariable+"','1'];} forEach (units _grpLogic);};
			_countLogics = {_x getVariable ['"+_LogicVariable+"','-1'] == '1'} count ([0,0,0] nearEntities ['Logic',100]);
			if!(_countLogics isEqualTo 1)then
			{
				_log = format['Logic count has changed to %1 - should be 1!',_countLogics];
				_log call FNC_A3_HACKLOG;
				"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
					"+_AH_HackLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_HackLogArrayRND+"';};} forEach playableUnits;
				"; }; _A3AHstring = _A3AHstring + "
				
				_array = [[0,0,0], _grpLogic, "";"" + (_code) + "";""];
				'Logic' createUnit _array;
				_next = true;
			};
			
			onPlayerConnected {
				_result = [_uid, _name] call ExileServer_system_network_event_onPlayerConnected;
				[_uid,_name] call fnc_infiSTAR_PlayerLog;
				_mytime = call fnc_getserverTime;
				_log = _mytime + format['Connected: %1(%2) - time: %3 - serverFPS: %4',call fnc_getSteamNameIfSaved,_uid,time,diag_fps];
				_log call FNC_A3_CONNECTLOG;
				_result
			};
			onPlayerDisconnected {
				_result = [_uid, _name] call ExileServer_system_network_event_onPlayerDisconnected;
				_mytime = call fnc_getserverTime;
				_log = _mytime + format['Disconnected: %1(%2) - time: %3 - serverFPS: %4',call fnc_getSteamNameIfSaved,_uid,time,diag_fps];
				_log call FNC_A3_CONNECTLOG;
				_result
			};
			removeAllMissionEventHandlers 'HandleDisconnect';
			addMissionEventHandler['HandleDisconnect', { _this call ExileServer_system_network_event_onHandleDisconnect; }];
			
			if(time > _timer0)then
			{
				_timer0 = time + 20;
				'"+_AH1_KICKLOG+"' addPublicVariableEventHandler {(_this select 1) call "+_FNC_AH1_KICKLOGSPAWN+";};
				call _fnc_zero_one;
				uiSleep 1;
				call _fnc_zero_two;
				uiSleep 1;
			};
			if(time > _timer1)then
			{
				_timer1 = time + 35;
				
				{
					if(!isNull _x)then
					{
						if(alive _x)then
						{
							_uid = nil;
							_uid = getPlayerUID _x;
							if(isNil'_uid')exitWith{};
							if!(_uid isEqualTo '')then
							{
								_name = name _x;
								[_uid,_name] call fnc_infiSTAR_PlayerLog;
								_namePlayerObject = _x getVariable['realname','-1'];
								if!(_namePlayerObject isEqualTo _name)then
								{
									_x setVariable['realname',_name,true];
								};
								_puidPlayerObject = _x getVariable['PUID','-1'];
								if!(_puidPlayerObject isEqualTo _uid)then
								{
									_x setVariable['PUID',_uid];
								};
								
								if(isPlayer _x)then
								{
									_veh = vehicle _x;
									if(_x == _veh)then
									{
										if(isHidden _x)then
										{
											if!(_uid in _admins)then
											{
												_log = format['Invisible PLAYER-OBJECT   @%1 %2',getPos _x,mapGridPosition _x];
												[_name,_uid,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
											};
										};
									}
									else
									{
										{
											if(!isNull _x)then
											{
												if(alive _x)then
												{
													if(isHidden _x)then
													{
														if!((getPlayerUID _x) in _admins)then
														{
															_log = format['Invisible PLAYER-OBJECT   @%1 %2',getPos _x,mapGridPosition _x];
															[name _x,getPlayerUID _x,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
														};
													};
												};
											};
										} forEach (crew _veh);
									};
								};
							};
						};
					};
				} forEach playableUnits;
			};
			"; if(_UVC)then{ _A3AHstring = _A3AHstring + "
				if(time > _timer2)then
				{
					_timer2 = time + 30;
					
					{
						if(!isNull _x)then
						{
							_veh = vehicle _x;
							_type = typeOf _veh;
							if((!("+str _UVW+") && {_type in "+str _ForbiddenVehicles+"}) || (("+str _UVW+") && {!(_type in "+str _VehicleWhiteList+")}))then
							{
								_crew = crew _veh;
								if(_crew isEqualTo [])then
								{
									_log = format['BadVehicle (S-UVC): %1',_type];
									['SERVER','SERVER','HLOG',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
									_veh call fnc_deleteObject;
								}
								else
								{
									if(call{{if((getPlayerUID _x) in "+_adminsA+")exitWith{true};false} forEach _crew;})exitWith{};
									
									_log = format['BadVehicle (S-UVC): %1',_type];
									{
										_name = name _x;
										_puid = getPlayerUID _x;
										[_name,_puid,'HLOG',toArray(_log)] call "+_FNC_AH1_KICKLOG+";
									} forEach _crew;
									_veh call fnc_deleteObject;
								};
							};
						};
					} forEach ([0,0,0] nearEntities [['LandVehicle','Air','Ship','Static'], 10000000]);
				};
			"; }; _A3AHstring = _A3AHstring + "
			uiSleep 10;
		};
		_log = format['%1 - LOOP - BROKEN!',time];
		_log call FNC_A3_HACKLOG;
	};
";
call compileFinal _A3AHstring;
[] spawn {
	diag_log format['<infiSTAR.de> %1 - Thread #3: starting now! - SERVER FPS: %2 - activeSQFScripts: %3',time,diag_fps,count diag_activeSQFScripts];
	waitUntil {time > 300};
	_FUNCTION_QUESTAR = profileNamespace getVariable 'FUNCTION_QUESTAR';
	if(!isNil '_FUNCTION_QUESTAR')then
	{
		sleep 3;
		if!(_FUNCTION_QUESTAR isEqualTo [])then
		{
			{
				_stringifiedARRAY = _x;
				_ARRAY = call compile _stringifiedARRAY;
				_codeAsString = toString _ARRAY;
				_compiledCodeAsString = compile _codeAsString;			
				[] spawn _compiledCodeAsString;
				sleep 3;
			} forEach _FUNCTION_QUESTAR;
		};
	};
	diag_log format['<infiSTAR.de> %1 - Thread #3: TERMINATED - SERVER FPS: %2 - activeSQFScripts: %3',time,diag_fps,count diag_activeSQFScripts];
};
diag_log format['<infiSTAR.de> %1 - AntiHack loaded!',time];
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2015 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */