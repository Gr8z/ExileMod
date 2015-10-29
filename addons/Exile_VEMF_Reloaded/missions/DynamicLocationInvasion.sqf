/*
	DynamicLocationInvasion by Vampire, rewritten by IT07
*/
private ["_settings","_grpCount","_groupUnits","_playerCheck","_loc","_hasPlayers","_spawned","_grpArr","_unitArr","_done","_boxes","_box","_chute","_colors","_lightType","_light","_smoke"];

// Define _settings
_settings = [["DynamicLocationInvasion"],["maxInvasions","groupCount","groupUnits","distanceCheck","distanceTooClose","distanceMaxPrefered","playerCheck","crateAltitude","useMarker","parachuteCrate","crateVisualMarker","crateMapMarker","useAnnouncements"]] call VEMFr_fnc_getSetting;
_maxInvasions = _settings select 0;
if isNil"VEMFr_invasCount" then
{
	VEMFr_invasCount = 0;
};
VEMFr_invasCount = VEMFr_invasCount + 1;
if (VEMFr_invasCount <= _maxInvasions) then
{
	_grpCount = _settings select 1;
	_groupUnits = _settings select 2;
	_range = _settings select 3;
	_tooClose = _settings select 4;
	_maxPref = _settings select 5;
	_playerCheck = _settings select 6;
	_crateAltitude = _settings select 7;
	_useMissionMarker = _settings select 8;
	_useChute = _settings select 9;
	_crateVisualMarker = _settings select 10;
	_crateMapMarker = _settings select 11;
	_useAnnouncements = _settings select 12;

	_loc = ["loc", false, position (allPlayers call VEMFr_fnc_random), _range, _tooClose, _maxPref, _playerCheck] call VEMFr_fnc_findPos;
	if (typeName _loc isEqualTo "ARRAY") then
	{
		_locName = _loc select 0;
		if (_locName isEqualTo "") then { _locName = "Area"; };
		["DynamicLocationInvasion", 1, format["Invading %1...", _locName]] call VEMFr_fnc_log;
		VEMFr_invasCount = VEMFr_invasCount + 1;
		// Send message to all players
		private ["_mode"];
		_mode = "aiPoliceMode" call VEMFr_fnc_getSetting;
		_randomModes = ([["DynamicLocationInvasion"],["randomModes"]] call VEMFr_fnc_getSetting) select 0;
		if (_randomModes isEqualTo 1) then
		{
			_mode = [0,1,2] call VEMFr_fnc_random;
		};
		if (_useAnnouncements isEqualTo 1) then
		{
			if (_mode < 1) then
			{
				[[format["Plundering groups have invaded %1 @ %2", _locName, mapGridPosition (_loc select 1)], "NEW INVASION"], ""] spawn VEMFr_fnc_broadCast;
			};
			if (_mode isEqualTo 1) then
			{
				[[format["%1 Police forces are now controlling %2 @ %3", worldName, _locName, mapGridPosition (_loc select 1)], "NEW MISSION"], ""] spawn VEMFr_fnc_broadCast;
			};
			if (_mode isEqualTo 2) then
			{
				[[format["%1 S.W.A.T. teams are now raiding %2 @ %3", worldName, _locName, mapGridPosition (_loc select 1)], "NEW RAID"], ""] spawn VEMFr_fnc_broadCast;
			};
		};
		private["_marker"];
		if (_useMissionMarker isEqualTo 1) then
		{ // Create/place the marker if enabled
			_marker = createMarker [format["VEMFr_DynaLocInva_ID%1", random 9000], (_loc select 1)];
			_marker setMarkerShape "ICON";
			_marker setMarkerType "o_unknown";
			switch true do
			{
				case (_mode < 1):
				{
					_marker setMarkerColor "ColorEAST";
				};
				case (_mode isEqualTo 1):
				{
					_marker setMarkerColor "ColorWEST";
				};
				case (_mode isEqualTo 2):
				{
					_marker setMarkerColor "ColorBlack";
				};
			};
		};
		// Usage: POSITION, Radius
		_playerNear = [_loc select 1, 800] call VEMFr_fnc_waitForPlayers;
		if _playerNear then
		{
			// Player is Near, so Spawn the Units
			_spawned = [_loc select 1, ((_grpCount select 0) + round random ((_grpCount select 1) - (_grpCount select 0))), ((_groupUnits select 0) + round random ((_groupUnits select 1) - (_groupUnits select 0))), _mode] call VEMFr_fnc_spawnAI;
			if (count (_spawned select 0) > 0) then
			{
				private ["_cal50s"];
				if (count (_spawned select 1) > 0) then
				{
					_cal50s = _spawned select 1;
				};
				// Place mines if enabled
				private ["_minesPlaced","_placeMines"];
				_placeMines = [[["DynamicLocationInvasion"],["placeMines"]] call VEMFr_fnc_getSetting, 0, [0]] call BIS_fnc_param;
				if (_placeMines isEqualTo 1) then
				{
					_minesPlaced = [[_loc select 1, 5, 100] call VEMFr_fnc_placeMines, 0, [], [[]]] call BIS_fnc_param;
					if (count _minesPlaced > 0) then
					{
						["DynamicLocationInvasion", 1, format["Successfully placed mines at %1", _locName]] call VEMFr_fnc_log;
					};
					if (count _minesPlaced isEqualto 0) then
					{
						["DynamicLocationInvasion", 0, format["Failed to place mines at %1", _locName]] call VEMFr_fnc_log;
						_minesPlaced = nil;
					};
				};

				// Wait for Mission Completion
				_done = [_loc select 1, _spawned select 0, _playerCheck] call VEMFr_fnc_waitForMissionDone;
				_usedLocs = uiNamespace getVariable "VEMFrUsedLocs";
				_index = _usedLocs find [_loc select 0, _loc select 1];
				if (_index > -1) then
				{
					_usedLocs deleteAt _index;
				};
				if _done then
				{
					// Broadcast
					if (_useAnnouncements isEqualTo 1) then
					{
						if (_mode < 1) then
						{
							[[format["%1 @ %2 has been cleared of %3 bad guys", _locName, mapGridPosition (_loc select 1), worldName], "ABORTED"], ""] spawn VEMFr_fnc_broadCast;
						};
						if (_mode isEqualTo 1) then
						{
							[[format["%1 @ %2 has been cleared of %3 Police forces", _locName, mapGridPosition (_loc select 1), worldName], "CLEARED"], ""] spawn VEMFr_fnc_broadCast;
						};
						if (_mode isEqualTo 2) then
						{
							[[format["S.W.A.T. raid on %1 @ %2 has been eliminated", _locName, mapGridPosition (_loc select 1)], "DEFEATED"], ""] spawn VEMFr_fnc_broadCast;
						};
					};
					// Deal with the 50s
					if not isNil"_cal50s" then
					{
						_keep50s = ([["DynamicLocationInvasion"],["keep50s"]] call VEMFr_fnc_getSetting) select 0;
						if (_keep50s isEqualTo -1) then
						{
							_cal50delMode = ([["DynamicLocationInvasion"],["cal50delMode"]] call VEMFr_fnc_getSetting) select 0;
							{
								if (_cal50delMode isEqualTo 1) then
								{
									deleteVehicle _x;
								};
								if (_cal50delMode isEqualTo 2) then
								{
									_x setDamage 1;
								};
							} forEach _cal50s;
						};
					};
					// Choose a box
					_boxes = [["DynamicLocationInvasion"],["crateTypes"]] call VEMFr_fnc_getSetting;
					_box = (_boxes select 0) call BIS_fnc_selectRandom;
					_pos = [_loc select 1, 0, 100, 0, 0, 300, 0] call bis_fnc_findSafePos;
					private ["_crate"];
					if (_useChute isEqualTo 1) then
					{
						_chute = createVehicle ["I_Parachute_02_F", _pos, [], 0, "FLY"];
						_chute setPos [getPos _chute select 0, getPos _chute select 1, _crateAltitude];
						_chute enableSimulationGlobal true;

						if not isNull _chute then
						{
							_crate = createVehicle [_box, getPos _chute, [], 0, "NONE"];
							_crate allowDamage false;
							_crate enableSimulationGlobal true;
							_crate attachTo [_chute, [0,0,0]];
							["DynamicLocationInvasion", 1, format ["Crate parachuted at: %1 / Grid: %2", (getPosATL _crate), mapGridPosition (getPosATL _crate)]] call VEMFr_fnc_log;
							_lootLoaded = [_crate] call VEMFr_fnc_loadLoot;
							if _lootLoaded then { ["DynamicLocationInvasion", 1, "Loot loaded successfully into parachuting crate"] call VEMFr_fnc_log };
						};
					};
					if (_useChute isEqualTo -1) then
					{
						_crate = createVehicle [_box, _pos, [], 0, "NONE"];
						_crate allowDamage false;
						_lootLoaded = [_crate] call VEMFr_fnc_loadLoot;
						if _lootLoaded then { ["DynamicLocationInvasion", 1, "Loot loaded successfully into crate"] call VEMFr_fnc_log };
					};
					if (_crateVisualMarker isEqualTo 1) then
					{
						// If night, attach a chemlight
						if (dayTime < 5 OR dayTime > 19) then
						{
							_colors = [[["DynamicLocationInvasion"],["flairTypes"]] call VEMFr_fnc_getSetting, 0, [], [[]]] call BIS_fnc_param;
							if (count _colors > 0) then
							{
								_lightType = _colors select floor random count _colors;
								_light = _lightType createVehicle (position _crate);
								_light attachTo [_crate,[0,0,0]];
							};
						};
						// If day, attach smoke
						if (dayTime > 5 OR dayTime < 19) then
						{
							_colors = [[["DynamicLocationInvasion"],["smokeTypes"]] call VEMFr_fnc_getSetting, 0, [], [[]]] call BIS_fnc_param;
							if (count _colors > 0) then
							{
								_rndmColor = _colors select floor random count _colors;
								_smoke = createVehicle [_rndmColor, getPos _crate, [], 0, "CAN_COLLIDE"];
								_smoke attachTo [_crate,[0,0,0]];
							};
						};
					};
					if (_useChute isEqualTo 1) then
					{
						waitUntil { uiSleep 1; (((getPos _crate) select 2) < 7) };
						detach _crate;
					};
					if not isNil"_marker" then
					{
						deleteMarker _marker
					};
					VEMFr_invasCount = VEMFr_invasCount - 1;
					VEMFr_missionCount = VEMFr_missionCount - 1;

					// Put a marker on the crate if enabled
					if not isNull _crate then
					{
						if not ([getPos _crate, 2] call VEMFr_fnc_checkPlayerPresence) then
						{
							_addMarker = [[["DynamicLocationInvasion"],["crateMapMarker"]] call VEMFr_fnc_getSetting, 0, 1, [0]] call BIS_fnc_param;
							if (_addMarker isEqualTo 1) then
							{
								private ["_crateMarker"];
								_crateMarker = createMarker [format["VEMF_lootCrate_ID%1", random 9000], position _crate];
								_crateMarker setMarkerShape "ICON";
								_crateMarker setMarkerType "mil_box";
								_crateMarker setMarkerColor "colorBlack";
								_crateMarker setMarkerText " Loot";
								[_crate, _crateMarker] spawn
								{
									_crate = _this select 0;
									_crateMarker = _this select 1;
									waitUntil { uiSleep 4; [getPos _crate, 2] call VEMFr_fnc_checkPlayerPresence };
									deleteMarker _crateMarker;
								};
							};
						};
					};

					// Explode or remove the mines
					if not isNil"_minesPlaced" then
					{
						private ["_cleanMines"];
						_cleanMines = [[["DynamicLocationInvasion"],["cleanMines"]] call VEMFr_fnc_getSetting, 0, 1, [0]] call BIS_fnc_param;
						if (_cleanMines isEqualTo 2) then
						{
							{
								if not isNull _x then
								{
									_x setDamage 1;
									uiSleep (2 + round random 2);
								};
							} forEach _minesPlaced;
							["DynamicLocationInvasion", 1, format["Successfully exploded all %1 mines at %2", count _minesPlaced, _locName]] call VEMFr_fnc_log;
							_minesPlaced = nil;
						};
						if (_cleanMines isEqualTo 1) then
						{
							{
								if not isNull _x then
								{
									deleteVehicle _x;
								};
							} forEach _minesPlaced;
							["DynamicLocationInvasion", 1, format["Successfully deleted all %1 mines at %2", count _minesPlaced, _locName]] call VEMFr_fnc_log;
							_minesPlaced = nil;
						};
					};
				};
			};
			if isNil"_spawned" then
			{
				["DynamicLocationInvasion", 0, format["Failed to spawn AI in %1", _locName]] call VEMFr_fnc_log;
				if not isNil"_marker" then
				{
					deleteMarker _marker
				};
				VEMFr_invasCount = VEMFr_invasCount - 1;
				VEMFr_missionCount = VEMFr_missionCount - 1;
			};
		};
		if not _playerNear then
		{
			["DynamicLocationInvasion", 1, format["Invasion of %1 timed out.", _locName]] call VEMFr_fnc_log;
			if not isNil"_marker" then
			{
				deleteMarker _marker
			};
			_usedLocs = uiNamespace getVariable "VEMFrUsedLocs";
			_index = _usedLocs find _loc;
			if (_index > -1) then
			{
				_usedLocs deleteAt _index;
			};
			VEMFr_invasCount = VEMFr_invasCount - 1;
			VEMFr_missionCount = VEMFr_missionCount - 1;
		};
	};
	if not(typeName _loc isEqualTo "ARRAY") then
	{
		VEMFr_invasCount = VEMFr_invasCount - 1;
		VEMFr_missionCount = VEMFr_missionCount - 1;
	};
};
if (VEMFr_invasCount >= _maxInvasions) then
{
	VEMFr_invasCount = VEMFr_invasCount - 1;
	VEMFr_missionCount = VEMFr_missionCount - 1;
};
