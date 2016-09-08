/*
	CONFIG
*/
_XG_updateTimer = 10; //default is 10 minutes.
_XG_countOfKills = 20; //default is 20 recent kills


/*
	CODE DO NOT TOUCH!
*/
XG_killBoard = format["XG_FetchLogKill:%1",_XG_countOfKills] call ExileServer_system_database_query_selectFull;
publicVariable "XG_killBoard";

_code =
{
	_XG_countOfKills = _this select 0;
	XG_killBoard = format["XG_FetchLogKill:%1",_XG_countOfKills] call ExileServer_system_database_query_selectFull;
	diag_log str XG_killBoard;
	publicVariable "XG_killBoard";
};
_timer = (_XG_updateTimer * 60);
[_timer,_code,[_XG_countOfKills],true] call ExileServer_system_thread_addTask;