/*
Xbrm_notifyOwner.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/

private["_objectID","_object","_messageStart","_message","_marker","_ownerUID","_type"];

_objectID = _this select 0;
_object = objectFromNetId _objectID;
_pos = mapGridPosition _object;
_messageStart = _this select 1;
_message = format ["%1%2",_messageStart, _pos];
_ownerUID = _this select 2;
_type = _this select 3;

if(_ownerUID == "") then {
	_ownerUID = _object getVariable ["ExileOwnerUID", ""];
};

_owner = objNull;
{
	if(_ownerUID isEqualTo getPlayerUID _x) then {
		_owner = _x;
	};
} forEach allPlayers;

switch (_type) do
{
	case "attempt":
	{
		if !(isNull _owner) then {
			[_owner, "toastRequest", ["ErrorTitleOnly", [_message]]] call ExileServer_system_network_send_to;
		};
	};
	case "complete":
	{
		if !(isNull _owner) then {
			[_owner, "toastRequest", ["ErrorTitleOnly", [_messageStart]]] call ExileServer_system_network_send_to;
		};
	};
};