/*
	File: EXILE_AH.sqf
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/






/*
	My UID is hardcoded in here. It could be removed when you
	a) Do not need help from me with scripts/this tool
		AND
	b) if your server is not named MGT (since I test most things on there/with them)
	I obviously don't need it but it can be really handy.
*/
_devs = ['0']; // ya i dont need that shit chris
/*
	I hope this is obvious enough documented, so even those with hardcore trust issues see that this.
	I can not open this up, modify it and let others in or somewhat exploit it.
	You are the only one who can modify it. You the serverowner :)
*/






/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* **************infiSTAR Copyright®© 2011 - 2015 All rights reserved.************** */
/* *********************************www.infiSTAR.de********************************* */
diag_log '<infiSTAR.de> VERSION: 14092015 infiSTAR.de AHAT (v0007)';
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
UPDATEEMAIL='ahmed-banna@hotmail.com';
INFISTARVERSION='14092015-v0007';
diag_log format['<infiSTAR.de> %1 - STARTING',time];
_spawnMarkers = [];{if(getMarkerType _x == 'ExileSpawnZone')then{_spawnMarkers pushBack (getMarkerPos _x);};} forEach allMapMarkers;
createMarker ['ADMIN_MARKER', [0,0,0]];
FNC_A3_LOG_RAND_VAR = compileFinal "
	'ARMA_LOG' callExtension format['A3_RANDOMVAR_LOG:%1 (v0007)',_this];
	diag_log ('<infiSTAR.de>RandomVarLog| '+_this+' (v0007)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_RAND_VAR'] call MAR_fnc_log;};
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
		_arr = ['p','C','E','Q','e','H','c','R','E','G','w','k','N','L','c','H','B','D','s','d','k','K','f','B','y','q','J','B','z','Y'];
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
_FNC_AH_KICKLOG = call _fnc_RandomGen;format['_FNC_AH_KICKLOG: %1',_FNC_AH_KICKLOG] call FNC_A3_LOG_RAND_VAR;
_FNC_AH_KICKLOGSPAWN = call _fnc_RandomGen;format['_FNC_AH_KICKLOGSPAWN: %1',_FNC_AH_KICKLOGSPAWN] call FNC_A3_LOG_RAND_VAR;
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
_AHKickLog = call _fnc_RandomGen;format['_AHKickLog: %1',_AHKickLog] call FNC_A3_LOG_RAND_VAR;
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
_AH_KICKLOG = call _fnc_RandomGen;format['_AH_KICKLOG: %1',_AH_KICKLOG] call FNC_A3_LOG_RAND_VAR;
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
diag_log format['<infiSTAR.de> %1 - loading AntiHack..',time];
{_blacklistedFileArray pushBack format['%1.sqf',_x];} forEach [0,1,2,3,4,5,6,7,8,9,10,'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
_blacklistedFileArray append [
	'bis_Jme_is_God.sqf','titanmm.sqf','l33tH4x0or\L33TMenu.sqf','xoia24rfadfhw2\alishcahc.sqf','m.sqf',
	'spoodyV2.sqf','spoodyV5.sqf','gefdummy.sqf','script.sqf','dummy2.sqf','Unbenannt-1.sqf','Wedor.sqf','guiedo.sqf','V6.sqf','ic_d_4.5.sqf','H4cks.sqf',
	'SSPCM\CheatDiary\CheatInit.sqf','@[Ha.De]\Addons\init.sqf'
];
_verybadStrings =
[
	'menu loaded','rustler','hangender','hungender',
	'douggem','monstercheats','bigben','fireworks','antiantihack',
	'jxmxe','hydroxus','kill target','no recoil','rapid fire','explode all','teleportall',
	'destroyall','destroy all','code to execute','g-e-f','box-esp','god on','god mode','unlimited mags',
	'ctrlcreate','_execscript','_theban','rhynov1','b1g_b3n','infishit',
	'e_x_t_a_s_y','jjjj','weppp3','att4chm3nt','f0od_dr1nk','m3d1c4l','t0ol_it3ms','b4ckp4cks',
	'it3m5','cl0th1ng','lystic','extasy','glasssimon_flo','remote_execution','gladtwoown','_pathtoscripts',
	'flo_simon','sonicccc_','fury_','phoenix_','_my_new_bullet_man','_jm3','disablecollisionwith _bullet',
	'thirtysix','dmc_fnc_4danews','w_o_o_k_i_e_m_e_n_u','xbowbii_','jm3_','wuat','menutest_','listening to jack',
	'dmcheats.de','kichdm','_news_banner','fucked up','lystics menu','rsccombo_2100','\dll\datmalloc','rsclistbox_1501',
	'rsclistbox_1500','\dll\tcmalloc_bi','___newbpass','updated_playerlist','recking_ki','gg_ee_ff','ggggg_eeeee_fffff',
	'gggg_eeee_ffff','mord all','teleport all','__byass','_altislifeh4x','antifrezze','ownscripts','ownscripted','mesnu',
	'mystic_','init re','init life re','spoody','gef_','throx_','_adasaasasa','_dsfnsjf','cheatmenu','in54nity','markad','fuck_me_','_v4fin',
	'a3randvar','infinite ammo','player markers','+ _code +'
];
_blacklistedVariables append ['BIS_fnc_dbg_reminder_value','BIS_fnc_dbg_reminder',
'time','serverTime','myplayeruid','hhahaaaaar','CharlieSheenkeybinds','KickOFF','yolo','runonce','notakeybind','action1','Supa_Licenses','autokick','wallaisseikun','MainMenu',
'GEFClose','GEFWhite','GEFRed','GEFGreen','GEFCyan','FirstHint','new_queued','fn_Exec','FND_fnc_select','fnx3','ANTIHACKKICK','tele','dmap','GOLDENS_GLOBAL_SHIT_YEAH','GLASS911_Run',
'gearDialog_create','lystoKeypress','ThirtySix','LY_SwaggerLikeUs','Jkeyszz','n2','boxofmagic','MainScripts','DMC_fnc_4danews','INFISTARBYPASS','EXEC_TEXT','vehicle_dblclick','init_main',
'ESP_Count','Nute_Dat_Bomber','s_cash100k','XposPlayer','ly_re_onetime','SKAR_checkA','MainScriptsV4','ViewDistance','check_load','already_load','meins','f1','Dummy','Plane_Jump',
'c_player','MouseClickEH','distp','nec2','Menu_I_Run_Color_LP','GLASSv1nce_BindHandler','thecar','FastAnimes','GetinPassenger','iaimon','DMC_Re_onetime','func_execOnServer','fnc_serverKickNice',
'Kick_Admins','DASMOKEON','hovering','r_kelly_be_flying','SLX_XEH_BWC_INIT_COMPILE','VinceLOL_ALTISLIFE','life_fnc_byassSkaroAH','AH_fnc_MP','jayRE','fn_newsbanner','Hack_News','TrollFuncs',
'Fanatic_InfiPass','keybindings_xxx','AndysClosed','UserFuncs','AltisFuncs','RemExe','BB_nofatigue','bis_fnc_diagkey_var_code','First_PAGE','Get_in_D','i_t_s__m_e_o','smissles','Whippy_ESP',
'TargetFuncs2','life_fnc_antiFreeeeze','LY_keyForward','TY_re_onetime','life_fnc_XaAxAA','mein1','GodDamnVehiclesXD','Mystic_FNC_ESP_distance','Esp_Id_setter','DummyMen','whipbut','UserFuncs',
'KrohdoFreedom','selectedPlayer','Lmenu1','ggplayer','throx_menu_item','lvl1','Init_Menu_Slew','D_B_R_T_Y_Slew','V6_GEF','xasfjisisafudmmyx','kekse','UPDATED_RE_36','first','second',
'SNI_PRZ_ZZZ_TargetPlayer','healit','O_fnc_ArmA','MLRN_EXEC'];
_blacklistedAdminVariables =
[
	'fnc_infiAdminKeyDown','BE_WHITE_LIST_ME','MAIN_DISPLAY_ID','fnc_Disconnect_selected','fnc_adminLog','go_in_nearestvehicle_callmevar','noRecoilRun',
	'FNC_CUSTOM_fn_loadInventory','ADMIN_LOCAL_MARKER','ALLOW_ME_THIS_KEYBIND','freeFlightCam','fnc_ButtonClick_44466','fnc_LBSelChanged_LEFT','unlimAmmRun',
	'fnc_infiSTAR_A3noRecoil','VEHBOOST_FUNCTION','fnc_infiSTAR_get_LeftClicks','fnc_AdminReq'
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
	_hours = floor(time / 60 / 60);
	_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
	_seconds = time - (_hours*60*60) - (_minutes * 60);
	format['%1h %2min %3s | ',_hours,_minutes,round _seconds]
";
FNC_A3_HACKLOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_HACKLOG:%1 [FPS: %2|THREADS: %3] (v0007)',_this,diag_fps,count diag_activeSQFScripts];
	diag_log ('<infiSTAR.de>HL| '+_this+' (v0007)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_HACKLOG'] call MAR_fnc_log;};
";
FNC_A3_SURVEILLANCELOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_SURVEILLANCELOG:%1 [FPS: %2|THREADS: %3] (v0007)',_this,diag_fps,count diag_activeSQFScripts];
	diag_log ('<infiSTAR.de>SL| '+_this+' (v0007)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_SURVEILLANCELOG'] call MAR_fnc_log;};
";
FNC_A3_ADMINLOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_ADMINLOG:%1 (v0007)',_this];
	diag_log ('<infiSTAR.de>AdminLog| '+_this+' (v0007)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de__ADMINLOG'] call MAR_fnc_log;};
";
FNC_A3_CONNECTLOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_CONNECTLOG:%1 (v0007)',_this];
	diag_log ('<infiSTAR.de>ConnectLog| '+_this+' (v0007)');
";
FNC_A3_RESOLVESTEAMNAMELOG = compileFinal "
	'ARMA_LOG' callExtension format['A3_RESOLVESTEAMNAMELOG:%1 (v0007)',_this];
	diag_log ('<infiSTAR.de>ResolveSteamName| '+_this+' (v0007)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_RESOLVESTEAMNAMELOG'] call MAR_fnc_log;};
