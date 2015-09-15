/*
	infiSTAR: fixed deconstruct of objects (adding items now correctly) - addItemCargoGlobal instead of addmagazine (addmagazine wasn't working, locality issues (or not a magazine?))
*/
private["_sessionID","_parameters","_objectNetID","_object","_playerObject","_radius","_flags","_flag","_build","_type","_objectID","_config","_holder"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectNetID = _parameters select 0;
_object = objectFromNetId _objectNetID;
_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
_radius = getArray(missionConfigFile >> "CfgTerritories" >> "prices");
_radius = (_radius select ((count _radius) -1)) select 1;
_flags = _playerObject nearObjects ["Exile_Construction_Flag_Static", _radius * 2];
_flag = _flags select 0;
_build_rights = _flag getVariable ["ExileTerritoryBuildRights",[]];
if((getPlayerUID _playerObject) in _build_rights)then
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
			_holder addItemCargoGlobal [_config,1];
			[_sessionID,"notificationRequest",["Success",["Deconstructed"]]] call ExileServer_system_network_send_to;
		};
	};
	clearBackpackCargoGlobal _object;
	clearItemCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearWeaponCargoGlobal _object;
	deleteVehicle _object;
};
true