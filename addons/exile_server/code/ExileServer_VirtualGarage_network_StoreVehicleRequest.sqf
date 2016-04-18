/*

 	Name: ExileServer_VirtualGarage_network_StoreVehicleRequest.sqf
 	Author(s): Shix
    Copyright (c) 2016 Shix
    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 	Description: Handles store Vehicle Requests
*/
private ["_sessionID","_vehNetID","_ownerUID","_vehicle","_player","_hitpoints","_vehicleHitpoints","_vehicleDBID","_pincode","_fuel","_damage","_vehicleID"];
_sessionID = _this select 0;
_vehNetID = (_this select 1) select 0;
_ownerUID = (_this select 1) select 1;
try
{
  _vehicle = objectFromNetId _vehNetID;
  _player = _sessionID call ExileServer_system_session_getPlayerObject;
  if(isNull _vehicle)then
  {
    throw "No vehicle found from NetID";
  };
  if (isNull _player) then
  {
    throw "No player was found from the session ID";
  };
  if !(alive _player) then
  {
    throw "The player is dead .... Dead Means dead you cant do shit when you're dead";
  };
  if !((owner _vehicle) isEqualTo (owner _player)) then
  {
    throw "The player does not own the vehicle";
  };
  if(_vehicle getVariable "ExileIsPersistent" isEqualTo false) then
  {
    throw "You Can Not Store None Persistent Vehicles";
  };
  _hitpoints = getAllHitPointsDamage _vehicle;
  _vehicleHitpoints = [];
  if!(_hitpoints isEqualTo [])then
  {
    {
      _vehicleHitpoints pushBack [_x ,_vehicle getHitPointDamage _x];
    }forEach (_hitpoints select 0);
  };
  _vehicleDBID = _vehicle getVariable ["ExileDatabaseID",0];
  _pincode = _vehicle getVariable ["ExileAccessCode",""];
  _fuel = fuel _vehicle;
  _damage = damage _vehicle;
  _position = getPosATL _vehicle;
  _vectorDirection = vectorDir _vehicle;
  _vectorUp = vectorUp _vehicle;
  _textures = getObjectTextures _vehicle;
  _data =
  [
  	typeOf _vehicle,
  	_ownerUID,
  	_fuel,
  	_damage,
  	_vehicleHitpoints,
  	_pincode,
  	_position select 0,
  	_position select 1,
  	_position select 2,
  	_vectorDirection select 0,
  	_vectorDirection select 1,
  	_vectorDirection select 2,
  	_vectorUp select 0,
    _vectorUp select 1,
    _vectorUp select 2,
    _textures
  ];
  _extDB2Message = ["insertVehicleToVG", _data] call ExileServer_util_extDB2_createMessage;
  _vehicleID = _extDB2Message call ExileServer_system_database_query_selectFull;
  deleteVehicle _vehicle;
  [_sessionID,"StoreVehicleResponse",["true"]] call ExileServer_system_network_send_to;
  format ["deleteVehicle:%1", _vehicleDBID] call ExileServer_system_database_query_fireAndForget;
} catch {
  [_exception,"Virtual Garage Store Vehicle Error"] call ExileServer_VirtualGarage_utils_diagLog;
  [_sessionID,"StoreVehicleResponse",["false"]] call ExileServer_system_network_send_to;
};
