/*
Xbrm_dbLogRaid.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/

private["_objectID","_object","_player","_object_type","_type"];

_objectID = _this select 0;
_object = objectFromNetId _objectID;
_player = _this select 1;
_object_type = _this select 2;
_type = _this select 3;

_object_owner = _object getVariable ["ExileOwnerUID",""];
_object_thief = getPlayerUID _player;
_territory_id = 0;
_position = getPosATL _object;
_data =
[
	_object_owner,
	_object_thief,
	_territory_id,
	_position select 0,
	_position select 1,
	_position select 2,
	typeOf(_object),
	_type,
	_object_type
];
_extDB2Message = ["saveLockpickUsage", _data] call ExileServer_util_extDB2_createMessage;
_territoryID = _extDB2Message call ExileServer_system_database_query_insertSingle;