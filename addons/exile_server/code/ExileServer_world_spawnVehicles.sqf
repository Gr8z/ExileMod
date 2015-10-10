/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_mapsizeX","_mapsizeY","_gridSize","_gridVehicles","_gridSizeOffset","_vehicleCount","_debugMarkers","_vehicleClassNames","_maximumDamage","_damageChance","_xSize","_workingXSize","_ySize","_workingYSize","_position","_spawned","_spawnedPositions","_positionReal","_spawnControl","_vehicleClassName","_vehicle","_hitpoints","_debugMarker"];
_mapsizeX = worldSize; 
_mapsizeY = worldSize; 
_gridSize = getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "vehiclesGridSize");
_gridVehicles = getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "vehiclesGridAmount");
format ["Spawning Dynamic Vehicles. GridSize: %1 Vehs/Grid : %2",_gridSize,_gridVehicles] call ExileServer_util_log;
_gridSizeOffset = _gridSize % 2;
_vehicleCount = 0;
_debugMarkers = ((getNumber(configFile >> "CfgSettings" >> "VehicleSpawn" >> "vehiclesDebugMarkers")) isEqualTo 1);
_vehicleClassNames = getArray (configFile >> "CfgSettings" >> "VehicleSpawn" >> "ground");
_maximumDamage = getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "maximumDamage");
_damageChance = getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "damageChance");
for "_xSize" from 0 to _mapsizeX step _gridSize do
{
	_workingXSize = _xSize + _gridSizeOffset;
	for "_ySize" from 0 to _mapsizeY step _gridSize do
	{
		_workingYSize = _ySize + _gridSizeOffset;
		_position = [_workingXSize,_workingYSize];
		_spawned = 0;
		_spawnedPositions = [];
		while {_spawned < _gridVehicles} do 
		{
			_positionReal = [_position, 25, _gridSize, 5, 0 , 1 , 0 , _spawnedPositions] call BIS_fnc_findSafePos;
			if(count _positionReal isEqualTo 3)exitWith{};
			_spawnControl = [[(_positionReal select 0) - 50, (_positionReal select 1) + 50],[(_positionReal select 0) + 50,(_positionReal select 1) - 50]];
			_spawnedPositions pushBack _spawnControl;
			_positionReal pushBack 0;
			_vehicleClassName = _vehicleClassNames select (floor (random (count _vehicleClassNames)));
			_vehicle = [_vehicleClassName, _positionReal, random 360, true] call ExileServer_object_vehicle_createNonPersistentVehicle;
			_hitpoints = _vehicleClassName call ExileClient_util_vehicle_getHitPoints;
			{
			    if ((random 100) < _damageChance) then
			    {
			        _vehicle setHitPointDamage [_x, random _maximumDamage];
			    };
			}
			forEach _hitpoints;
			if (_debugMarkers) then
			{
				_debugMarker = createMarker ["vehicleMarker#"+str _vehicleCount, _positionReal];
				_debugMarker setMarkerColor "ColorOrange";
				_debugMarker setMarkerType "mil_dot_noShadow";
			};
			_spawned = _spawned + 1;
			_vehicleCount = _vehicleCount + 1;
		};
	};
};
format ["Dynamic vehicles spawned. Count : %1",_vehicleCount] call ExileServer_util_log;

if (!isServer) exitWith{};
private["_ExileTraderZone","_position","_radius","_vehicleArray","_vehicleUnlocked","_vehicleUnlockedTotal","_unLockVehiclesInTradeZone"];
_unLockVehiclesInTradeZone = getNumber (configFile >> "CfgSettings" >> "Init" >> "unLockVehiclesInTradeZone");
_unLockVehiclesInTradeZone = 1; //1 to enable 0 to disable
if(_unLockVehiclesInTradeZone isEqualTo 1) then
{
	_vehicleUnlockedTotal = 0;
	{
		_ExileTraderZone = _x;
		if (getMarkerType _ExileTraderZone isEqualTo "ExileTraderZone") then
		{
			_vehicleUnlocked    = 0;
			_position          = getMarkerPos _ExileTraderZone;
			_radius            = getMarkerSize _ExileTraderZone;

			_vehicleArray = _position nearEntities[["Motorcycle","Car","Tank","Helicopter_Base_F","Plane_Base_F"], _radius select 0];
			{
				private["_vehicleObject","_vehicleClass","_vehicleKindOfExile"];
				_vehicleObject = _x;

				if (_vehicleObject getVariable "ExileIsLocked" isEqualTo -1) then
				{
					format ["ExileServer - Unlocking vehicle beloning to UID: %1 / TRADER: %3 / CLASS: (%2)", _vehicleObject getVariable "ExileOwnerUID", typeOf _vehicleObject, _ExileTraderZone] call ExileServer_util_log;
					_vehicleObject setVariable ["ExileIsLocked", 0, true];
					_vehicleObject lock 0;
					_vehicleUnlocked = _vehicleUnlocked + 1;
				};
				true
			}
			count _vehicleArray;			
			_vehicleUnlockedTotal = _vehicleUnlockedTotal + _vehicleUnlocked;
			format ["ExileServer - %1 Vehicle unlocked in %2", _vehicleUnlocked, _ExileTraderZone] call ExileServer_util_log;
		};
		true
	} count allMapMarkers;	
	format ["ExileServer - Total unlocked vehicle: %1", _vehicleUnlockedTotal] call ExileServer_util_log;
} else 
{
	format ["ExileServer - traderzone vehicle cleanup deactivated! setting: %1", _unLockVehiclesInTradeZone] call ExileServer_util_log;
};

true