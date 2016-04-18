/*

 	Name: ExileServer_VirtualGarage_network_SpawnRequestedVehicle.sqf
 	Author(s): Shix
  	Copyright (c) 2016 Shix
  	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
  	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 	Description: handles spawn Vehicle Requests
*/
private["_sessionID","_parameters","_vehicleClass","_pinCode","_vehicleFuel","_vehicleDamage","_vehicleHitPoints","_vehicleDatabaseID","_playerObject","_salesPrice","_playerMoney","_position","_vehicleObject","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleClass = _parameters select 0;
_pinCode = _parameters select 1;
_vehicleFuel = _parameters select 2;
_vehicleDamage = _parameters select 3;
_vehicleHitPoints = _parameters select 4;
_vehicleDatabaseID = _parameters select 5;
_vehiclePosX = _parameters select 6;
_vehiclePosY = _parameters select 7;
_vehiclePosZ = _parameters select 8;
_vehicleVectorDirX = _parameters select 9;
_vehicleVectorDirY = _parameters select 10;
_vehicleVectorDirZ = _parameters select 11;
_vehicleVectorUpX = _parameters select 12;
_vehicleVectorUpY = _parameters select 13;
_vehicleVectorUpZ = _parameters select 14;
_textures = _parameters select 15;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "The is no player";
	};
	if !(alive _playerObject) then
	{
		throw "The player is dead";
	};
	if !((count _pinCode) isEqualTo 4) then
	{
		throw "The pin code is does not equal 4 chars";
	};
	_position = (getPos _playerObject) findEmptyPosition [20, 175, _vehicleClass];
	_direction = (random 360);
	_SpawnPos = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_VehicleSpawnPos");
	if (_SpawnPos == 1) then {
	    _position = [_vehiclePosX,_vehiclePosY,_vehiclePosZ];
		_direction = [[_vehicleVectorDirX,_vehicleVectorDirY,_vehicleVectorDirZ],[_vehicleVectorUpX,_vehicleVectorUpY,_vehicleVectorUpZ]];
	};
	if (_position isEqualTo []) then
	{
			throw "Position is not defined";
	};
	_vehicleObject = [_vehicleClass, _position, _direction, true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
	_vehicleObject setVariable ["ExileOwnerUID", (getPlayerUID _playerObject)];
	for '_i' from 0 to (count _textures)-1 do {
		_tex = _textures select _i;
	    _vehicleObject setObjectTextureGlobal [_i, _tex];
	};
	_vehSpawnState = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_VehicleSpawnState");
	if (_vehSpawnState == 1) then
	{
		_vehicleObject setVariable ["ExileIsLocked",1,true];
		_vehicleObject lock 2;
	};
	_vehicleObject setFuel _vehicleFuel;
	_vehicleObject setDamage _vehicleDamage;
	_reapplyDamage = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_ReapplyDamage");
	if (_reapplyDamage == 1) then
	{
		if ((typeName _vehicleHitPoints) isEqualTo "ARRAY") then
		{
			{
				_vehicleObject setHitPointDamage [_x select 0, _x select 1];
			}forEach _vehicleHitPoints;
		};
	};
	_GivePlayerPinCode = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_GivePlayerPinCode");
	if (_GivePlayerPinCode == 1) then {
		_msg = Format["Vehicle Successfully Retrieved PIN Code:%1",_pinCode];
		[_sessionID, "notificationRequest", ["Success", [_msg]]] call ExileServer_system_network_send_to;
	}
	else
	{
		_msg = Format["Vehicle Successfully Retrieved"];
		[_sessionID, "notificationRequest", ["Success", [_msg]]] call ExileServer_system_network_send_to;
	};
	_vehicleObject call ExileServer_object_vehicle_database_insert;
	_vehicleObject call ExileServer_object_vehicle_database_update;
	[_sessionID, "RetrieveVehicleResponse", ["true",netId _vehicleObject]] call ExileServer_system_network_send_to;
	format ["deleteVehicleFromVG:%1", _vehicleDatabaseID] call ExileServer_system_database_query_fireAndForget;
	_vehicleDBID = _vehicleObject getVariable ["ExileDatabaseID",0];
	_skinTextures = getObjectTextures _vehicleObject;
	format["updateVehicleSkin:%1:%2", _skinTextures, _vehicleDBID] call ExileServer_system_database_query_fireAndForget;
}
catch
{
	[_exception,"Virtual Garage Spawn Vehicle Error"] call ExileServer_VirtualGarage_utils_diagLog;
  	[_sessionID, "RetrieveVehicleResponse", ["false",_vehicleObject]] call ExileServer_system_network_send_to;
};
