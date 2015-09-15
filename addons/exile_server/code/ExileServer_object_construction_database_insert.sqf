/*
	infiSTAR: fixed grims databese to database (ExileServer_object_construction_database_delete)
*/
private["_constructionObject","_position","_vectorDirection","_vectorUp","_data","_extDB2Message","_constructionID"];
_constructionObject = _this;
_position = getPosATL _constructionObject;
_vectorDirection = vectorDir _constructionObject;
_vectorUp = vectorUp _constructionObject;
_data =
[
	typeOf _constructionObject,
	_constructionObject getVariable ["ExileOwnerUID", ""],
	_position select 0,
	_position select 1,
	_position select 2,
	_vectorDirection select 0,
	_vectorDirection select 1,
	_vectorDirection select 2,
	_vectorUp select 0,
	_vectorUp select 1,
	_vectorUp select 2
];
_extDB2Message = ["insertConstruction", _data] call ExileServer_util_extDB2_createMessage;
_constructionID = _extDB2Message call ExileServer_system_database_query_insertSingle;
_constructionObject setVariable ["ExileDatabaseID", _constructionID];
_constructionObject addMPEventHandler ["MPKilled",{if!(isServer)exitWith{}; (_this select 0) call ExileServer_object_construction_database_delete}];
_constructionID