";
FNC_A3_GLOBAL_SAFE = compileFinal "
	private['_reobj','_do'];
	_do = _this;
	if(isNil'_do')exitWith{
		_log = '_do is Nil';
		_log call FNC_A3_ADMINLOG;
	};
	if(typeName _do == 'CODE')then{_do = (str(_do)) select [1,((count(str(_do)))-2)];};
	if(typeName _do != 'STRING')then{_do = str _do;};
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
	_reobj addMPEventHandler ['MPKilled',('if(isServer)exitWith{};'+_do)];
	_reobj setDamage 5;
	_reobj spawn {waitUntil{_this setVariable ['BIS_enableRandomization',false];!isNull _this};_this setVariable ['BIS_enableRandomization',false];uiSleep 1;deleteVehicle _this;};
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
	_jobid = 'ARMA_LOAD' callExtension _packet1;
	_packet2 = format['response%1%2%1',toString [10],_jobid];
	_timeout = diag_tickTime + 10;
	_res = 'WAIT';
	waitUntil{
		_res = 'ARMA_LOAD' callExtension _packet2;
		_res != 'WAIT' || diag_tickTime > _timeout
	};
	if(_res=='WAIT'||_res==''||_res=='URLERROR')exitWith{};
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
			
			format['%1(%2) is %3',_name,_puid,_res] call FNC_A3_RESOLVESTEAMNAMELOG;
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
	_objToDelete = _this;
	if(_objToDelete isKindOf 'Exile_Construction_Flag_Static')exitWith
	{
		_objectID = _objToDelete getVariable ['ExileDatabaseID',-1];
		if(_objectID != -1)then
		{
			_pos = getPosATL _objToDelete;
			_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];
			_holder addItemCargoGlobal ['Exile_Item_Flag',1];
			_pos set[2,(_pos select 2)+0.1];
			_holder setPosATL _pos;
			
			_flagID = _objToDelete getVariable ['ExileDatabaseID',0];
			format ['deleteTerritory:%1', _flagID] call ExileServer_system_database_query_fireAndForget;
		};
		deleteVehicle _objToDelete;
	};
	if(isNumber(configFile >> 'CfgVehicles' >> (typeOf _objToDelete) >> 'exileContainer'))exitWith
	{
		_objToDelete call ExileServer_object_container_packContainer;
	};
	if(_objToDelete isKindOf 'Exile_Construction_Abstract_Static')exitWith
	{
		_type = typeOf _objToDelete;
		_pos = getPosATL _objToDelete;
		if!(_objToDelete isKindOf 'Exile_Construction_Abstract_Physics')then
		{
			_objectID = _objToDelete getVariable ['ExileDatabaseID',-1];
			if(_objectID != -1)then
			{
				_objToDelete call ExileServer_object_construction_database_delete;
				_config = ('(getText(_x >> ''staticObject'') isEqualTo _type)' configClasses (configFile >> 'CfgConstruction')) select 0;
				_config = getText (_config >> 'kitMagazine');
				_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];
				_holder addItemCargoGlobal [_config,1];
				_pos set[2,(_pos select 2)+0.1];
				_holder setPosATL _pos;
			};
		};
		deleteVehicle _objToDelete;
	};
	if(!isNull _objToDelete)then
	{
		_objToDelete call ExileServer_object_vehicle_remove;
		if(!isNull _objToDelete)then{deleteVehicle _objToDelete;};
	};
