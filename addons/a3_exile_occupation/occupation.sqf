
if (!isServer) exitWith {};
diag_log format ["[OCCUPATION]:: Starting Occupation Monitor"];

_middle = worldSize/2;
_spawnCenter 	= [_middle,_middle,0];
_max = _middle;
_useLaunchers = DMS_ai_use_launchers;

_maxAIcount = 100; // the maximum amount of AI, if the AI count is above this then additional AI won't spawn
_minFPS = 15; // any lower than 15fps on the server and additional AI won't spawn
_scaleAI = 10; // any more than _scaleAI players on the server and _maxAIcount is reduced for each extra player
_debug = false; // set to true for debug log information

// more than _scaleAI players on the server and the max AI count drops per additional player
_currentPlayerCount = count playableUnits;
if(_currentPlayerCount > _scaleAI) then 
{
	_maxAIcount = _maxAIcount - (_currentPlayerCount - _scaleAI) ;
};

// Don't spawn additional AI if the server fps is below _minFPS
if(diag_fps < _minFPS) exitWith { diag_log format ["[OCCUPATION]:: Held off spawning more AI as the server FPS is only %1",diag_fps]; };

_aiActive = count(_spawnCenter nearEntities ["O_recon_F", 20000]);
if(_aiActive > _maxAIcount) exitWith { diag_log format ["[OCCUPATION]:: %1 active AI, so not spawning AI this time",_aiActive]; };

_locations = (nearestLocations [_spawnCenter, ["NameVillage","NameCity", "NameCityCapital"], _max]);
{
	_okToSpawn = true;
	_temppos = position _x;
	_locationName = text _x;
	_locationType = type _x;
	_pos = [_temppos select 0, _temppos select 1, 0];
	
	if(_debug) then { diag_log format ["[OCCUPATION]:: Testing location name: %1 position: %2",_locationName,_pos];};
	
	while{_okToSpawn} do
	{
			
		// Percentage chance to spawn (roll 80 or more to spawn AI)
		_spawnChance = round (random 100);
		if(_spawnChance < 80) exitWith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION]:: Rolled %1 so not spawning AI this time",_spawnChance,_locationName];};};
			
		// Don't spawn if too near a player base
		_nearBase = (nearestObjects [_pos,["Exile_Construction_Flag_Static"],500]) select 0;
		if (!isNil "_nearBase") exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION]:: %1 is too close to player base",_locationName];};};
		
		// Don't spawn AI near traders and spawn zones
		_nearestMarker = ["ExileTraderZone", _pos] call BIS_fnc_nearestPosition; // Nearest Marker to the Location		
		_posNearestMarker = getMarkerPos _nearestMarker;
		if(_pos distance _posNearestMarker < 1000) exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION]:: %1 is too close to a %2",_locationName,_nearestMarker];}; };
	
		// Don't spawn additional AI if there are players in range
		if([_pos, 100] call ExileClient_util_world_isAlivePlayerInRange) exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION]:: %1 has players too close",_locationName];}; };
		
		// Don't spawn additional AI if there are already AI in range
		_aiNear = count(_pos nearEntities ["O_recon_F", 500]);
		if(_aiNear > 0) exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION]:: %1 already has %2 active AI patrolling",_locationName,_aiNear];}; };
		
		if(_okToSpawn) then
		{
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// Get AI to patrol the town
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			_aiCount = 1;
			_groupRadius = 100;
			if(_locationType isEqualTo "NameCityCapital") then { _aiCount = 4 + (round (random 5)) - _aiNear; _groupRadius = 300; };
			if(_locationType isEqualTo "NameCity") then { _aiCount = 2 + (round (random 3)) - _aiNear; _groupRadius = 200; };
			if(_locationType isEqualTo "NameVillage") then { _aiCount = 1 + (round (random 2)) - _aiNear; _groupRadius = 100; };
				
			if(_aiCount < 1) then { _aiCount = 1; };
			_difficulty = "random";
			_side = "bandit";
			_spawnPos = [_pos,10,100,5,0,20,0] call BIS_fnc_findSafePos;		
			_spawnPosition = [_spawnPos select 0, _spawnPos select 1,0];
			
			DMS_ai_use_launchers = false;
			_group = [_spawnPosition, _aiCount, _difficulty, "random", _side] call DMS_fnc_SpawnAIGroup;
			DMS_ai_use_launchers = _useLaunchers;
						
			// Get the AI to shut the fuck up :)
			enableSentences false;
			enableRadio false;
			
			[_group, _pos, _groupRadius] call bis_fnc_taskPatrol;
			_group setBehaviour "SAFE";
			_group setCombatMode "RED";
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			diag_log format ["[OCCUPATION]:: Spawning %2 AI in at %3 to patrol %1",_locationName,_aiCount,_spawnPosition];
			_okToSpawn = false;		
		};
	
	};
} forEach _locations;