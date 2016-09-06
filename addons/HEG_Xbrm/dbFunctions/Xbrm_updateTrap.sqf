/*
Xbrm_updateTrap.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/
 
 
private["_objectID","_containerObject","_containerID","_data","_extDB2Message"];
diag_log format ["[XBRMUPDATETRAP] - passed at %1", time];
_objectID = _this;
_containerObject = objectFromNetId _objectID;
_containerID = _containerObject getVariable ["ExileDatabaseID", -1];
if (_containerID > -1) then
{
	_data =
	[
		_containerObject getVariable ["HegIsTrapped",0],
		_containerID
	];
	_extDB2Message = ["setSafeTraps", _data] call ExileServer_util_extDB2_createMessage;
	_extDB2Message call ExileServer_system_database_query_fireAndForget;
};
true