";
_admins = [];{_admins append (_x select 0)} forEach _adminUIDandAccess;
{if!(_x in _admins)then{_admins pushBack _x;};} forEach _devs;
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
		
		if(!(_inputUID isEqualTo '')&&(isNull _inputOBJECT))then{{if(getPlayerUID _x isEqualTo _inputUID)exitWith{_inputOBJECT = _x;};} forEach allPlayers;};
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
	
	_RequestTokenCODE={
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
			diag_log format['<infiSTAR.de> RequestToken: resolving _playerObj of UID %1 via allPlayers',_clientUID];
			{
				if(getPlayerUID _x == _clientUID)exitWith
				{
					_playerObj = _x;
				};
			} forEach allPlayers;
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
			diag_log format['<infiSTAR.de> RequestToken: %1(%2) TOKEN FOUND! SENT %3 TO OBJECT WITH NETID %4',name _playerObj,_clientUID,_token,netId _playerObj];
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
		'if(profileName == '+str _name+')then{(findDisplay 46)closeDisplay 0;};' call FNC_A3_GLOBAL;
		diag_log format['<infiSTAR.de>KickLog| %1(%2)   (v0007)',_name,_uid];
		(getText(configfile >> 'CfgSettings' >> 'RCON' >> 'serverPassword')) serverCommand format ['#kick %1',_name];
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
			{if(getPlayerUID _x in _admins)then{(owner _x) publicVariableClient '"+_TMPBAN+"';};} forEach allPlayers;
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
			'ARMA_LOG' callExtension format['A3_BANLOG:%1(%2) (v0007)',_name,_uid];
			diag_log format['<infiSTAR.de>BanLog| %1(%2)   (v0007)',_name,_uid];
		}
		else
		{
			'ARMA_LOG' callExtension format['A3_BANLOG:%1(%2) %3 (v0007)',_name,_uid,_reason];
			diag_log format['<infiSTAR.de>BanLog| %1(%2) %3 (v0007)',_name,_uid,_reason];
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
				'76561197982406660','76561197972252136','76561198009791150',
				'76561198044218532','76561198035170425','76561198141958508',
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
				'76561198151000468','76561198244171410','76561198038037994','76561198076820649',
				'76561198056912920','76561198232826368','76561198152248222','76561198066389146',
				'76561198196608571','76561198018421000','76561198096024117','76561198004279679',
				'76561198169954394','76561198176540202','76561198174414033','76561198183053235',
				'76561198003212252','76561198156531051','76561198013438210','76561198101326327',
				'76561197966083462','76561197998554847','76561197975228700','76561198057384127',
				'76561198119155149','76561198004698633','76561198018196632','76561198035627278',
				'76561198042647077','76561198031703034','76561198001534111',
				'76561198122771378','76561198136639284','76561198005841721',
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
				'76561198179253387','76561198196027789','76561198095794948','76561198247892706',
				'76561198072428132','76561198027641828','76561198111703688','76561198079348447',
				'76561198177550182','76561198137433533','76561198104637087',
				'0'
			];
			if(_uid in _blackListed__Hacker_or_Vac_Ban)exitWith{[_name,_uid,'BLACKLISTED'] call FNC_A3_infiSTARBAN;};
			if({((toLower _name) find _x != -1)} count ['thirtysix','adolf','le hippo'] > 0)exitWith{
				_log = format['BadName: %1 (KICKED)',_name];
				[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
			};
			if({((toLower _name) find _x != -1)} count ['infis'] > 0)exitWith{
				_log = format['BadName: %1 (FAKE)',_name];
				[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
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
	
	_FNC_AH_KICKLOG = {
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
							diag_log format['<infiSTAR.de> CLIENT NO UID - SERVER RESOLVED: %1(%2).. used allPlayers',_name,_puid];
						};
					};
				};
			} forEach allPlayers;
		};
		if(_what in ['KICKME'])exitWith{[_name,_puid] call FNC_INFISERVERKICK;};
		_mytime = call fnc_getserverTime;
		_admins = "+str _admins+";
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
			"+_AH_AdmiLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';};} forEach allPlayers;
			"; }; _A3AHstring = _A3AHstring + "
		};
		_randomNumber = 230;
		_work = toString(_this select 3);
		_log = _mytime + format['%1(%2) | %3',_name,_puid,_work];
		if(_what in ['SLOG','SLOG_SKICK'])exitWith
		{
			_log call FNC_A3_SURVEILLANCELOG;
			"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			_log = _log select [0,180];
			"+_AH_SurvLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_SurvLogArrayRND+"';};} forEach allPlayers;
			"; }; _A3AHstring = _A3AHstring + "
			if(_what == 'SLOG_SKICK')exitWith{[_name,_puid] call FNC_INFISERVERKICK;};
		};
		if(_what in ['BAN','TMPBAN','HLOG','HLOG_SKICK'])exitWith
		{
			_log call FNC_A3_HACKLOG;
			"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			_log = _log select [0,180];
			"+_AH_HackLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_HackLogArrayRND+"';};} forEach allPlayers;
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
				"+_AH_AdmiLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';};} forEach allPlayers;
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
	"+_FNC_AH_KICKLOG+" = compileFinal ([_FNC_AH_KICKLOG] call fnc_CompilableString);
	
	
	_FNC_PVAH_AdminReq = {
		_allPlayers = "+str _admins+";
		
		_clientNetID = _this select 2;
		if(isNil '_clientNetID')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq clientNetID is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _clientNetID != 'STRING')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq clientNetID wrong typeName: %1   %2 (v0007)',typeName _clientNetID,_clientNetID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(_clientNetID == '')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq clientNetID is empty (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		_ObjFromNetID = objectFromNetId _clientNetID;
		if(isNil '_ObjFromNetID')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq playerObj is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _ObjFromNetID != 'OBJECT')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq ObjFromNetID wrong typeName: %1   %2 (v0007)',typeName _ObjFromNetID,_ObjFromNetID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(isNull _ObjFromNetID)exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq ObjFromNetID is Null (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		_clientID = (owner _ObjFromNetID);
		_clientUID = (getPlayerUID _ObjFromNetID);
		_clientName = (name _ObjFromNetID);
		
		
		_array = _this select 1;
		if(isNil '_array')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _array != 'ARRAY')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq wrong typeName: %1   %2 (v0007)',typeName _array,_array];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_option = _array select 0;
		if(isNil '_option')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq option is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _option != 'SCALAR')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq option wrong typeName: %1   %2 (v0007)',typeName _option,_option];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_playerObj = _array select 1;
		if(isNil '_playerObj')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq playerObj is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _playerObj != 'OBJECT')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq playerObj wrong typeName: %1   %2 (v0007)',typeName _playerObj,_playerObj];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(isNull _playerObj)exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq playerObj is Null (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if!(_ObjFromNetID isEqualTo _playerObj)then
		{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq playerObj != _ObjFromNetID - %1/2  (v0007)',_playerObj,_ObjFromNetID];
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
					_log = _mytime + 'AdminReq puid is Nil (v0007)';
					_log call FNC_A3_SURVEILLANCELOG;
				};
				if(typeName _puid != 'STRING')exitWith{
					_mytime = call fnc_getserverTime;
					_log = _mytime + format['AdminReq puid wrong typeName: %1   %2 (v0007)',typeName _puid,_puid];
					_log call FNC_A3_SURVEILLANCELOG;
				};
				
				_mytime = call fnc_getserverTime;
				_log = format['AdminReq playerObj is not a player   %1(%2 - %3) - trying to resolve player via allPlayers (v0007)',name _playerObj,getPlayerUID _playerObj,_puid];
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
				} forEach allPlayers;
			};
		};
		if(!isPlayer _playerObj)exitWith{
			_mytime = call fnc_getserverTime;
			_log = format['AdminReq playerObj is not a player   %1(%2) (v0007)',name _playerObj,getPlayerUID _playerObj];
			_log = _mytime + _log;
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_tokenreceived = _this select 0;
		if(isNil '_tokenreceived')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq tokenreceived is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _tokenreceived != 'STRING')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['AdminReq tokenreceived wrong typeName: %1   %2 (v0007)',typeName _tokenreceived,_tokenreceived];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(_tokenreceived == '')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'AdminReq tokenreceived is empty (v0007)';
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
					{if(getPlayerUID _x == _clientUID)exitWith{_clientName = name _x;};} forEach allPlayers;				
					_mytime = call fnc_getserverTime;
					_log = _mytime + format['%1(%2) | AdminReq - SERVER RESOLVED UID! (v0007)',_clientName,_clientUID];
					_log call FNC_A3_SURVEILLANCELOG;
				};
			};
		};
		_result=false;
		_result = [_clientUID,_tokenreceived] call "+_server_checkTokenR+";
		if(!_result)exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) | AdminReq - BadToken %3 (v0007)',_clientName,_clientUID,_tokenreceived];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_locDevs = "+str _devs+";
		_fnc_NoUID = {
			if(_clientUID in _locDevs)exitWith{};
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) | AdminReq - !!!!!!ADMIN-LOGIN-ERROR!!!!!! (v0007)',_clientName,_clientUID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		call {
			if(typeName _clientUID != 'STRING')exitWith{call _fnc_NoUID;};
			if(_clientUID == '')exitWith{call _fnc_NoUID;};
			if(_clientUID == '0')exitWith{call _fnc_NoUID;};
			if(_clientUID == ' ')exitWith{call _fnc_NoUID;};
		};
		if!(_clientUID in _allPlayers)exitWith
		{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) | AdminReq - Attempted to Use the AdminMenu (v0007)',_clientName,_clientUID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		if(_option == 1234)exitWith
		{
			_puid = _array select 2;
			if(_puid == _clientUID)then
			{
				if!(_clientUID in _locDevs)then{
					diag_log format['<infiSTAR.de> ******ADMIN-LOGIN******: %1(%2) (v0007)',_clientName,_clientUID];
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
			if(_clientUID in _allPlayers)then
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
						case 0:{_code call FNC_A3_GLOBAL_SAFE;};
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
			_adminObjects = [];{if((getPlayerUID _x) in _allPlayers)then{_adminObjects pushBack _x;};} forEach allPlayers;
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
			{if(getPlayerUID _x in _allPlayers)then{(owner _x) publicVariableClient '"+_TMPBAN+"';};} forEach allPlayers;
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
			_do = 'if(hasInterface)then
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
			if(_case == 1)exitWith{(getText(configfile >> 'CfgSettings' >> 'RCON' >> 'serverPassword')) serverCommand '#lock';};
			if(_case == 2)exitWith{(getText(configfile >> 'CfgSettings' >> 'RCON' >> 'serverPassword')) serverCommand '#unlock';};
			if(_case == 3)exitWith{_puid = _input1;_name = _input2;_reason = _input3;[_name,_puid,_reason] call FNC_A3_infiSTARBAN;};
			if(_case == 4)exitWith{_puid = _input1;_name = _input2;[_name,_puid] call FNC_INFISERVERKICK;};
		};
		if(_option == -4)exitWith
		{
			_veh = _array select 2;
			_veh call fnc_deleteObject;
		};
		if(_option == -5)exitWith
		{
			_pos = (_array select 2) select 0;
			_radius = (_array select 2) select 1;
			_objectsToDelete = nearestObjects [_pos, ['Exile_Construction_Abstract_Static','Exile_Construction_Flag_Static','Exile_Container_Safe'], _radius];
			
			_cargoToAdd = [];
			{
				_objToDelete = _x;
				if(_objToDelete isKindOf 'Exile_Construction_Flag_Static')then
				{
					_objectID = _objToDelete getVariable ['ExileDatabaseID',-1];
					if(_objectID != -1)then
					{
						_cargoToAdd pushBack 'Exile_Item_Flag';
						_flagID = _objToDelete getVariable ['ExileDatabaseID',0];
						format ['deleteTerritory:%1', _flagID] call ExileServer_system_database_query_fireAndForget;
					};
					deleteVehicle _objToDelete;
				};
				if(isNumber(configFile >> 'CfgVehicles' >> (typeOf _objToDelete) >> 'exileContainer'))then
				{
					_objToDelete call ExileServer_object_container_packContainer;
				};
				if(_objToDelete isKindOf 'Exile_Construction_Abstract_Static')then
				{
					_type = typeOf _objToDelete;
					_pos = getPosATL _objToDelete;
					if!(_objToDelete isKindOf 'Exile_Construction_Abstract_Physics')then
					{
						_objectID = _objToDelete getVariable ['ExileDatabaseID',-1];
						if(_objectID != -1)then
						{
							_objToDelete call ExileServer_object_construction_database_delete;
							_config = ('(getText(_x >> ''staticObject'') isEqualTo _type)' configClasses (configFile >> 'CfgConstruction')) select 0;
							_config = getText (_config >> 'kitMagazine');
							_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];							
							_cargoToAdd pushBack _config;
						};
					};
					deleteVehicle _objToDelete;
				};
			} forEach _objectsToDelete;
			if!(_cargoToAdd isEqualTo [])then
			{
				_pos = _playerObj modelToWorld [0,5,0];
				_pos set[2,0];
				_crate = 'Box_IND_AmmoVeh_F' createVehicle _pos;
				_crate setVariable ['BIS_enableRandomization',false];
				_crate setPosATL _pos;
				clearWeaponCargoGlobal _crate;
				clearMagazineCargoGlobal _crate;
				clearBackpackCargoGlobal _crate;
				clearItemCargoGlobal _crate;
				{_crate addItemCargoGlobal [_x,1];} forEach _cargoToAdd;
			};
		};
		if(_option == -2)exitWith
		{
			_target = _array select 2;
			_target setDamage 5;
		};
		if(_option == 0)exitWith
		{
			private['_vehObj','_netIdvehObj','_target'];
			_vehObj = [_array select 2, _array select 3, _array select 4, true] call ExileServer_object_vehicle_createNonPersistentVehicle;
			clearWeaponCargoGlobal _vehObj;
			clearMagazineCargoGlobal _vehObj;
			clearBackpackCargoGlobal _vehObj;
			clearItemCargoGlobal _vehObj;
			_netIdvehObj = netId _vehObj;
			_target = objectFromNetId (_array select 5);
			"+_clientdo+" = '
				_containerObject = objectFromNetId '+str _netIdvehObj+';
				player moveInDriver _containerObject;
			';
			(owner _target) publicVariableClient '"+_clientdo+"';
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
			{[_msg,_x] call fnc_serverMassMessage;} forEach allPlayers;
		};
		if(_option == 9)exitWith
		{
			_target = _array select 2;
			_target setDamage 0;
			_target setFuel 1;
			if(isPlayer _target)then
			{
				_target setBleedingRemaining 0;
				_target setOxygenRemaining 1;
				_netIDtarget = netId _target;
				_vehicle = vehicle _target;
				_netIDvehicle = netId _vehicle;
				
				if(typeOf _target isEqualTo 'Exile_Unit_Player')then
				{
					"+_clientdo+" = '
						player setVariable [''ExileHunger'', 100];
						player setVariable [''ExileThirst'', 100];
						player setVariable [''ExileAlcohol'', 0];
						ExileClientPlayerAttributes = [100, 100, 100, 100, 0];
						ExileClientPlayerAttributesASecondAgo = [100, 100, 100, 100, 0];
						ExileClientPlayerLastHpRegenerationAt = diag_tickTime;
						ExileClientPlayerOxygen = 100;
						ExileClientPlayerIsAbleToBreathe = true;
						ExileClientPlayerIsDrowning = false;
						ExileClientPlayerIsInjured = false;
						ExileClientPlayerIsBurning = false;
						ExileClientPlayerIsBleeding = false;
						ExileClientPlayerIsExhausted = false;
						ExileClientPlayerIsHungry = false;
						ExileClientPlayerIsThirsty = false;
					';
					(owner _target) publicVariableClient '"+_clientdo+"';
				}
				else
				{
					if((_target isKindOf 'LandVehicle')||(_target isKindOf 'Ship')||(_target isKindOf 'Air'))then
					{
						if(local _target)then
						{
							[_target,9999] call ExileClient_util_fuel_setFuel;
						}
						else
						{
							['setFuelRequest',[_netIDtarget,9999]] call ExileClient_system_network_send;
						};
					};
				};
				if!(_netIDtarget isEqualTo _netIDvehicle)then
				{
					if((_vehicle isKindOf 'LandVehicle')||(_vehicle isKindOf 'Ship')||(_vehicle isKindOf 'Air'))then
					{
						if(local _vehicle)then
						{
							[_vehicle,9999] call ExileClient_util_fuel_setFuel;
						}
						else
						{
							['setFuelRequest',[netId _vehicle,9999]] call ExileClient_system_network_send;
						};
					};
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
			
			ExileClientPlayerMoney = _newMoney;
			(owner _target) publicVariableClient 'ExileClientPlayerMoney';
			
			format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
		};
		if(_option == 122)exitWith
		{
			_target = _array select 2;
			_value = _array select 3;
			
			_playerMoney = _target getVariable ['ExileScore', 0];
			_newScore = _playerMoney + _value;
			_target setVariable ['ExileScore', _newScore];
			
			ExileClientPlayerScore = _newScore;
			(owner _target) publicVariableClient 'ExileClientPlayerScore';
			
			format['setAccountScore:%1:%2', _newScore, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
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
			private['_arrayforcrate'];
			_select = _array select 2;
			_target = _array select 3;
			if(isNil'_target')exitWith{};
			if(!isPlayer _target)exitWith{};
			_targetUID = getPlayerUID _target;
			_targetID = owner _target;
			if(isNil'_targetUID')exitWith{};
			if(_targetUID == '')exitWith{};
			
			_pos = _target modelToWorld [0,3,1];
			_posATL = getPosATL _target;
			_dir = (getDir _target) + 180;
			
			_arrayforcrate = "+str _allSupportBoxes+" select (_select-1);
			if(isNil'_arrayforcrate')exitWith{};
			if(_arrayforcrate isEqualTo [])exitWith{};
			
			_pin = '';for '_i' from 0 to 3 do {_pin = _pin + str(floor(random 10));};
			_containerObject = createVehicle ['Exile_Container_Safe', _pos, [], 0, 'CAN_COLLIDE'];
			clearBackpackCargoGlobal _containerObject;
			clearItemCargoGlobal _containerObject;
			clearMagazineCargoGlobal _containerObject;
			clearWeaponCargoGlobal _containerObject;
			_pos set[2,_posATL select 2];
			_containerObject setPosATL _pos;
			_containerObject setVelocity [0,0,0];
			_containerObject setVectorUp [0,0,1];
			_containerObject setDir _dir;
			
			{
				if(typeName _x == 'ARRAY')then
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
			
			
			_containerObject setVariable ['ExileOwnerUID', _targetUID];
			_containerObject lock 0;
			_containerObject allowDamage false;
			_containerObject removeAllEventHandlers 'HandleDamage';
			
			_position = getPosATL _containerObject;
			_vectorDirection = vectorDir _containerObject;
			_vectorUp = vectorUp _containerObject;
			_data =
			[
				typeOf _containerObject,
				_containerObject getVariable ['ExileOwnerUID', ''],
				_position select 0,
				_position select 1,
				_position select 2,
				_vectorDirection select 0, 
				_vectorDirection select 1,
				_vectorDirection select 2,
				_vectorUp select 0,
				_vectorUp select 1,
				_vectorUp select 2,
				_containerObject call ExileServer_util_getItemCargo,
				magazinesAmmoCargo _containerObject,
				weaponsItemsCargo _containerObject,
				_containerObject call ExileServer_util_getObjectContainerCargo,
				_pin
			];
			_extDB2Message = ['insertContainer', _data] call ExileServer_util_extDB2_createMessage;
			_containerID = _extDB2Message call ExileServer_system_database_query_insertSingle;
			_containerObject setVariable ['ExileDatabaseID', _containerID];
			_containerObject setVariable ['ExileIsPersistent', true];
			_containerObject setVariable ['ExileIsContainer', true];
			_containerObject setVariable ['ExileAccessCode',_pin];
			_containerObject addMPEventHandler ['MPKilled',{if!(isServer)exitwith{}; (_this select 0) call ExileServer_object_container_database_delete}];
			_containerObject setVariable ['ExileIsLocked',-1,true];
			ExileServerOwnershipSwapQueue pushBack [_containerObject, _target];
			
			_txt = format['SupportBox (SAFE) %1 created for %2(%3)- default pin is %4!',_select,name _target,_targetUID,_pin];
			"+_clientdo+" = ""
				_txt = ""+str _txt+"";
				systemChat _txt;
				hint _txt;
			"";
			if!(_targetID isEqualTo _targetID)then
			{
				_targetID publicVariableClient '"+_clientdo+"';
			};
			_clientID publicVariableClient '"+_clientdo+"';
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
	
	
	_FNC_AH_KICKLOGSPAWN =
	{
		private['_tokenreceived','_arraysent','_netId','_objByNetID','_name','_puid','_result','_foundtokenid','_puidfound','_belongstoname'];
		if(isNil '_this')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + 'FNC_AH_KICKLOGSPAWN _this is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1',_this];
		
		_tokenreceived = _this select 0;
		if(isNil '_tokenreceived')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + '_tokenreceived _this is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _tokenreceived != 'STRING')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['_tokenreceived wrong type %1 (v0007)',typeName _tokenreceived];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_arraysent = _this select 1;
		if(isNil '_arraysent')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + '_arraysent _this is Nil (v0007)';
			_log call FNC_A3_SURVEILLANCELOG;
		};
		if(typeName _arraysent != 'ARRAY')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['_arraysent wrong type %1 (v0007)',typeName _arraysent];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		
		_objByNetID = objNull;
		_netId = _this select 2;
		if(isNil '_netId')then{_netId='';};
		if(typeName _netId != 'STRING')exitWith{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['_netId wrong type %1 (v0007)',typeName _netId];
			_log call FNC_A3_SURVEILLANCELOG;
		};
		_objByNetID = objectFromNetId _netId;
		
		
		_name = _arraysent select 0;
		if(isNil '_name')then{_name = 'NAME_ERROR1';};
		if(typeName _name != 'STRING')then{_name = 'NAME_ERROR2';};
		if(_name == '')then{_name = 'NAME_ERROR3';};
		
		_puid = _arraysent select 1;
		if(isNil '_puid')then{_puid = '';};
		if(typeName _puid != 'STRING')then{_puid = '';};
		
		diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1(%2) Token %3 - objByNetID %4',_name,_puid,_tokenreceived,_objByNetID];
		
		
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
					[_name,_puid,'SLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
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
					{if(getPlayerUID _x == _puidfound)then{_belongstoname = name _x;};} forEach allPlayers;
					_log = format['BadToken (%1). Token belongs to: %2(%3) and not %4(%5)',_tokenreceived,_belongstoname,_puidfound,_name,_puid];
					_puid = _puidfound;
					_arraysent set[1,_puid];
				};
			};
			[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
			[_name,_puid] call FNC_INFISERVERKICK;
		};
		
		_arraysent spawn "+_FNC_AH_KICKLOG+";
	};
	"+_FNC_AH_KICKLOGSPAWN+" = compileFinal ([_FNC_AH_KICKLOGSPAWN] call fnc_CompilableString);
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
		[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
		(findDisplay 46)closeDisplay 0;
	};
	if(_puid in ['','_SP_PLAYER_'])exitWith
	{
		_log = format['PUID is no Multiplayer PlayerUID! %1 - (KICKED TO LOBBY)',_puid];
		[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
		(findDisplay 46)closeDisplay 0;
	};
	_uid=format['%1',getPlayerUID player];
	if!(_puid isEqualTo _uid)exitWith
	{
		_log = format['_puid != _uid (%1/%2)   (KICKED TO LOBBY)',_puid,_uid];
		[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
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
				[profileName,_puid,'TMPBAN',toArray(_log)] call "+_AHKickLog+";
				[] spawn "+_AHKickOFF+";
			};
		};
		{
			if(!isNil _x)then
			{
				_log = format['AdminVariable Found: %1',_forEachIndex];
				[profileName,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
				[] spawn "+_AHKickOFF+";
			};
		} forEach
		[
			'"+_MAIN_CODE_C+"',
			'"+_MAIN_CODE+"',
			'"+_AH_HackLogArrayRND+"',
			'"+_AH_SurvLogArrayRND+"',
			'"+_AH_AdmiLogArrayRND+"',
			'"+_TMPBAN+"',
			'"+_BigTokenArray+"',
			'"+_MCS+"'
		];
	};




	"+_t5+"=str diag_tickTime;
	[_name,_puid,_admins] spawn {
		private['_MyMoneyVal','_ExileClientPlayerMoney'];
		disableSerialization;
		_name = _this select 0;
		_puid = _this select 1;
		_admins = _this select 2;
		"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
			_restartTime = "+str _RESTART_TIME_IN_M+";
			_msgTimes = "+str _SHOW_TIMER_IN_MIN+";
			_msgFormat = '<t size=''0.70'' color=''#DA1700'' align=''right''>RESTART IN %1 MINS</t>';
			_restarttimerTimer = 0;
		"; }; _A3AHstring = _A3AHstring + "
		_mapMenuLogged = false;
		
		_variablechecktimer = 0;
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
		_moneyChangeTimer = time;
		while{1==1}do
		{
			_ExileClientPlayerMoney = ExileClientPlayerMoney;
			if(isNil'_ExileClientPlayerMoney')then{_ExileClientPlayerMoney = 0;}else{if(typeName _ExileClientPlayerMoney != 'SCALAR')then{_ExileClientPlayerMoney = 0;};};
			_MyMoneyVal = player getVariable ['MyMoneyVal',_ExileClientPlayerMoney];
			if(isNil'_MyMoneyVal')then{_MyMoneyVal = 0;}else{if(typeName _MyMoneyVal != 'SCALAR')then{_MyMoneyVal = 0;};};
			if!(_MyMoneyVal isEqualTo _ExileClientPlayerMoney)then
			{
				_dif = _ExileClientPlayerMoney - _MyMoneyVal;
				if(_dif > 2000)then
				{
					_log = format['Money incread by %1 in %2 seconds - old %3 new %4',_dif,_moneyChangeTimer-time,_MyMoneyVal,_ExileClientPlayerMoney];
					[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
				};
				
				player setVariable ['MyMoneyVal',_ExileClientPlayerMoney,true];
				_moneyChangeTimer = time;
			};
			
			if(_variablechecktimer < diag_tickTime)then
			{
				_variablechecktimer = diag_tickTime + 5;
				
				if!(_puid in _admins)then
				{
					{
						_vc = missionNamespace getVariable _x;
						if(!isNil _x)then
						{
							_log = format['BadVar#1: %1 - %2',_x,_vc];
							[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
							[] spawn "+_AHKickOFF+";
						}
						else
						{
							if(!isNil '_vc')then
							{
								_log = format['BadVar#1 in missionNamespace: %1 - %2',_x,_vc];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] spawn "+_AHKickOFF+";
							};
						};
					} forEach "+str _blacklistedAdminVariables+";
				};
				
				{
					_vc = missionNamespace getVariable _x;
					if(!isNil _x)then
					{
						_log = format['BadVar#1: %1 - %2',_x,_vc];
						[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
						(findDisplay 46)closeDisplay 0;
					}
					else
					{
						if(!isNil '_vc')then
						{
							_log = format['BadVar#1 in missionNamespace: %1 - %2',_x,_vc];
							[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
							(findDisplay 46)closeDisplay 0;
						};
					};
					_vc = uiNamespace getVariable _x;
					if(!isNil '_vc')then
					{
						_log = format['BadVar#1 in uiNamespace: %1 - %2',_x,_vc];
						[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
						(findDisplay 46)closeDisplay 0;
					};
					_vc = profileNamespace getVariable _x;
					if(!isNil '_vc')then
					{
						_log = format['BadVar#1 in profileNamespace: %1 - %2',_x,_vc];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
						(findDisplay 46)closeDisplay 0;
					};
				} forEach _blacklistedVariables;
			};
			
			
			"+_t5+"=str diag_tickTime;
			_display49 = findDisplay 49;
			"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
				if(!isNull _display49)then
				{
					if!(serverCommandAvailable '#logout')then
					{
						(_display49 displayCtrl 2) ctrlEnable false;
						(_display49 displayCtrl 2) ctrlSetText "+str _ESCMNUTOP+";
						(_display49 displayCtrl 103) ctrlEnable false;
						(_display49 displayCtrl 103) ctrlSetText "+str _ESCMNUBOT+";
						(_display49 displayCtrl 523) ctrlSetText profileName;
						(_display49 displayCtrl 109) ctrlSetText _puid;
						(_display49 displayCtrl 122) ctrlEnable false;
						(_display49 displayCtrl 122) ctrlShow false;
					};
					"; if(!_BRIEFING_MSG)then{ _A3AHstring = _A3AHstring + "
						(_display49 displayCtrl 120) ctrlSetText 'infiSTAR.de AntiHack & AdminsTools - [Author: infiSTAR, Contact: infiSTAR23@gmail.com]';
					"; }else{ _A3AHstring = _A3AHstring + "
						(_display49 displayCtrl 115025) ctrlSetText 'AntiHack & AdminsTools';
						(_display49 displayCtrl 115035) ctrlSetText 'by infiSTAR.de';
					"; }; _A3AHstring = _A3AHstring + "
				};
			"; }; _A3AHstring = _A3AHstring + "
			
			_display24 = findDisplay 24;
			if(!isNull _display24)then
			{
				_chat = _display24 displayCtrl 101;
				_txt = ctrlText _chat;
				
				
				_idKeydown24 = 9001;
				_randomNumber = (floor(random 8))+1;
				for '_i' from 0 to _randomNumber do
				{
					_idKeydown24 = (finddisplay 24) displayAddEventHandler ['KeyDown',{false}];
				};
				if!(_idKeydown24 isEqualTo _randomNumber)then
				{
					if(_idKeydown24 isEqualTo -1)exitWith{};
					_log = format['ChatMenu Found: %1 (%2)',_txt,_idKeydown24];
					[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
					[] spawn "+_AHKickOFF+";
				};
				(findDisplay 24) displayRemoveAllEventHandlers 'KeyDown';
				
				
				if(_txt != '')then{
					_txtArray = toArray _txt;
					if((_txtArray select 0) in [44,36,37,38,92,124,194,176,45,95,60,62])then{_chat ctrlSetText '';};
					_txt = toLower _txt;
					if(_puid in _admins)then{
						if(_txt == '!admin')then
						{
							waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
							[_name,_puid,'AC',toArray(_txt)] call "+_AHKickLog+";
							(findDisplay 46)closeDisplay 0;
						};
					};
					if(_txt find 'infishit' > -1)then{
						waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
						_log = format['BadText: %1 [infishit]',_txt];
						[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
					};
				};
			};
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
						[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
						(findDisplay 46)closeDisplay 0;
						lbClear _control1;
					};
				};
				_control2 = _display12 displayCtrl 1001;
				_lsize = lbSize _control2;
				if(_lsize > 6)then
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
						[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
					};
					lbClear _control2;
				};
			};
			
			
			"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
				if(_restarttimerTimer < diag_tickTime)then
				{
					_restarttimerTimer = diag_tickTime + 10;
					
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
				};
			"; }; _A3AHstring = _A3AHstring + "
			
			onEachFrame {};
			if((isNull _display49)&&(isNull _display24))then{uiSleep 0.2;};
			"+_t1+"=str diag_tickTime;
			if(rating player < 999999)then{player addRating 9999999;};
		};
		_log = 'Loop #0 ended!';
		[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
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
			{uiNamespace setVariable[_x,nil];} forEach ['RscDisplayRemoteMissions','RscDisplayDebugPublic','RscDisplayMovieInterrupt','RscDisplayArsenal'];
			
			"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
			_allowedIddsPre = "+str _allowedIDDs+";
			_allowedDisplays = [];
			{_allowedDisplays pushBack format['Display #%1',_x];} forEach _allowedIddsPre;
			_announceDisplayIddOnce = ['No display'];
			"; }; _A3AHstring = _A3AHstring + "
			
			"; if(_CMC)then{ _A3AHstring = _A3AHstring + "
			_find1 = toLower('#USER');
			"; }; _A3AHstring = _A3AHstring + "
			_start_player_pos = getPos player;
			_lastText = '';
			while{1==1}do
			{
				{
					_disp = _x;
					{
						if(!isNull (_disp displayCtrl _x))then
						{
							_log = format['MenuBasedHack :: %1 :: %2',_disp,_x];
							[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
							[] spawn "+_AHKickOFF+";
						};
					} forEach [24010,16030,13163,989187,99991,16100];
				} forEach allDisplays;
				if(!isNull ((findDisplay 46) displayCtrl -2))then
				{
					_log = 'MenuBasedHack :: 46 :: -2';
					[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
					[] spawn "+_AHKickOFF+";
				};
				
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
										[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
										(findDisplay 46)closeDisplay 0;
									};
								} forEach _verybadStrings;
							};
						};
					} forEach _allCtrls;
				};
				
				if(dialog)then
				{
					if(diag_tickTime - _lastEmpty > 45)then
					{
						_lastEmpty = diag_tickTime;
						_checked = [];
					};
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
							[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
							(findDisplay 46)closeDisplay 0;
						};
					};
				};
				"; }; _A3AHstring = _A3AHstring + "
				"; if(_KCM)then{ _A3AHstring = _A3AHstring + "
					showCommandingMenu '';
				"; }; _A3AHstring = _A3AHstring + "
				
				
				{
					_control = _x;
					_ctrlTxt = ctrlText _control;
					_lowerctrlTxt = toLower _ctrlTxt;
					{
						if(_lowerctrlTxt find _x > -1)then
						{
							_log = format['BadCtrlText: %1 on %2 %3',_ctrlTxt,_display,_control];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] spawn "+_AHKickOFF+";
						};
					} forEach _verybadStrings;
				} forEach [((findDisplay 49) displayCtrl 2),((findDisplay 49) displayCtrl 103)];
				
				
				{
					if(!isNull (findDisplay _x))then
					{
						_log = format['MenuBasedHack :: %1',_x];
						[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
						[] spawn "+_AHKickOFF+";
					};
				} forEach [-1338,-1337,17,19,30,32,45,56,64,69,71,125,132,155,156,165,166,167,1320,1321,2727,2928,2929,3030,316000,9899,0110,110,312];
				
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
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] spawn "+_AHKickOFF+";
							}
							else
							{
								uiNamespace setVariable[_x,nil];
								_log = format['Hacked: %1 - %2',_x,_cc1];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] spawn "+_AHKickOFF+";
							};
						};
					};
				} forEach ['RscDisplayRemoteMissions','RscDisplayDebugPublic','RscDisplayMovieInterrupt','RscDisplayArsenal'];
				
				_c101txt = ctrlText 101;
				if!(_c101txt in ['','ITEM','\A3\Data_F_Mark\Logos\arma3_Mark_logo_ca.paa','\A3\Data_F_Kart\Logos\arma3_karts_logo_ca.paa'])then
				{
					_log = format['ctrlText 101: %1',_c101txt];
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
					(findDisplay 46)closeDisplay 0;
				};
				
				_fkd = 'no';{if(!isNull (findDisplay _x))exitWith{_fkd = str _x;};} forEach "+str _badIDDsToKick+";
				if(_fkd != 'no')then
				{
					_log = format['BadDisplayID: %1',_fkd];
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
					[] spawn "+_AHKickOFF+";
				};
				{if(!isNull (findDisplay _x))then{closeDialog 0;(findDisplay _x) closeDisplay 0;closeDialog 0;closeDialog 0;};} forEach "+str _badIDDsToClose+";
				
				"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
				_toBreakDisplays = [];
				"; }; _A3AHstring = _A3AHstring + "
				{
					"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
					_strx = str _x;
					if!(_strx in _allowedDisplays)then
					{
						_toBreakDisplays pushBack _x;
					};
					"; }; _A3AHstring = _A3AHstring + "
					
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
												[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
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
									_tvtxt = _control tvText _curTV;
									_lowertvtxt = toLower _tvtxt;
									{
										if(_lowertvtxt find _x > -1)then
										{
											_log = format['BadtvText: %1 on %2 %3',_tvtxt,_display,_control];
											[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
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
												[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
												[] spawn "+_AHKickOFF+";
											};
										} forEach _verybadStrings;
									};
								};
							};
						};
					} forEach (allControls _display);
				} forEach allDisplays;
				
				"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
				if!(_toBreakDisplays isEqualTo [])then
				{
					{if(str _x != 'No display')then{_x closeDisplay 0;};} forEach _toBreakDisplays;
					closeDialog 0;closeDialog 0;closeDialog 0;
					
					_lognow = false;
					{_strxxx = str _x;if!(_strxxx in _announceDisplayIddOnce)exitWith{_lognow = true;_announceDisplayIddOnce pushBack _strxxx;};} forEach _toBreakDisplays;
					if(_lognow)then
					{
						_log = format['Not Allowed Displays: %1   (closed)',_toBreakDisplays];
						[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
					};
				};
				"; }; _A3AHstring = _A3AHstring + "
				
				
				_type = typeOf player;
				if!(_type isEqualTo 'Exile_Unit_Player')then
				{
					if((currentWeapon player != '')||(player != vehicle player))then
					{
						if((getPos player) distance _start_player_pos > 500)then
						{
							_log = format['Player is BADTYPE (invisible hack?): %1 - %2 %3 @%4 %5(KICKED TO LOBBY)',_type,(currentWeapon player != ''),(player != vehicle player),getPos player,mapGridPosition player];
							[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							(findDisplay 46)closeDisplay 0;
						};
					};
				};
				
				
				if!(player isEqualTo (vehicle player))then
				{
					_slingloaded = getSlingLoad (vehicle player);
					if(!isNull _slingloaded)then
					{
						if(locked _slingloaded isEqualTo 2)then
						{
							(vehicle player) setSlingLoad objNull;
							
							_log = 'You can not SlingLoad a locked vehicle!';
							systemChat ('<infiSTAR.de> '+_log);
							cutText [_log, 'PLAIN'];
							hint _log;
						};
					};
					"; if(_LVC)then{ _A3AHstring = _A3AHstring + "
						if(netId (vehicle player) isEqualTo '0:0')then
						{
							_type = typeOf (vehicle player);
							_log = format['LocalVehicle: %1 - netId 0:0',_type];
							[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
							deleteVehicle (vehicle player);
						};
					"; }; _A3AHstring = _A3AHstring + "
				};
				uiSleep .75;"+_t4+"=str diag_tickTime;
			};
			_log = 'Loop #1 ended!';
			[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
			[] spawn "+_AHKickOFF+";
		};




		"; if(_UBF||_CAP||_UFI||_UIW)then{ _A3AHstring = _A3AHstring + "
			[_name,_puid] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				"; if(_UBF)then{ _A3AHstring = _A3AHstring + "
					_filechecktimer = 0;
					"; if(_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
						_blacklistedFileArray = ['welcome.sqf'];
					"; }else{ _A3AHstring = _A3AHstring + "
						_blacklistedFileArray = ['Done! badcontent.sqf'];
					"; }; _A3AHstring = _A3AHstring + "
					_blacklistedFileArray append "+str _blacklistedFileArray+";
				"; }; _A3AHstring = _A3AHstring + "
				"; if(_CAP)then{ _A3AHstring = _A3AHstring + "
					_object = player;
					_acnt = -1;
				"; }; _A3AHstring = _A3AHstring + "
				while{1==1}do
				{
					"; if(_CAP)then{ _A3AHstring = _A3AHstring + "
						if(player isEqualTo _object)then[{_acnt = _acnt + 1},{_object = player;_acnt = 0}];
						_actionid = player addAction ['', '', [], -5, false, true, '', 'false'];player removeAction _actionid;
						if(_actionid > _acnt + 1)then
						{
							removeAllActions player;removeAllActions (vehicle player);
							_log = format['Actions: %1/%2 possible scroll menu hack',_actionid,_acnt];
							[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
							_acnt = _actionid;
						};
					"; }; _A3AHstring = _A3AHstring + "
					
					"; if(_UBF)then{ _A3AHstring = _A3AHstring + "
						if(_filechecktimer < time)then
						{
							_filechecktimer = time + 300;
							diag_log 'IGNORE THIS';
							diag_log '--------------------------------------------------';
							{
								_f = preprocessFileLineNumbers _x;
								if(_f != '')then
								{
									_log = format['BadFile: %1 - %2',_x,_f];
									[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
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
										[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
										[] spawn "+_AHKickOFF+";
									};
								};
							} forEach _inventory;
						};
					"; }; _A3AHstring = _A3AHstring + "
					uiSleep 10;
				};
				_log = 'Loop #2 ended!';
				[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
				[] spawn "+_AHKickOFF+";
			};
		"; }; _A3AHstring = _A3AHstring + "



		"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
			[_name,_puid] spawn {
				private['_name','_puid','_spawnMarkers','_tpc','_falseStates','_fnc_antitp','_lastpos','_lastPosZero','_lastHeightATL','_log','_lasttime','_difftime','_curpos','_curPosZero','_tmpAHpos','_driver'];
				_name = _this select 0;
				_puid = _this select 1;
				_spawnMarkers = "+str _spawnMarkers+";
				"+_AHpos+" = [];
				_tpc = 0;
				_falseStates = 0;
				_fnc_antitp = {
					_state = true;
					if(_lastpos distance [0,0,0] <= 50)exitWith{false};
					{if(_lastpos distance _x <= 50)exitWith{_state=false;false};} forEach _spawnMarkers;
					_state
				};
				_fnc_setBack = {
					_tpc = 0;
					_falseStates = 0;
					
					_lastpos = getPosATL (vehicle player);
					_lastHeightATL = _lastpos select 2;
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
					if(isNil'ExilePlayerInSafezone')then{ExilePlayerInSafezone=false;}else{if(typeName ExilePlayerInSafezone != 'BOOL')then{
						_log = format['ExilePlayerInSafezone typeName changed! %1',typeName ExilePlayerInSafezone];
						[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
						[] spawn "+_AHKickOFF+";
					};};
					if(ExilePlayerInSafezone)then{call _fnc_setBack;}else
					{
						_difftime = diag_tickTime - _lasttime;
						if(alive player)then
						{
							_curpos = getPosATL (vehicle player);
							_curHeightATL = _curpos select 2;
							_curPosZero = [_curpos select 0,_curpos select 1,0];
							_distance = _lastPosZero distance _curPosZero;
							if(_distance > 0)then
							{
								_speed = _distance / _difftime;
								_type = typeOf (vehicle player);
								_topSpeed = (getNumber(configFile >> 'CfgVehicles' >> _type >> 'maxSpeed')) max 5;
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
													[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
													[] spawn "+_AHKickOFF+";
													player SetVelocity [0,0,1];player setPosATL _lastPosZero;
												};
												if(_tmpAHpos isEqualTo [])then
												{
													if(_tpc > 0)then{
														_log = format['POTENTIAL-TP-REVERTED: Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
														[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
														player SetVelocity [0,0,1];player setPosATL _lastPosZero;
													};
													_tpc = _tpc + 1;
												}
												else
												{
													"+_AHpos+" = [];
													_log = 'Teleported by Admin';
													[_name,_puid,'TPLOG',toArray(_log),_tmpAHpos select 0,_tmpAHpos select 1,_lastpos,_curpos] call "+_AHKickLog+";
												};
											}
											else
											{
												_log = 'TELEPORT CHECK VARIABLE NILLED!';
												[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
												[] spawn "+_AHKickOFF+";
												player SetVelocity [0,0,1];player setPosATL _lastPosZero;
											};
										}
										else
										{
											if!(isPlayer _driver)then
											{
												_log = format['TP with AI as driver..  Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
												[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
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
											[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
											player SetVelocity [0,0,1];player setPosATL _lastPosZero;
										};
									};
								};
								if(vehicle player == player)then
								{
									_velZ = (velocity player) select 2;
									if(((_curHeightATL - _lastHeightATL) > 30)&&(_velZ < -5))then
									{
										_log = format['POTENTIAL-TP-REVERTED(HEIGHT): Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
										[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
										player SetVelocity [0,0,1];player setPosATL _lastPosZero;
									};
								};
							};
						}else{call _fnc_setBack;};
						if(_tpc >= 3)then
						{
							_tpc = 0;
							_log = 'Has been caught for teleporting too often (KICKED TO LOBBY)!';
							[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							player SetVelocity [0,0,1];player setPosATL _lastPosZero;
							(findDisplay 46)closeDisplay 0;
						};
					};
					_lastpos = getPosATL (vehicle player);
					_lastHeightATL = _lastpos select 2;
					_lastPosZero = [_lastpos select 0,_lastpos select 1,0];
					_lasttime = diag_tickTime;
					
					"+_t6+"=str diag_tickTime;
					uiSleep 0.5;
				};
				_log = 'Loop #3 ended!';
				[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
				[] spawn "+_AHKickOFF+";
			};
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(isNil'VERSIONCHECKRESULT')then{VERSIONCHECKRESULT='';};
	
	
	_GET_TIME_TIME = {
		_hours = floor(time / 60 / 60);
		_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
		_seconds = time - (_hours*60*60) - (_minutes * 60);
		format['%1h %2min %3s',_hours,_minutes,round _seconds]
	};
	_devLog = format['%1 VERSION: 14092015 infiSTAR.de AHAT (v0007) - server running: %2:223',VERSIONCHECKRESULT,call _GET_TIME_TIME];diag_log _devLog;
	"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
		systemChat format['%1 <infiSTAR.de> Successfully Loaded In.',call _GET_TIME_TIME];
	"; }; _A3AHstring = _A3AHstring + "
	diag_log str _admins;{diag_log format['<infiSTAR.de> %1',_x];} forEach diag_activeSQFScripts;
	"+_AH_RunCheckENDVAR+" = 'k';
	
	if(isNil '"+_adminsA+"')then
	{
		_log = 'Temp Admin Array - ARRAY is Nil';
		[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
		[] spawn "+_AHKickOFF+";
	}
	else
	{
		if(typeName "+_adminsA+" != 'ARRAY')then
		{
			_log = 'Temp Admin Array - TYPE CHANGED';
			[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
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
			INFISTARVERSION='14092015-v0007';
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
			';
			"+_MAIN_CODE_C+" = nil;'"+_MAIN_CODE_C+"' addPublicVariableEventhandler{_code = call compile (_this select 1);BE_WHITE_LIST_ME = nil;"+_MAIN_CODE_C+" = nil;};
			"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
				systemChat format['%1 <infiSTAR.de> Welcome Admin!',call _GET_TIME_TIME];
			"; }; _A3AHstring = _A3AHstring + "
			_GET_TIME_TIME spawn {
				_GET_TIME_TIME = _this;
				uiSleep 3;
				[1234,player,getPlayerUID player] call fnc_AdminReq;
				"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
					systemChat format['%1 <infiSTAR.de> Requesting infiSTAR.de Admin code..!',call _GET_TIME_TIME];
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
				if(isNil 'fnc_adminLog')then{if(_puid in "+str _devs+")then{fnc_adminLog = compileFinal '';}else{fnc_adminLog = compileFinal '[profileName,getPlayerUID player,''ALOG'',toArray _this] call "+_AHKickLog+";';};};
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
					if((isNil 'AdminAnnounceDisabled')||(isStreamFriendlyUIEnabled))then
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
		setObjectViewDistance ["+str _VOV+",0];
	"; }; _A3AHstring = _A3AHstring + "
	player createDiaryRecord ['Diary', ['infiSTAR.de AntiHack & AdminTools', '<br/>  Get your own infiSTAR.de AntiHack and AdminTools available on <br/><br/>http://www.infiSTAR.de<br/><br/>']];
};
"+_AH_MAIN_BLOCK+" = str _AH_MAIN_BLOCK;





	diag_log format['<infiSTAR.de> %1 - Thread MAIN: none-threaded code compiled and/or sent!',time];
	INFISTAR_SERVER_LOOP_1 = [] spawn {
		diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 starting now!',time];
		private['_url','_from','_vers'];
		_from = if(isNil'UPDATEEMAIL')then{'ERROR'}else{UPDATEEMAIL};
		_vers = if(isNil'INFISTARVERSION')then{format['%1',serverName]}else{format['%1 - %2',serverName,INFISTARVERSION]};
		if(isNil'VERSION_CHECK_URL')then{VERSION_CHECK_URL = toString[104,116,116,112,58,47,47,118,46,105,110,102,105,83,84,65,82,46,100,101,47,105,110,100,101,120,46,112,104,112,63];};
		VERSION_CHECK_URL_FULL = format['%1f=%2&v=%3',VERSION_CHECK_URL,_from,_vers];
		FNC_VERSION_CHECK = {
			private['_packet1','_jobid','_packet2','_res'];
			_packet1 = format['getasync%1%2%1',toString [10],VERSION_CHECK_URL_FULL];
			_jobid = 'ARMA_LOAD' callExtension _packet1;
			_packet2 = format['response%1%2%1',toString [10],_jobid];
			
			_timeout = diag_tickTime + 60;
			_res = 'WAIT';
			waitUntil{
				_res = 'ARMA_LOAD' callExtension _packet2;
				_res != 'WAIT' || diag_tickTime > _timeout
			};
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
			if(_res=='WAIT'||_res==''||_res=='URLERROR')exitWith{};
			_lowerRes = toLower _res;
			if(_lowerRes find 'error' != -1)exitWith{};
			if(_lowerRes find 'wrapper is disabled' != -1)exitWith{};
			VERSIONCHECKRESULT = _res;publicVariable'VERSIONCHECKRESULT';
		};
		[] spawn FNC_VERSION_CHECK;
		diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 looping now!',time];
		_admins = "+str _admins+";
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
							[_name,_puid,'BAN',toArray('')] call "+_FNC_AH_KICKLOG+";
						};
					} forEach allPlayers;
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




		_zero = ""
			"+_t9+"=str diag_tickTime;
			if(isNil '"+_t1+"')then{"+_t1+"=str diag_tickTime;};
			_AHKickOFF = compileFinal '
				sleep 0.1;
				(findDisplay 46)closeDisplay 0;
				if(!isNil''"+_AHKickLog+"'')then{[profileName,getPlayerUID player,''KICKME''] call "+_AHKickLog+";};
			';
			if(isNil'"+_AHKickOFF+"')then{"+_AHKickOFF+" = _AHKickOFF;};
			if(str _AHKickOFF != str "+_AHKickOFF+")then{[] spawn _AHKickOFF;};
			_AHKickLog = compileFinal """"
				if(!isNil'"+_YourPlayerToken+"')then
				{
					"+_AH_KICKLOG+" = ["+_YourPlayerToken+",_this,netId player];publicVariableServer '"+_AH_KICKLOG+"';"+_AH_KICKLOG+"=nil;
				}
				else
				{
					_this spawn {
						_temptime = time+15;_tempdiagtime = diag_tickTime+15;
						waitUntil{!isNil '"+_YourPlayerToken+"' || time > _temptime || diag_tickTime > _tempdiagtime};
						if(isNil'"+_YourPlayerToken+"')exitWith{KICKED_FOR_NIL_TOKEN_AHKickLog = format['PLAYER__%1__%2',getPlayerUID player,_this];publicVariableServer 'KICKED_FOR_NIL_TOKEN_AHKickLog';(findDisplay 46)closeDisplay 0;};
						"+_AH_KICKLOG+" = ["+_YourPlayerToken+",_this,netId player];publicVariableServer '"+_AH_KICKLOG+"';"+_AH_KICKLOG+"=nil;
					};
				};
			"""";
			if(isNil'"+_AHKickLog+"')then{"+_AHKickLog+" = _AHKickLog;};
			if(str _AHKickLog != str "+_AHKickLog+")then{[] spawn _AHKickOFF;};
			if(hasInterface)then
			{
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
						[profileName,getPlayerUID player,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
						[] spawn "+_AHKickOFF+";
					};
					
					"+_t5+"=str diag_tickTime;
					_this spawn {
						_AH_MAIN_BLOCK = _this select 1;
						if(isNil '_AH_MAIN_BLOCK')then{
							_log = 'AH_MAIN_BLOCK is NIL';
							[profileName,getPlayerUID player,'SLOG',toArray(_log)] call "+_AHKickLog+";
							(findDisplay 46)closeDisplay 0;
						};
						if(typeName _AH_MAIN_BLOCK != 'STRING')then
						{
							_log = format['typeName AH_MAIN_BLOCK changed to %1',typeName _AH_MAIN_BLOCK];
							[profileName,getPlayerUID player,'SLOG',toArray(_log)] call "+_AHKickLog+";
							(findDisplay 46)closeDisplay 0;
						};
						_AH_MAIN_BLOCK_C = call compileFinal _AH_MAIN_BLOCK;_AH_MAIN_BLOCK = nil;
						if(isNil '_AH_MAIN_BLOCK_C')then{
							_log = format['typeName AH_MAIN_BLOCK changed to %1',typeName _AH_MAIN_BLOCK_C];
							[profileName,getPlayerUID player,'SLOG',toArray(_log)] call "+_AHKickLog+";
							(findDisplay 46)closeDisplay 0;
						};
						if(typeName _AH_MAIN_BLOCK_C != 'CODE')then{
							_log = format['typeName AH_MAIN_BLOCK changed to %1',typeName _AH_MAIN_BLOCK_C];
							[profileName,getPlayerUID player,'SLOG',toArray(_log)] call "+_AHKickLog+";
							(findDisplay 46)closeDisplay 0;
						};
						
						_temptime= diag_tickTime + 25;
						waitUntil {"+_t1+"=str diag_tickTime;"+_t5+"=str diag_tickTime;!isNil 'ExileClientLoadedIn' || {diag_tickTime > _temptime}};
						uiSleep 3;
						_maximumdelay = diag_tickTime + 30;
						waitUntil{"+_t1+"=str diag_tickTime;"+_t5+"=str diag_tickTime;(((player == player)&&{!isNull player}&&{getPlayerUID player != ''})||(diag_tickTime > _maximumdelay))};
						_puid = format['%1',getPlayerUID player];
						_name = profileName;
						
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




		_DO_THIS_MORE_OFTEN = (""
			if(hasInterFace)then
			{
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
								[profileName,getPlayerUID player,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
								[] spawn "+_AHKickOFF+";
							};
						}
						else
						{
							_log = format['typeName of T%1 changed to %2: %3!   (BANNED)',_TIndex,typeName _var,_x];
							[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
							[] spawn "+_AHKickOFF+";
						};
					}
					else
					{
						if(_TIndex in [1])then
						{
							_log = format['T%1 is Nil   (BANNED)',_TIndex];
							[profileName,getPlayerUID player,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] spawn "+_AHKickOFF+";
						};
					};
				} forEach ['"+_t1+"','"+_t2+"','"+_t3+"','"+_t4+"','"+_t5+"','"+_t6+"','"+_t7+"','"+_t8+"','"+_t9+"'];
				{
					if(!isNil _x)then
					{
						_var = missionNamespace getVariable _x;
						if(typeName _var != 'STRING')then
						{
							[] spawn "+_AHKickOFF+";
						};
					};
				} forEach ['"+_YourPlayerToken+"','"+_AH_MAIN_BLOCK+"'];
				{
					if(!isNil _x)then
					{
						_var = missionNamespace getVariable _x;
						if(typeName _var != 'ARRAY')then
						{
							[] spawn "+_AHKickOFF+";
						};
					};
				} forEach ['"+_AH_KICKLOG+"','"+_adminsA+"','"+_MC+"'];
				{
					if(!isNil _x)then
					{
						_var = missionNamespace getVariable _x;
						if(typeName _var == 'CODE')then
						{
							_log = format['AntiAntiHack #1: %1 - %2',_x,_var];
							[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
							[] spawn "+_AHKickOFF+";
						};
					};
				} forEach ['"+_RequestToken+"','"+_AH_RunCheckENDVAR+"','"+_clientdo+"','"+_AHpos+"'];
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
							[profileName,getPlayerUID player,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] spawn "+_AHKickOFF+";
						};
						"+_t2+"=nil;
					};
				};
			};
		"");





		_grpLogic = creategroup sidelogic;
		_array = [[0,0,0], _grpLogic, "";"" + (_zero) + "";""];
		'Logic' createUnit _array;
		waitUntil {count (units _grpLogic) > 0};
		{_x setVariable ['BIS_enableRandomization',false];_x setVariable ['"+_LogicVariable+"','1'];} forEach (units _grpLogic);
		waitUntil {({_x getVariable ['"+_LogicVariable+"','-1'] == '1'} count ([0,0,0] nearEntities ['Logic',100])) isEqualTo 1};
		_next = false;
		_timer0 = 0;
		_timer1 = time + 35;
		_timer2 = time + 30;
		_deSimTimer = time + 61;
		_vehsThatHaveBeenChecked = [];
		_fnc_remove_badvehicle = {
			{
				if(isPlayer _x)then
				{
					_log = format['BadVehicle: %1 :: %2 :: @%3 %4',_veh,_type,mapGridPosition _veh,getPos _veh];
					[name _x,getPlayerUID _x,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
				}
				else
				{
					_log = format['BadVehicle: %1 :: %2 :: @%3 %4',_veh,_type,mapGridPosition _veh,getPos _veh];
					['SERVER','SERVER','HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
				};
			} forEach _crew;
			_veh call fnc_deleteObject;
		};
		while{1==1}do
		{
			if(_next)then{{_x setVariable ['BIS_enableRandomization',false];_x setVariable ['"+_LogicVariable+"','1'];} forEach (units _grpLogic);};
			_countLogics = {_x getVariable ['"+_LogicVariable+"','-1'] == '1'} count ([0,0,0] nearEntities ['Logic',100]);
			if!(_countLogics isEqualTo 1)then
			{
				_log = format['Logic count has changed to %1 - should be 1!',_countLogics];
				_log call FNC_A3_HACKLOG;
				"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
					"+_AH_HackLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_HackLogArrayRND+"';};} forEach allPlayers;
				"; }; _A3AHstring = _A3AHstring + "
				
				_array = [[0,0,0], _grpLogic, "";"" + (_zero) + "";""];
				'Logic' createUnit _array;
				_next = true;
			};
			
			if(time > _timer0)then
			{
				_timer0 = time + 25;
				'"+_AH_KICKLOG+"' addPublicVariableEventHandler {(_this select 1) call "+_FNC_AH_KICKLOGSPAWN+";};
				
				_DO_THIS_MORE_OFTEN call FNC_A3_GLOBAL;
				uiSleep 1;
				
				call _fnc_zero_two;
				uiSleep 1;
			};
			
			onPlayerConnected {
				[_uid, _name] call ExileServer_system_network_event_onPlayerConnected;
				[_uid,_name] call fnc_infiSTAR_PlayerLog;
				_mytime = call fnc_getserverTime;
				_log = _mytime + format['Connected: %1(%2) - time: %3 - serverFPS: %4',call fnc_getSteamNameIfSaved,_uid,time,diag_fps];
				_log call FNC_A3_CONNECTLOG;
			};
			onPlayerDisconnected {
				[_uid, _name] call ExileServer_system_network_event_onPlayerDisconnected;
				_mytime = call fnc_getserverTime;
				_log = _mytime + format['Disconnected: %1(%2) - time: %3 - serverFPS: %4',call fnc_getSteamNameIfSaved,_uid,time,diag_fps];
				_log call FNC_A3_CONNECTLOG;
			};
			removeAllMissionEventHandlers 'HandleDisconnect';
			addMissionEventHandler['HandleDisconnect', { _this call ExileServer_system_network_event_onHandleDisconnect; }];
			
			
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
								if(_uid select [0,2] == 'HC')exitWith{};
								
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
								
								_veh = vehicle _x;
								if(_x == _veh)then
								{
									if(rating _x < 0)then
									{
										_log = format['Player Low Rating! %1 - %2 - @%3 %4',rating _x,typeOf _x,getPos _x,mapGridPosition _x];
										[_name,_uid,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
									};
									if(isHidden _x)then
									{
										if!(_uid in _admins)then
										{
											_log = format['Invisible PLAYER-OBJECT   @%1 %2',getPos _x,mapGridPosition _x];
											[_name,_uid,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
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
														[name _x,getPlayerUID _x,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
													};
												};
											};
										};
									} forEach (crew _veh);
								};
							};
						};
					};
				} forEach allPlayers;
			};
			"; if(_UVC)then{ _A3AHstring = _A3AHstring + "
				if(time > _timer2)then
				{
					_timer2 = time + 45;
					
					{
						if(!isNull _x)then
						{
							if!(_x in _vehsThatHaveBeenChecked)then
							{
								_vehsThatHaveBeenChecked pushBack _x;
								
								_veh = _x;
								_type = typeOf _x;
								_crew = crew _x;
								if!(_type in "+str _VehicleWhiteList+")then
								{
									if(_type in "+str _ForbiddenVehicles+")then
									{
										call _fnc_remove_badvehicle;
									}
									else
									{
										if!(_type select [0,5] isEqualTo 'Exile')then
										{
											call _fnc_remove_badvehicle;
										};
									};
								};
							};
						};
					} forEach ([0,0,0] nearEntities [['LandVehicle','Air','Ship','Static'], 10000000]);
					uiSleep 1;
				};
			"; }; _A3AHstring = _A3AHstring + "
			uiSleep 10;
		};
		_log = format['%1 - LOOP - BROKEN!',time];
		_log call FNC_A3_HACKLOG;
	};
";
call compileFinal _A3AHstring;
diag_log format['<infiSTAR.de> %1 - AntiHack loaded!',time];
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2015 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */

_fn_cleanUp = {
        _fn_check_player_close = {
                _playerClose = false;
                try
                {
                        {
                                {
                                        if(isPlayer _x)exitWith{throw true};
                                } forEach (crew _x);
                        } forEach (_this nearEntities [['Exile_Unit_Player','LandVehicle', 'Air', 'Ship'], 20]);
                }
                catch
                {
                        _playerClose = _exception;
                };
                _playerClose
        };
        _fn_get_runningTime = {
                _hours = floor(time / 60 / 60);
                _minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
                _seconds = time - (_hours*60*60) - (_minutes * 60);
                format['%1h %2min %3s',_hours,_minutes,round _seconds]
        };
        _fn_delete = {
                _cnt = 0;
                {
                        _type = typeOf _x;
                        if!(_type isEqualTo 'Logic')then
                        {
                                if!(_x call _fn_check_player_close)then
                                {
                                        deleteVehicle _x;
                                        _cnt = _cnt + 1;
                                };
                        };
                }forEach _this;
                _cnt
        };
        _fn_cleanDead = {
                _cnt = 0;
                {
                        _type = typeOf _x;
                        if(_type isEqualTo 'Exile_Unit_Player')then
                        {
                                _CleanUpTimer = _x getVariable['CleanUpTimer',-1];
                                if(_CleanUpTimer isEqualTo -1)then
                                {
                                        _x setVariable['CleanUpTimer',time+600];
                                }
                                else
                                {
                                        if(time > _CleanUpTimer)then
                                        {
                                                deleteVehicle _x;
                                                _cnt = _cnt + 1;
                                        };
                                };
                        }
                        else
                        {
                                deleteVehicle _x;
                                _cnt = _cnt + 1;
                        };
                } forEach _this;
                _cnt
        };
        _fn_disableSimulation = {
                _cnt = 0;
                {
                        if(simulationEnabled _x)then
                        {
                                if!(_x call _fn_check_player_close)then
                                {
                                        _x enableSimulationGlobal false;
                                        if!(isNull _x)then
                                        {
                                                if!(_x getVariable['ExileIsSimulationMonitored', false])then
                                                {
                                                        _x setVariable ['ExileIsSimulationMonitored', true];
                                                        ExileSimulationMonitoredVehicles pushBack _x;
                                                };
                                        };
                                        _cnt = _cnt + 1;
                                };
                        };
                }forEach _this;
                _cnt
        };
        'ARMA_LOG' callExtension format['A3_PURGECRAP:Waiting until mission is running for more than 300 seconds [FPS: %1|PLAYERS: %2|THREADS: %3]',diag_fps,count allplayers,count diag_activeSQFScripts];
        waitUntil {uiSleep 10;time > 300};
        uiSleep 1;
        while {true} do
        {
                'ARMA_LOG' callExtension format['A3_PURGECRAP:STARTING :) [FPS: %1|PLAYERS: %2|THREADS: %3]',diag_fps,count allplayers,count diag_activeSQFScripts];
                uiSleep 1;
                _startTime = time;
               
                _deleteTotal = 0;
                _deleteTotal = _deleteTotal + (allDeadMen call _fn_cleanDead);
                _deleteTotal = _deleteTotal + (allDead call _fn_cleanDead);
                _deleteTotal = _deleteTotal + ((allMissionObjects 'LootWeaponHolder') call _fn_delete);
                _deleteTotal = _deleteTotal + ((allMissionObjects 'groundWeaponHolder') call _fn_delete);
                _deleteTotal = _deleteTotal + ((allMissionObjects 'WeaponHolderSimulated') call _fn_delete);
                _deleteTotal = _deleteTotal + (([0,0,0] nearObjects ['All',150]) call _fn_delete);
               
                _disableSimulationCounter = (([0,0,0] nearEntities [['LandVehicle','Air','Ship','Static'], 10000000]) call _fn_disableSimulation);
               
                _timetaken = time-_startTime;
                uiSleep 13;
                'ARMA_LOG' callExtension format['A3_PURGECRAP:[FPS: %1|PLAYERS: %2|THREADS: %3|DELETED: %4|DISABLED_SIM: %5|RUNTIME: %6|CLEANUP_TIME: %7]',
                diag_fps,count allplayers,count diag_activeSQFScripts,_deleteTotal,_disableSimulationCounter,call _fn_get_runningTime,_timetaken];
                uiSleep 300;
        };
};
if(!isNil'FN_CLEANUP_THREAD')then{terminate FN_CLEANUP_THREAD;FN_CLEANUP_THREAD=nil;};
FN_CLEANUP_THREAD = [] spawn _fn_cleanUp;