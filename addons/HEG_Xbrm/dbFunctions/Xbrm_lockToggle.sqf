/*
Xbrm_lockToggle.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/
 
 
private["_objectID","_type","_object","_objectDbID","_data","_extDB2Message"];

diag_log format ["[XBRMLOCKTOGGLE] - passed at %1", time];
_objectID = _this select 0;
_type = _this select 1;
_object = objectFromNetId _objectID;
_objectDbID = _object getVariable ["ExileDatabaseID", -1];
if (_objectDbID > -1) then
{
	switch (_type) do
	{
		case "door":
		{
			_data =
			[
				_object getVariable ["ExileIsLocked",-1],
				_objectDbID
			];
			_extDB2Message = ["updateLock", _data] call ExileServer_util_extDB2_createMessage;
			_extDB2Message call ExileServer_system_database_query_fireAndForget;
		};
		case "safe":
		{
			_data =
			[
				_object getVariable ["ExileIsLocked",-1],
				_objectDbID
			];
			_extDB2Message = ["updateContainerLock", _data] call ExileServer_util_extDB2_createMessage;
			_extDB2Message call ExileServer_system_database_query_fireAndForget;
		};
	};
};
true