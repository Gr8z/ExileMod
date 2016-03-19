////////////////////////////////////////////////////////////////////////
//
//		Server Occupation script by second_coming
//
//		Version 2.0
//
//		http://www.exilemod.com/profile/60-second_coming/
//
//		This script uses the fantastic DMS by Defent and eraser1
//
//		http://www.exilemod.com/topic/61-dms-defents-mission-system/
//
////////////////////////////////////////////////////////////////////////
private["_wp","_wp2","_wp3"];

if (!isServer) exitWith {};
diag_log format ["[OCCUPATION]:: Starting Occupation Monitor"];

_middle 	= worldSize/2;			
_spawnCenter 	= [_middle,_middle,0];		// Centre point for the map
_maxDistance 	= _middle;			// Max radius for the map

_maxAIcount 	= maxAIcount;
_minFPS 	= minFPS;
_debug 		= debug;
_useLaunchers 	= DMS_ai_use_launchers;
_scaleAI	= scaleAI;

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

_locations = (nearestLocations [_spawnCenter, ["NameVillage","NameCity", "NameCityCapital"], _maxDistance]);
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
		_nearestMarker = [allMapMarkers, _pos] call BIS_fnc_nearestPosition; // Nearest Marker to the Location		
		_posNearestMarker = getMarkerPos _nearestMarker;
		if(_pos distance _posNearestMarker < 500) exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION]:: %1 is too close to a %2",_locationName,_nearestMarker];}; };
	
		// Don't spawn additional AI if there are players in range
		if([_pos, 200] call ExileClient_util_world_isAlivePlayerInRange) exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION]:: %1 has players too close",_locationName];}; };
	
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
			if(_locationType isEqualTo "NameCityCapital") then { _aiCount = 5; _groupRadius = 300; };
			if(_locationType isEqualTo "NameCity") then { _aiCount = 2 + (round (random 3)); _groupRadius = 200; };
			if(_locationType isEqualTo "NameVillage") then { _aiCount = 1 + (round (random 2)); _groupRadius = 100; };
				
			if(_aiCount < 1) then { _aiCount = 1; };
			_difficulty = "random";
			_side = "bandit";
			_spawnPos = [_pos,10,100,5,0,20,0] call BIS_fnc_findSafePos;		
			_spawnPosition = [_spawnPos select 0, _spawnPos select 1,0];
			
			DMS_ai_use_launchers = false;
			_group = [_spawnPosition, _aiCount, _difficulty, "random", _side, customGearSet1] call DMS_fnc_SpawnAIGroup;
			DMS_ai_use_launchers = _useLaunchers;
						
			// Get the AI to shut the fuck up :)
			enableSentences false;
			enableRadio false;
			
			if(!useWaypoints) then
			{
				[_group, _pos, _groupRadius] call bis_fnc_taskPatrol;
				_group setBehaviour "DESTROY";
				_group setCombatMode "RED";
			}
			else
			{
				[ _group,_pos,_difficulty,"DESTROY" ] call DMS_fnc_SetGroupBehavior;
				
				_buildings = _pos nearObjects ["house", _groupRadius];
				{
					_buildingPositions = [_x, 10] call BIS_fnc_buildingPositions;
					if(count _buildingPositions > 0) then
					{

						// Find Highest Point
						_highest = [0,0,0];
						{
							if(_x select 2 > _highest select 2) then
							{
								_highest = _x;
							};

						} foreach _buildingPositions;		
						_spawnPosition = _highest;
						
						_i = _buildingPositions find _spawnPosition;
						_wp = _group addWaypoint [_spawnPosition, 0] ;
						_wp setWaypointFormation "Column";
						_wp setWaypointBehaviour "DESTROY";
						_wp setWaypointCombatMode "RED";
						_wp setWaypointCompletionRadius 1;
						_wp waypointAttachObject _x;
						_wp setwaypointHousePosition _i;
						_wp setWaypointType "MOVE";

					};
				} foreach _buildings;
				if(count _buildings > 0 ) then
				{
					_wp setWaypointType "CYCLE";
				};			
			};

			if(_locationType isEqualTo "NameCityCapital") then
			{
				DMS_ai_use_launchers = false;
				_group2 = [_spawnPosition, 5, _difficulty, "random", _side] call DMS_fnc_SpawnAIGroup;
				DMS_ai_use_launchers = _useLaunchers;
							
				// Get the AI to shut the fuck up :)
				enableSentences false;
				enableRadio false;
				[_group2, _pos, _groupRadius] call bis_fnc_taskPatrol;
				_group2 setBehaviour "DESTROY";
				_group2 setCombatMode "RED";

			};
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			if(_debug) then 
			{
				_marker = createMarker [format ["%1", _spawnPosition],_pos];
				_marker setMarkerShape "Icon";
				_marker setMarkerSize [3,3];
				_marker setMarkerType "mil_dot";
				_marker setMarkerBrush "Solid";
				_marker setMarkerAlpha 0.5;
				_marker setMarkerColor "ColorOrange";
				_marker setMarkerText "Occupied Area";	
			};			
			
			diag_log format ["[OCCUPATION]:: Spawning %2 AI in at %3 to patrol %1",_locationName,_aiCount,_spawnPosition];
			_okToSpawn = false;		
		};
	
	};
} forEach _locations;
