/*
© 2015 Zenix Gaming Ops
Developed by Rod-Serling
Co-Developed by Vishpala

All rights reserved.

Function:
	AVS_fnc_refuelVehicle - Responds to a player's request to rearm a vehicle.
	Handles notifications, money transactions, and having the clients update the fuel state.

Usage (from the client):
	[sessionID, _vehicle,] remoteExec [AVS_fnc_refuelVehicle, 2];
Return Value:
	None
*/

private ["_owner", "_playerMoney", "_rearmCost"];

_OK = params
[
	["_sessionID", "", [""]],
	["_vehicle", objNull, [objNull]]
];

if (!_OK) exitWith
{
	diag_log format ["AVS Error: Calling AVS_fnc_refuelVehicle with invalid parameters: %1",_this];
};

_owner = _sessionID call ExileServer_system_session_getPlayerObject;
_playerMoney = _owner getVariable ["ExileMoney", 0];

_refuelCost = _vehicle call AVS_fnc_getRefuelCost;

if (_playerMoney < _refuelCost) exitWith
{
	[_owner, "notificationRequest", ["Whoops", ["You don't have enough poptabs!"]]] call ExileServer_system_network_send_to;
};

[_vehicle] remoteExec ["AVS_fnc_refuelVehicleClient", _vehicle];

_playerMoney = _playerMoney - _refuelCost;
_owner setVariable ["ExileMoney", _playerMoney];
format["setAccountMoney:%1:%2", _playerMoney, (getPlayerUID _owner)] call ExileServer_system_database_query_fireAndForget;
[_playerMoney] remoteExec ["AVS_fnc_setPlayerMoney", _owner];

{
	[_x, "notificationRequest", ["Success", ["Vehicle refueled!"]]] call ExileServer_system_network_send_to;
}
forEach crew _vehicle;

_vehicle call ExileServer_object_vehicle_database_update;