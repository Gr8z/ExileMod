//Altis Safezones
donn_traders = [
	["Terminal",[14600, 16797.2,0]],
	["Silderas",[2998.06, 18175.5,0]],
	["Fotia",[23334.6, 24188.9,0]],
	["Chalkeia",[20498.8,11030.2,0]]
];

if (hasInterface) then {
	//SENSORS
	donn_notSafe = true;
	donn_safeZone_name = "unknown";
	{
		_x spawn {
			private ["_dist","_tPos","_tName","_maxVel","_tRad"];
			_tName = _this select 0;
			_tPos = _this select 1;
			_maxVel = 100;
			_tRad = 170;
			waitUntil {sleep 0.25;speed player > 1};
			while {true} do {
				_dist = player distance _tPos;
				while {_dist > 150} do {
					sleep ((((_dist - _tRad)/_maxVel) max 0.25) min 5);
					_dist = player distance  _tPos;
				};
				donn_notSafe = false;
				inSafeZone = true; //NEW LINE 1
				donn_safeZone_name = _tName;
				systemChat ("NOW ENTERING " + _tName);
				while {_dist < 150} do {
					sleep 0.25;
					_dist = player distance _tPos;
				};
				donn_notSafe = true;
				inSafeZone = false; //NEW LINE 2
				donn_safeZone_name = "none";
				systemChat ("NOW LEAVING" + _tName);
			};
		};
	} forEach donn_traders;

	//Safe zone Functions
	donn_avoidGearAccess = {
		_protecting = [];
		_toProtect = donn_pv_protected_veh select 1;
		_toUnprotect = [];
		_protectVersion = donn_pv_protected_veh select 0;
		while {!donn_notSafe} do {
			{
				_x addEventHandler ["ContainerOpened", {
					_veh = _this select 0;
					_player = _this select 1;
					_veh_crew = _veh getVariable ['don_crew', nil];
					if (isNil '_veh_crew') then {_veh_crew = [getPlayerUID _player];};
					_groupUnits = units _player;
					_canAccess = false;
					{
						if (getPlayerUID _x in _veh_crew) then {
							_canAccess = true;
						};
					} forEach _groupUnits;
					if (!_canAccess)then {
						systemChat format ['%1, you cant access this gear.', name _player];
						_player action ["Gear", objNull];
					};
				}];
			} forEach _toProtect;
			{
				_x removeAllEventHandlers "ContainerOpened";
			} forEach _toUnprotect;
			_protecting = _protecting + _toProtect - _toUnprotect;
			waitUntil {sleep 0.2;donn_pv_protected_veh select 0 > _protectVersion};
			_toProtect = (donn_pv_protected_veh select 1) - _protecting;
			_toUnprotect = _protecting - (donn_pv_protected_veh select 1);
		};
		{
			_x removeAllEventHandlers "ContainerOpened";
		} forEach _protecting;
	};
	
	//Safezone
	don_incar = false;
	don_firedEH_1 = nil;
	donn_godMode = false;
	[] spawn {
		private ['_runOneTime','_donn_notSafe','_don_passengers','_don_veh_crew','_don_player_veh','_don_veh_driver'];
		waitUntil {!(isNil 'donn_notSafe')};
		_runOneTime = false;
		_donn_notSafe = donn_notSafe;
		while {true} do {
			waitUntil {!((_donn_notSafe && donn_notSafe) || (!_donn_notSafe && !donn_notSafe)) || !_runOneTime};
			_donn_notSafe = donn_notSafe;
			if (!_donn_notSafe) then {
				//Player God Mode
				player allowDamage false;
				donn_sz_fired = player addEventHandler ['Fired',{deleteVehicle (_this select 6);}];
				donn_godMode = true;
				
				//Protect Player Gear
				donn_pv_protected_veh_add = player;
				publicVariableServer "donn_pv_protected_veh_add";
				
				//Avoid player to access other Gears (turn off is automatic)
				[] spawn donn_avoidGearAccess;
			};
			if (_donn_notSafe && _runOneTime) then {
				//Player God Mode Off
				player allowDamage true;
				player removeEventHandler ["Fired",donn_sz_fired];
				donn_godMode = false;
				
				//Clear Player Gear Protection
				donn_pv_protected_veh_sub = player;
				publicVariableServer "donn_pv_protected_veh_sub";
			};
			if (!_donn_notSafe && don_incar) then {
				
				//Get Info
				_don_player_veh = don_player_veh;
				don_veh_crew = crew _don_player_veh;
				_don_veh_driver = driver _don_player_veh;
				
				if (player == _don_veh_driver) then {
					//Car God Mode
					_don_player_veh allowDamage false;
					_don_player_veh removeAllEventHandlers 'handleDamage';
					_don_player_veh addEventHandler ['handleDamage', {0}];
					_don_player_veh removeAllEventHandlers 'Fired';
					_don_player_veh addEventHandler ['Fired',{deleteVehicle (_this select 6);}];
					
					//Passenger Names
					_don_passengers = '';
					{if (alive _x) then {_don_passengers = _don_passengers + format [' %1',name _x];};} forEach don_veh_crew;
					
					//Passenger PlayerUID
					_don_veh_crew = [];
					{if (alive _x) then {_don_veh_crew = _don_veh_crew + [getPlayerUID _x];};} forEach don_veh_crew;

					//Put info on Vehicle
					_don_player_veh setVariable ['don_ownerity_code', format ['%1_%2', getPlayerUID player, round diag_tickTime], true];
					_don_player_veh setVariable ['don_crew', _don_veh_crew, true];
					_don_player_veh setVariable ['don_passengers', _don_passengers, true];

					//Protect Vehicle Gear
					donn_pv_protected_veh_add = _don_player_veh;
					publicVariable "donn_pv_protected_veh_add";
				};
				
			};
			if (_donn_notSafe && don_incar && _runOneTime) then {
				
				//Get Info
				_don_player_veh = don_player_veh;
				_don_veh_driver = driver _don_player_veh;			
				
				if (player == _don_veh_driver) then {
					//Clear Vehicle Protection Variables
					_don_player_veh setVariable ['don_ownerity_code', nil, true];
					_don_player_veh setVariable ['don_crew', nil, true];
					_don_player_veh setVariable ['don_passengers', nil, true];
				
					//Car God Mode Off
					_don_player_veh allowDamage true;
					_don_player_veh removeAllEventHandlers 'handleDamage';
					_don_player_veh removeAllEventHandlers 'Fired';
					
					//Clear Vehicle Gear Protection
					donn_pv_protected_veh_sub = _don_player_veh;
					publicVariableServer "donn_pv_protected_veh_sub";
				};
			};
			_runOneTime = true;
		};
	};
	[] spawn {
		private ['_don_veh_crew','_wait_time','_last_mark','_max_time'];
		while {true} do {
			_max_time = 480;
			waitUntil {sleep 0.0625; vehicle player != player};
			don_player_veh = vehicle player;
			don_incar = true;
			if (!donn_notSafe) then {
				_don_veh_crew = don_player_veh getVariable ['don_crew', nil];
				if (isNil '_don_veh_crew') then {_don_veh_crew = [getPlayerUID player];};
				_groupUnits = units player;
				_canAccess = false;
				{
					if (getPlayerUID _x in _don_veh_crew) then {
						_canAccess = true;
					};
				} forEach _groupUnits;
				if (!_canAccess) then {
					call compile format ['if (isNil ''don_%1'') then {don_%1 = diag_tickTime;}; _last_mark = don_%1;', don_player_veh getVariable ['don_ownerity_code', 0]];
					_wait_time = diag_tickTime - _last_mark;
					if (_wait_time < _max_time) then {
						while {player != vehicle player} do {
							player action ['getOut', don_player_veh];
							uiSleep 0.01;
						};
						cuttext [format ['Owners:%1. %2 seconds to liberate.', don_player_veh getVariable ['don_passengers','Owners not found'], round (_max_time - _wait_time)], 'PLAIN DOWN'];
						cad_pvar_smessage = [format ['%1 is messing with your vehicle! %2 seconds to liberate!', name player, round (_max_time - _wait_time)], _don_veh_crew];
						publicVariable 'cad_pvar_smessage';
					} else {
						call compile format ['don_%1 = nil;', don_player_veh getVariable ['don_ownerity_code', 0]];
						don_player_veh setVariable ['don_ownerity_code', nil, true];
						don_player_veh setVariable ['don_crew', nil, true];
						don_player_veh setVariable ['don_passengers', nil, true];
						cuttext [format ['Vehicle is now free for all!'], 'PLAIN DOWN'];
						cad_pvar_smessage = [format ['Vehicle invaded by %1!', name player], _don_veh_crew];
						publicVariable 'cad_pvar_smessage';
					};
				};
				don_player_veh allowDamage false;
				don_player_veh removeAllEventHandlers 'handleDamage';
				don_player_veh addEventHandler ['handleDamage', {0}];
				don_player_veh removeAllEventHandlers 'Fired';
				don_player_veh addEventHandler ['Fired',{deleteVehicle (_this select 6);}];
			};
			if (donn_notSafe) then {
				don_player_veh allowDamage true;
				don_player_veh removeAllEventHandlers 'handleDamage';
				don_player_veh removeAllEventHandlers 'Fired';
				if (player == driver don_player_veh) then {
					don_player_veh setVariable ['don_ownerity_code', nil, true];
					don_player_veh setVariable ['don_crew', nil, true];
					don_player_veh setVariable ['don_passengers', nil, true];
				};
			};
			waitUntil {sleep 0.0625; vehicle player == player};
			don_incar = false;
			don_player_veh = nil;
		};
	};
	//Remote Mensages
	'cad_pvar_smessage' addPublicVariableEventHandler {
		private ['_message', '_receivers'];
		_message = (_this select 1) select 0; _receivers = (_this select 1) select 1;
		if (getPlayerUID player in _receivers) then {cutText [_message, 'PLAIN DOWN'];};
	};
	diag_log "! SAZON OK !";
};

//=============
// SERVER SIDE
//=============
if (isServer) then {
	//DONN SaZon Protected Veh
	donn_pv_protected_veh = [0,[]];
	publicVariable "donn_pv_protected_veh";
	"donn_pv_protected_veh_add" addPublicVariableEventHandler {
		donn_pv_protected_veh set [0,(donn_pv_protected_veh select 0) + 1];
		donn_pv_protected_veh set [1,(donn_pv_protected_veh select 1) + [_this select 1]];
		publicVariable "donn_pv_protected_veh";
		diag_log ("[SAZON] Added veh to protection: " + str (_this select 1));
	};
	"donn_pv_protected_veh_sub" addPublicVariableEventHandler {
		donn_pv_protected_veh set [0,(donn_pv_protected_veh select 0) + 1];
		donn_pv_protected_veh set [1,(donn_pv_protected_veh select 1) - [_this select 1]];
		publicVariable "donn_pv_protected_veh";
		diag_log ("[SAZON] Deadded veh to protection: " + str (_this select 1));
	};
};