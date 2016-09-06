/*
Xbrm_notifyMembers.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/

private["_objectID","_object","_message","_marker","_flag","_members"];

_objectID = _this select 0;
_object = objectFromNetId _objectID;
_message = _this select 1;
_type = _this select 2;

_flag = nearestObject [position _object, "Exile_Construction_Flag_Static"];
_members = _flag getVariable ["ExileTerritoryBuildRights",[]];

{
	[_objectID, _message, _x, _type] call Xbrm_notifyOwner;
} forEach _members;
