/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de';
VERSION_DATE_IS = '06022016#1077';
infiSTAR_customFunctions = [];
_configClasses = "true" configClasses (configfile >> "CfgCustomFunctions");
{
	_configProperties = configProperties [configfile >> "CfgCustomFunctions" >> configName _x];
	_type = getNumber (_configProperties select 0);
	_name = getText (_configProperties select 1);
	_code = getText (_configProperties select 2);
	infiSTAR_customFunctions pushBack [_type,_name,_code];
} forEach _configClasses;
if!(infiSTAR_customFunctions isEqualTo [])then{infiSTAR_customFunctions sort true;};
infiSTAR_MAIN_CODE = "
	_log = format['<infiSTAR.de> %1 - Loading Menu..',call GET_TIME_TIME];systemchat _log;diag_log _log;
	allSupportBoxesNames = "+str _allSupportBoxesNames+";
	infiSTAR_CUSTOM_RUN = [];
	infiSTAR_CUSTOM_Toggleable = [];
	infiSTAR_CUSTOM_OnTarget = [];
	infiSTAR_customFunctions = "+str infiSTAR_customFunctions+";
	infiSTAR_HTML_LOAD = "+str _use_html_load_on_adminmenu+";
	if!(infiSTAR_customFunctions isEqualTo [])then
	{
		_counter0 = 0;
		_counter1 = 0;
		_counter2 = 0;
		{
			_type = _x select 0;
			_name = _x select 1;
			_code = _x select 2;
			switch (_type) do
			{
				case 0: {
					infiSTAR_CUSTOM_RUN pushBack _name;
					missionNameSpace setVariable[format['FNC_CUSTOM_RUN_%1',_counter0],compile _code];
					_counter0 = _counter0 + 1;
				};
				case 1: {
					infiSTAR_CUSTOM_Toggleable pushBack _name;
					missionNameSpace setVariable[format['FNC_CUSTOM_TOGGLEABLE_%1',_counter1],compile _code];
					_counter1 = _counter1 + 1;
				};
				case 2: {
					infiSTAR_CUSTOM_OnTarget pushBack _name;
					missionNameSpace setVariable[format['FNC_CUSTOM_ON_TARGET_%1',_counter2],compile _code];
					_counter2 = _counter2 + 1;
				};
			};
		} forEach infiSTAR_customFunctions;
	};
	MYPUIDinfiESP = getPlayerUID player;
	ALT_IS_PRESSED=false;FILLMAINSTATE=0;LASTSUBBUTTON=1;BTN_GET_ITEM_SEL=0;
	SortAlphaPlease = true;SortGroupsPlease = nil;SortRangePlease = nil;
	infiSTAR_add_vehicles=true;
	SELECTED_TARGET_PLAYER = player;
	MAIN_DISPLAY_ID = -1338;LEFT_CTRL_ID = 1500;RIGHT_CTRL_ID = 1501;
	uiNamespace setVariable['A3MAPICONS_mainMap', nil];
	uiNamespace setVariable['A3MAPICONS_mainMap', findDisplay 12 displayCtrl 51];
	if(isNil 'AH_HackLogArray')then{AH_HackLogArray = [];};
	if(isNil 'AH_SurvLogArray')then{AH_SurvLogArray = [];};
	if(isNil 'AH_AdmiLogArray')then{AH_AdmiLogArray = [];};
	if(isNil 'SERVER_FPS')then{SERVER_FPS = '';};
	if(isNil 'SERVER_THREADS')then{SERVER_THREADS = '';};
	if(isNil 'infiSTAR_toggled_A')then{infiSTAR_toggled_A = ['==== OnTarget ====','==== Toggleable ====','==== Custom Functions ===='];};
	FN_SHOW_LOG = {cutText [format['infiSTAR.de:\n%1',_this], 'PLAIN'];};
	FN_GET_NAME = {
		_name = _this getVariable['ExileName',''];
		if(_name isEqualTo '')then{if(alive _this)then{_name = name _this}else{_name = 'unknown';};};
		_name
	};
	FN_GET_CLR = {
		if(_this isEqualTo SELECTED_TARGET_PLAYER)exitWith{[1,0.7,0.15,_alpha]};
		if(!alive _this)exitWith{[1,1,1,_alpha]};
		_xuid = getPlayerUID _this;
		if(((_xuid in infiSTAR_ADMINS)&&!(_xuid in infiSTAR_Ds))||((_xuid in infiSTAR_Ds)&&(MYPUIDinfiESP in infiSTAR_Ds))||(_xuid == MYPUIDinfiESP))exitWith{[0,1,0,_alpha]};
		if(_this in (units(group player)))exitWith{[1,0.95,0,_alpha]};
		if(vehicle _this isEqualTo _this)exitWith{[1,0.17,0.17,_alpha]};
		[0.047,0.502,1,_alpha]
	};
	FN_GET_CLR_PLAYERLIST = {
		if(_this isEqualTo SELECTED_TARGET_PLAYER)exitWith{[1,0.7,0.15,1]};
		if(!alive _this)exitWith{[1,1,1,1]};
		_xuid = getPlayerUID _this;
		if(_xuid isEqualTo '0')exitWith{[0,0.6,0.63,1]};
		if(_xuid isEqualTo '0')exitWith{[0.59,0.03,0,1]};
		if(_xuid isEqualTo '0')exitWith{[0.86,0.81,0.92,1]};
		if(_xuid isEqualTo '0')exitWith{[0.6,0.33,0.67,1]};
		if(((_xuid in infiSTAR_ADMINS)&&!(_xuid in infiSTAR_Ds))||((_xuid in infiSTAR_Ds)&&(MYPUIDinfiESP in infiSTAR_Ds))||(_xuid == MYPUIDinfiESP))exitWith{[0,1,0,1]};
		if(_this in (units(group player)))exitWith{[1,0.95,0,1]};
		if(vehicle _this isEqualTo _this)exitWith{[1,0.17,0.17,1]};
		[0.047,0.502,1,1]
	};
	FN_GET_PLR_POS = {
		_this modelToWorldVisual (_this selectionPosition 'head')
	};
	TRADER_FUNCTION_ARRAY = [
		[''],
		['Exile_Trader_Armory','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_SpecialOperations','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_Equipment','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_Food','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_Hardware','ExileClient_gui_traderDialog_show',0],
		[''],
		['Exile_Trader_Vehicle','ExileClient_gui_vehicleTraderDialog_show',0],
		['Exile_Trader_Aircraft','ExileClient_gui_vehicleTraderDialog_show',0],
		['Exile_Trader_Boat','ExileClient_gui_vehicleTraderDialog_show',0],
		[''],
		['Exile_Trader_Office','ExileClient_gui_purchaseTerritoryDialog_show',0],
		['Exile_Trader_Office','ExileClient_gui_payTerritoryProtectionMoneyDialog_show',0],
		[''],
		['Exile_Trader_WasteDump','ExileClient_gui_wasteDumpDialog_show',1],
		['Exile_Trader_VehicleCustoms','ExileClient_gui_vehicleCustomsDialog_show',1],
		['Exile_Trader_AircraftCustoms','ExileClient_gui_vehicleCustomsDialog_show',1],
		['Exile_Trader_BoatCustoms','ExileClient_gui_vehicleCustomsDialog_show',1],
		[''],
		['-- customs are not set by default --'],
		['Exile_Trader_CommunityCustoms','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms2','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms3','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms4','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms5','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms6','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms7','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms8','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms9','ExileClient_gui_traderDialog_show',0],
		['Exile_Trader_CommunityCustoms10','ExileClient_gui_traderDialog_show',0]
	];
	ALLC_ITEMS = ['B_Parachute'];
	ALL_MAGS_TO_SEARCH_C = [];
	ALL_VEHS_TO_SEARCH_C = [];
	ALL_VEHS_TO_SEARCH_C_EXILE = [];
	ALL_VEHS_TO_SEARCH_C_OTHER = [];
	newAllItems_CATEGORY = [];
	
	{
		_configName = configName _x;
		ALL_VEHS_TO_SEARCH_C pushBack _configName;
		if(_configName select [0,5] isEqualTo 'Exile')then{ALL_VEHS_TO_SEARCH_C_EXILE pushBack _configName;}else{ALL_VEHS_TO_SEARCH_C_OTHER pushBack _configName;};
	} forEach ('((getNumber (_x >> ''scope'') >= 2) && {!(getText(_x >> ''picture'') isEqualTo '''')} && {configName _x isKindOf ''allVehicles'' && !(configName _x isKindOf ''Man'')})' configClasses (configFile >> 'CfgVehicles'));
	
	_bags = getArray(missionconfigfile >> 'CfgTraderCategories' >> 'Backpacks' >> 'items');
	{
		ALLC_ITEMS pushBack _x;
		_itemInformation = [_x] call BIS_fnc_itemType;
		_category = _itemInformation select 1;
		if!(_category in newAllItems_CATEGORY)then{newAllItems_CATEGORY pushBack _category;};
	} forEach _bags;
	
	{
		_configName = configName _x;
		ALLC_ITEMS pushBack _configName;
		_itemInformation = [_configName] call BIS_fnc_itemType;
		_category = _itemInformation select 1;
		if!(_category in newAllItems_CATEGORY)then{newAllItems_CATEGORY pushBack _category;};
	} forEach ('(getNumber(_x >> ''scope'') isEqualTo 2) && {(getText(_x >> ''vehicleClass'') isEqualTo ''Backpacks'')}' configClasses (configFile >> 'CfgVehicles'));
	
	{
		_configName = configName _x;
		ALLC_ITEMS pushBack _configName;
		_itemInformation = [_configName] call BIS_fnc_itemType;
		_category = _itemInformation select 1;
		if!(_category in newAllItems_CATEGORY)then{newAllItems_CATEGORY pushBack _category;};
	} forEach ('(getNumber(_x >> ''scope'') isEqualTo 2) && {!(getText(_x >> ''picture'') isEqualTo '''')}' configClasses (configFile >> 'CfgWeapons'));
	
	{
		_configName = configName _x;
		ALLC_ITEMS pushBack _configName;
		ALL_MAGS_TO_SEARCH_C pushBack _configName;
		_itemInformation = [_configName] call BIS_fnc_itemType;
		_category = _itemInformation select 1;
		if!(_category in newAllItems_CATEGORY)then{newAllItems_CATEGORY pushBack _category;};
	} forEach ('(getNumber(_x >> ''scope'') isEqualTo 2) && {!(getText(_x >> ''picture'') isEqualTo '''')}' configClasses (configFile >> 'CfgMagazines'));
	newAllItems_CATEGORY sort true;
	{
		_itemInformation = [_x] call BIS_fnc_itemType;
		_category = _itemInformation select 1;
		
		_variable = missionNameSpace getVariable (_category+'_ARRAY');
		if(isNil '_variable')then
		{
			missionNameSpace setVariable[(_category+'_ARRAY'),[_x]];
		}
		else
		{
			if!(_x in _variable)then
			{
				_variable pushBack _x;
				missionNameSpace setVariable[(_category+'_ARRAY'),_variable];
			};
		};
	} forEach ALLC_ITEMS;
	_log = format['<infiSTAR.de> %1 - config data loaded!',call GET_TIME_TIME];diag_log _log;
	if('==== Base Deleter ====' call ADMINLEVELACCESS)then
	{
		CCG_fnc_adminClick = {
			private ['_click'];
			_click = _this select 0;
			if(_click == '')exitWith{};
			try {
				switch (_click) do {
					case 'BD: Set Center' : {
						call CCG_fnc_bdSetCenter;
						throw 'BASEDELETER: Set Center';
					};
					case 'BD: Set Radius' : {
						call CCG_fnc_bdSetRadius;
						throw 'BASEDELETER: Set Radius';
					};
					case 'BD: Cancel / Remove' : {
						call CCG_fnc_bdCancel;
						throw 'BASEDELETER: Cancel';
					};
					case 'BD: Delete Base' : {
						call CCG_fnc_bdDeleteB;
						throw 'BASEDELETER: Delete Base';
					};
					case 'BD: Delete Weaponholder' : {
						call CCG_fnc_bdDeleteW;
						throw 'BASEDELETER: Delete Weaponholder';
					};
				};
			} catch {
				systemChat _exception;
				call fnc_FULLinit;
			};
		};
		CCG_fnc_bdSetCenter = {
			private ['_arrow'];
			CCGbdCenter = getPosASL player;
			_arrow = 'Sign_Arrow_F' createVehicleLocal [0,0,0];
			_arrow setPosASL CCGbdCenter;
			if(isNil 'CCGbdObjs')then{CCGbdObjs = [];};
			CCGbdObjs pushBack _arrow;
		};
		CCG_fnc_bdSetRadius = {
			private ['_arrow', '_pos', '_radius', '_angle', '_distance', '_count', '_step', '_count', '_step', '_objects'];
			if(isNil 'CCGbdCenter')then{throw 'BASEDELETER: Center not set!';};
			CCGbdRadius = [CCGbdCenter, getPosASL player] call BIS_fnc_distance2D;
			_arrow = 'Sign_Arrow_F' createVehicleLocal [0,0,0];
			_arrow setPosASL CCGbdCenter;
			CCGbdObjs pushBack _arrow;
			_angle = 0;
			_count = round((2 * pi * CCGbdRadius) / 2);
			if(_count == 0)then{throw 'BASEDELETER: Center and Radius position can not be the same!';};
			for '_x' from 0 to _count do
			{
				private['_a', '_b', '_obj'];
				_a = (CCGbdCenter select 0) + (sin(_angle)*CCGbdRadius);
				_b = (CCGbdCenter select 1) + (cos(_angle)*CCGbdRadius);
				_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
				_obj setPosASL [_a, _b, CCGbdCenter select 2];
				CCGbdObjs pushBack  _obj;
				_angle = _angle + (360/_count);
			};
			for '_x' from 0 to _count do
			{
				private['_a', '_b', '_obj'];
				_a = (CCGbdCenter select 0) + (sin(_angle)*CCGbdRadius);
				_b = (CCGbdCenter select 2) + (cos(_angle)*CCGbdRadius);
				_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
				_obj setPosASL [_a, CCGbdCenter select 1, _b];
				CCGbdObjs pushBack  _obj;
				_angle = _angle + (360/_count);
			};
			for '_x' from 0 to _count do
			{
				private['_a', '_b', '_obj'];
				_a = (CCGbdCenter select 1) + (sin(_angle)*CCGbdRadius);
				_b = (CCGbdCenter select 2) + (cos(_angle)*CCGbdRadius);
				_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
				_obj setPosASL [CCGbdCenter select 0, _a, _b];
				CCGbdObjs pushBack  _obj;
				_angle = _angle + (360/_count);
			};
		};
		CCG_fnc_bdGetObjectsToDelete = {
			if(isNil 'CCGbdCenter')exitWith{[]};
			if(isNil 'CCGbdRadius')exitWith{[]};
			nearestObjects [ASLtoATL CCGbdCenter,['Exile_Construction_Abstract_Static','AbstractConstruction','Exile_Construction_Flag_Static'], CCGbdRadius]
		};
		CCG_fnc_bdGetWeaponHoldersToDelete = {
			if(isNil 'CCGbdCenter')exitWith{[]};
			if(isNil 'CCGbdRadius')exitWith{[]};
			nearestObjects [ASLtoATL CCGbdCenter,['GroundWeaponHolder','WeaponHolderSimulated','LootWeaponHolder'], CCGbdRadius]
		};
		CCG_fnc_bdDeleteB = {
			private ['_objects'];
			if(isNil 'CCGbdCenter')then{throw 'BASEDELETER: Center not set!';};
			if(isNil 'CCGbdRadius')then{throw 'BASEDELETER: Radius not set!';};
			[-5,ASLtoATL CCGbdCenter,CCGbdRadius] call fnc_AdminReq;
			systemChat format['BASEDELETER: Deleting..', count (call CCG_fnc_bdGetObjectsToDelete)];
		};
		CCG_fnc_bdDeleteW = {
			private ['_objects'];
			if(isNil 'CCGbdCenter')then{throw 'BASEDELETER: Center not set!';};
			if(isNil 'CCGbdRadius')then{throw 'BASEDELETER: Radius not set!';};
			[-6,ASLtoATL CCGbdCenter,CCGbdRadius] call fnc_AdminReq;
			systemChat format['BASEDELETER: Deleting..', count (call CCG_fnc_bdGetWeaponHoldersToDelete)];
		};
		CCG_fnc_bdCancel = {
			CCGbdCenter = nil;
			CCGbdRadius = nil;
			{if(!isNull _x)then{deleteVehicle _x;};} foreach CCGbdObjs;
			CCGbdObjs = [];
		};
	};
	fnc_setFocus = {
		disableSerialization;
		ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID);
		ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID);
	};
	fnc_MouseButtonDown = {
		if(_this select 1 == 0)then
		{
			_pos = ((_this select 0) posScreenToWorld [_this select 2, _this select 3]);
			if(ALT_IS_PRESSED)then
			{
				_veh = vehicle player;
				if(_veh == player)then
				{
					_veh setPosATL _pos;
				}
				else
				{
					if(_veh isKindOf 'AIR')then
					{
						_posObj = getPosATL _veh;
						_pos = [_pos select 0,_pos select 1,_posObj select 2];
					};
					[1,netId _veh,_pos] call fnc_AdminReq;
				};
				ALT_IS_PRESSED = false;
				format['Teleport to %1(GPS: %2)',_pos,mapGridPosition _pos] call fnc_adminLog;
				{player reveal _x;} foreach (_pos nearObjects 50);
			};
		};
	};
	fnc_addpic =
	{
		_status = call {
			if(isClass (configFile >> 'CfgWeapons' >> _this))exitWith{'CfgWeapons'};
			if(isClass (configFile >> 'CfgMagazines' >> _this))exitWith{'CfgMagazines'};
			if(isClass (configFile >> 'CfgVehicles' >> _this))exitWith{'CfgVehicles'};
			'no';
		};
		if(_status != 'no')then
		{
			_pic = (getText (configFile >> _status >> _this >> 'picture'));
			if(_pic != '')then{
				_ctrl lbSetPicture [(lbsize _ctrl)-1,_pic];
				_ctrl lbSetPictureColor [(lbsize _ctrl)-1,[1, 1, 1, 1]];
			};
		};
	};
	fnc_searchNfill = {
		if(isNil 'SEARCHLOOP')then{
			SEARCHLOOP = true;
			if(isNil 'lastSearched')then{lastSearched = '';};
			[] spawn {
				disableSerialization;
				_fnc_search =
				{
					[
						_txt,
						{
							_txt = _this;
							if(_txt == lastSearched)exitWith{};
							disableSerialization;
							_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
							lbClear _ctrl;
							if(LASTSUBBUTTON isEqualTo 0)then
							{
								if('Items spawn menu' call ADMINLEVELACCESS)then
								{
									{
										_displayName = getText(configFile >> 'CfgWeapons' >> _x >> 'displayName');
										if(_displayName isEqualTo '')then{_displayName = getText(configFile >> 'CfgMagazines' >> _x >> 'displayName');};
										if(_displayName isEqualTo '')then{_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');};
										if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
											_lbid = _ctrl lbAdd format['%1 (%2)',_displayName,_x];
											_ctrl lbSetData [_lbid,_x];
											_x call fnc_addpic;
										};
									} forEach ALLC_ITEMS;
									for '_i' from 0 to 12 do {_ctrl lbAdd '';};
								};
							};
							if(LASTSUBBUTTON isEqualTo 1)then
							{
								if('==== Vehicles ====' call ADMINLEVELACCESS)then
								{
									_ctrl lbAdd '==== Vehicles ====';
									if(!isNil 'infiSTAR_add_vehicles')then
									{
										{
											_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
											if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
												_lbid = _ctrl lbAdd format['%1 (%2)',_displayName,_x];
												_ctrl lbSetData [_lbid,_x];
												_x call fnc_addpic;
												if(_x select [0,5] isEqualTo 'Exile')then{_ctrl lbSetColor [_lbid, [0,1,0,1]];};
											};
										} forEach ALL_VEHS_TO_SEARCH_C;
										for '_i' from 0 to 12 do {_ctrl lbAdd '';};
									};
								};
							};
							lastSearched = _txt;
							[] call fnc_colorizeMain;
						}
					] execFSM 'call.fsm';
				};
				while {true} do
				{
					if(isNull (findDisplay MAIN_DISPLAY_ID))exitWith{};
					if(!isNil 'stopthissearchplease')exitWith{stopthissearchplease=nil;};
					_txt = ctrlText((findDisplay MAIN_DISPLAY_ID) displayCtrl 100);
					if((_txt != '') && (_txt != 'Search') && (_txt != 'Search for Playername'))then
					{
						_txt = toLower _txt;
						if(FILLMAINSTATE == 1)then
						{
							call _fnc_search;
						}
						else
						{
							_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID;
							lbclear _ctrl;
							_shown = [];
							{
								
								_name = if(alive _x)then{name _x}else{_x getVariable['ExileName',name _x]};
								if((toLower _name) find _txt > -1)then
								{
									_grp = group _x;
									if!(_grp in _shown)then
									{
										_shown pushBack _grp;
										_ctrl lbAdd format['______%1______',_grp];
										{
											_PUIDX = getPlayerUID _x;
											_side = side _x;
											_grp = group _x;
											_ExileName = if(alive _x)then{name _x}else{_x getVariable['ExileName',name _x]};
											_name = format['%1 [%2]',_ExileName,_side];
											if(count units _grp > 1)then
											{
												_name = format['%1 [%2 (%3)]',_ExileName,_side,_grp];
											};
											
											_lbid = _ctrl lbAdd _name;
											_veh = vehicle _x;
											_xpic = getText (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'picture');
											if(alive _x)then
											{
												if(_x == _veh)then
												{
													_wpnstate = weaponState _x;
													_cwep = _wpnstate select 0;
													if(_cwep != '')then
													{
														_xpic = getText (configFile >> 'CfgWeapons' >> _cwep >> 'picture');
													};
												};
											};
											if!(_xpic isEqualTo '')then
											{
												_ctrl lbSetPicture [_lbid,_xpic];
												_ctrl lbSetPictureColor [_lbid,[1, 1, 1, 1]];
											};
											_clr = _x call FN_GET_CLR_PLAYERLIST;
											_ctrl lbSetColor [_lbid,_clr];
										} forEach (units _grp);
									};
								};
							} forEach (call fnc_get_plr);
						};
					};
					if(_txt == '')then
					{
						[] call fnc_fill_infiSTAR_Player;
						waitUntil {((ctrlText((findDisplay MAIN_DISPLAY_ID) displayCtrl 100) != '')||(isNull (findDisplay MAIN_DISPLAY_ID))||(!isNil 'stopthissearchplease'))};
					};
					uiSleep 0.1;
				};
				SEARCHLOOP = nil;
			};
		};
	};
	fnc_SearchFieldButtons = {
		disableSerialization;
		_display = findDisplay MAIN_DISPLAY_ID;
		_others=false;
		if(FILLMAINSTATE == 1)then{_others = true;};
		
		_editSearch = _display displayCtrl 100;
		_editSearch ctrlEnable true;
		_editSearch ctrlShow true;
		_editSearch ctrlSetTextColor [0.56,0.04,0.04,1];
		if(FILLMAINSTATE in [0,3,4])then
		{
			_editSearch ctrlSetText 'Search for Playername';
		}
		else
		{
			_editSearch ctrlSetText 'Search';
		};
		
		_btnItems = _display displayCtrl 36;
		_btnItems ctrlEnable true;
		_btnItems ctrlShow true;
		_btnItems buttonSetAction '
			LASTSUBBUTTON = 0;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;
		';
		if!('Items spawn menu' call ADMINLEVELACCESS)then
		{
			_btnItems ctrlEnable false;
			_btnItems ctrlShow false;
		};
		
		_ctrlL = _display displayCtrl LEFT_CTRL_ID;
		if(isNil 'ctrlposL')then{ctrlposL = ctrlPosition _ctrlL;};
		_ctrlLTMP = ctrlposL;
		if(isNil 'ctrlposeditSearch')then{ctrlposeditSearch = ctrlPosition _editSearch;};
		_ctrleditSearchTMP = ctrlposeditSearch;
		if(isNil 'ctrlposbtnItems')then{ctrlposbtnItems = ctrlPosition _btnItems;};
		_ctrlbtnItemsTMP = ctrlposbtnItems;
		if(FILLMAINSTATE in [0,3,4])then
		{
			_btnItems ctrlSetText 'Reset PlayerSearch';
			_btnItems buttonSetAction '
				((findDisplay MAIN_DISPLAY_ID) displayCtrl 100) ctrlSetText ''Search for Playername'';
				[] call fnc_fill_infiSTAR_Player;
			';
			
			
			_ctrlLTMP = [(ctrlposL select 0),(ctrlposL select 1)+.165,(ctrlposL select 2),(ctrlposL select 3)-.165];
			_ctrleditSearchTMP = [SafeZoneX,(ctrlposeditSearch select 1)-0.045,(ctrlposL select 2),(ctrlposeditSearch select 3)*0.75];
			_ctrlbtnItemsTMP = [SafeZoneX,(ctrlposbtnItems select 1)-0.035,(ctrlposL select 2),(ctrlposbtnItems select 3)];
		};
		_ctrlL ctrlSetPosition _ctrlLTMP;
		_ctrlL ctrlCommit 0.3;
		_editSearch ctrlSetPosition _ctrleditSearchTMP;
		_editSearch ctrlCommit 0.3;
		_btnItems ctrlSetPosition _ctrlbtnItemsTMP;
		_btnItems ctrlCommit 0.3;
		
		if(FILLMAINSTATE == 1)then{
			_btnItems ctrlSetText 'Items';
			_btnItems buttonSetAction '
				LASTSUBBUTTON = 0;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;
			';
		};
		
		_btnVehs = _display displayCtrl 37;
		_btnVehs ctrlEnable _others;
		_btnVehs ctrlShow _others;
		_btnVehs buttonSetAction '
			LASTSUBBUTTON = 1;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;
		';
		if!('==== Vehicles ====' call ADMINLEVELACCESS)then
		{
			_btnVehs ctrlEnable false;
			_btnVehs ctrlShow false;
		};
		
		_btnTrader = _display displayCtrl 38;
		_btnTrader ctrlSetText 'Trader';
		_btnTrader ctrlEnable _others;
		_btnTrader ctrlShow _others;
		_btnTrader buttonSetAction '
			LASTSUBBUTTON = 2;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;
		';
		
		call fnc_searchNfill;
	};
	fnc_cloneGear = {
		_unit = _this;
		if(isNil'_unit')exitWith{systemchat'_unit not defined';};
		if(isNull _unit)exitWith{systemchat'_unit OBJECT-NULL';};
		_export = '';
		_fnc_addMultiple = {
			_items = _this select 0;
			_expression = _this select 1;
			_itemsUsed = [];
			{
				_item = _x;
				_itemLower = tolower _x;
				if !(_itemLower in _itemsUsed)then{
					_itemsUsed set [count _itemsUsed,_itemLower];
					_itemCount = {_item == _x} count _items;
					_expressionLocal = _expression;
					if(_itemCount > 1)then{
						_expressionLocal = format ['for ''_i'' from 1 to %1 do {%2};',_itemCount,_expression];
					};
					_export = _export + format [_expressionLocal,_var,_x];
				};
			} foreach _items;
		};
		_export = _export + '_unit = player;';
		_var = '_unit';
		_export = _export + format ['removeAllWeapons %1;',_var];
		_export = _export + format ['removeAllItems %1;',_var];
		_export = _export + format ['removeAllAssignedItems %1;',_var];
		_export = _export + format ['removeUniform %1;',_var];
		_export = _export + format ['removeVest %1;',_var];
		_export = _export + format ['removeBackpack %1;',_var];
		_export = _export + format ['removeHeadgear %1;',_var];
		_export = _export + format ['removeGoggles %1;',_var];
		if(uniform _unit != '')then{
			_export = _export + format ['%1 forceAddUniform ''%2'';',_var,uniform _unit];
			[uniformitems _unit,'%1 addItemToUniform ''%2'';'] call _fnc_addMultiple;
		};
		if(vest _unit != '')then{
			_export = _export + format ['%1 addVest ''%2'';',_var,vest _unit];
			[vestitems _unit,'%1 addItemToVest ''%2'';'] call _fnc_addMultiple;
		};
		if(!isnull unitbackpack _unit)then{
			_export = _export + format ['%1 addBackpack ''%2'';',_var,typeof unitbackpack _unit];
			[backpackitems _unit,'%1 addItemToBackpack ''%2'';'] call _fnc_addMultiple;
		};
		if(headgear _unit != '')then{_export = _export + format ['%1 addHeadgear ''%2'';',_var,headgear _unit];};
		if(goggles _unit != '')then{_export = _export + format ['%1 addGoggles ''%2'';',_var,goggles _unit];};
		{
			_weapon = _x select 0;
			_weaponAccessories = _x select 1;
			_weaponCommand = _x select 2;
			if(_weapon != '')then{
				_export = _export + format ['%1 addWeapon ''%2'';',_var,_weapon];
				{
					if(_x != '')then{_export = _export + format ['%1 %3 ''%2'';',_var,_x,_weaponCommand];};
				} foreach _weaponAccessories;
			};
		} foreach [
			[primaryweapon _unit,_unit weaponaccessories primaryweapon _unit,'addPrimaryWeaponItem'],
			[secondaryweapon _unit,_unit weaponaccessories secondaryweapon _unit,'addSecondaryWeaponItem'],
			[handgunweapon _unit,_unit weaponaccessories handgunweapon _unit,'addHandgunItem'],
			[binocular _unit,[],'']
		];
		[assigneditems _unit - [binocular _unit],'%1 linkItem ''%2'';'] call _fnc_addMultiple;
		_export
	};
	fnc_Loadoutmenu = {
		disableSerialization;
		if(isNil'missionNameSpaceLoadouts')then{missionNameSpaceLoadouts=[];};
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44464);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['IGUIBack', 44464];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44464) ctrlSetPosition [
			0.554062 * safezoneW + safezoneX,
			0.8,
			0.3,
			0.2 * safezoneH
		];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44464) ctrlSetBackgroundColor [0.15,0.15,0.15,1];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44464) ctrlCommit 0;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RscListbox', 44465];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) ctrlSetPosition [
			0.554062 * safezoneW + safezoneX,
			0.8
		];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) ctrlCommit 0;
		fnc_load_LoadOuts = {
			infiSTAR_LoadOutARRay = profileNamespace getVariable['infiSTAR_LoadOutARRay',[]];
			lbClear (findDisplay MAIN_DISPLAY_ID displayCtrl 44465);
			if!(infiSTAR_LoadOutARRay isEqualTo [])then
			{
				{(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd _x;} forEach infiSTAR_LoadOutARRay;
				(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd '';
			};
			if!(missionNameSpaceLoadouts isEqualTo [])then
			{
				{(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd _x;} forEach missionNameSpaceLoadouts;
				(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd '';
			};
		};
		call fnc_load_LoadOuts;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44469);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RscEdit', 44469];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44469) ctrlSetPosition [
			0.554062 * safezoneW + safezoneX,
			0.81+(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3),
			(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 2),
			0.033 * safezoneH
		];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44469) ctrlCommit 0;
		
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44466);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44466];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44466) ctrlSetText 'LOAD';
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44466) ctrlSetPosition [
			0.68 * safezoneW + safezoneX,
			0.8,
			0.3,
			0.033 * safezoneH
		];
		fnc_ButtonClick_44466 = {
			_txt = lbtext[44465,(lbCurSel 44465)];
			if(_txt != '')then
			{
				if(_txt in missionNameSpaceLoadouts)exitWith
				{
					_m = missionNameSpace getVariable _txt;
					if((!isNil '_m')&&{(typeName _m == 'CODE')})then
					{
						call _m;
					};
				};
				
				if(isNil'FNC_CUSTOM_fn_loadInventory')then
				{
					FNC_CUSTOM_fn_loadInventory = compile (preprocessfile 'A3\functions_f\Inventory\fn_loadInventory.sqf');
				};
				_fnc_scriptName='';[player, [profileNamespace, _txt]] call FNC_CUSTOM_fn_loadInventory;
			};
		};
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44466) ctrlCommit 0;
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44466) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44466'];
		
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44467);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44467];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44467) ctrlSetText 'DELETE';
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44467) ctrlSetPosition [
			0.68 * safezoneW + safezoneX,
			0.8+((ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3)/2),
			0.3,
			0.033 * safezoneH
		];
		fnc_ButtonClick_44467 = {
			_txt = lbtext[44465,(lbCurSel 44465)];
			if(_txt != '')then
			{
				if(_txt in infiSTAR_LoadOutARRay)then
				{
					_id = infiSTAR_LoadOutARRay find _txt;
					if(_id == -1)exitWith{systemchat 'can not find Loadout';};
					_return = infiSTAR_LoadOutARRay deleteAt _id;
					systemchat format['Deleted Loadout: %1',_return];
					profileNamespace setVariable['infiSTAR_LoadOutARRay',infiSTAR_LoadOutARRay];saveprofileNamespace;
					_fnc_scriptName='';[player, [profileNamespace, _txt]] call BIS_fnc_deleteInventory;
				}
				else
				{
					_id = missionNameSpaceLoadouts find _txt;
					if(_id == -1)exitWith{systemchat 'can not find Loadout';};
					_return = missionNameSpaceLoadouts deleteAt _id;
					systemchat format['Deleted Loadout: %1',_return];
				};
			};
			call fnc_load_LoadOuts;
		};
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44467) ctrlCommit 0;
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44467) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44467'];
		
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44468);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44468];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44468) ctrlSetPosition [
			0.68 * safezoneW + safezoneX,
			0.8+(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3),
			0.3,
			0.033 * safezoneH
		];
		fnc_ButtonClick_44468 = {
			_txt = ctrlText 44469;
			if(_txt == '')exitWith{systemchat 'Type a Loadout name to save!';};
			if(count _txt > 30)exitWith{systemchat 'Loadout name should have max 30 characters!';};
			if(isNull SELECTED_TARGET_PLAYER)exitWith{systemchat 'Player selected is NULL-OBJECT';};
			
			_exit = false;
			{if(toUpper _txt isEqualTo toUpper _x)exitWith{_exit=true};} forEach missionNameSpaceLoadouts;
			if(_exit)exitWith{systemchat 'can not overwrite missionNameSpaceLoadouts Admin Loadouts';};
			
			if!(_txt in infiSTAR_LoadOutARRay)then
			{
				infiSTAR_LoadOutARRay pushBack _txt;
				profileNamespace setVariable['infiSTAR_LoadOutARRay',infiSTAR_LoadOutARRay];saveprofileNamespace;
			};
			_fnc_scriptName='';[SELECTED_TARGET_PLAYER, [profileNamespace, _txt]] call BIS_fnc_saveInventory;
			call fnc_load_LoadOuts;
		};
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44468) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44468'];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44468) ctrlSetText 'SAVE FROM SELECTED';
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44468) ctrlCommit 0;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44471);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44471];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44471) ctrlSetPosition [
			0.81 * safezoneW + safezoneX,
			0.8+((ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3)/2),
			0.3,
			0.033 * safezoneH
		];
		fnc_ButtonClick_44471 = {
			_export = player call fnc_cloneGear;
			[_export,SELECTED_TARGET_PLAYER] call admin_d0_target;
			
			_log = format['Cloned on %1(%2)!',name SELECTED_TARGET_PLAYER,getPlayerUID SELECTED_TARGET_PLAYER];
			_log call FN_SHOW_LOG;
		};
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44471) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44471'];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44471) ctrlSetText 'CLONE ON SELECTED';
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44471) ctrlCommit 0;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44472);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44472];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44472) ctrlSetPosition [
			0.81 * safezoneW + safezoneX,
			0.8,
			0.3,
			0.033 * safezoneH
		];
		fnc_ButtonClick_44472 = {
			_export = SELECTED_TARGET_PLAYER call fnc_cloneGear;
			call compile _export;
			
			_log = format['Cloned %1(%2) on yourself!',name SELECTED_TARGET_PLAYER,getPlayerUID SELECTED_TARGET_PLAYER];
			_log call FN_SHOW_LOG;
		};
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44472) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44472'];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44472) ctrlSetText 'CLONE FROM SELECTED';
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44472) ctrlCommit 0;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44463);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 44463];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 44463) ctrlSetPosition [
			0.677 * safezoneW + safezoneX,
			0.75,
			0.2 * safezoneW,
			0.03 * safezoneH
		];
		
		if(!isNil 'THREAD_BTTNTXTCHANGE')then{terminate THREAD_BTTNTXTCHANGE;};
		THREAD_BTTNTXTCHANGE = [] spawn {
			disableSerialization;
			while {!isNull findDisplay MAIN_DISPLAY_ID} do
			{
				(findDisplay MAIN_DISPLAY_ID displayCtrl 44463) ctrlSetText format['SELECTED TARGET: %1',if(isNull SELECTED_TARGET_PLAYER)then{''}else{name SELECTED_TARGET_PLAYER}];
				(findDisplay MAIN_DISPLAY_ID displayCtrl 44463) ctrlCommit 0;
				uiSleep 0.3;
			};
		};
	};
	fnc_WeatherLord = {
		disableSerialization;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33300);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 33300];
		_text1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33300);
		_text1 ctrlSetPosition [
			0.55 * safezoneW + safezoneX,
			0.3,
			0.2 * safezoneW,
			0.03 * safezoneH
		];
		_text1 ctrlSetText 'Fog:';
		_text1 ctrlCommit 0;
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33301);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RscXSliderH', 33301];
		_slider1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33301);
		_slider1 ctrlSetPosition [
			0.554 * safezoneW + safezoneX,
			0.35
		];
		_slider1 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
		slider_fog_changed = {
			SET_FOG_VALUE = (_this select 1)/10;
			0 setFog SET_FOG_VALUE;
		};
		_slider1 ctrlRemoveAllEventHandlers 'SliderPosChanged';
		_slider1 ctrlAddEventHandler ['SliderPosChanged','call slider_fog_changed'];
		_slider1 ctrlCommit 0;
		
		
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33302);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 33302];
		_text2 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33302);
		_text2 ctrlSetPosition [
			0.55 * safezoneW + safezoneX,
			0.4,
			0.2 * safezoneW,
			0.03 * safezoneH
		];
		_text2 ctrlSetText 'Overcast:';
		_text2 ctrlCommit 0;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33303);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RscXSliderH', 33303];
		_slider2 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33303);
		_slider2 ctrlSetPosition [
			0.554 * safezoneW + safezoneX,
			0.45
		];
		_slider2 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
		slider_overcast_changed = {
			SET_OVERCAST_VALUE = (_this select 1)/10;
			0 setOvercast SET_OVERCAST_VALUE;
		};
		_slider2 ctrlRemoveAllEventHandlers 'SliderPosChanged';
		_slider2 ctrlAddEventHandler ['SliderPosChanged','call slider_overcast_changed'];
		_slider2 ctrlCommit 0;
		
		
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33304);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 33304];
		_text3 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33304);
		_text3 ctrlSetPosition [
			0.55 * safezoneW + safezoneX,
			0.5,
			0.2 * safezoneW,
			0.03 * safezoneH
		];
		_text3 ctrlSetText 'Rain:';
		_text3 ctrlCommit 0;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33305);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RscXSliderH', 33305];
		_slider3 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33305);
		_slider3 ctrlSetPosition [
			0.554 * safezoneW + safezoneX,
			0.55
		];
		_slider3 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
		slider_rain_changed = {
			SET_RAIN_VALUE = (_this select 1)/10;
			if(SET_RAIN_VALUE > 0.3)then{if(overcast < 0.75)then{SET_OVERCAST_VALUE = 0.75;};};
			0 setRain SET_RAIN_VALUE;
		};
		_slider3 ctrlRemoveAllEventHandlers 'SliderPosChanged';
		_slider3 ctrlAddEventHandler ['SliderPosChanged','call slider_rain_changed'];
		_slider3 ctrlCommit 0;
		
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33400);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 33400];
		_btn1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33400);
		_btn1 ctrlSetText 'CHANGE GLOBAL';
		_btn1 ctrlSetPosition [
			0.554 * safezoneW + safezoneX,
			0.6,
			0.3,
			0.033 * safezoneH
		];
		_btn1 ctrlCommit 0;
		_btn1 ctrlSetEventHandler['ButtonClick','[16,SET_FOG_VALUE,SET_OVERCAST_VALUE,SET_RAIN_VALUE] call fnc_AdminReq;'];
		
		SET_FOG_VALUE = fog;
		SET_OVERCAST_VALUE = overcast;
		SET_RAIN_VALUE = rain;
		if(!isNil'fnc_WeatherLordTHREAD')then{terminate fnc_WeatherLordTHREAD;};
		fnc_WeatherLordTHREAD = [] spawn {
			disableSerialization;
			_slider1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33301);
			_slider2 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33303);
			_slider3 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33305);
			if(isNil'SET_FOG_VALUE')then{SET_FOG_VALUE=fog};
			if(isNil'SET_OVERCAST_VALUE')then{SET_OVERCAST_VALUE=overcast};
			if(isNil'SET_RAIN_VALUE')then{SET_RAIN_VALUE=rain};
			while {!isNull findDisplay MAIN_DISPLAY_ID} do
			{
				_fog = SET_FOG_VALUE;
				if(_fog > 0)then{_fog=_fog*10;};
				_slider1 sliderSetPosition _fog;
				0 setFog SET_FOG_VALUE;
				
				_overcast = SET_OVERCAST_VALUE;
				if(_overcast > 0)then{_overcast=_overcast*10;};
				_slider2 sliderSetPosition _overcast;
				0 setOvercast SET_OVERCAST_VALUE;
				
				_rain = SET_RAIN_VALUE;
				if(_rain > 0)then{_rain=_rain*10;};
				_slider3 sliderSetPosition _rain;
				0 setRain SET_RAIN_VALUE;
				
				uiSleep 0.1;
			};
		};
	};
	fnc_reallyAdditem = {
		params[['_target',player],['_class','']];
		if(_class == '')exitWith{systemChat 'No Item selected!';};
		if(local _target)then
		{
			_added = [_target, _class] call ExileClient_util_playerEquipment_add;
			if(!_added)then
			{
				_itemInformation = [_class] call BIS_fnc_itemType;
				_itemCategory = _itemInformation select 0;
				_itemType = _itemInformation select 1;
				if(_itemCategory isEqualTo 'Magazine')then
				{
					_target addMagazine _class;
				}
				else
				{
					if(_itemCategory isEqualTo 'Weapon')then
					{
						_target addWeapon _class;
					}
					else
					{
						_target addItem _class;
					};
				};
			};
		}
		else
		{
			['
				_target = player;
				_class = '+str _class+';
				_added = [_target, _class] call ExileClient_util_playerEquipment_add;
				if(!_added)then
				{
					_itemInformation = [_class] call BIS_fnc_itemType;
					_itemCategory = _itemInformation select 0;
					_itemType = _itemInformation select 1;
					if(_itemCategory isEqualTo ''Magazine'')then
					{
						_target addMagazine _class;
					}
					else
					{
						if(_itemCategory isEqualTo ''Weapon'')then
						{
							_target addWeapon _class;
						}
						else
						{
							_target addItem _class;
						};
					};
				};
			',_target] call admin_d0_target;
		};
	};
	fnc_FULLinit = {
		disableSerialization;
		if(isNull findDisplay MAIN_DISPLAY_ID)then
		{
			createdialog 'infiSTAR_AdminMenu';
			call fnc_initOnceOnOpen;
		};
		call fnc_initOnKeyPress;
	};
	fnc_btn_html = {
		infiSTAR_HTML_LOAD = !infiSTAR_HTML_LOAD;
		[] call fnc_colorButtons;
	};
	fnc_ctrlCreate = {
		params['_display','_idc','_type'];
		ctrlDelete (_display displayCtrl _idc);
		_ctrl = _display ctrlCreate[_type, _idc];
		_ctrl
	};
	fnc_initOnceOnOpen = {
		_display = findDisplay MAIN_DISPLAY_ID;
		
		_btn = [_display,1338001,'RSCButton'] call fnc_ctrlCreate;
		_btn ctrlSetText 'SAVE TOGGLE STATE';
		_btn ctrlSetPosition [
			0.39 * safezoneW + safezoneX + (0.15 * safezoneW),
			0.0379694 * safezoneH + safezoneY,
			0.12 * safezoneW,
			0.02 * safezoneH
		];
		_btn buttonSetAction '
			profileNamespace setVariable [''infiSTAR_saveToggle'',infiSTAR_toggled_A];
			saveprofileNamespace;
			_log = ''Saved currently toggled/enabled admin functions. Next time you login as admin, they will automatically turn on.'';
			_log call FN_SHOW_LOG;
			systemChat (''<infiSTAR.de> ''+_log);
		';
		_btn ctrlCommit 0;
		
		if(infiSTAR_HTML_LOAD)then
		{
			if(!isNil'START_LOADING_HTML')then{terminate START_LOADING_HTML;START_LOADING_HTML=nil;};
			START_LOADING_HTML = [] spawn {
				disableSerialization;
				_html = uiNamespace getVariable 'RscHTML_infiSTAR_Admin';
				_html htmlLoad HTML_LOAD_URL2;
				_start = diag_tickTime + .25;
				waitUntil {diag_tickTime > _start};
				if(!ctrlHTMLLoaded _html)exitWith{_html ctrlEnable false;};
			};
		};
	};
	fnc_initOnKeyPress = {
		if!(FILLMAINSTATE in [1,2])then{FILLMAINSTATE = 0;};
		_display = findDisplay MAIN_DISPLAY_ID;
		
		_ctrlL = _display displayCtrl LEFT_CTRL_ID;
		_ctrlL ctrlRemoveAllEventHandlers 'LBDblClick';
		_ctrlL ctrlRemoveAllEventHandlers 'LBSelChanged';		
		_ctrlL ctrlAddEventHandler ['LBDblClick', 'call fnc_LBDblClick_LEFT;[] call fnc_setFocus;'];
		_ctrlL ctrlAddEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_LEFT;[] call fnc_setFocus;'];
		[] call fnc_fill_infiSTAR_Player;
		
		_ctrlR = _display displayCtrl RIGHT_CTRL_ID;
		_ctrlR ctrlRemoveAllEventHandlers 'LBDblClick';
		_ctrlR ctrlRemoveAllEventHandlers 'LBSelChanged';
		_ctrlR ctrlAddEventHandler ['LBDblClick', 'call fnc_LBDblClick_RIGHT;[] call fnc_setFocus;'];
		_ctrlR ctrlAddEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_RIGHT;[] call fnc_setFocus;'];
		[] call fnc_fill_infiSTAR_MAIN;
		
		_ctrl = _display displayCtrl 2;
		_ctrl ctrlSetText format['Players loaded in: %1 of %2                 SERVER UPTIME: %3  SERVER FPS: %4  SERVER THREADS: %5          infiSTAR.de Admin Menu %6',count playableUnits,((playersNumber west)+(playersNumber east)+(playersNumber civilian)+(playersNumber resistance)),call GET_TIME_TIME,SERVER_FPS,SERVER_THREADS,INFISTARVERSION];
		
		_btnMainMenu = _display displayCtrl 20;
		_btnMainMenu buttonSetAction 'FILLMAINSTATE=0;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;';
		
		_btnAntiSpawnMenu = _display displayCtrl 21;
		_btnAntiSpawnMenu buttonSetAction 'FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fnc_setFocus;[] call fnc_colorButtons;';
		
		_btnAntiHackLog = _display displayCtrl 23;
		_btnAntiHackLog ctrlSetText (format['AHLogs: %1',count AH_HackLogArray + count AH_SurvLogArray + count PVAH_AHTMPBAN]);
		_btnAntiHackLog buttonSetAction 'FILLMAINSTATE=3;[] call fnc_fill_HackLog;[] call fnc_setFocus;[] call fnc_colorButtons;';
		
		_btnAdminLog = _display displayCtrl 24;
		_btnAdminLog ctrlSetText (format['AdminLogs: %1',count AH_AdmiLogArray]);
		_btnAdminLog buttonSetAction 'FILLMAINSTATE=4;[] call fnc_fill_AdminLog;[] call fnc_setFocus;[] call fnc_colorButtons;';
		
		if('==== Loadouts ====' call ADMINLEVELACCESS)then{call fnc_Loadoutmenu;};
		if('==== WeatherLord ====' call ADMINLEVELACCESS)then{call fnc_WeatherLord;};
		
		call fnc_SearchFieldButtons;
		[] call fnc_add_adminMainMapMovement;
		[] call fnc_setFocus;
		[] call fnc_colorButtons;
	};
	fnc_colorizeMain = {
		disableSerialization;
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
		_lsize = lbSize RIGHT_CTRL_ID;
		for '_i' from 0 to _lsize do
		{
			_lbtxt = lbtext [RIGHT_CTRL_ID,_i];
			if(_lbtxt in (infiSTAR_Toggleable+infiSTAR_CUSTOM_Toggleable))then
			{
				if(_lbtxt in infiSTAR_toggled_A)then
				{
					_ctrl lbSetColor [_i,[0,1,0,1]];
				}
				else
				{
					_ctrl lbSetColor [_i,[1,0,0,1]];
				};
			};
			if(_lbtxt in infiSTAR_SubMenus)then
			{
				_ctrl lbSetColor [_i,[0.67,0.97,0.97,1]];
			};
			if(_lbtxt in infiSTAR_OnTargetNICE)then
			{
				_ctrl lbSetColor [_i,[0,0.8,1,1]];
			};
			if(_lbtxt in infiSTAR_OnTargetEVIL)then
			{
				_ctrl lbSetColor [_i,[0.99,0.8,0.8,1]];
			};
			if(_lbtxt in infiSTAR_CUSTOM_OnTarget)then
			{
				_ctrl lbSetColor [_i,[0.78,0.66,0,1]];
			};
		};
	};
	fnc_colorButtons = {
		call fnc_SearchFieldButtons;
		disableSerialization;
		_display = findDisplay MAIN_DISPLAY_ID;
		_btnMainMenu = _display displayCtrl 20;
		if(FILLMAINSTATE isEqualTo 0)then{_btnMainMenu ctrlSetTextColor [0,1,0,1];} else {_btnMainMenu ctrlSetTextColor [1,1,1,1];};
		_btnAntiSpawnMenu = _display displayCtrl 21;
		if(FILLMAINSTATE isEqualTo 1)then{_btnAntiSpawnMenu ctrlSetTextColor [0,1,0,1];} else {_btnAntiSpawnMenu ctrlSetTextColor [1,1,1,1];};
		_btnAntiHackLog = _display displayCtrl 23;
		if(FILLMAINSTATE isEqualTo 3)then{_btnAntiHackLog ctrlSetTextColor [0,1,0,1];} else {_btnAntiHackLog ctrlSetTextColor [1,1,1,1];};
		_btnAdminLog = _display displayCtrl 24;
		if(FILLMAINSTATE isEqualTo 4)then{_btnAdminLog ctrlSetTextColor [0,1,0,1];} else {_btnAdminLog ctrlSetTextColor [1,1,1,1];};
		_btnItems = _display displayCtrl 36;
		if((LASTSUBBUTTON isEqualTo 0)&&(FILLMAINSTATE isEqualTo 1))then
		{
			_btnItems ctrlSetTextColor [0,1,0,1];
			
			_ctrlpos =
			[
				0.2 * safezoneW + safezoneX,
				0.173 * safezoneH + safezoneY,
				0.15 * safezoneW,
				0.025 * safezoneH
			];
			
			ctrlDelete (_display displayCtrl 33401);
			_RSCButton33401 = _display ctrlCreate['RSCButton', 33401];
			_RSCButton33401 ctrlSetText 'INFRONT OF TARGET';
			_RSCButton33401 ctrlSetPosition _ctrlpos;
			_RSCButton33401 buttonSetAction 'BTN_GET_ITEM_SEL = 0;[] call fnc_colorButtons;';
			_RSCButton33401 ctrlCommit 0;
			ctrlDelete (_display displayCtrl 33402);
			_RSCButton33402 = _display ctrlCreate['RSCButton', 33402];
			_RSCButton33402 ctrlSetText 'ON TARGET';
			_RSCButton33402 ctrlSetPosition [((_ctrlpos select 0)+(_ctrlpos select 2))*1.2,_ctrlpos select 1,_ctrlpos select 2,_ctrlpos select 3];
			_RSCButton33402 buttonSetAction 'BTN_GET_ITEM_SEL = 1;[] call fnc_colorButtons;';
			_RSCButton33402 ctrlCommit 0;
			
			if(BTN_GET_ITEM_SEL isEqualTo 0)then
			{
				_RSCButton33401 ctrlSetTextColor [0,1,0,1];
				_RSCButton33402 ctrlSetTextColor [1,1,1,1];
			}
			else
			{
				_RSCButton33401 ctrlSetTextColor [1,1,1,1];
				_RSCButton33402 ctrlSetTextColor [0,1,0,1];
			};
		}
		else
		{
			_btnItems ctrlSetTextColor [1,1,1,1];
			
			ctrlDelete (_display displayCtrl 33401);
			ctrlDelete (_display displayCtrl 33402);
		};
		_btnVehs = _display displayCtrl 37;
		if(LASTSUBBUTTON isEqualTo 1)then{_btnVehs ctrlSetTextColor [0,1,0,1];} else {_btnVehs ctrlSetTextColor [1,1,1,1];};
		_btnTrader = _display displayCtrl 38;
		if(LASTSUBBUTTON isEqualTo 2)then{_btnTrader ctrlSetTextColor [0,1,0,1];} else {_btnTrader ctrlSetTextColor [1,1,1,1];};
		_mytime = 0.3;
		_ctrlR = _display displayCtrl RIGHT_CTRL_ID;
		if(isNil 'ctrlposR')then{ctrlposR = ctrlPosition _ctrlR;};
		_ctrlRTMP = [(ctrlposR select 0),(ctrlposR select 1),(ctrlposR select 2)*2.35,(ctrlposR select 3)];
		if(FILLMAINSTATE isEqualTo 0)then
		{
			_ctrlRTMP = ctrlposR;
		};
		if(FILLMAINSTATE isEqualTo 1)then
		{
			_ctrlRTMP = [(ctrlposR select 0),(ctrlposR select 1)+.25,(ctrlposR select 2),(ctrlposR select 3)-.25];
		};
		_ctrlR ctrlSetPosition _ctrlRTMP;
		_ctrlR ctrlCommit _mytime;
		
		_btnHTML = _display displayCtrl 25;
		if(infiSTAR_HTML_LOAD)then{_btnHTML ctrlSetTextColor [1,0,0,1];_btnHTML ctrlSetText 'HIDE HTML';}else{_btnHTML ctrlSetTextColor [0,1,0,1];_btnHTML ctrlSetText 'SHOW HTML';};
		(uiNamespace getVariable 'RscHTML_infiSTAR_Admin') ctrlEnable infiSTAR_HTML_LOAD;
		(uiNamespace getVariable 'RscHTML_infiSTAR_Admin') ctrlShow infiSTAR_HTML_LOAD;
	};
	fnc_fill_HackLog = {
		disableSerialization;
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
		lbclear _ctrl;
		_ctrl lbAdd 'clear ingame HackLog';
		_ctrl lbAdd 'DBL-CLICK TO SYSTEMCHAT';
		_ctrl lbAdd '--------------------';
		
		_ctrl lbAdd format['HackLog: %1',count AH_HackLogArray];
		{_ctrl lbAdd _x;} forEach AH_HackLogArray;
		
		_ctrl lbAdd '';
		_ctrl lbAdd format['SurveillanceLog: %1',count AH_SurvLogArray];
		{_ctrl lbAdd _x;} forEach AH_SurvLogArray;
		
		_ctrl lbAdd '';
		_ctrl lbAdd format['BanLog: %1',count PVAH_AHTMPBAN];
		if(str PVAH_AHTMPBAN != '[]')then
		{
			_ctrl lbAdd 'DBL-CLICK TO REMOVE';
			{_ctrl lbAdd _x;} forEach PVAH_AHTMPBAN;
		};
		for '_i' from 0 to 12 do {_ctrl lbAdd '';};
	};
	fnc_fill_AdminLog = {
		disableSerialization;
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
		lbclear _ctrl;
		if('AdminLog' call ADMINLEVELACCESS)then
		{
			_ctrl lbAdd 'clear ingame AdminLog';
			_ctrl lbAdd 'DBL-CLICK TO SYSTEMCHAT';
			{_ctrl lbAdd _x;} forEach AH_AdmiLogArray;
		}
		else
		{
			_ctrl lbAdd 'Nothin to see here';
		};
		for '_i' from 0 to 12 do {_ctrl lbAdd '';};
	};
	infiSTAR_SubMenus =
	[
		'==== Vehicles ====','==== OnTarget ====','==== Toggleable ====','==== Custom Functions ===='
	];
	infiSTAR_SubMenus append newAllItems_CATEGORY;
	infiSTAR_OnTargetNICE =
	[
		'Teleport - Target To Me','Teleport - Me To Target',
		'Request Steam Name','Heal','Restore','Flip Vehicle',
		'Move In My Vehicle','Move In Target Vehicle',
		'Add / Remove Money','Add / Remove Respect',
		'UnFreeze Target','UnRestrain'
	];
	infiSTAR_OnTargetEVIL =
	[
		'Restrain','Freeze Target',
		'Remove Gear','Kill','Explode','Delete Vehicle','Eject','Eject Crew',
		'Force Disconnect','Kick (Silent)','Kick (Announce)','Ban (Silent)','Ban (Announce)'
	];
	infiSTAR_OnTarget = infiSTAR_OnTargetNICE + infiSTAR_OnTargetEVIL;
	infiSTAR_Toggleable =
	[
		'infiSTAR Player ESP','infiSTAR AI ESP','infiSTAR Dead ESP',
		'infiSTAR MapIcons','Vehicle Marker','Flag Marker (with radius)','DeadPlayer Marker','Stealth / Invisible',
		'God Mode','Vehicle God Mode','Vehboost','UnlimAmmo','noRecoil','FastFire','Lower Terrain',
		'Disable Announces','Teleport In Facing Direction (10m steps)','Show Server Information'
	];
	fnc_fill_infiSTAR_MAIN = {
		disableSerialization;
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
		lbclear _ctrl;
		if(FILLMAINSTATE == 1)then
		{
			switch (LASTSUBBUTTON) do {
				case 0:{
					if('Items spawn menu' call ADMINLEVELACCESS)then
					{
						{
							_category = _x;
							_ctrl lbAdd _category;
							
							_varstate = missionNameSpace getVariable (_category+'SHOW_STATE');
							if(!isNil '_varstate')then
							{
								_variable = missionNameSpace getVariable (_category+'_ARRAY');
								{
									_displayName = getText(configFile >> 'CfgWeapons' >> _x >> 'displayName');
									if(_displayName isEqualTo '')then{_displayName = getText(configFile >> 'CfgMagazines' >> _x >> 'displayName');};
									if(_displayName isEqualTo '')then{_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');};
									
									_lbid = _ctrl lbAdd format['%1 (%2)',_displayName,_x];
									_ctrl lbSetData [_lbid,_x];
									_x call fnc_addpic;
								} forEach _variable;
							};
							
						} forEach newAllItems_CATEGORY;
						for '_i' from 0 to 12 do {_ctrl lbAdd '';};
					};
				};
				case 1:{
					if('==== Vehicles ====' call ADMINLEVELACCESS)then
					{
						_ctrl lbAdd '==== Vehicles ====';
						if(!isNil 'infiSTAR_add_vehicles')then
						{
							_lbid = _ctrl lbAdd 'Exile vehicles:';
							_ctrl lbSetColor [_lbid, [0,1,0,1]];
							{
								_lbid = _ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_ctrl lbSetData [_lbid,_x];
								_x call fnc_addpic;
								_ctrl lbSetColor [_lbid, [0,1,0,1]];
							} forEach ALL_VEHS_TO_SEARCH_C_EXILE;
							
							_ctrl lbAdd '';
							_ctrl lbAdd 'Other vehicles:';
							{
								_lbid = _ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_ctrl lbSetData [_lbid,_x];
								_x call fnc_addpic;
							} forEach ALL_VEHS_TO_SEARCH_C_OTHER;
						};
					};
					for '_i' from 0 to 12 do {_ctrl lbAdd '';};
				};
				case 2:{
					_lbid = _ctrl lbAdd '!!! ATTENTION !!!';_ctrl lbSetData [_lbid,'-1337'];
					_lbid = _ctrl lbAdd 'Trader menus might be a bit buggy.';_ctrl lbSetData [_lbid,'-1337'];
					{
						_lbid = _ctrl lbAdd (_x select 0);
						if(count _x isEqualTo 1)then{_ctrl lbSetData [_lbid,'-1337'];}else{_ctrl lbSetData [_lbid,str _forEachIndex];};
					} forEach TRADER_FUNCTION_ARRAY;
				};
				default {lbclear _ctrl;};
			};
		};
		if(FILLMAINSTATE == 0)then
		{
			_onTarget = [];
			{if(_x call ADMINLEVELACCESS)then{_onTarget pushBack _x;};} forEach infiSTAR_OnTargetNICE;
			if!(_onTarget isEqualTo [])then{_onTarget pushBack '---';};
			{if(_x call ADMINLEVELACCESS)then{_onTarget pushBack _x;};} forEach infiSTAR_OnTargetEVIL;
			if!(_onTarget isEqualTo [])then
			{
				_ctrl lbAdd '==== OnTarget ====';
				if(isNil 'infiSTAR_add_OnTarget')then
				{
					{_ctrl lbAdd _x;} forEach _onTarget;
				};
			};
			
			
			_Toggleable = [];
			{if(_x call ADMINLEVELACCESS)then{_Toggleable pushBack _x;};} forEach infiSTAR_Toggleable;
			if!(_Toggleable isEqualTo [])then
			{
				_ctrl lbAdd '==== Toggleable ====';
				if(isNil 'infiSTAR_add_Toggleable')then
				{
					{_ctrl lbAdd _x;} forEach _Toggleable;
				};
			};
			
			if('Spawn Ammo' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Spawn Ammo';};
			if('FreeRoam Cam (does not work with ESP)' call ADMINLEVELACCESS)then{_ctrl lbAdd 'FreeRoam Cam (does not work with ESP)'};
			if('BIS FreeRoam Cam (works with ESP)' call ADMINLEVELACCESS)then{_ctrl lbAdd 'BIS FreeRoam Cam (works with ESP)'};
			
			if('Spawn Support-Boxes' call ADMINLEVELACCESS)then
			{
				_ctrl lbAdd '';
				{
					_ctrl lbAdd _x;
				} forEach allSupportBoxesNames;
			};
			
			_ctrl lbAdd '';
			if('Mass Message' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Mass Message';};
			if('ChangeTime' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Day'};
			if('ChangeTime' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Night'};
			if('AdminConsole' call ADMINLEVELACCESS)then{_ctrl lbAdd 'AdminConsole';};
			if('Login as Arma Admin' call ADMINLEVELACCESS)then
			{
				if(isNil 'serverCommandLoginDone')then{_ctrl lbAdd 'Login';};
				if(serverCommandAvailable '#logout')then
				{
					_target = lbtext[LEFT_CTRL_ID,(lbCurSel LEFT_CTRL_ID)];
					_ctrl lbAdd format['#kick %1',_target];
					_ctrl lbAdd format['#exec ban %1',str _target];
				};
			};
			
			_ctrl lbAdd '';
			_ctrl lbAdd 'Self Disconnect';
			_ctrl lbAdd '';
			
			if('==== Base Deleter ====' call ADMINLEVELACCESS)then
			{
				_index = _ctrl lbAdd '==== Base Deleter ====';
				_ctrl lbSetColor [_index, [0.2,0.4,1,1]];
				if(isNil 'infiSTAR_add_BaseDeleter')then
				{
					_ctrl lbAdd 'BD: Set Center';
					if(!isNil 'CCGbdCenter')then{
						_ctrl lbAdd 'BD: Set Radius';
					};
					if(!isNil 'CCGbdCenter' && !isNil 'CCGbdRadius')then{
						_ctrl lbAdd '';
						_objects = call CCG_fnc_bdGetObjectsToDelete;
						_ctrl lbAdd format['BD: Selected %1 Objects', count _objects];
						_index = _ctrl lbAdd 'BD: Delete Base';
						_ctrl lbSetColor [_index, [0.8,0,0,1]];
						
						_ctrl lbAdd '';
						
						_objects = call CCG_fnc_bdGetWeaponHoldersToDelete;
						_ctrl lbAdd format['BD: Selected %1 WeaponHolder', count _objects];
						_index = _ctrl lbAdd 'BD: Delete Weaponholder';
						_ctrl lbSetColor [_index, [0.8,0,0,1]];
						_ctrl lbAdd '';
					};
					_ctrl lbAdd 'BD: Cancel / Remove';
					_ctrl lbAdd '';
				};
			};
			
			if(!isNil'infiSTAR_customFunctions')then
			{
				_customFunctions = [];
				{if((_x select 1) call ADMINLEVELACCESS)then{_customFunctions pushBack (_x select 1);};} forEach infiSTAR_customFunctions;
				if!(_customFunctions isEqualTo [])then
				{
					
					_ctrl lbAdd '==== Custom Functions ====';
					if(isNil 'infiSTAR_add_customFunctions')then
					{
						{_ctrl lbAdd _x;} forEach _customFunctions;
					};
				};
			};
			
			_ctrl lbAdd '';
			_ctrl lbAdd 'Keybinds:';
			_ctrl lbAdd 'F1 - Default AdminMenu Key';
			_ctrl lbAdd 'F6 - Heal Yourself';
			_ctrl lbAdd 'F7 - Heal & Repair withing 15m';
			_ctrl lbAdd 'F9 - Show Gear of Player you are currently spectating (might close if player moves)';
			_ctrl lbAdd 'F10 - Stop Spectating';
			_ctrl lbAdd 'F11 - Add Ammo for current weapon';
			_ctrl lbAdd 'SHIFT & 4 - Fly Up';
			_ctrl lbAdd 'SHIFT & 5 - Teleport in looking direction (if enabled)';
			_ctrl lbAdd '7 - Unlock/Lock targeted Vehicle';
			_ctrl lbAdd 'SHIFT & F2 - Adminconsole';
			_ctrl lbAdd 'SHIFT & TAB - Open Map';
			_ctrl lbAdd 'SHIFT & I - Show Info (Like Codes of Vehicles and Doors)';
			_ctrl lbAdd 'DELETE - Delete CursorTarget';
			_ctrl lbAdd 'DIK_PGUP (PageUP) - Flip CursorTarget Vehicle';
			_ctrl lbAdd 'ON MAP - LEFT-ALT + CLICK To Teleport';
			_ctrl lbAdd 'TYPE !admin in Chat to relog as player/admin';
		};
		[] call fnc_colorizeMain;
		for '_i' from 0 to 12 do {_ctrl lbAdd '';};
	};
	fnc_get_plr = {allPlayers};
	fnc_fill_infiSTAR_Player = {
		disableSerialization;
		if(!isNil 'filling_infiSTAR_Player')exitWith{};
		filling_infiSTAR_Player = positionCameraToWorld [0,0,0];
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID;
		lbclear _ctrl;
		_unsorted = call fnc_get_plr;
		_sorted = _unsorted;
		lbclear _ctrl;
		if!(_sorted isEqualTo [])then
		{
			_fnc_addPlayerToList = {
				if(isNull _x)exitWith{};
				_PUIDX = getPlayerUID _x;
				if(_PUIDX == '')exitWith{};
				_side = side _x;
				
				_grp = group _x;
				_ExileName = if(alive _x)then{name _x}else{_x getVariable['ExileName',name _x]};
				_name = format['%1 [%2]',_ExileName,_side];
				if(count units _grp > 1)then
				{
					_name = format['%1 [%2 (%3)]',_ExileName,_side,_grp];
				};
				_index = _ctrl lbAdd _name;
				
				_veh = vehicle _x;
				_xpic = getText (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'picture');
				if(alive _x)then
				{
					if(_x == _veh)then
					{
						_wpnstate = weaponState _x;
						_cwep = _wpnstate select 0;
						if(_cwep != '')then
						{
							_xpic = getText (configFile >> 'CfgWeapons' >> _cwep >> 'picture');
						};
					};
				};
				if!(_xpic isEqualTo '')then
				{
					_ctrl lbSetPicture [_index,_xpic];
					_ctrl lbSetPictureColor [_index,[1, 1, 1, 1]];
				};
				_clr = _x call FN_GET_CLR_PLAYERLIST;
				_ctrl lbSetColor [_index,_clr];
			};
			if(!isNil'SortAlphaPlease')exitWith
			{
				{call _fnc_addPlayerToList} forEach _sorted;
			};
			if(!isNil'SortGroupsPlease')exitWith
			{
				_shown = [];
				{
					_grp = group _x;
					if!(_grp in _shown)then
					{
						_shown pushBack _grp;
						
						_ctrl lbAdd format['______%1______',_grp];
						{
							call _fnc_addPlayerToList;
							
						} forEach (units _grp);
					};
				} forEach _sorted;
			};
			if(!isNil'SortRangePlease')exitWith
			{
				_sorted = [_unsorted,[],{filling_infiSTAR_Player distance _x},'ASCEND'] call BIS_fnc_sortBy;
				{call _fnc_addPlayerToList} forEach _sorted;
			};
		};
		_display = findDisplay MAIN_DISPLAY_ID;
		_btnSortAlpha = _display displayCtrl 10;if(!isNil 'SortAlphaPlease')then{lbSort _ctrl;_btnSortAlpha ctrlSetTextColor [0,1,0,1];} else {_btnSortAlpha ctrlSetTextColor [1,1,1,1];};
		_btnSortGroups = _display displayCtrl 11;if(!isNil 'SortGroupsPlease')then{_btnSortGroups ctrlSetTextColor [0,1,0,1];} else {_btnSortGroups ctrlSetTextColor [1,1,1,1];};
		_btnSortRange = _display displayCtrl 12;if(!isNil 'SortRangePlease')then{_btnSortRange ctrlSetTextColor [0,1,0,1];} else {_btnSortRange ctrlSetTextColor [1,1,1,1];};
		_ctrl lbAdd '-----------------------------------';
		_index = _ctrl lbAdd '[Selected]';_ctrl lbSetColor [_index,[1,0.7,0.15,1]];
		_index = _ctrl lbAdd '[In Vehicle]';_ctrl lbSetColor [_index,[0.047,0.502,1,1]];
		_index = _ctrl lbAdd '[Player]';_ctrl lbSetColor [_index,[1,0.17,0.17,1]];
		_index = _ctrl lbAdd '[Group]';_ctrl lbSetColor [_index,[1,0.95,0,1]];
		_index = _ctrl lbAdd '[Admin]';_ctrl lbSetColor [_index,[0,1,0,1]];
		_index = _ctrl lbAdd '[Dead Player]';_ctrl lbSetColor [_index,[1,1,1,1]];
		for '_i' from 0 to 12 do {_ctrl lbAdd '';};
		filling_infiSTAR_Player = nil;
	};
	fnc_LBDblClick_LEFT = {
		_target = lbtext[LEFT_CTRL_ID,(lbCurSel LEFT_CTRL_ID)];
		
		SELECTED_DOUBLECLICK_TARGET = objNull;
		if(!isNil 'SELECTED_TARGET_PLAYER')then
		{
			if(!isNull SELECTED_TARGET_PLAYER)then
			{
				SELECTED_DOUBLECLICK_TARGET = SELECTED_TARGET_PLAYER;
			};
		};
		if(isNull SELECTED_DOUBLECLICK_TARGET)then
		{
			_break = false;
			{
				_puid = getPlayerUID _x;
				if(_puid != '')then
				{
					_grp = group _x;
					_side = side _x;
					_ExileName = if(alive _x)then{name _x}else{_x getVariable['ExileName',name _x]};
					_search = format['%1 [%2]',_ExileName,_side];
					if(count units _grp > 1)then
					{
						_search = format['%1 [%2 (%3)]',_ExileName,_side,_grp];
					};
					if(_search == _target)then
					{
						_break = true;
						SELECTED_DOUBLECLICK_TARGET = _x;
					};
				};
				if(_break)exitWith{true};
			} forEach (call fnc_get_plr);
		};
		if('spectating' call ADMINLEVELACCESS)then{call fnc_beginspectate;};
	};
	fnc_LBSelChanged_LEFT = {
		_target = lbtext[LEFT_CTRL_ID,(lbCurSel LEFT_CTRL_ID)];
		_break = false;
		_puid = '';
		SELECTED_TARGET_PLAYER = objNull;
		{
			_puid = getPlayerUID _x;
			if(_puid != '')then
			{
				_grp = group _x;
				_side = side _x;
				_ExileName = if(alive _x)then{name _x}else{_x getVariable['ExileName',name _x]};
				_search = format['%1 [%2]',_ExileName,_side];
				if(count units _grp > 1)then
				{
					_search = format['%1 [%2 (%3)]',_ExileName,_side,_grp];
				};
				if(_search == _target)then
				{
					_break = true;
					SELECTED_TARGET_PLAYER = _x;
				};
			};
			if(_break)exitWith{true};
		} forEach (call fnc_get_plr);
		SELECTED_TARGET_PLAYER
	};
	fnc_GET_ITEM = {
		_target = if(isNull (call fnc_LBSelChanged_LEFT))then{player} else {(call fnc_LBSelChanged_LEFT)};
		if((BTN_GET_ITEM_SEL isEqualTo 0)&&!(FILLMAINSTATE isEqualTo 6))then
		{
			_posATL = getPosATL _target;
			_pos = _target modelToWorld [0,1.5,0];
			_pos set[2,_posATL select 2];
			[3,netId _target,_pos,_class] call fnc_AdminReq;
			
			_log = format['Spawning %1 on the ground infront of %2!',_click,name _target];
			_log call fnc_adminLog;
			_log call FN_SHOW_LOG;
		}
		else
		{
			[_target,_class] call fnc_reallyAdditem;
			_log = format['Spawning %1 on %2!',_click,name _target];
			_log call fnc_adminLog;
			_log call FN_SHOW_LOG;
		};
	};
	FN_EXILE_VEH_TRADER_ADMIN = {
		if((player isEqualTo (vehicle player))&&((_this select 2 isEqualTo 1)))exitWith
		{
			systemChat '<infiSTAR.de> You need to be in a Vehicle to use this!'
		};
		_obj = (_this select 0) createVehicleLocal (getPos player);
		_obj call (missionNameSpace getVariable (_this select 1));
		deleteVehicle _obj;
	};
	fnc_toggleables = {
		switch (_this) do {
			case 'infiSTAR Player ESP':{call infiSTAR_fnc_infiESP_player1;};
			case 'infiSTAR AI ESP':{call infiSTAR_fnc_infiESP_AI;};
			case 'infiSTAR Dead ESP':{call infiSTAR_fnc_infiESP_DEAD;};
			case 'infiSTAR MapIcons':{call infiSTAR_A3MAPICONS;};
			case 'Vehicle Marker':{call adminVehicleMarker;};
			case 'Flag Marker (with radius)':{call adminFlagMark;};
			case 'DeadPlayer Marker':{call adminDeadPlayer;};
			case 'God Mode':{call infiSTAR_A3Invulnerability;};
			case 'Vehicle God Mode':{call fnc_infiSTAR_A3cargod;};
			case 'Lower Terrain':{call fnc_LowerTerrain;};
			case 'Vehboost':{call infiSTAR_VehicleBoost;};
			case 'UnlimAmmo':{call fnc_infiSTAR_A3UnlAmmo;};
			case 'noRecoil':{call fnc_infiSTAR_A3noRecoil;};
			case 'FastFire':{call fnc_infiSTAR_A3FF;};
			case 'Stealth / Invisible':{call fnc_infiSTARHIDE;};
			case 'Disable Announces':{call fnc_DisableAnnouncements;};
			case 'Teleport In Facing Direction (10m steps)':{if(isNil'infiSTAR_TpdirectionENABLED')then{infiSTAR_TpdirectionENABLED=true}else{infiSTAR_TpdirectionENABLED=nil;};};
			case 'Show Server Information':{call FN_SERVER_INFORMATION_OVERLAY;};
		};
		if(_this in infiSTAR_CUSTOM_Toggleable)then
		{
			_id = infiSTAR_CUSTOM_Toggleable find _this;
			if!(_id isEqualTo -1)then
			{
				call (missionNameSpace getVariable format['FNC_CUSTOM_TOGGLEABLE_%1',_id]);
			};
		};
		if(_this in infiSTAR_toggled_A)then
		{
			lbSetColor [RIGHT_CTRL_ID,1,[1,0,0,1]];
			infiSTAR_toggled_A = infiSTAR_toggled_A - [_this];
			format['%1 - 0',_this] call fnc_adminLog;
		}
		else
		{
			lbSetColor [RIGHT_CTRL_ID,1,[0,1,0,1]];
			infiSTAR_toggled_A pushBack _this;
			format['%1 - 1',_this] call fnc_adminLog;
		};
	};
	fnc_LBDblClick_RIGHT = {
		_click = lbtext[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
		if(_click isEqualTo '')exitWith{};
		if(FILLMAINSTATE isEqualTo 1 && LASTSUBBUTTON isEqualTo 2)exitWith
		{
			_num = parseNumber(lbData[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)]);
			if(_num isEqualTo -1337)exitWith{};
			(TRADER_FUNCTION_ARRAY select _num) call FN_EXILE_VEH_TRADER_ADMIN;
		};
		if(_click in infiSTAR_CUSTOM_RUN)exitWith
		{
			_id = infiSTAR_CUSTOM_RUN find _click;
			if!(_id isEqualTo -1)then
			{
				call (missionNameSpace getVariable format['FNC_CUSTOM_RUN_%1',_id]);
			};
		};
		if('==== Base Deleter ====' call ADMINLEVELACCESS)then{[_click] call CCG_fnc_adminClick;};
		if(_click in AH_HackLogArray)exitWith{systemchat _click;diag_log _click;};
		if(_click in AH_SurvLogArray)exitWith{systemchat _click;diag_log _click;};
		if(_click in AH_AdmiLogArray)exitWith{systemchat _click;diag_log _click;};
		if(_click in PVAH_AHTMPBAN)exitWith{
			[-667,_click] call fnc_AdminReq;
			systemchat format['Removed  %1  from TempBan Variable. Might still be banned in ban(s).txt',_click];
			[] call fnc_fill_HackLog;[] call fnc_setFocus;
		};
		if(_click in (infiSTAR_Toggleable+infiSTAR_CUSTOM_Toggleable))then{_click call fnc_toggleables;};
		if(_click in (infiSTAR_OnTarget+infiSTAR_CUSTOM_OnTarget))then
		{
			if(isNil 'SELECTED_TARGET_PLAYER')then{SELECTED_TARGET_PLAYER = objNull;};
			_target = lbtext[LEFT_CTRL_ID,(lbCurSel LEFT_CTRL_ID)];
			if(_target == '' && isNull SELECTED_TARGET_PLAYER)exitWith
			{
				_log = 'You did not select a Target!';
				_log call FN_SHOW_LOG;
			};
			if(isNull SELECTED_TARGET_PLAYER)then
			{
				_break = false;
				{
					if(getPlayerUID _x != '')then
					{
						_search = format['%1 [%2]',name _x,side _x];
						if(_search == _target)then
						{
							_break = true;
							SELECTED_TARGET_PLAYER = _x;
						};
					};
					if(_break)exitWith{true};
				} forEach (call fnc_get_plr);
			};
			if(!isNull SELECTED_TARGET_PLAYER)then
			{
				_unit = SELECTED_TARGET_PLAYER;
				switch (_click) do {
					case 'Teleport - Target To Me':{[_unit] call fnc_TP2ME;};
					case 'Teleport - Me To Target':{[_unit] call fnc_TPME2;};
					case 'Request Steam Name':{[_unit] call fnc_getSteamName;};
					case 'Heal':{[_unit] call fnc_HealTarget;};
					case 'Restore':{[_unit] call fnc_RepairTarget;};
					case 'Flip Vehicle':{[_unit] call fnc_flipVeh;};
					case 'Add / Remove Money':{[_unit] spawn fnc_ExileMoneyChange;};
					case 'Add / Remove Respect':{[_unit] spawn fnc_ExileRespectChange;};
					case 'Move In My Vehicle':{[_unit] call fnc_MoveInMyVehicle;};
					case 'Move In Target Vehicle':{[_unit] call fnc_MoveInTargetVehicle;};
					case 'Freeze Target':{[_unit,true] call fnc_freezeTarget;};
					case 'UnFreeze Target':{[_unit,false] call fnc_freezeTarget;};
					case 'Restrain':{[_unit,true] call fnc_restrainTarget;};
					case 'UnRestrain':{[_unit,false] call fnc_restrainTarget;};
					case 'Remove Gear':{[_unit] call fnc_RemoveGear;};
					case 'Eject':{[_unit] call fnc_EjectTargetVeh;};
					case 'Eject Crew':{[_unit] call fnc_EjectCrewTargetVeh;};
					case 'Kill':{[_unit] call fnc_Kill_selected;};
					case 'Explode':{[_unit] call fnc_Explode_selected;};
					case 'Delete Vehicle':{[_unit] call fnc_deleteVeh_selected;};
					case 'Force Disconnect':{[_unit] call fnc_Disconnect_selected;};
					case 'Kick (Silent)':{[_unit,0] call fnc_Kick_selected;};
					case 'Kick (Announce)':{[_unit,1] spawn fnc_Kick_selected;};
					case 'Ban (Silent)':{[_unit,0] call fnc_Ban_selected;};
					case 'Ban (Announce)':{[_unit,1] spawn fnc_Ban_selected;};
				};
				if(_click in infiSTAR_CUSTOM_OnTarget)then
				{
					_id = infiSTAR_CUSTOM_OnTarget find _click;
					if!(_id isEqualTo -1)then
					{
						_unit call (missionNameSpace getVariable format['FNC_CUSTOM_ON_TARGET_%1',_id]);
					};
				};
				_log = format['%1 - %2(%3)',_click,_target,getPlayerUID _unit];_log call fnc_adminLog;
			};
		};
		
		_exitHere = false;
		{
			if(_click isEqualTo _x)exitWith{[_x,_forEachIndex] call fnc_spawn_Box;_exitHere=true;};
		} forEach allSupportBoxesNames;
		if(_exitHere)exitWith{true};
		
		switch (_click) do {
			case '==== OnTarget ====':{if(isNil 'infiSTAR_add_OnTarget')then{infiSTAR_add_OnTarget = true;} else {infiSTAR_add_OnTarget = nil;};};
			case '==== Toggleable ====':{if(isNil 'infiSTAR_add_Toggleable')then{infiSTAR_add_Toggleable = true;} else {infiSTAR_add_Toggleable = nil;};};
			case '==== Base Deleter ====':{if(isNil 'infiSTAR_add_BaseDeleter')then{infiSTAR_add_BaseDeleter = true;} else {infiSTAR_add_BaseDeleter = nil;};};
			case '==== Custom Functions ====':{if(isNil 'infiSTAR_add_customFunctions')then{infiSTAR_add_customFunctions = true;} else {infiSTAR_add_customFunctions = nil;};};
			case '==== Vehicles ====':{if(isNil 'infiSTAR_add_vehicles')then{infiSTAR_add_vehicles = true;} else {infiSTAR_add_vehicles = nil;};};
			case 'clear ingame HackLog':{[0] call fnc_clearLogArray;_click call fnc_adminLog;[] call fnc_fill_HackLog;};
			case 'clear ingame AdminLog':{[1] call fnc_clearLogArray;_click call fnc_adminLog;[] call fnc_fill_AdminLog;};
			case 'BIS FreeRoam Cam (works with ESP)':{call fnc_BIS_FreeRoamCam;};
			case 'FreeRoam Cam (does not work with ESP)':{call fnc_FreeRoamCam;};
			case 'Day':{11 call fnc_changeTime;_click call fnc_adminLog;};
			case 'Night':{23 call fnc_changeTime;_click call fnc_adminLog;};
			case 'AdminConsole':{[] spawn fnc_RscDisplayDebugPublic;_click call fnc_adminLog;};
			case 'Mass Message':{[] call fnc_mass_message;};
			case 'Spawn Ammo':{[] call infiSTAR_A3addAmmo;};
			case 'Self Disconnect':{_click call fnc_adminLog;(finddisplay 46) closeDisplay 0;};
		};
		if(_click in newAllItems_CATEGORY)then
		{
			_varstate = missionNameSpace getVariable (_click+'SHOW_STATE');
			if(isNil '_varstate')then
			{
				missionNameSpace setVariable[(_click+'SHOW_STATE'),true];
			}
			else
			{
				missionNameSpace setVariable[(_click+'SHOW_STATE'),nil];
			};
		};
		_class = lbData[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
		if(_class in ALLC_ITEMS)exitWith
		{
			call fnc_GET_ITEM;
		};
		if(_class in ALL_VEHS_TO_SEARCH_C)exitWith
		{
			_target = if(isNull (call fnc_LBSelChanged_LEFT))then{player} else {(call fnc_LBSelChanged_LEFT)};
			_position = _target modelToWorld [0,10,0];
			_dir = getDir (vehicle _target);
			
			_log = format['Spawning %1 infront of %2!',_click,name _target];
			_log call FN_SHOW_LOG;
			[0,_class,_position,_dir,netId _target] spawn {
				disableSerialization;
				_array = _this;
				call ExileClient_gui_interactionMenu_unhook;
				ExileClientInteractionObject = player;
				_pincode = 4 call ExileClient_gui_keypadDialog_show;
				_array pushBack _pincode;
				_array call fnc_AdminReq;
			};
			format['spawning %1',_click] call fnc_adminLog;
		};
		if(_click == 'Login')then{if(isNil 'serverCommandLoginDone')then{serverCommandLoginDone = true;serverCommand ('#login '+passwordAdmin);};};
		if((_click find '#kick' > -1) || (_click find '#exec' > -1))then{serverCommand _click;};
		if((FILLMAINSTATE == 0)||(FILLMAINSTATE == 1))then{[] call fnc_fill_infiSTAR_MAIN;};
	};
	fnc_LBSelChanged_RIGHT = {
		_class = lbData[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
		_cfg = call {
			if(isClass (configFile >> 'CfgWeapons' >> _class))exitWith{'CfgWeapons'};
			if(isClass (configFile >> 'CfgMagazines' >> _class))exitWith{'CfgMagazines'};
			if(isClass (configFile >> 'CfgVehicles' >> _class))exitWith{'CfgVehicles'};
			''
		};
		if(_cfg != '')then
		{
			_xposT = 0.6;
			_yposT = 0.375 * safezoneH + safezoneY;
			_txt = (gettext (configFile >> _cfg >> _class >> 'Library' >> 'libTextDesc'));
			if(_txt == '')then{_txt = 'by infiSTAR.de';};
			
			if(_cfg=='CfgVehicles')then{
				_vehicleConfig=configFile>>_cfg>>_class;
				_info = format['Capacity: %1 Armor: %2 Fuel: %3 MaxSpeed: %4',getNumber(_vehicleConfig>>'maximumLoad'),getNumber(_vehicleConfig>>'armor'),getNumber(_vehicleConfig>>'fuelCapacity'),getNumber(_vehicleConfig>>'maxSpeed')];
				_log = format['Class: %1 %2',_class,_info];
				_log call FN_SHOW_LOG;
				_txt=(_info+'<br/>'+_txt);
			};
			
			['
				<t size=''0.4''>'+_txt+' </t>
			',_xposT,_yposT,15,0,0,8407] spawn bis_fnc_dynamicText;
			
			_xposP = 0.525 * safezoneW + safezoneX;
			_yposP = 0.175 * safezoneH + safezoneY;
			_pic = (getText (configFile >> _cfg >> _class >> 'picture'));
			if((toLower _pic) in ['','pictureheal','picturepapercar','picturething','picturestaticobject'])exitWith{};
			['
				<img size=''3.5'' image='''+_pic+'''/>
			',_xposP,_yposP,15,0,0,8406] spawn bis_fnc_dynamicText;
		};
	};
	fnc_getConfig = {
		_cfg = '';
		if(isClass (configFile >> 'CfgWeapons' >> _this))then
		{
			_cfg = 'CfgWeapons';
		}
		else
		{
			if(isClass (configFile >> 'CfgMagazines' >> _this))then
			{
				_cfg = 'CfgMagazines';
			}
			else
			{
				if(isClass (configFile >> 'CfgVehicles' >> _this))then
				{
					_cfg = 'CfgVehicles';
				};
			};
		};
		_cfg
	};
	admin_showGear = {
		if(!isNull cameraOn)then
		{
			closeDialog 0;
			createGearDialog [cameraOn,'RscDisplayInventory'];
			_log = format['Showing Gear of %1',name cameraOn];
			_log call FN_SHOW_LOG;
		};
	};
	fnc_endSpectate = {
		if(!isNil'SPECTATE_THREAD')then{terminate SPECTATE_THREAD;SPECTATE_THREAD=nil;};
		(vehicle player) switchCamera cameraView;
		for '_i' from 3025 to 3045 do {['',0,0,1,0,0,_i] spawn bis_fnc_dynamicText;};
		_log = 'Finished spectating.';
		_log call FN_SHOW_LOG;
	};
	fnc_beginspectate = {
		if(!isNil'SPECTATE_THREAD')then{terminate SPECTATE_THREAD;SPECTATE_THREAD=nil;};
		SPECTATE_THREAD = [] spawn {
			_log = 'Spectating - Press F10 to exit.';
			_log call FN_SHOW_LOG;
			while {true} do
			{
				if(isNil 'SELECTED_DOUBLECLICK_TARGET')then{SELECTED_DOUBLECLICK_TARGET = player;};
				_unit = SELECTED_DOUBLECLICK_TARGET;
				if(isNull _unit)then{_unit = player;};
				if(str(_unit) == '<NULL-object>')then{_unit = player;};
				if(getPlayerUID _unit == '')then{_unit = player;};
				
				_veh = vehicle _unit;
				if(str _veh != str cameraOn)then
				{
					player reveal _unit;
					player reveal _veh;
					_veh switchCamera cameraView;
					format['SPECTATE - switchedCamera on %1(%2)',name _unit,getPlayerUID _unit] call fnc_adminLog;
					for '_i' from 3025 to 3045 do {['',0,0,1,0,0,_i] spawn bis_fnc_dynamicText;};
				};
				
				_log = format['%1 (%2) @%3',name _unit,getPlayerUID _unit,mapGridPosition _veh];
				['<t align=''left'' size=''0.5'' color=''#238701''>'+_log+'</t>',safezoneX+0.2,safezoneY+0.405,0.3,0,0,3033] spawn bis_fnc_dynamicText;
				
				_PLAYER_STATS_VAR = _unit getVariable['PLAYER_STATS_VAR',[0,0]];
				_money = _PLAYER_STATS_VAR select 0;
				_money = if(_money > 1000)then{format['%1K',_money / 1000]}else{_money};
				_respect = _PLAYER_STATS_VAR select 1;
				_log2 = format['Health: %1  Money: %2  Respect: %3',(1-(damage _unit))*100,_money,_respect];
				['<t align=''left'' size=''0.5'' color=''#238701''>'+_log2+'</t>',safezoneX+0.2,safezoneY+0.435,0.3,0,0,3034] spawn bis_fnc_dynamicText;
				
				_cwep = '';
				_cammo = '';
				_cmags = '';
				_wpnstate = weaponState _unit;
				if(!isNil '_wpnstate')then
				{
					if(str _wpnstate != '[]')then
					{
						_cwep = _wpnstate select 0;
						_cmags = {_wpnstate select 3 == _x} count magazines _unit;
						_cammo = _wpnstate select 4;
					};
				};
				if(_cwep == '')then
				{
					_log3 = 'Bare Fists';
					['<t align=''left'' size=''0.5'' color=''#238701''>'+_log3+'</t>',safezoneX+0.2,safezoneY+0.465,0.3,0,0,3035] spawn bis_fnc_dynamicText;
				}
				else
				{
					_type = _cwep;
					_cfg = _type call fnc_getConfig;
					_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
					_pic = getText (configFile >> _cfg >> _type >> 'picture');
					
					_log3 = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];
					['
					<img size=''0.75'' image='''+_pic+''' align=''left''/>
					<t align=''left'' size=''0.5'' color=''#238701''>'+_log3+'</t>
					',
					safezoneX+0.2,safezoneY+0.465,0.3,0,0,3035] spawn bis_fnc_dynamicText;
					
					if(_veh != _unit)then
					{
						_cwepsV = [];
						{
							if(_x find 'Horn' == -1)then
							{
								_cwepsV pushBack _x;
							};
						} forEach (weapons _veh);
						
						if(count _cwepsV > 0)then
						{
							_id = 3032;
							_YPOS = safezoneY+0.355;
							
							{
								_cwep = _x;
								_cammo = _veh ammo _cwep;
								_cmags = {currentMagazine _veh == _x} count magazines _veh;
								
								_type = _cwep;
								_cfg = _type call fnc_getConfig;
								_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
								
								_log3a = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];
								['<t align=''left'' size=''0.5'' color=''#A90F68''>'+_log3a+'</t>',safezoneX+0.2,_YPOS,0.3,0,0,_id] spawn bis_fnc_dynamicText;
								
								_id = _id - 1;
								_YPOS = _YPOS - 0.03;
							} forEach _cwepsV;
						};
					};
				};
				
				_ct = cursorTarget;
				if(!isNull _ct)then
				{
					if(getPlayerUID _ct != '')then
					{
						_cwep_ct = currentWeapon _ct;
						_cammo_ct = _ct ammo _cwep_ct;
						_cmags_ct = {currentMagazine _ct == _x} count magazines _ct;
						
						_log4 = format['%1 (%2) @%3',name _ct,getPlayerUID _ct,mapGridPosition _ct];
						['<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log4+'</t>',safezoneX+0.2,safezoneY+0.545,0.3,0,0,3036] spawn bis_fnc_dynamicText;
						
						_log5 = format['Health: %1  Distance: %2m',(1-(damage _ct))*100,round(cameraOn distance _ct)];
						['<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log5+'</t>',safezoneX+0.2,safezoneY+0.575,0.3,0,0,3037] spawn bis_fnc_dynamicText;
						
						_type = _cwep_ct;
						_cfg = _type call fnc_getConfig;
						_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
						_pic = getText (configFile >> _cfg >> _type >> 'picture');
						_log6 = format[' %1 [%2] (%3/%4)',_displayName,_cwep_ct,_cammo_ct,_cmags_ct];
						['
						<img size=''0.75'' image='''+_pic+''' align=''left''/>
						<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log6+'</t>
						',
						safezoneX+0.2,safezoneY+0.605,0.3,0,0,3038] spawn bis_fnc_dynamicText;
					}
					else
					{
						_type = typeOf _ct;
						_cfg = _type call fnc_getConfig;
						_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
						_log4 = format['%1 [%2] @%3',_displayName,_type,mapGridPosition _ct];
						['<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log4+'</t>',safezoneX+0.2,safezoneY+0.545,0.3,0,0,3036] spawn bis_fnc_dynamicText;
						
						_log5 = format['Health: %1 - Distance: %2m',(1-(damage _ct))*100,round(cameraOn distance _ct)];
						['<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log5+'</t>',safezoneX+0.2,safezoneY+0.575,0.3,0,0,3037] spawn bis_fnc_dynamicText;
						
						['',0,0,1,0,0,3038] spawn bis_fnc_dynamicText;
					};
					
					_vehCT = vehicle _ct;
					if((_vehCT isKindOf 'LandVehicle') || (_vehCT isKindOf 'Air') || (_vehCT isKindOf 'Ship') || (_vehCT isKindOf 'Static'))then
					{
						_cwepsV = [];
						{
							if(_x find 'Horn' == -1)then
							{
								_cwepsV pushBack _x;
							};
						} forEach (weapons _vehCT);
						
						if(count _cwepsV > 0)then
						{
							_id = 3039;
							_YPOS = safezoneY+0.655;
							
							{
								_cwep = _x;
								_cammo = _vehCT ammo _cwep;
								_cmags = {currentMagazine _vehCT == _x} count magazines _vehCT;
								
								_type = _cwep;
								_cfg = _type call fnc_getConfig;
								_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
								
								_log6a = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];
								['<t align=''left'' size=''0.5'' color=''#A90F68''>'+_log6a+'</t>',safezoneX+0.2,_YPOS,0.3,0,0,_id] spawn bis_fnc_dynamicText;
								
								_id = _id + 1;
								_YPOS = _YPOS + 0.03;
							} forEach _cwepsV;
						};
					};
				};
				uiSleep 0.05;
			};
		};
	};
	fnc_clearLogArray = {
		[-668,_this select 0] call fnc_AdminReq;
		_log = 'ingame Log(s) cleared!';
		_log call FN_SHOW_LOG;
	};
	fnc_getSteamName = {
		[9876,getPlayerUID (_this select 0)] call fnc_AdminReq;
		_log = format['Requested Steam Name of %1(%2)',name (_this select 0),getPlayerUID (_this select 0)];
		_log call FN_SHOW_LOG;
	};
	fnc_TP2ME = {
		_unit = _this select 0;
		_pos = player modelToWorld [0,15,0];
		if(_unit == vehicle _unit)then{_pos = player modelToWorld [0,5,0];};
		[1,netId _unit,_pos] call fnc_AdminReq;
	};
	fnc_TPME2 = {
		_unit = _this select 0;
		_pos = _unit modelToWorld [0,-5,0];		
		_object = (vehicle player);
		if(str(crew _object) == str([player]))then
		{
			_object setPos _pos;
		}
		else
		{
			[1,netId _unit,_pos] call fnc_AdminReq;
		};
	};
	fnc_MoveInMyVehicle = {
		_unit = _this select 0;
		_unit moveInAny (vehicle player);
	};
	fnc_MoveInTargetVehicle = {
		_unit = _this select 0;
		player moveInAny (vehicle _unit);
	};
	fnc_EjectTargetVeh = {
		_unit = _this select 0;
		moveOut _unit;
		unassignVehicle _unit;
		_unit action ['eject', (vehicle _unit)];
	};
	fnc_EjectCrewTargetVeh = {
		_unit = _this select 0;
		_veh = (vehicle _unit);
		_uids = [];
		{
			moveOut _x;
			unassignVehicle _x;
			_x action ['eject', _veh];
			_uids pushBack (getPlayerUID _x)
		} forEach (crew _veh);
	};
	fnc_RemoveGear = {
		_target = _this select 0;
		if(typeName _target != 'OBJECT')then
		{
			_target = cursorTarget;
		};
		if(!isNull _target)then
		{
			[11,netId _target] call fnc_AdminReq;
			
			_log = format['Removed Gear of %1!',name _target];
			_log call FN_SHOW_LOG;
		};
	};
	fnc_mass_message = {
		disableSerialization;
		_display = findDisplay 24;
		if(isNull _display)exitWith
		{
			_log = 'open your chat, type a message and start this function again!';
			_log call FN_SHOW_LOG;
			systemchat _log;
		};
		_chat = _display displayCtrl 101;
		_msg = ctrlText _chat;
		(_display) closeDisplay 0;
		[7,toArray _msg] call fnc_AdminReq;
		format['Mass Message: %1',_msg] call fnc_adminLog;
		
		_log = 'message sent!';
		_log call FN_SHOW_LOG;
	};
	fnc_changeTime = {
		[17,_this] call fnc_AdminReq;
		_log = format['changed time to hour: %1',_this];
		_log call FN_SHOW_LOG;
	};
	fnc_get_addvalue = {
		disableSerialization;
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77764);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['IGUIBack', 77764];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77764) ctrlSetPosition [
			0.6,
			0-(0.033 * safezoneH),
			0.7,
			0.099 * safezoneH
		];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77764) ctrlSetBackgroundColor [0.15,0.15,0.15,1];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77764) ctrlCommit 0;
		
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77769);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RscEdit', 77769];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77769) ctrlSetPosition [
			0.6,
			0,
			0.7,
			0.033 * safezoneH
		];
		ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77769);
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77769) ctrlCommit 0;
		
		
		fnc_ButtonClick_77766 = {
			_txt = ctrlText 77769;
			if(_txt != '')then
			{
				_val = parseNumber _txt;
				if(abs _val <= 500000)then
				{
					fnc_get_addvalue_VALUE = (parseNumber _txt);
					ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77764);
					ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77769);
					ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77766);
					ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77765);
				}
				else
				{
					systemChat 'Value needs to be smaller than 500.000!';
				};
			};
		};
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77766);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 77766];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlSetPosition [
			0.8,
			0.033 * safezoneH,
			0.3,
			0.033 * safezoneH
		];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_77766'];
		
		
		
		fnc_get_addvalue_VALUE = nil;
		ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77765);
		findDisplay MAIN_DISPLAY_ID ctrlCreate['RscText', 77765];
		(findDisplay MAIN_DISPLAY_ID displayCtrl 77765) ctrlSetPosition [
			0.6,
			0-(0.033 * safezoneH),
			0.7,
			0.033 * safezoneH
		];
		waitUntil {
			(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlSetText format['%1',if(_this isEqualTo 0)then{'+/- Money'}else{'+/- Respect'}];
			_addval = parseNumber(ctrlText 77769);
			if(abs _addval > 500000)then
			{
				(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlEnable false;
			}
			else
			{
				(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlEnable true;
			};
			(findDisplay MAIN_DISPLAY_ID displayCtrl 77766) ctrlCommit 0;
			ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl 77769);
			
			_PLAYER_STATS_VAR = SELECTED_TARGET_PLAYER getVariable['PLAYER_STATS_VAR',[0,0]];
			_curval = _PLAYER_STATS_VAR select _this;
			(findDisplay MAIN_DISPLAY_ID displayCtrl 77765) ctrlSetText format['Current %1: %2 - after change: %3',if(_this isEqualTo 0)then{'Money'}else{'Respect'},_curval,_curval + _addval];
			(findDisplay MAIN_DISPLAY_ID displayCtrl 77765) ctrlCommit 0;
			
			!isNil 'fnc_get_addvalue_VALUE' || 
			isNull (findDisplay MAIN_DISPLAY_ID displayCtrl 77769)
		};
		if(isNil 'fnc_get_addvalue_VALUE')exitWith{0};
		fnc_get_addvalue_VALUE
	};
	fnc_ExileMoneyChange = {
		_target = _this select 0;
		if(typeName _target != 'OBJECT')exitWith
		{
			_log = 'Target is not an Object!';
			_log call FN_SHOW_LOG;
		};
		if!(isPlayer _target)exitWith
		{
			_log = 'Target is not a Player!';
			_log call FN_SHOW_LOG;
		};
		
		_value = 0 call fnc_get_addvalue;
		[12,netId _target,_value] call fnc_AdminReq;
		_log = format['Added %1 Pop Tabs to %2!',_value,name _target];
		if(_value < 0)then{_log = format['Removed %1 Pop Tabs from %2!',_value,name _target];};
		_log call FN_SHOW_LOG;
	};
	fnc_ExileRespectChange = {
		_target = _this select 0;
		if(typeName _target != 'OBJECT')exitWith
		{
			_log = 'Target is not an Object!';
			_log call FN_SHOW_LOG;
		};
		if!(isPlayer _target)exitWith
		{
			_log = 'Target is not a Player!';
			_log call FN_SHOW_LOG;
		};
		
		_value = 1 call fnc_get_addvalue;
		[122,netId _target,_value] call fnc_AdminReq;
		_log = format['Added %1 Respect to %2!',_value,name _target];
		if(_value < 0)then{_log = format['Removed %1 Respect from %2!',_value,name _target];};
		_log call FN_SHOW_LOG;
	};
	fnc_freezeTarget = {
		_target = _this select 0;
		_value = _this select 1;
		if(typeName _target != 'OBJECT')exitWith
		{
			_log = 'Target is not an Object!';
			_log call FN_SHOW_LOG;
		};
		if!(isPlayer _target)exitWith
		{
			_log = 'Target is not a Player!';
			_log call FN_SHOW_LOG;
		};
		[13,netId _target,_value] call fnc_AdminReq;
		_log = format['UnFroze %1!',name _target];
		if(_value)then{_log = format['Froze %1!',name _target];};
		_log call FN_SHOW_LOG;
	};
	fnc_restrainTarget = {
		_target = _this select 0;
		_value = _this select 1;
		if(typeName _target != 'OBJECT')exitWith
		{
			_log = 'Target is not an Object!';
			_log call FN_SHOW_LOG;
		};
		if!(isPlayer _target)exitWith
		{
			_log = 'Target is not a Player!';
			_log call FN_SHOW_LOG;
		};
		[15,netId _target,netId player,_value] call fnc_AdminReq;
		_log = format['UnRestrained %1!',name _target];
		if(_value)then{_log = format['Restrained %1!',name _target];};
		_log call FN_SHOW_LOG;
	};
	fnc_spawn_Box = {
		private['_boxname','_select','_target'];
		_boxname = _this select 0;
		_select = _this select 1;
		_target = if(isNull (call fnc_LBSelChanged_LEFT))then{player} else {(call fnc_LBSelChanged_LEFT)};
		[5000,netId _target,_select] call fnc_AdminReq;
		_log = format['%1 created for %2(%3)!',_boxname,name _target,getPlayerUID _target];
		_log call FN_SHOW_LOG;
		_log call fnc_adminLog;
	};
	admin_showinfo = {
		_obj = cursortarget;
		if(!isNull _obj)then
		{
			_pos = getPosATL _obj;
			_type = typeOf _obj;
			
			if(!isNil'REQUESTING_OBJECT_PIN_CODE')then{systemChat 'Still requestion PinCode!';};
			[14,netId _obj] call fnc_AdminReq;
			REQUESTING_OBJECT_PIN_CODE = true;
			objectPinCode_RESULT=nil;
			waitUntil {!isNil 'objectPinCode_RESULT'};
			_objectPinCode_RESULT = objectPinCode_RESULT;objectPinCode_RESULT = nil;
			REQUESTING_OBJECT_PIN_CODE = nil;
			
			_PLAYER_STATS_VAR = _obj getVariable['PLAYER_STATS_VAR',[0,0]];
			_money = _PLAYER_STATS_VAR select 0;
			_money = if(_money > 1000)then{format['%1K',_money / 1000]}else{_money};
			_respect = _PLAYER_STATS_VAR select 1;
			
			{
				systemChat _x;
				diag_log _x;
			} forEach [
				format['%1, Code: %2',_type,_objectPinCode_RESULT],
				format['WorldSpace: [%1,%2], @%3',getDir _obj,_pos,mapGridPosition _pos],
				if(_obj in (call fnc_get_plr))then{format['%1(%2) - Health: %3  Money: %4  Respect: %5',name _obj,getPlayerUID _obj,(1-(damage _obj))*100,_money,_respect]}else{''},
				'--'
			];
		};
	};
	fnc_infiSTAR_A3cargod = {
		if(!isNil 'A3carGodRun')then
		{
			terminate A3carGodRun;A3carGodRun=nil;
			
			{
				_x removeAllEventhandlers 'HandleDamage';
				_x allowDamage true;
			} forEach MY_VEHICLES;
			
			_log = 'Vehicle God Mode - Disabled';
			_log call FN_SHOW_LOG;
		}
		else
		{
			_log = 'Vehicle God Mode - Enabled';
			_log call FN_SHOW_LOG;
			
			MY_VEHICLES = [];
			A3carGodRun = [] spawn {
				while {true} do
				{
					_veh = vehicle cameraOn;
					if(local _veh)then
					{
						if(_veh != player)then
						{
							if!(_veh in MY_VEHICLES)then{MY_VEHICLES pushBack _veh;};
							_veh allowDamage false;
							_veh removeAllEventhandlers 'HandleDamage';
							_veh addEventHandler['HandleDamage',{false}];
						};
					};
					uiSleep 0.1;
				};
			};
		};
	};
	fnc_LowerTerrain = {
		if(isNil 'admin_terrain')then{admin_terrain = true;} else {admin_terrain = !admin_terrain};
		if(admin_terrain)then{
			setTerrainGrid 50;
			_log = 'Terrain Low';
			_log call FN_SHOW_LOG;
		}
		else
		{
			setTerrainGrid 25;
			_log = 'Terrain Normal';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_infiSTAR_A3UnlAmmo = {
		if(isNil 'unlimAmmRun')then
		{
			unlimAmmRun = [] spawn {
				private['_muzzle','_vehicle','_turretPath','_mags','_magArray','_magazineClass'];
				while {true} do
				{
					_muzzle = currentMuzzle player;
					_vehicle = vehicle player;
					if(player isEqualTo _vehicle)then
					{
						player setAmmo [_muzzle,999];
					}
					else
					{
						_assignedVehicleRole = assignedVehicleRole player;
						if((_assignedVehicleRole select 0) isEqualTo 'Turret')then
						{
							_turretPath = _assignedVehicleRole select 1;
							_mags = _vehicle magazinesTurret _turretPath;
							if(_mags isEqualTo [''])then
							{
								_magArray = getArray(configFile >> 'CfgWeapons' >> _muzzle >> 'magazines');
								
								{
									_vehicle addMagazineTurret [_x,_turretPath];
									systemChat format['Added %1 to your Turret!',_x];
								} forEach _magArray;
							}
							else
							{
								_magazineClass = _vehicle currentMagazineTurret _turretPath;
								_vehicle setMagazineTurretAmmo [_magazineClass,999,_turretPath];
							};
						};
					};
					_vehicle setVehicleAmmo 1;
					uiSleep .1;
				};
			};
			_log = 'Unlimited Ammo ON';
			_log call FN_SHOW_LOG;
		}
		else
		{
			terminate unlimAmmRun;unlimAmmRun=nil;
			_log = 'Unlimited Ammo OFF';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_infiSTAR_A3noRecoil = {
		if(isNil 'noRecoilRun')then
		{
			noRecoilRun = [] spawn {
				while {true} do
				{
					(vehicle player) setUnitRecoilCoefficient 0;
					player setUnitRecoilCoefficient 0;
					player setCustomAimCoef 0;
					uiSleep 3;
				};
			};
			_log = 'No Recoil ON';
			_log call FN_SHOW_LOG;
		}
		else
		{
			terminate noRecoilRun;noRecoilRun=nil;
			(vehicle player) setUnitRecoilCoefficient 1;
			player setUnitRecoilCoefficient 1;
			_log = 'No Recoil OFF';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_infiSTAR_A3FF = {
		if(isNil 'A3FFrun')then
		{
			A3FFrun = [] spawn {
				while {true} do
				{
					_vehicle = (vehicle player);
					_done = _vehicle setWeaponReloadingTime [gunner (vehicle player), currentMuzzle (gunner (vehicle player)), 0];
					uiSleep .1;
				};
			};
			_log = 'FastFire ON';
			_log call FN_SHOW_LOG;
		}
		else
		{
			terminate A3FFrun;A3FFrun=nil;
			(vehicle player) setUnitRecoilCoefficient 1;
			player setUnitRecoilCoefficient 1;
			_log = 'FastFire OFF';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_infiSTARHIDE = {
		if(isNil'A3HIDErun')then
		{
			[2,true] call fnc_AdminReq;
			
			_log = 'Stealth / Invisible ON';
			_log call FN_SHOW_LOG;
			
			A3HIDErun = true;
		}
		else
		{
			[2,false] call fnc_AdminReq;
			
			_log = 'Stealth / Invisible OFF';
			_log call FN_SHOW_LOG;
			
			A3HIDErun = nil;
		};
	};
	fnc_DisableAnnouncements = {
		if(isNil 'A3DANNrun')then{A3DANNrun = 0;};
		if(A3DANNrun==0)then
		{
			A3DANNrun=1;
			AdminAnnounceDisabled = true;
			
			_log = 'Disable Announces - ON';
			_log call FN_SHOW_LOG;
		}
		else
		{
			A3DANNrun=0;
			AdminAnnounceDisabled = nil;
			
			_log = 'Disable Announces - OFF';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_FreeRoamCam = {
		if(isNil 'freeFlightCam')then
		{
			camDestroy freeFlightCam;
			freeFlightCam = nil;
			_getPos = player modelToWorld[0,3, 1.75];
			freeFlightCam = 'camera' camCreate _getPos;
			freeFlightCam setDir([_getPos, player] call BIS_fnc_dirTo);
			freeFlightCam camCommand 'MANUAL ON';
			freeFlightCam camCommand 'INERTIA OFF';
			freeFlightCam cameraEffect['INTERNAL', 'BACK'];
			showCinemaBorder false;
			_log = 'Right Click To Cancel!';
			_log call FN_SHOW_LOG;
		}
		else
		{
			camDestroy freeFlightCam;
			freeFlightCam = nil;
		};
	};
	fnc_BIS_FreeRoamCam = {
		[] spawn (uinamespace getvariable 'bis_fnc_camera');
	};
	fnc_deleteVeh_selected = {
		{player reveal _x;} foreach (player nearObjects 50);
		_target = _this select 0;
		if(typeName _target != 'OBJECT')then
		{
			_target = cursorTarget;
		};
		if(!isNull _target)then
		{
			_delete = (vehicle _target);
			
			if(isNil 'DELETE_TARGET')then{DELETE_TARGET = objNull;};
			if(str DELETE_TARGET != str _delete)exitWith
			{
				_type = typeOf _delete;
				_displayName = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
				_distance = round(cameraOn distance _delete);
				
				_log = format['DELETE:   %1 (%2)   distance %3m?  (press continue and delete again)',_displayName,_type,_distance];
				_log call FN_SHOW_LOG;
				DELETE_TARGET = _delete;
			};
			
			if(isNil 'ToDeleteArray')then{ToDeleteArray = [];};
			if(_delete in ToDeleteArray)then
			{
				_log = format['%1 - IN DELETE QUEUE',_delete];
				_log call FN_SHOW_LOG;
			}
			else
			{
				ToDeleteArray pushBack _delete;
				[-4,netId _delete] call fnc_AdminReq;
				
				_log = format['Deleting %1 @%2..',typeOf _delete,mapGridPosition _delete];
				if(getPlayerUID _target != '')then
				{
					_log = format['Deleting %1(%2) vehicle: %3 @%4..',name _target,getPlayerUID _target,typeOf _delete,mapGridPosition _delete];
				};
				_log call FN_SHOW_LOG;
				systemchat _log;
				diag_log _log;
				_log call fnc_adminLog;
			};
		}
		else
		{
			DELETE_TARGET = objNull;
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_flipVeh = {
		_target = _this select 0;
		if(typeName _target != 'OBJECT')then
		{
			_target = cursorTarget;
		};
		if((!isNull _target) && {alive _target} && {_target isKindOf 'Landvehicle' || _target isKindOf 'Air' || _target isKindOf 'Ship'})then
		{
			_pos = getPos _target;
			_pos = [_pos select 0,_pos select 1,(_pos select 2)+0.1];
			[1,netId _target,_pos] call fnc_AdminReq;
			
			_log = format['Flipping %1 @%2..',typeOf _target,mapGridPosition _pos];
			_log call FN_SHOW_LOG;
		}
		else
		{
			_log = 'invalid target';
			if((!alive _target) && {_target isKindOf 'Landvehicle' || _target isKindOf 'Air' || _target isKindOf 'Ship'})then{_txt = 'vehicle destroyed..';};
			_log call FN_SHOW_LOG;
		};
	};
	fnc_Kill_selected = {
		_target = _this select 0;
		if(typeName _target != 'OBJECT')then
		{
			_target = cursorTarget;
		};
		if(!isNull _target)then
		{
			if(alive _target)then
			{
				_log = format['Killing %1 @%2',typeOf _target,mapGridPosition _target];
				if(getPlayerUID _target != '')then
				{
					_log = format['Killing %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
				};
				_log call FN_SHOW_LOG;
				
				_log call fnc_adminLog;
				[-2,netId _target] call fnc_AdminReq;
			}
			else
			{
				_log = 'target is dead';
				_log call FN_SHOW_LOG;
			};
		}
		else
		{
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_Explode_selected = {
		_target = _this select 0;
		if(typeName _target != 'OBJECT')then
		{
			_target = cursorTarget;
		};
		_pos = screenToWorld [0.5,0.5];
		_log = format['Exploding @%1',mapGridPosition _pos];
		if(!isNull _target)then
		{
			_log = format['Exploding %1 @%2',typeOf _target,mapGridPosition _target];
			if(isPlayer _target)then
			{
				_log = format['Exploding %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
			};
			
			_eyepos = ASLToATL eyepos _target;if(surfaceIsWater _eyepos)then{_eyepos = eyepos _target;};
			_pos = getPosVisual _target;
			_pos set[2,_eyepos select 2];
		};
		_log call FN_SHOW_LOG;
		_log call fnc_adminLog;
		
		_bomb = 'HelicopterExploSmall' createVehicleLocal _pos;
	};
	fnc_Disconnect_selected = {
		_target = _this select 0;
		if(!isNull _target)then
		{
			[-664,netId _target] call fnc_AdminReq;	
			_log = format['Disconnect %1(%2)',name _target,getPlayerUID _target];
			_log call FN_SHOW_LOG;
		}
		else
		{
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_Kick_selected = {
		_target = _this select 0;
		_opt = _this select 1;
		if(!isNull _target)then
		{
			_TUID = getPlayerUID _target;
			if(_TUID != '')then
			{
				_TNAME = name _target;
				[-665,netId _target] call fnc_AdminReq;
				if(_opt == 1)then
				{
					uiSleep 1;
					_msg = format['%1 has been KICKED!',_TNAME];
					[7,toArray _msg] call fnc_AdminReq;
				};
				
				_log = format['Kicking %1(%2)',_TNAME,_TUID];
				_log call FN_SHOW_LOG;
			};
		}
		else
		{
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_Ban_selected = {
		_target = _this select 0;
		_opt = _this select 1;
		if(!isNull _target)then
		{
			_TUID = getPlayerUID _target;
			if(_TUID != '')then
			{
				_TNAME = name _target;
				[-666,netId _target] call fnc_AdminReq;
				if(_opt == 1)then
				{
					uiSleep 1;
					_msg = format['%1 has been BANNED!',_TNAME];
					[7,toArray _msg] call fnc_AdminReq;
				};
				
				_log = format['Ban %1(%2)',_TNAME,_TUID];
				_log call FN_SHOW_LOG;
			};
		}
		else
		{
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_ATTACH_TO = {
		if(isNil'LastAttachedObject')then{LastAttachedObject=objNull;};
		if(!isNull LastAttachedObject)exitWith{detach LastAttachedObject;LastAttachedObject = nil;};
		
		_target = _this select 0;
		if(typeName _target != 'OBJECT')then
		{
			_target = cursorTarget;
		};	
		if(!isNull _target)then
		{
			_bbr = boundingBoxReal _target;
			_p1 = _bbr select 0;
			_p2 = _bbr select 1;
			_offset = 5;
			_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
			_maxLength = abs ((_p2 select 1) - (_p1 select 1));
			if(_maxWidth > _offset)then{_offset = _maxWidth;};
			if(_maxLength > _offset)then{_offset = _maxLength;};
			
			_bbr = boundingBoxReal vehicle player;
			_p1 = _bbr select 0;
			_p2 = _bbr select 1;
			_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
			
			[5,netId _target,_offset,_maxHeight] call fnc_AdminReq;
			LastAttachedObject = _target;
			
			_log = format['Attaching   %1   to player',typeOf _target];
			_log call FN_SHOW_LOG;
		}
		else
		{
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_HealTarget = {
		_target = _this select 0;
		if(typeName _target != 'OBJECT')then
		{
			_target = cursorTarget;
		};
		if(!isNull _target)then
		{
			_log = format['Healed %1 @%2',typeOf _target,mapGridPosition _target];
			if(getPlayerUID _target != '')then
			{
				_log = format['Healed %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
			};
			_log call FN_SHOW_LOG;
			
			[9,netId _target] call fnc_AdminReq;
		}
		else
		{
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_RepairTarget = {
		_target = _this select 0;
		if(typeName _target != 'OBJECT')then
		{
			_target = cursorTarget;
		};
		if(!isNull _target)then
		{
			_log = format['%1 @%2 - Repaired & Refueled',typeOf _target,mapGridPosition _target];
			if(getPlayerUID _target != '')then
			{
				_log = format['%1 @%2 - Repaired & Refueled   @%3',name _target,getPlayerUID _target,mapGridPosition _target];
			};
			_log call FN_SHOW_LOG;
			
			[9,netId (vehicle _target)] call fnc_AdminReq;
		}
		else
		{
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
	};
	infiSTAR_A3Heal = {
		[9,netId cameraOn] call fnc_AdminReq;
		if(cameraOn != vehicle cameraOn)then
		{
			[9,netId (vehicle cameraOn)] call fnc_AdminReq;
		};
		_log = format['Healed %1(%2)',name cameraOn,getPlayerUID cameraOn];
		_log call FN_SHOW_LOG;
	};
	infiSTAR_A3RestoreNear = {
		{
			_crewandobject = [_x];
			_crewandobject append (crew _x);
			{
				[9,netId _x] call fnc_AdminReq;
			} forEach _crewandobject;
		} forEach (cameraOn nearEntities ['AllVehicles',15]);
		_log = format['Restored Near %1(%2)',name cameraOn,getPlayerUID cameraOn];
		_log call FN_SHOW_LOG;
	};
	infiSTAR_A3addAmmo = {
		if(isNil'SELECTED_TARGET_PLAYER')then{SELECTED_TARGET_PLAYER=player;};
		if(isNull SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER=player;};
		if(!alive SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER=player;};
		_log = '';
		_veh = vehicle SELECTED_TARGET_PLAYER;
		if(_veh == SELECTED_TARGET_PLAYER)then 
		{
			_muzzle = currentMuzzle SELECTED_TARGET_PLAYER;
			_magArray = getArray(configFile >> 'CfgWeapons' >> _muzzle >> 'magazines');
			if((((toLower _muzzle) find '_gl' != -1) && {((toLower _muzzle) find '_glock' == -1)})||((toLower _muzzle) find 'm203' != -1))then
			{
				_pewpews = [];
				{
					
					if(((toLower _x) select [0,4] in ['1rnd','3rnd'])||((toLower _x) find 'ugl_' != -1))then
					{
						_pewpews pushBack _x;
					};
				} forEach ALL_MAGS_TO_SEARCH_C;
				_magArray append _pewpews;
			};
			if(_magArray isEqualTo [])exitWith{};
			[] call fnc_FULLinit;
			LASTSUBBUTTON = 0;
			FILLMAINSTATE = 6;
			disableSerialization;
			_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
			lbclear _ctrl;
			_ctrl lbAdd '==== Magazines ====';
			{
				_lbid = _ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgMagazines' >> _x >> 'displayName'),_x];
				_ctrl lbSetData [_lbid,_x];
				_x call fnc_addpic;
			} forEach _magArray;
			[] call fnc_colorizeMain;
			for '_i' from 0 to 12 do {_ctrl lbAdd '';};
		}
		else
		{
			_log = format['%1 added Ammo to %2',name SELECTED_TARGET_PLAYER,typeOf _veh];
			{
				_wep = _x;
				{
					[_veh,_x] call fnc_reallyAdditem;
				} forEach (getArray (configFile >> 'CfgWeapons' >> _wep >> 'magazines'));
			} forEach (weapons _veh);
		};
		_log call FN_SHOW_LOG;
		_log call fnc_adminLog;
	};
	infiSTAR_A3Invulnerability = {
		if(isNil 'infiSTAR_A3InvulnerabilityLoop')then
		{
			infiSTAR_A3InvulnerabilityLoop = [] spawn {
				while {1==1} do
				{
					player allowDamage false;
					player removeAllEventhandlers 'HandleDamage';
					player addEventhandler ['HandleDamage', {false}];
					player setVariable['ExileHunger', 100];
					player setVariable['ExileThirst', 100];
					player setVariable['ExileAlcohol', 0];
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
					player setBleedingRemaining 0;
					uiSleep 1;
				};
			};
			_log = 'God Mode Enabled';
			_log call FN_SHOW_LOG;
		}
		else
		{
			terminate infiSTAR_A3InvulnerabilityLoop;
			infiSTAR_A3InvulnerabilityLoop=nil;
			player allowDamage true;
			player removeAllEventhandlers 'HandleDamage';
			player addEventHandler ['HandleDamage',{_this call ExileClient_object_player_event_onHandleDamage}];
			_log = 'God Mode Disabled';
			_log call FN_SHOW_LOG;
		};
	};
	fnc_draw3dhandlerPLAYER1 = ""
		_shown = [];
		{
			_veh = vehicle _x;
			if!(_veh in _shown)then
			{
				_shown pushBack _veh;
				_distance = round(cameraOn distance _x);
				if(_distance > 1800)exitWith{};
				
				_alpha = ((1200 - _distance)/1200) + .45;
				_iconTextSize = 380 * pixelH;
				_nameTextSize = 16 * pixelH;
				_shadow = 0;
				
				if(_x isEqualTo _veh)then
				{
					_playerRenderedPos = _x call FN_GET_PLR_POS;
					_name = _x call FN_GET_NAME;
					_clr = _x call FN_GET_CLR;
					_curwep = currentWeapon _x;
					_hp = round((damage _x - 1) * -100);
					_txt = format['unarmed - %1HP',_hp];
					
					_pos2D = worldToScreen _playerRenderedPos;
					if(abs(_pos2D select 0) < 1)then
					{
						if(_curwep != '')then
						{
							_txt = format['%1 - [%2/%3] - %4HP',gettext(configFile >> 'CfgWeapons' >> _curwep >> 'displayName'),_x ammo _curwep,getNumber(configFile >> 'CfgMagazines' >> currentMagazine _x >> 'count'),_hp];
						};
						if(_x isEqualTo cameraOn) then
						{
							drawIcon3D['iconManMedic',_clr,_playerRenderedPos,_iconTextSize,_iconTextSize,([_x, getpos player] call BIS_fnc_relativeDirTo),_txt,_shadow,_nameTextSize,'PuristaMedium','',true];
						}
						else
						{
							drawIcon3D['iconManMedic',_clr,_playerRenderedPos,_iconTextSize,_iconTextSize,([_x, getpos player] call BIS_fnc_relativeDirTo)+180,_txt,_shadow,_nameTextSize,'PuristaMedium','',true];
						};
					};
					
					_txt = format['%1 - %2m',_name,_distance];
					drawIcon3D['',_clr,_playerRenderedPos,_iconTextSize,0,0,_txt,_shadow,_nameTextSize,'PuristaMedium','',true];
				}
				else
				{
					_class = typeOf _veh;
					_speed = round(speed _veh*100)/100;
					_maxSpeed = getNumber(configFile >> 'CfgVehicles' >> _class >> 'maxSpeed');
					_typename = gettext(configFile >> 'CfgVehicles' >> _class >> 'displayName');
					_icon = gettext(configFile >> 'CfgVehicles' >> _class >> 'Picture');
					_vehRenderedPos = _veh modelToWorldVisual [0,0,-1];
					
					_crew = crew _veh;
					_vehclr = [0.047,0.502,1,_alpha];
					if(!alive _veh)then{_vehclr = [1,1,1,_alpha]};
					
					_pos2D = worldToScreen _vehRenderedPos;
					if(abs(_pos2D select 0) < 1)then
					{
						_cnt = count _crew;
						if(_cnt > 0)then
						{
							_num = _cnt * -1;
							{
								_height = _num + _forEachIndex;
								_role = assignedVehicleRole _x;
								if(_role isEqualTo [])then{_role = 'Passenger';}else{_role = _role select 0;};
								_txt = format['%1. %2 - %3 %4HP',_forEachIndex,_role,_x call FN_GET_NAME,round((1-(damage _x))*100)];
								drawIcon3D['\A3\ui_f\data\map\Markers\Military\dot_ca.paa',[1,0.17,0.17,_alpha],_x call FN_GET_PLR_POS,0,0,0,format['%1',_forEachIndex],_shadow,_nameTextSize,'PuristaMedium','',true];
								drawIcon3D['',_x call FN_GET_CLR,_vehRenderedPos,_iconTextSize,_height,0,_txt,_shadow,_nameTextSize,'PuristaMedium','',true];
							} forEach _crew;
						};
						
						_txt = format['%1 - %2m',_typename,_distance];
						drawIcon3D['',_vehclr,_vehRenderedPos,_iconTextSize,0,0,_txt,_shadow,_nameTextSize,'PuristaMedium','',true];
						
						_txt = format['%1/%2km/h %3HP',_speed,_maxSpeed,round((1-(damage _veh))*100)];
						drawIcon3D[_icon,_vehclr,_vehRenderedPos,_iconTextSize,_iconTextSize,0,_txt,_shadow,_nameTextSize,'PuristaMedium','',true];
					}
					else
					{
						_crewnames = '';
						{
							if(_crewnames == '')then
							{
								_crewnames = _x call FN_GET_NAME;
							}
							else
							{
								_crewnames = format['%1, %2',_crewnames,_x call FN_GET_NAME];
							};
						} forEach _crew;
						
						_txt = format['%1 - %2 - %3HP - %4m',_crewnames,_typename,round((1-(damage _veh))*100),_distance];
						drawIcon3D['',_vehclr,_vehRenderedPos,_iconTextSize,0,0,_txt,_shadow,_nameTextSize,'PuristaMedium','',true];
					};
				};
			};
		} forEach (call fnc_get_plr);
	"";
	fnc_draw3dhandlerAI = ""
		if(!isNull cameraOn)then
		{
			ALLVEHICLES_OBJECTS_1500m = cameraOn nearEntities ['Allvehicles',1500];
			{
				if(!isNull _x)then
				{
					if(alive _x)then
					{
						_PUIDX = getPlayerUID _x;
						if(_PUIDX == '')then
						{
							if(_x isKindOf 'Animal_Base_F')exitWith{};
							_crew = crew _x;
							if!(_crew isEqualTo [])then
							{
								_distance = cameraOn distance _x;
								_txt = 'AI';
								if(_x isKindOf 'Man')then
								{
									_txt = format['AI (%1m)',round _distance];
								}
								else
								{
									_txt = format['AI - %1 (%2m)',gettext (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> 'displayName'),round _distance];
								};
								
								_grp = group _x;
								if(!isNull _grp)then
								{
									_txt = format['%1 GRP:%2 UNITS:%3',_txt,allGroups find _grp,count units _grp];
								};
								_pos = ASLToATL eyepos _x;
								if(surfaceIsWater _pos)then{_pos = eyepos _x;};
								drawIcon3D['',[1,0,0.75,0.7],_pos,.1,.1,0,_txt,1,.03];
							};
						};
					};
				};
			} forEach ALLVEHICLES_OBJECTS_1500m;
		};
	"";
	fnc_draw3dhandlerDEAD = ""
		{
			if(!isNull _x)then
			{
				if!(getPlayerUID _x isEqualTo '')exitWith{};
				
				_distance = cameraOn distance _x;
				if(_distance < 500)then
				{
					_name = _x getVariable['ExileName',''];
					if(_name != '')then
					{
						_clr = [1,1,1,0.7];
						_txt = format['%1 %2m',_name,round _distance];
						_pos = _x modelToWorld [0,0,1];
						drawIcon3D['',_clr,_pos,0,0,45,_txt,0,.032];
					};
				};
			};
		} forEach allDeadMen;
	"";
	fnc_call_single_esps = {
		if(!isNil'infiSTAREspEHVAR')then{
			removeMissionEventHandler ['Draw3D',infiSTAREspEHVAR];
			infiSTAREspEHVAR=nil;
		};
		_string = '';
		if(!isNil 'fnc_infiESP_statePlayer1')then
		{
			_string = _string + fnc_draw3dhandlerPLAYER1;
		};
		if(!isNil 'fnc_infiESP_stateAI')then
		{
			_string = _string + fnc_draw3dhandlerAI;
		};
		if(!isNil 'fnc_infiESP_stateDEAD')then
		{
			_string = _string + fnc_draw3dhandlerDEAD;
		};
		if(_string != '')then
		{
			_string = ('if(!isNull findDisplay 49)exitWith{};'+_string);
			infiSTAREspEHVAR = addMissionEventHandler ['Draw3D',_string];
		};
	};
	infiSTAR_fnc_infiESP_player1 = {
		if(isNil 'fnc_infiESP_statePlayer1')then{
			fnc_infiESP_statePlayer1 = 1;_log = 'infiSTAR Player ESP - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
		} else {
			fnc_infiESP_statePlayer1 = nil;_log = 'infiSTAR Player ESP - OFF';_log call FN_SHOW_LOG;
		};
		call fnc_call_single_esps;
	};
	infiSTAR_fnc_infiESP_AI = {
		if(isNil 'fnc_infiESP_stateAI')then{
			fnc_infiESP_stateAI = 1;_log = 'infiSTAR AI ESP - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
		} else {
			fnc_infiESP_stateAI = nil;_log = 'infiSTAR AI ESP - OFF';_log call FN_SHOW_LOG;
		};
		call fnc_call_single_esps;
	};
	infiSTAR_fnc_infiESP_DEAD = {
		if(isNil 'fnc_infiESP_stateDEAD')then{
			fnc_infiESP_stateDEAD = 1;_log = 'infiSTAR DEAD ESP - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
		} else {
			fnc_infiESP_stateDEAD = nil;_log = 'infiSTAR DEAD ESP - OFF';_log call FN_SHOW_LOG;
		};
		call fnc_call_single_esps;
	};
	fnc_draw_MapIcons = {
		if(visibleMap)then
		{
			private['_ctrl'];
			_ctrl =  _this select 0;
			_iscale = ((1 - ctrlMapScale _ctrl) max .2) * 28;
			_icon = '';
			_alpha = 1;
			if(mapiconsshowbuildings)then
			{
				if(isNil'timerForBuildings')then{timerForBuildings = 0;};
				if(time > timerForBuildings)then
				{
					timerForBuildings = time + 25;
					Exile_Construction_Abstract_Static_ARRAY = (allMissionObjects 'Exile_Construction_Abstract_Static');
				};
				
				_sizeIwantOnEachScale = 33.2012;
				_scale = ctrlMapScale _ctrl;
				_size = 5 max (_sizeIwantOnEachScale*(_sizeIwantOnEachScale/(_scale * 10000)));
				{_ctrl drawIcon ['iconObject_1x1', [1,1,1,1], getPosASL _x, _size, _size, getDir _x];} forEach Exile_Construction_Abstract_Static_ARRAY;
			};
			if(mapiconsshowflags)then
			{
				if(isNil'timerForFlags')then{timerForFlags = 0;};
				if(time > timerForFlags)then
				{
					timerForFlags = time + 25;
					Exile_Construction_Flag_Static_ARRAY = (allMissionObjects 'Exile_Construction_Flag_Static');
				};
				
				_sizeIwantOnEachScale = 33.2012;
				_scale = ctrlMapScale _ctrl;
				_size = 5 max (_sizeIwantOnEachScale*(_sizeIwantOnEachScale/(_scale * 10000)));
				{_ctrl drawIcon ['iconObject_1x1', [0,1,1,1], getPosASL _x, _size, _size, getDir _x];} forEach Exile_Construction_Flag_Static_ARRAY;
			};
			if(mapiconsshowplayer)then
			{
				_shown = [];
				{
					if(!isNull _x)then
					{
						_veh = vehicle _x;
						if(_veh in _shown)exitWith{};
						_shown pushBack _veh;
						_PUIDX = getPlayerUID _x;
						if(_PUIDX != '')then
						{
							_name = _x getVariable['ExileName',name _x];
							_type = typeOf _veh;
							_dist = round(_veh distance player);
							_clr = _x call FN_GET_CLR;
							_txt = format['%1 (%2m) (DEAD, but still watching)',_name,_dist];
							if(alive _x)then
							{
								if(_x isEqualTo _veh)then
								{
									_txt = format['%1 (%2m)',_name,_dist];
								}
								else
								{
									_names = '';
									{
										if(_forEachIndex isEqualTo 0)then
										{
											_names = _names + format['%1',_x getVariable['ExileName',name _x]];
										}
										else
										{
											_names = _names + format[', %1',_x getVariable['ExileName',name _x]];
										};
									} forEach (crew _veh);
									_typename = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
									_txt = format['%1 - %2 (%3m)',_names,_typename,_dist];
								};
							};
							
							_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
							_grpx = group _x;
							if(!isNull _grpx)then
							{
								_alive = {alive _x} count units _grpx;
								if(_alive > 1)then
								{
									_txt = _txt + format[' GRP:%1 PLR:%2',allGroups find _grpx,_alive];
								};
							};
							
							_ctrl drawIcon [_icon, _clr, getPosASL _veh, _iscale, _iscale, getDir _veh,_txt];
						};
					};
				} forEach (call fnc_get_plr);
			};
			if(mapiconsshowvehicles||mapiconsshowai)then
			{
				{
					if(!isNull _x)then
					{
						_PUIDX = getPlayerUID _x;
						if(_PUIDX isEqualTo '')then
						{
							_veh = vehicle _x;
							_type = typeOf _veh;
							if(mapiconsshowvehicles)then
							{
								if!(_x isKindOf 'Man')then
								{
									_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
									_ctrl drawIcon [_icon, [0.67,0.97,0.97,1], getPosASL _x, _iscale, _iscale, getDir _x];
								};
							};
							if(mapiconsshowai)then
							{
								if(_x isKindOf 'Animal_Base_F')exitWith{};
								_crew = crew _x;
								if!(_crew isEqualTo [])then
								{
									_distance = cameraOn distance _x;
									_txt = 'AI';
									if(_x isKindOf 'Man')then
									{
										_txt = format['AI (%1m)',round _distance];
									}
									else
									{
										_txt = format['AI - %1 (%2m)',gettext (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> 'displayName'),round _distance];
									};
									
									_grp = group _x;
									if(!isNull _grp)then
									{
										_txt = format['%1 GRP:%2 UNITS:%3',_txt,allGroups find _grp,count units _grp];
									};
									_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
									_ctrl drawIcon [_icon, [1,0,0.75,1], getPosASL _x, _iscale, _iscale, getDir _x,_txt];
								};
							};
						};
					};
				} forEach ([0,0,0] nearEntities ['Allvehicles',1000000]);
			};
			if(mapiconsshowdeadvehicles)then
			{
				{
					if((_x isKindOf 'Air')||(_x isKindOf 'Landvehicle'))then
					{
						_veh = vehicle _x;
						_type = typeOf _veh;
						_clr = [1,1,1,1];
						if(_x isEqualTo SELECTED_TARGET_PLAYER)then{_clr = [1,0.7,0.15,1];};
						_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
						_ctrl drawIcon [_icon, _clr, getPosASL _x, _iscale, _iscale, getDir _x];
					};
				} forEach allDead;
			};
			if(mapiconsshowdeadplayer)then
			{
				{
					if(!isNull _x)then
					{
						_name = _x getVariable['ExileName',''];
						if(_name != '')then
						{
							_veh = vehicle _x;
							_dist = round(_veh distance player);
							_txt = format['%1 (%2m)',_name,_dist];
							if(getPlayerUID _x != '')then
							{
								_txt = format['%1 (%2m) (DEAD, but still watching)',_name,_dist];
							};
							_type = typeOf _veh;
							_clr = [1,1,1,1];
							_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
							_ctrl drawIcon [_icon, _clr, getPosASL _veh, _iscale, _iscale, getDir _veh,_txt];
						};
					};
				} forEach allDeadMen;
			};
		};
	};
	infiSTAR_A3MAPICONS = {
		if(isNil 'fnc_MapIcons_run')then
		{
			_log = 'MapIcons Enabled';
			_log call FN_SHOW_LOG;
			
			fnc_MapIcons_run = true;
			if(isNil'mapiconsshowbuildings')then{mapiconsshowbuildings=false;};
			if(isNil'mapiconsshowflags')then{mapiconsshowflags=false;};
			if(isNil'mapiconsshowplayer')then{mapiconsshowplayer=true;};
			if(isNil'mapiconsshowvehicles')then{mapiconsshowvehicles=false;};
			if(isNil'mapiconsshowdeadplayer')then{mapiconsshowdeadplayer=false;};
			if(isNil'mapiconsshowdeadvehicles')then{mapiconsshowdeadvehicles=false;};
			if(isNil'mapiconsshowai')then{mapiconsshowai=false;};
			
			if(!isNil'MAP_BUTTON_THREAD')exitWith{};
			MAP_BUTTON_THREAD = [] spawn {
				disableSerialization;
				private['_fnc_removeButtons','_fnc_addButtons','_zerobutton','_zerobutton_2','_firstbutton','_secondbutton','_thirdbutton','_fourthbutton','_fithbutton','_button','_state','_text','_function','_color'];
				_fnc_removeButtons = {{ctrlDelete ((findDisplay 12) displayCtrl _x);} forEach [1084,1085,1086,1087,1088,1089,1090];};
				_fnc_addButtons = {
					_zerobutton = (findDisplay 12) ctrlCreate ['RscButton',1084];
					_zerobutton ctrlSetPosition [safeZoneX+safeZoneW-0.3,-0.1,0.3,0.05];
					_zerobutton_2 = (findDisplay 12) ctrlCreate ['RscButton',1085];
					_zerobutton_2 ctrlSetPosition [safeZoneX+safeZoneW-0.3,-0.05,0.3,0.05];
					_firstbutton = (findDisplay 12) ctrlCreate ['RscButton',1086];
					_firstbutton ctrlSetPosition [safeZoneX+safeZoneW-0.3,0,0.3,0.05];
					_secondbutton = (findDisplay 12) ctrlCreate ['RscButton',1087];
					_secondbutton ctrlSetPosition [safeZoneX+safeZoneW-0.3,0.05,0.3,0.05];
					_thirdbutton = (findDisplay 12) ctrlCreate ['RscButton',1088];
					_thirdbutton ctrlSetPosition [safeZoneX+safeZoneW-0.3,0.1,0.3,0.05];
					_fourthbutton = (findDisplay 12) ctrlCreate ['RscButton',1089];
					_fourthbutton ctrlSetPosition [safeZoneX+safeZoneW-0.3,0.15,0.3,0.05];
					_fithbutton = (findDisplay 12) ctrlCreate ['RscButton',1090];
					_fithbutton ctrlSetPosition [safeZoneX+safeZoneW-0.3,0.2,0.3,0.05];
				};
				while{true}do
				{
					if(visibleMap)then
					{
						if(isNil'EventHandlerDrawAdded')then
						{
							call _fnc_removeButtons;
							call _fnc_addButtons;
							EventHandlerDrawAdded = (uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlAddEventHandler['Draw','_this call fnc_draw_MapIcons'];
						};
						
						{
							_button = _x select 0;
							_state = _x select 1;
							_text = if(_state)then{_x select 2}else{_x select 3};
							_function = if(_state)then{_x select 4}else{_x select 5};
							_color = if(_state)then{[0.56,0.04,0.04,1]}else{[0,1,0,1]};
							
							_button ctrlSetText _text;
							_button ctrlSetTextColor _color;
							_button ctrlRemoveAllEventHandlers 'ButtonDown';
							_button ctrlAddEventHandler ['ButtonDown',_function];
							_button ctrlCommit 0;
						} forEach
						[
							[_zerobutton,mapiconsshowbuildings,'Hide Buildings','Show Buildings',{mapiconsshowbuildings = false;},{mapiconsshowbuildings = true;}],
							[_zerobutton_2,mapiconsshowflags,'Hide Flags','Show Flags',{mapiconsshowflags = false;},{mapiconsshowflags = true;}],
							[_firstbutton,mapiconsshowplayer,'Hide Player','Show Player',{mapiconsshowplayer = false;},{mapiconsshowplayer = true;}],
							[_secondbutton,mapiconsshowdeadplayer,'Hide DeadPlayer','Show DeadPlayer',{mapiconsshowdeadplayer = false;},{mapiconsshowdeadplayer = true;}],
							[_thirdbutton,mapiconsshowvehicles,'Hide Vehicles','Show Vehicles',{mapiconsshowvehicles = false;},{mapiconsshowvehicles = true;}],
							[_fourthbutton,mapiconsshowdeadvehicles,'Hide DeadVehicles','Show DeadVehicles',{mapiconsshowdeadvehicles = false;},{mapiconsshowdeadvehicles = true;}],
							[_fithbutton,mapiconsshowai,'Hide AI','Show AI',{mapiconsshowai = false;},{mapiconsshowai = true;}]
						];
					}
					else
					{
						if(!isNil'EventHandlerDrawAdded')then
						{
							call _fnc_removeButtons;
							(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['Draw',EventHandlerDrawAdded];EventHandlerDrawAdded=nil;
						};
					};
					uiSleep 0.3;
				};
			};
		} 
		else 
		{
			_log = 'MapIcons Disabled';
			_log call FN_SHOW_LOG;
			
			fnc_MapIcons_run = nil;
			terminate MAP_BUTTON_THREAD;MAP_BUTTON_THREAD=nil;
			if(!isNil'EventHandlerDrawAdded')then{(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['Draw',EventHandlerDrawAdded];EventHandlerDrawAdded=nil;};
			{ctrlDelete ((findDisplay 12) displayCtrl _x);} forEach [1084,1085,1086,1087,1088,1089,1090];
		};
	};
	adminVehicleMarker = {
		adminVehicleMarkers =
		{
			while {markadVehicleMarker == 1} do
			{
				{
					_typename = gettext (configFile >> 'CfgVehicles' >> typeOf _x >> 'displayName');
					_xPos = getPos _x;
					
					_cm = ('adminVehicleMarkers' + (str _forEachIndex));
					_pos = getMarkerPos _cm;
					if((_pos select 0 != _xPos select 0) || (_pos select 1 != _xPos select 1))then
					{
						deleteMarkerLocal _cm;
						_vm = createMarkerLocal [_cm,_xPos];ADMIN_LOCAL_MARKER=true;
						_vm setMarkerDirLocal (getDir _x);
						_vm setMarkerTypeLocal 'mil_start';
						_vm setMarkerColorLocal 'ColorBlue';
						_vm setMarkerTextLocal format['%1',_typename];
					};
					if(markadVehicleMarker == 0)exitWith{};
				} forEach ([0,0,0] nearEntities[['LandVehicle','Ship','Air','Tank'],1000000]);
				if(markadVehicleMarker == 0)exitWith{};
				uiSleep 1;
				if(markadVehicleMarker == 0)exitWith{};
			};
			for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
		};
		if(isNil 'markadVehicleMarker')then{markadVehicleMarker = 0;};
		if(markadVehicleMarker == 0)then
		{
			_log = '2D Map VehicleMarkerMarker Enabled';
			_log call FN_SHOW_LOG;
			
			markadVehicleMarker = 1;
			[] spawn adminVehicleMarkers;
		}
		else
		{
			_log = '2D Map VehicleMarkerMarker Disabled';
			_log call FN_SHOW_LOG;
			
			markadVehicleMarker = 0;
			for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
		};
	};
	adminFlagMark = {
		adminFlagMarks = {
			while {true} do
			{
				if(isNil'timerForFlags')then{timerForFlags = 0;};
				if(time > timerForFlags)then
				{
					timerForFlags = time + 25;
					Exile_Construction_Flag_Static_ARRAY = (allMissionObjects 'Exile_Construction_Flag_Static');
				};
				for '_i' from 0 to (count Exile_Construction_Flag_Static_ARRAY)-1 do
				{
					_c = Exile_Construction_Flag_Static_ARRAY select _i;
					if(!isNull _c)then
					{
						deleteMarkerLocal ('adminFlagMarks' + (str _i));
						_vm = createMarkerLocal [('adminFlagMarks' + (str _i)), getPos _c];
						_vm setMarkerAlphaLocal 0.8;
						_vm setMarkerBrushLocal 'Grid';
						_radius = _c getVariable['ExileTerritorySize', 15];
						_vm setMarkerSizeLocal [_radius,_radius];
						_vm setMarkerShapeLocal 'ELLIPSE';
						_vm setMarkerColorLocal 'ColorGreen';
						
						_k = _i + 30000;
						deleteMarkerLocal ('adminFlagMarks' + (str _k));
						_vm = createMarkerLocal [('adminFlagMarks' + (str _k)), getPos _c];
						_vm setMarkerColorLocal 'ColorGreen';
						_vm setMarkerTypeLocal 'selector_selectable';
						_vm setMarkerSizeLocal [0.5,0.5];
						
						_level = _c getVariable['ExileTerritoryLevel', 1];
						_vm setMarkerTextLocal format['LVL %1',_level];
					};
				};
				uiSleep 20;
			};
		};
		if(isNil 'FLAG_MARK_THREAD')then
		{
			_log = '2D Map FlagMarker Enabled';
			_log call FN_SHOW_LOG;
			
			timerForFlags = 0;
			FLAG_MARK_THREAD = [] spawn adminFlagMarks;
		}
		else
		{
			_log = '2D Map FlagMarker Disabled';
			_log call FN_SHOW_LOG;
			
			terminate FLAG_MARK_THREAD;FLAG_MARK_THREAD=nil;
			_flagCount = (count Exile_Construction_Flag_Static_ARRAY)+300;
			for '_i' from 0 to _flagCount do {deleteMarkerLocal ('adminFlagMarks' + (str _i));deleteMarkerLocal ('adminFlagMarks' + (str (_i+30000)));};
		};
	};
	adminDeadPlayer = {
		adminDeadPlayers =
		{
			while {markadDeadPlayer == 1} do
			{
				ADMIN_DeadPlayer_LIST = [] + allDeadMen;
				if(markadDeadPlayer == 0)exitWith{};
				for '_i' from 0 to (count ADMIN_DeadPlayer_LIST)-1 do
				{
					if(markadDeadPlayer == 0)exitWith{};
					
					deleteMarkerLocal ('adminDeadPlayers' + (str _i));
					_c = ADMIN_DeadPlayer_LIST select _i;
					if(!isNull _c)then
					{
						_txt = _c getVariable['ExileName','DEAD'];
						if(_txt != 'DEAD')then
						{
							_txt = format['%1 (DEAD)',_txt];
							_vm = createMarkerLocal [('adminDeadPlayers' + (str _i)), getPos _c];ADMIN_LOCAL_MARKER=true;
							_vm setMarkerTypeLocal 'waypoint';
							_vm setMarkerColorLocal 'ColorBlack';
							_vm setMarkerTextLocal _txt;
						};
					};
					
					if(markadDeadPlayer == 0)exitWith{};
				};
				if(markadDeadPlayer == 0)exitWith{};
				uiSleep 20;
				if(markadDeadPlayer == 0)exitWith{};
			};
			for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminDeadPlayers' + (str _i));};
		};
		if(isNil 'markadDeadPlayer')then{markadDeadPlayer = 0;};
		if(markadDeadPlayer == 0)then
		{
			_log = '2D Map DeadPlayerMarker Enabled';
			_log call FN_SHOW_LOG;
			
			markadDeadPlayer = 1;
			[] spawn adminDeadPlayers;
		}
		else
		{
			_log = '2D Map DeadPlayerMarker Disabled';
			_log call FN_SHOW_LOG;
			
			markadDeadPlayer = 0;
			for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminDeadPlayers' + (str _i));};
		};
	};
	infiSTAR_VehicleBoost = {
		if(isNil 'vehBoostrun')then
		{
			vehBoostrun = 1;
			_log = 'VehicleBoost 1';
			_log call FN_SHOW_LOG;
			VEHBOOST_FUNCTION =
			{
				_obj = (vehicle cameraOn);
				if(!local _obj)exitWith{};
				if(_obj == player)exitWith{};
				
				if(_this==57)exitWith{
					_obj SetVelocity [(velocity _obj select 0) * 0.93, (velocity _obj select 1) *0.93, (velocity _obj select 2) * 0.985];
				};
				
				_class = typeOf _obj;
				_maxSpeed = getNumber(configFile >> 'CfgVehicles' >> _class >> 'maxSpeed');
				_speed = speed _obj;
				if(_speed > _maxSpeed * 1.5)exitWith{};
				
				if(isEngineOn _obj)then 
				{
					if(_this==42)exitWith{
						_factor = 1.02;
						if(_obj isKindOf 'Air')then
						{
							_obj setVelocity [(velocity _obj select 0) * _factor, (velocity _obj select 1) * _factor, (velocity _obj select 2) * _factor];
						}
						else
						{
							_obj setVelocity [(velocity _obj select 0) * _factor, (velocity _obj select 1) * _factor,0];
						};
					};
				};
			};
		}
		else
		{
			vehBoostrun = nil;
			_log = 'VehicleBoost 0';
			_log call FN_SHOW_LOG;
			_obj = nil;
		};
	};
	infiSTAR_FlyUp = {
		_obj = (vehicle cameraOn);
		if(!local _obj)exitWith{};
		if(_this select 0 == 0)then
		{
			_vel = velocity _obj;
			if(_obj==player)then 
			{
				_obj setVelocity [(_vel select 0),(_vel select 1),8];
			}
			else
			{
				_obj setVelocity [(_vel select 0),(_vel select 1),20];
			};
		}
		else
		{
			if(_obj == cameraOn)then{player setPos (player modelToWorld [0,0,3]);};
		};
	};
	fnc_Hover = {
		_obj = (vehicle cameraOn);
		if(!local _obj)exitWith{};
		if(_obj isKindOf 'Air')then 
		{
			if(isnil 'HoverState')then
			{
				HoverState = true;
				_log = 'Now Hovering';
				_log call FN_SHOW_LOG;
				hovverthread = [] spawn {
					_obj = (vehicle cameraOn);
					if(!local _obj)exitWith{};
					while {!isNil 'HoverState'} do
					{
						for '_i' from 0 to 10 do {_obj setVelocity [0,0,0];};
					};
				};
			}
			else
			{
				terminate hovverthread;
				HoverState = nil;
				_log = 'No longer Hovering';
				_log call FN_SHOW_LOG;
			};
		} else {HoverState = nil;};
	};
	infiSTAR_go_down = {
		_veh = vehicle player;
		if(local _veh)then
		{
			_vel = velocity _veh;
			_posZ = (getPos _veh) select 2;
			if(_posZ > 6)then 
			{
				_veh setVelocity [(_vel select 0),(_vel select 1),-20];
			}
			else
			{
				if(_posZ < 10)then 
				{
					_veh setVelocity [0,0,-3];
				};
			};
			if(isTouchingGround _veh)then
			{
				_veh setVectorUp [0,0,1];
			};
		};
	};
	infiSTAR_shortTP = {
		if(player != vehicle player)exitWith{};
		_distance = 1;
		_object = player;
		_dir = getdir _object;
		_pos = getPos _object;
		_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
		_object setPos _pos;
		{player reveal _x;} foreach (_pos nearObjects 50);
	};
	infiSTAR_Tpdirection = {
		_distance = 10;
		_veh = vehicle player;
		if!(crew _veh isEqualTo [player])exitWith{};
		if(!local _veh)exitWith{};
		_dir = getdir _veh;
		_pos = getPos _veh;
		_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
		_veh setPos _pos;
	};
	infiSTAR_A3Togglelock = {
		private ['_veh'];
		{player reveal _x;} foreach (position player nearObjects 50);
		_veh = vehicle player;
		if(vehicle player == player)then
		{
			_veh = cursorTarget;
		};
		if(isNull _veh)exitWith
		{
			_log = 'target does not exist';
			_log call FN_SHOW_LOG;
		};
		if(!alive _veh)exitWith
		{
			_log = 'target is destroyed ';
			_log call FN_SHOW_LOG;
		};
		if(_veh isKindOf 'AllVehicles')exitWith
		{
			if((player distance _veh < 12) || ((_veh == vehicle player) && (vehicle player != player)))then
			{
				[10,netId _veh] call fnc_AdminReq;
				_locked = locked _veh;
				if(_locked isEqualTo 2)then
				{
					_log = format['unlocked - [%1]',typeOf _veh];
					_log call FN_SHOW_LOG;
					_log call fnc_adminLog;
				}
				else
				{
					_log = format['locked - [%1]',typeOf _veh];
					_log call FN_SHOW_LOG;
					_log call fnc_adminLog;
				};
			};
		};
	};
	_stayLocalNumber = 1080;
	fnc_RscDisplayDebugPublic = {
		disableSerialization;
		if(isNull findDisplay 316000)then{createdialog 'RscDisplayDebugPublic';};
		waitUntil {!isNull findDisplay 316000};
		_display = findDisplay 316000;
		
		{
			if!(str _x in ['Control #1','Control #13284','Control #13288'])then
			{
				_x ctrlRemoveAllEventHandlers 'ButtonDown';
				_x ctrlRemoveAllEventHandlers 'ButtonClick';
				_x ctrlRemoveAllEventHandlers 'MouseButtonClick';
				_x ctrlRemoveAllEventHandlers 'MouseButtonDown';
			};
		} forEach (allControls _display);
		
		_testRscListBox1 = _display ctrlCreate ['RscListBox',122000];
		_testRscListBox1 ctrlSetposition [0.83,0,0.5,1];
		_testRscListBox1 ctrlEnable true;
		_testRscListBox1 ctrlCommit 0;
		lbClear _testRscListBox1;
		_testRscListBox1 lbadd format['Player connected: %1',{getPlayerUID _x != ''} count (call fnc_get_plr)];
		_names = [];
		{
			if(getPlayerUID _x != '')then
			{
				if!(name _x in _names)then{_names pushBack (name _x);};
			};
		} forEach (units (group player));
		{
			if(getPlayerUID _x != '')then
			{
				if!(name _x in _names)then{_names pushBack (name _x);};
			};
		} forEach (call fnc_get_plr);
		{
			_testRscListBox1 lbadd _x;
		} forEach _names;
		
		for '_i' from 0 to 12 do {_testRscListBox1 lbAdd '';};
		
		_watchField1 = _display displayCtrl 12285;
		_watchField2 = _display displayCtrl 12287;
		_watchField3 = _display displayCtrl 12289;
		_watchField4 = _display displayCtrl 12291;
		
		waitUntil
		{
			_title = _display displayCtrl 11884;
			_title ctrlSetText 'Debug & Admin Console - modified by infiSTAR.de';
			
			_titleBox = _display displayCtrl 11892;
			_titleBox ctrlSetText 'ENTER: CODE TO RUN - BE MESSAGE - KICK/BAN REASON';
			
			_btnSpectator = _display displayCtrl 13287;
			_btnSpectator ctrlEnable true;
			_btnSpectator ctrlShow true;
			_btnSpectator ctrlSetText 'clear';
			_btnSpectator buttonSetAction '
				diag_log (ctrlText ((findDisplay 316000) displayCtrl 12284));
				((findDisplay 316000) displayCtrl 12284) ctrlSetText '''';
			';
			
			_btnCamera = _display displayCtrl 13288;
			_btnCamera ctrlEnable true;
			_btnCamera ctrlShow true;
			
			_btnFunctions = _display displayCtrl 13289;
			_btnFunctions ctrlSetText 'lock';
			_btnFunctions buttonSetAction '
				[-662,1] call fnc_AdminReq;
			';
			
			_btnConfig = _display displayCtrl 13290;
			_btnConfig ctrlSetText 'unlock';
			_btnConfig buttonSetAction '
				[-662,2] call fnc_AdminReq;
			';
			
			_btnAnimations = _display displayCtrl 13291;
			_btnAnimations ctrlSetText 'ban';
			_btnAnimations buttonSetAction '
				_lbtxt = lbtext[122000,(lbCurSel 122000)];
				{
					_xUID = getPlayerUID _x;
					if(_xUID != '''')then
					{
						if(name _x == _lbtxt)exitWith
						{
							_reason = (ctrlText ((findDisplay 316000) displayCtrl 12284));
							if(_reason == '''')then{_reason=''Admin Ban'';};
							_input = [3,netId _x,toArray _reason];
							[-662,_input] call fnc_AdminReq;
						};
					};
				} forEach (call fnc_get_plr);
			';
			
			_btnGuiEditor = _display displayCtrl 13292;
			_btnGuiEditor ctrlSetText 'kick';
			_btnGuiEditor buttonSetAction '
				_lbtxt = lbtext[122000,(lbCurSel 122000)];
				{
					_xUID = getPlayerUID _x;
					if(_xUID != '''')then
					{
						if(name _x == _lbtxt)exitWith
						{
							_reason = (ctrlText ((findDisplay 316000) displayCtrl 12284));
							if(_reason == '''')then{_reason=''Admin Kick'';};
							_input = [4,netId _x,toArray _reason];
							[-662,_input] call fnc_AdminReq;
						};
					};
				} forEach (call fnc_get_plr);
			';
			
			_btnSE = _display displayCtrl 13286;
			_btnSE buttonSetAction '[ctrlText ((findDisplay 316000) displayCtrl 12284)] call admin_d0_server;';
			
			_btnGE = _display displayCtrl 13285;
			_btnGE buttonSetAction '[ctrlText ((findDisplay 316000) displayCtrl 12284)] call admin_d0;';
			
			
			isNull findDisplay 316000
		};
	};
	FN_SERVER_INFORMATION_OVERLAY = {
		if(isNil'DEBUG_OVERLAY_THREAD')then
		{
			DEBUG_OVERLAY_THREAD = [] spawn {
				private['_timer1','_timer2','_code','_ALL','_allMissionObjects','_allMissionObjectsTypeAll','_ObjectsSimulated','_Exile_Construction','_Exile_Flag','_Vehicles','_LandVehicleAirShipStatic','_allDead','_allDeadMen','_DeadPlayers','_Players','_AI','_SERVERTHREADS','_FPS','_MissionRunningTime','_nearestObject','_nearestObjectHealth','_nearestObjects','_LootWeaponHolder','_GroundWeaponHolder','_WeaponHolderSimulated','_Exile_Flag150m','_Exile_Construction150m','_LootWeaponHolder150m','_GroundWeaponHolder150m','_WeaponHolderSimulated150m','_ctrlTXT'];
				disableSerialization;
				
				ctrlDelete ((findDisplay 46) displayCtrl 5555313);
				_ctrlTXT = (findDisplay 46) ctrlCreate ['RscStructuredText',5555313];
				_ctrlTXT ctrlSetPosition [safeZoneX+safeZoneW-0.55,safeZoneY+0.1,1,1.2];
				_ctrlTXT ctrlSetBackgroundColor [0.15,0.15,0.15,0.5];
				
				_timer1 = 0;
				_timer2 = 0;
				while{true}do
				{
					if(time > _timer1)then
					{
						_timer1 = time + 10;
						
						_ALL = (allMissionObjects '');
						_Exile_Flag = {_x isKindOf 'Exile_Construction_Flag_Static'} count _ALL;
						_Exile_Construction = {_x isKindOf 'Exile_Construction_Abstract_Static'} count _ALL;
						_allMissionObjects = count _ALL;
						_ObjectsSimulated = {simulationEnabled _x} count _ALL;
						
						_Vehicles = count vehicles;
						_LandVehicleAirShipStatic = count ([0,0,0] nearEntities [['LandVehicle','Air','Ship','Static'], 10000000]);
						
						_LootWeaponHolder = {_x isKindOf 'LootWeaponHolder'} count _ALL;
						_GroundWeaponHolder = {_x isKindOf 'GroundWeaponHolder'} count _ALL;
						_WeaponHolderSimulated = {_x isKindOf 'WeaponHolderSimulated'} count _ALL;
					};
					if(time > _timer2)then
					{
						_timer2 = time + 3;
						
						_allDead = count allDead;
						_allDeadMen = count allDeadMen;
						_DeadPlayers = {!alive _x} count (call fnc_get_plr);
						_Players = count (call fnc_get_plr);
						_AI = {(!(isPlayer _x) && (!isNull group _x))} count allUnits;
						
						_Exile_Flag150m = count (player nearObjects ['Exile_Construction_Flag_Static', 150]);
						_Exile_Construction150m = count (player nearObjects ['Exile_Construction_Abstract_Static', 150]);
						_LootWeaponHolder150m = count (player nearObjects ['LootWeaponHolder', 150]);
						_GroundWeaponHolder150m = count (player nearObjects ['GroundWeaponHolder', 150]);
						_WeaponHolderSimulated150m = count (player nearObjects ['WeaponHolderSimulated', 150]);
					};
					_MissionRunningTime = if(time > 0)then{_hours = floor(time / 60 / 60);_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);_seconds = time - (_hours*60*60) - (_minutes * 60);format['%1h %2min %3s',_hours,_minutes,round _seconds]}else{0};
					_nearestObject = '';
					_nearestObjectHealth = '';
					_nearestObjects = nearestObjects [screenToWorld [0.5,0.5], [], 10];
					{
						if(!isNull _x)exitWith
						{
							_nearestObject = _x;
							_nearestObjectHealth = (1-(damage _x))*100;
						};
					}forEach _nearestObjects;
					_txt = format['
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>Exile_Flags on Map: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%1</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>Exile_Constructions on Map: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%2</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>LootWeaponHolder on Map: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%20</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>GroundWeaponHolder on Map: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%21</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>WeaponHolderSimulated on Map: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%22</t><br/>
						<br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>Exile_Flags in 150m: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%3</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>Exile_Constructions in 150m: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%27</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>LootWeaponHolder in 150m: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%23</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>GroundWeaponHolder in 150m: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%24</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>WeaponHolderSimulated in 150m: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%25</t><br/>
						<br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>allMissionObjects: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%4</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>Vehicles: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%6</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>LandVehicleAirShipStatic: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%7</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>ObjectsSimulated: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%5</t><br/>
						<br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>Players: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%11</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>DeadPlayers: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%10</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>allDeadMen: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%9</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>allDead: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%8</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>AI: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%12</t><br/>
						<br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>MissionRunningTime: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%14</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>SERVER: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>[FPS: %15|THREADS: %13]</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>CLIENT: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>[FPS: %16|THREADS: %26]</t><br/>
						<br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>TARGET TYPE: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%17</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>TARGET DISTANCE: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%18</t><br/>
						<t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#44CD00''>TARGET HEALTH: </t><t align=''left''size=''.85'' font=''EtelkaMonospaceProBold'' color=''#5FBEDE''>%19</t><br/>
					',
						_Exile_Flag,
						_Exile_Construction,
						_Exile_Flag150m,
						_allMissionObjects,
						_ObjectsSimulated,
						_Vehicles,
						_LandVehicleAirShipStatic,
						_allDead,
						_allDeadMen,
						_DeadPlayers,
						_Players,
						_AI,
						if(isNil'SERVER_THREADS')then{0}else{SERVER_THREADS},
						_MissionRunningTime,
						if(isNil'SERVER_FPS')then{0}else{SERVER_FPS},
						diag_fps,
						if(isNull cursorTarget)then{_nearestObject}else{typeOf cursorTarget},
						if(isNull cursorTarget)then{player distance2D (screenToWorld [0.5,0.5])}else{player distance cursorTarget},
						if(isNull cursorTarget)then{_nearestObjectHealth}else{(1-(damage cursorTarget))*100},
						_LootWeaponHolder,
						_GroundWeaponHolder,
						_WeaponHolderSimulated,
						_LootWeaponHolder150m,
						_GroundWeaponHolder150m,
						_WeaponHolderSimulated150m,
						count diag_activeSQFScripts,
						_Exile_Construction150m
					];
					_ctrlTXT ctrlSetStructuredText parseText _txt;
					_ctrlTXT ctrlCommit 0;
					uiSleep .5;
				};
			};
		}
		else
		{
			terminate DEBUG_OVERLAY_THREAD;DEBUG_OVERLAY_THREAD=nil;
			ctrlDelete ((findDisplay 46) displayCtrl 5555313);
		};
	};
	FN_GEAR_ON_TARGET = {
		disableSerialization;
		ctrlDelete ((findDisplay 46) displayCtrl 55667);
		_tvctrl = findDisplay 46 createDisplay 'RscCredits' ctrlCreate ['RscTree', 55667];
		_tvctrl ctrlSetFont 'PuristaBold';
		_tvctrl ctrlSetTextColor[1,1,1,1];
		_tvctrl ctrlSetBackgroundColor[0,0,0,0.7];
		_tvctrl ctrlSetPosition[0.1,safeZoneY,1,safeZoneH];
		_tvctrl ctrlRemoveAllEventHandlers 'TreeDblClick';
		_tvctrl ctrlAddEventHandler ['TreeDblClick',{
			_tvctrl = _this select 0;
			_tvCurSel = _this select 1;
			_class = _tvctrl tvData _tvCurSel;
			if(_class != '')then
			{
				_click = _tvctrl tvText _tvCurSel;
				if(isNull SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER=player;};
				_target = SELECTED_TARGET_PLAYER;
				_log = format['Spawning %1 on %2!',_click,name _target];
				_log call FN_SHOW_LOG;
				_log call fnc_adminLog;
				[_target,_class] call fnc_reallyAdditem;
			};
		}];
		_tvctrl ctrlCommit 0;
		{
			_category = _x;
			_index = _forEachIndex;
			_tvctrl tvAdd [[],_category];
			
			_variable = missionNameSpace getVariable (_category+'_ARRAY');
			{
				_class = _x call {
					if(isClass (configFile >> 'CfgWeapons' >> _this))exitWith{'CfgWeapons'};
					if(isClass (configFile >> 'CfgMagazines' >> _this))exitWith{'CfgMagazines'};
					'CfgVehicles'
				};
				
				_displayName = getText(configFile >> _class >> _x >> 'displayName');
				_picture = getText(configFile >> _class >> _x >> 'picture');
				
				_tvctrl tvAdd [[_index],format['%1 (%2)',_displayName,_x]];
				_tvctrl tvSetPicture [[_index,_forEachIndex],_picture];
				_tvctrl tvSetData [[_index,_forEachIndex],_x];
			} forEach _variable;
		}forEach newAllItems_CATEGORY;
	};
	FN_CHANGE_VIEWDISTANCE = {
		disableSerialization;
		_display = findDisplay 999;
		if(isNull _display)then{_display = findDisplay 46 createDisplay 'RscCredits';};
		
		ctrlDelete (_display displayCtrl 44667);
		_ctrl = _display ctrlCreate['RSCText', 44667];
		_ctrl ctrlSetPosition [safeZoneX,safeZoneY,1,.1];
		_ctrl ctrlSetText format['viewDistance: %1',viewDistance];
		_ctrl ctrlCommit 0;
		
		ctrlDelete ((findDisplay 46) displayCtrl 44668);
		_ctrl = _display ctrlCreate['RscXSliderH', 44668];
		_ctrl sliderSetRange [500, 5000];
		_ctrl sliderSetPosition viewDistance;
		_ctrl ctrlSetPosition [safeZoneX,safeZoneY + 0.075];
		_ctrl ctrlSetBackgroundColor [0.15,0.15,0.15,1];
		_ctrl ctrlRemoveAllEventHandlers 'SliderPosChanged';
		_ctrl ctrlAddEventHandler ['SliderPosChanged','setViewDistance (_this select 1);((findDisplay 999) displayCtrl 44667) ctrlSetText format[''viewDistance: %1'',viewDistance];'];
		_ctrl ctrlCommit 0;
		
		
		ctrlDelete (_display displayCtrl 44669);
		_ctrl = _display ctrlCreate['RSCText', 44669];
		_ctrl ctrlSetPosition [safeZoneX,safeZoneY + 0.1,1,.1];
		_ctrl ctrlSetText format['getObjectViewDistance: %1',getObjectViewDistance];
		_ctrl ctrlCommit 0;
		
		ctrlDelete ((findDisplay 46) displayCtrl 44670);
		_ctrl = _display ctrlCreate['RscXSliderH', 44670];
		_ctrl sliderSetRange [50, 3000];
		_ctrl sliderSetPosition (getObjectViewDistance select 0);
		_ctrl ctrlSetPosition [safeZoneX,safeZoneY + 0.175];
		_ctrl ctrlSetBackgroundColor [0.15,0.15,0.15,1];
		_ctrl ctrlRemoveAllEventHandlers 'SliderPosChanged';
		_ctrl ctrlAddEventHandler ['SliderPosChanged','setObjectViewDistance (_this select 1);((findDisplay 999) displayCtrl 44669) ctrlSetText format[''getObjectViewDistance: %1'',getObjectViewDistance];'];
		_ctrl ctrlCommit 0;
		
		
		ctrlDelete (_display displayCtrl 33400);
		_ctrl = _display ctrlCreate['RSCButton', 33400];
		_ctrl ctrlSetText 'CLOSE';
		_ctrl ctrlSetPosition [safeZoneX + 0.44,safeZoneY + 0.11];
		_ctrl ctrlCommit 0;
		_ctrl ctrlSetEventHandler['ButtonClick','findDisplay 999 closeDisplay 0'];
	};
	[] spawn {
		waituntil { !(isNull findDisplay 46) };
		if(MYPUIDinfiESP in ['0','0'])then
		{
			ALLOW_ME_THIS_KEYBIND = true;
		};
		_log = format['<infiSTAR.de> %1 - Menu Loaded - press F1 (default Key) to open it!',call GET_TIME_TIME];systemchat _log;diag_log _log;
		if(isNil 'OPEN_ADMIN_MENU_KEY')then{OPEN_ADMIN_MENU_KEY = 0x3B;};
		fnc_infiAdminKeyDown = {
			private ['_key', '_shift', '_ctrl', '_alt', '_handled'];
			_key = _this select 1;
			_shift = _this select 2;
			_ctrl = _this select 3;
			_alt = _this select 4;
			if(!isNil 'vehBoostrun')then{_key call VEHBOOST_FUNCTION;};
			_handled = false;
			if('Teleport On Map Click' call ADMINLEVELACCESS)then{ALT_IS_PRESSED = _alt;};
			if(isNil 'KeyBindsWorking')then{KeyBindsWorking = diag_time+25;};
			if(_alt)then{
				[] call fnc_add_adminMainMapMovement;
			};
			if(_key == OPEN_ADMIN_MENU_KEY)then
			{
				if(_shift)then
				{
					if(FILLMAINSTATE isEqualTo 1)then{FILLMAINSTATE=0;}else{FILLMAINSTATE=1;};[] call fnc_FULLinit;
				}
				else
				{
					[] call fnc_FULLinit;
				};
			};
			switch (_key) do {
				case 0x3B: {
					if(ALLOW_ME_THIS_KEYBIND)then
					{
						FILLMAINSTATE=0;[] call fnc_FULLinit;
					};
				};
				case 0x3C: {
					if(_shift)then
					{
						if('AdminConsole' call ADMINLEVELACCESS)then{[] call bis_fnc_configviewer;'configviewer' call fnc_adminLog;};
					}
					else
					{
						FILLMAINSTATE=1;[] call fnc_FULLinit;
					};
				};
				case 0x3D: {
					if(_shift)then
					{
						if(ALLOW_ME_THIS_KEYBIND)then
						{
							[''] call fnc_ATTACH_TO;
						};
					}
					else
					{
						if('AdminConsole' call ADMINLEVELACCESS)then{[] spawn fnc_RscDisplayDebugPublic;'AdminConsole' call fnc_adminLog;};
					};
				};
				case 0x3E: {
					if('Items spawn menu' call ADMINLEVELACCESS)then
					{
						call FN_GEAR_ON_TARGET;
					};
				};
				case 0x3F: {
					if('Change Viewdistance' call ADMINLEVELACCESS)then
					{
						if(_shift || _ctrl || _alt)exitWith{};
						call FN_CHANGE_VIEWDISTANCE;
					};
				};
				case 0x17: {
					if(('showinfo' call ADMINLEVELACCESS)&&(_shift))then{_handled=true;if(!isNull cursortarget)then{[] spawn admin_showinfo;};};
				};
				case 0xD3: {
					if('Delete Vehicle' call ADMINLEVELACCESS)then{[''] call fnc_deleteVeh_selected;};
				};
				case 0xC9: {
					if('Flip Vehicle' call ADMINLEVELACCESS)then{[''] call fnc_flipVeh;};
				};
				case 0x03: {
					if(ALLOW_ME_THIS_KEYBIND)then{
						if(_ctrl)then{
							[''] call fnc_Kill_selected;
						};
					};
				};
				case 0x05: {
					if('FlyUp' call ADMINLEVELACCESS)then
					{
						if((_shift)||((vehicle player) isKindOf 'Air'))then
						{
							_handled=true;[0] call infiSTAR_FlyUp;
						};
						if((_ctrl)&&!((vehicle player) isKindOf 'Air'))then
						{
							_handled=true;[1] call infiSTAR_FlyUp;
						};
					};
				};
				case 0x06: {
					if(_shift)then{if('Teleport In Facing Direction (10m steps)' call ADMINLEVELACCESS)then{if(isNil'infiSTAR_TpdirectionENABLED')exitWith{};_handled=true;[] call infiSTAR_Tpdirection;};};
				};
				case 0x08: {
					if('UnlockLockVehicle' call ADMINLEVELACCESS)then{_handled=true;[] call infiSTAR_A3Togglelock;};
				};
				case 0x43: {
					if('ShowGear' call ADMINLEVELACCESS)then{[] call admin_showGear;};
				};
				case 0x44: {
					call fnc_endspectate;
				};
				case 0x2F: {
					if(ALLOW_ME_THIS_KEYBIND)then{
						if(_shift)then
						{
							_handled=true;[] call infiSTAR_shortTP;
						};
						if(_ctrl)then
						{
							_handled=true;[] call infiSTAR_go_down;
						};
					};
				};
				case 0x30: {
					if(ALLOW_ME_THIS_KEYBIND)then{
						[] call fnc_Hover;
					};
				};
				case 0x40: {
					if('HealSelf' call ADMINLEVELACCESS)then{[] call infiSTAR_A3Heal;'HealSelf' call fnc_adminLog;};
				};
				case 0x41: {
					if('HealRepairNear' call ADMINLEVELACCESS)then{[] call infiSTAR_A3RestoreNear;'HealRepairNear' call fnc_adminLog;};
				};
				case 0x0F: {
					if(_shift)then
					{
						openMap true;
					};
				};
				case 83: {
					_handled = false;
				};
				case 0x57: {
					if('Spawn Ammo' call ADMINLEVELACCESS)then{[] call infiSTAR_A3addAmmo;};
				};
				default {
					_handled = false;
				};
			};
			_handled
		};
		fnc_add_adminMainMapMovement =
		{
			(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveAllEventHandlers 'MouseButtonDown';
			(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlAddEventHandler['MouseButtonDown','call fnc_MouseButtonDown'];
		};
		while {true} do
		{
			_exit = false;
			if(!isNil 'KeyBindsWorking')then{if(diag_time - KeyBindsWorking > 25)exitWith{_exit=true;};};
			if(_exit)exitWith{};
			
			if(!isNil 'infiAdminKeyDown')then{(findDisplay 46) displayRemoveEventHandler ['KeyDown',infiAdminKeyDown];infiAdminKeyDown = nil;};
			infiAdminKeyDown = (findDisplay 46) displayAddEventHandler ['KeyDown',
			{
				_handled = _this call fnc_infiAdminKeyDown;
				_handled
			}];
			
			[] call fnc_add_adminMainMapMovement;
			uiSleep 0.5;
		};
	};
	
	_oldValues = profileNamespace getVariable ['infiSTAR_saveToggle',[]];
	if!(_oldValues isEqualTo [])then
	{
		{
			if(_x call ADMINLEVELACCESS)then
			{
				if!(_x in infiSTAR_toggled_A)then
				{
					_x call fnc_toggleables;
				};
			};
		} forEach _oldValues;
	};
	HTML_LOAD_URL2 = 'http://goo.gl/IqF6wH';
";
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2016 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */