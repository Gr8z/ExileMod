/** ROAMING TRADER by JohnO **/
// Trader vehicle handling added by second_coming 

diag_log format['[OCCUPATION:Vehicle] Started'];

if (!isServer) exitWith {};

if(liveVehicles >= maxNumberofVehicles) exitWith {};

_vehiclesToSpawn = (maxNumberofVehicles - liveVehicles);
_middle = worldSize/2;
_spawnCenter = [_middle,_middle,0];
_maxDistance = _middle;

_locations = (nearestLocations [_spawnCenter, ["NameVillage","NameCity", "NameCityCapital"], _maxDistance]);
_i = 0;
{
	_okToUse = true;
	_pos = position _x;	
	_nearestMarker = [allMapMarkers, _pos] call BIS_fnc_nearestPosition; // Nearest Marker to the Location		
	_posNearestMarker = getMarkerPos _nearestMarker;
	if(_pos distance _posNearestMarker < 2500) exitwith { _okToUse = false; };

	if(!_okToUse) then
	{
		_locations deleteAt _i;
	};
	_i = _i + 1;

} forEach _locations;

for "_j" from 1 to _vehiclesToSpawn do
{
	private["_group"];
	_Location = _locations call BIS_fnc_selectRandom; 
	_position = position _Location;	
	_pos = [_position,10,100,5,0,20,0] call BIS_fnc_findSafePos;
	_spawnLocation = [_pos select 0, _pos select 1, 150];
	
	// Get position of nearest roads
	_nearRoads = _spawnLocation nearRoads 500;
	_nearestRoad = _nearRoads select 0;
	_nearestRoad = position (_nearRoads select 0);
	
	_group = createGroup east;
	_vehicleObject = [ [_nearestRoad], _group, "assault", "difficult", "bandit",VehicleClassToUse ] call DMS_fnc_SpawnAIVehicle;
	_vehicleObject addEventHandler ["killed", "liveVehicles = liveVehicles - 1;"];
	_vehicleObject setSpeedMode "Normal";
	_vehicleObject limitSpeed 60;
	_vehicleObject action ["LightOn", _vehicleObject];	
	[_group, _spawnLocation, 2000] call bis_fnc_taskPatrol;
	_group setBehaviour "AWARE";
	_group setCombatMode "RED";

	liveVehicles = liveVehicles + 1;	
};


diag_log format['[OCCUPATION:Vehicle] Running'];
