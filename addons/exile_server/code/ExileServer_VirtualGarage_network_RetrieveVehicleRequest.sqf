/*

    Name: ExileServer_VirtualGarage_network_RetrieveVehicleRequest.sqf
 	  Author(s): Shix
    Copyright (c) 2016 Shix
    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 	  Description: handles retrieve vehicle requests
*/
private ["_sessionID","_vehicleDBID","_player","_VehicleInfo","_vehClass","_vehFuel","_vehDamage","_vehHitPoints","_vehPinCode"];
_sessionID = _this select 0;
_vehicleDBID = (_this select 1) select 0;
try
{
  _player = _sessionID call ExileServer_system_session_getPlayerObject;
  if (isNull _player) then
  {
    throw "No player was found from the session ID";
  };
  _VehicleInfo = format ["RetrieveVehicle:%1", _vehicleDBID] call ExileServer_system_database_query_selectFull;
  _vehClass = (_VehicleInfo select 0) select 1;
  _vehFuel = (_VehicleInfo select 0) select 3;
  _vehDamage = (_VehicleInfo select 0) select 4;
  _vehHitPoints = (_VehicleInfo select 0) select 5;
  _vehPinCode = (_VehicleInfo select 0) select 6;

  [_sessionID,[_vehClass,_vehPinCode,_vehFuel,_vehDamage,_vehHitPoints,_vehicleDBID]] call ExileServer_VirtualGarage_network_SpawnRequestedVehicle;
} catch {
  [_exception,"Virtual Garage Retrieve Vehicle Error"] call ExileServer_VirtualGarage_utils_diagLog;
}
