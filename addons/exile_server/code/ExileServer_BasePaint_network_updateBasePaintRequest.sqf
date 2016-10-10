/**
 * ExileServer_BasePaint_network_updateBasePaintRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_vehicleNetID","_skinTextures","_playerObject","_vehicleObject","_skinMaterials","_skinClassName","_vehicleID","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleNetID = _parameters select 0;
_skinTextures = _parameters select 1;
try 
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw 1;
	};
	if !(alive _playerObject) then
	{
		throw 2;
	};
	if(_playerObject getVariable ["ExileMutex",false]) then
	{
		throw 12;
	};
	_playerObject setVariable ["ExileMutex",true];
	_vehicleObject = objectFromNetId _vehicleNetID;
	if (isNull _vehicleObject) then
	{
		throw 6;
	};

	_vehicleObject setObjectTextureGlobal [0, _skinTextures];
	_vehicleObject setObjectTextureGlobal [1, _skinTextures];

	_vehicleID = _vehicleObject getVariable ["ExileDatabaseID", -1];
	format["updateConstructionTexture:%1:%2", _skinTextures, _vehicleID] call ExileServer_system_database_query_fireAndForget;
}
catch 
{
	_responseCode = _exception;
	[_sessionID, "purchaseVehicleSkinResponse", [_responseCode, 0]] call ExileServer_system_network_send_to;
};
if !(isNull _playerObject) then 
{
	_playerObject setVariable ["ExileMutex", false];
};
true