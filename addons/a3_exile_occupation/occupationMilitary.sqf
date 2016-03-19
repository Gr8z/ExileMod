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
diag_log format ["[OCCUPATION Military]:: Starting Monitor"];

_middle 		= worldSize/2;			
_spawnCenter 		= [_middle,_middle,0];		// Centre point for the map
_maxDistance 		= _middle;			// Max radius for the map

_maxAIcount 		= maxAIcount;
_minFPS 		= minFPS;
_debug 			= debug;
_useLaunchers 		= DMS_ai_use_launchers;
_scaleAI		= scaleAI;

_buildings = [
				"Land_Airport_Tower_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F","Land_u_Barracks_V2_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_Cargo_HQ_V1_F",
		        "Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F",
		        "Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F",
		        "Land_Medevac_house_V1_F","Land_Medevac_HQ_V1_F","Land_HBarrierTower_F","Land_MilOffices_V1_F","Land_Dome_Big_F","Land_Dome_Small_F","Land_Research_house_V1_F","Land_Research_HQ_F","Land_FuelStation_Shed_F",
                "Land_fs_roof_F","Land_fs_feed_F","Land_FuelStation_Feed_F","Land_Atm_01_F"
             ]; // Class names for the military buildings to patrol
_building = [];

_currentPlayerCount = count playableUnits;
if(_currentPlayerCount > _scaleAI) then 
{
	_maxAIcount = _maxAIcount - (_currentPlayerCount - _scaleAI) ;
};


// Select an area to scan as nearObjects on the entire map is slooooooooow
_areaToScan = [ 0, 900, 1, 500, 500, 0, 0, 0, true, false ] call DMS_fnc_findSafePos;

// Don't spawn additional AI if the server fps is below 8
if(diag_fps < _minFPS) exitWith { diag_log format ["[OCCUPATION Military]:: Held off spawning more AI as the server FPS is only %1",diag_fps]; };

_aiActive = count(_spawnCenter nearEntities ["O_recon_F", _maxDistance+1000]);
if(_aiActive > _maxAIcount) exitWith { diag_log format ["[OCCUPATION Military]:: %1 active AI, so not spawning AI this time",_aiActive]; };

for [{_i = 0},{_i < (count _buildings)},{_i =_i + 1}] do
{
	diag_log format ["[OCCUPATION Military]:: scanning nearObjects started at %1",time];
	
	_building = _areaToScan nearObjects [_buildings select _i, 1000];
	
	diag_log format ["[OCCUPATION Military]:: scanning nearObjects finished at %1",time];
	
    uiSleep 1;
    for [{_n = 0},{_n < (count _building)},{_n =_n + 1}] do
    {
		_okToSpawn = true;
		uiSleep 1;
        _foundBuilding = (_building select _n);
		_location = getPos _foundBuilding;
		_pos = [_location select 0, _location select 1, 0];
		
		if(_debug) then { diag_log format ["[OCCUPATION Military]:: Testing position: %1",_pos];};
		
		while{_okToSpawn} do
		{			
			// Percentage chance to spawn (roll 80 or more to spawn AI)
			_spawnChance = round (random 100);
			if(_spawnChance < 80) exitWith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION Military]:: Rolled %1 so not spawning AI this time",_spawnChance];};};
				
			// Don't spawn if too near a player base
			_nearBase = (nearestObjects [_pos,["Exile_Construction_Flag_Static"],500]) select 0;
			if (!isNil "_nearBase") exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION Military]:: %1 is too close to player base",_pos];};};
			
			// Don't spawn AI near traders and spawn zones
			_nearestMarker = ["ExileTraderZone", _pos] call BIS_fnc_nearestPosition; // Nearest Marker to the Location		
			_posNearestMarker = getMarkerPos _nearestMarker;
			if(_pos distance _posNearestMarker < 1000) exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION Military]:: %1 is too close to a %2",_pos,_nearestMarker];}; };
			
			// Don't spawn additional AI if there are already AI in range
			_aiNear = count(_pos nearEntities ["O_recon_F", 500]);
			if(_aiNear > 0) exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION Military]:: %1 already has %2 active AI patrolling",_pos,_aiNear];}; };

			// Don't spawn additional AI if there are players in range
			if([_pos, 200] call ExileClient_util_world_isAlivePlayerInRange) exitwith { _okToSpawn = false; if(_debug) then { diag_log format ["[OCCUPATION Military]:: %1 has players too close",_pos];}; };
			
			if(_okToSpawn) then
			{
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// Get AI to patrol the area
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				_aiCount = 2 + (round (random 3)); 
				_groupRadius = 100;
				_difficulty = "random";
				_side = "bandit";
				_spawnPosition = _pos;				
				

							
				// Get the AI to shut the fuck up :)
				enableSentences false;
				enableRadio false;
				

				
				if(!useWaypoints) then
				{
					DMS_ai_use_launchers = false;
					_group = [_spawnPosition, _aiCount, _difficulty, "random", _side] call DMS_fnc_SpawnAIGroup;
					DMS_ai_use_launchers = true;

					[_group, _pos, _groupRadius] call bis_fnc_taskPatrol;
					_group setBehaviour "DESTROY";
					_group setCombatMode "RED";
				}
				else
				{

					_buildingPositions = [_foundBuilding, 5] call BIS_fnc_buildingPositions;
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
					};
					
									
					DMS_ai_use_launchers = false;
					_group = [_spawnPosition, _aiCount, _difficulty, "random", _side] call DMS_fnc_SpawnAIGroup;
					DMS_ai_use_launchers = true;

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
				
				
				
			
				//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				diag_log format ["[OCCUPATION Military]:: Spawning %1 AI in at %2 to patrol",_aiCount,_spawnPosition];

				if(_debug) then 
				{
					_marker = createMarker [format ["%1", _foundBuilding],_pos];
					_marker setMarkerShape "Icon";
					_marker setMarkerSize [3,3];
					_marker setMarkerType "mil_dot";
					_marker setMarkerBrush "Solid";
					_marker setMarkerAlpha 0.5;
					_marker setMarkerColor "ColorRed";
					_marker setMarkerText "Occupied Military Area";	
				};
				
				_okToSpawn = false;			
			};	
		};
    };
};
diag_log "[OCCUPATION Military]: Ended";
