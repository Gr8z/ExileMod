/** ROAMING TRADER by JohnO **/
// Trader vehicle handling added by second_coming 

diag_log format['[OCCUPATION:Sky] Started'];

if (!isServer) exitWith {};

if(liveHelis >= maxNumberofHelis) exitWith {};

_vehiclesToSpawn = (maxNumberofHelis - liveHelis);
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

for "_i" from 1 to _vehiclesToSpawn do
{
   private["_group"];
   _Location = _locations call BIS_fnc_selectRandom;
   
   _position = position _Location;	
   _spawnLocation = [_position select 0, _position select 1, 500];


	_group = createGroup east;
	_vehicle1 = [ [_spawnLocation], _group, "assault", "difficult", "bandit", HeliClassToUse ] call DMS_fnc_SpawnAIVehicle;
	_vehicle1 setVehiclePosition [_spawnLocation, [], 0, "FLY"];
	_vehicle1 setVariable ["vehicleID", _spawnLocation, true];  
	_vehicle1 setFuel 1;
	_vehicle1 engineOn true;
	_vehicle1 flyInHeight 150;
	[_group, _spawnLocation, 2000] call bis_fnc_taskPatrol;
	_group setBehaviour "AWARE";
	_group setCombatMode "RED";
	liveHelis = liveHelis + 1;
	_vehicle1 addEventHandler ["killed", "liveHelis = liveHelis - 1;"];
	diag_log format['[OCCUPATION:Vehicle] Vehicle spawned @ %1',_spawnLocation];	
	sleep 5;
	
};


diag_log format['[OCCUPATION:Sky] Running'];
