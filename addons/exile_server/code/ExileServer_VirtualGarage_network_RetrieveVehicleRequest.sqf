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
  _vehPosX = (_VehicleInfo select 0) select 7;
  _vehPosY = (_VehicleInfo select 0) select 8;
  _vehPosZ = (_VehicleInfo select 0) select 9;
  _vehVectorDirX = (_VehicleInfo select 0) select 10;
  _vehVectorDirY = (_VehicleInfo select 0) select 11;
  _vehVectorDirZ = (_VehicleInfo select 0) select 12;
  _vehVectorUpX = (_VehicleInfo select 0) select 13;
  _vehVectorUpY = (_VehicleInfo select 0) select 14;
  _vehVectorUpZ = (_VehicleInfo select 0) select 15;
  _texture = (_VehicleInfo select 0) select 16;
  [_sessionID,[_vehClass,_vehPinCode,_vehFuel,_vehDamage,_vehHitPoints,_vehicleDBID,_vehPosX,_vehPosY,_vehPosZ,_vehVectorDirX,_vehVectorDirY,_vehVectorDirZ,_vehVectorUpX,_vehVectorUpY,_vehVectorUpZ,_texture]] call ExileServer_VirtualGarage_network_SpawnRequestedVehicle;
} catch {
  [_exception,"Virtual Garage Retrieve Vehicle Error"] call ExileServer_VirtualGarage_utils_diagLog;
}
