/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_objectNetID","_object","_playerObject","_type","_objectID","_config","_holder"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectNetID = _parameters select 0;
_object = objectFromNetId _objectNetID;
_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
if((_object getVariable ["ExileOwnerUID","Wrong!"]) == (getPlayerUID _playerObject))then
{
	_type = typeOf _object;
	if!(_object isKindOf "Exile_Construction_Abstract_Physics")then
	{
		_objectID = _object getVariable ["ExileDatabaseID",-1];
		if(_objectID != -1)then
		{
			_object call ExileServer_object_construction_database_delete;
			_config = ("(getText(_x >> 'staticObject') isEqualTo _type)" configClasses (configFile >> "CfgConstruction")) select 0;
			_config = getText (_config >> "kitMagazine");
			_holder = createVehicle ["groundWeaponHolder", getPosATL _playerObject, [], 0, "CAN_COLLIDE"];
			_holder addMagazine [_config,1];
			[_sessionID,"notificationRequest",["Success",["Deconstructed"]]] call ExileServer_system_network_send_to;
		};
	};
	deleteVehicle _object;
};
true