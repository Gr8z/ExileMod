/**
 * GG_onContainerOpened
 * MADE BY GR8's Anti Steal
 */
 
private["_openedContainer","_unit","_vehicleOwner"];
_openedContainer = _this select 0;
_unit = _this select 1;
_vehicleOwner = _openedContainer getVariable ['GR8owner', objNull];
if (GG_vehicleGroup) then {_ownerGroup = units group _vehicleOwner;} else {_ownerGroup = _vehicleOwner;};

if !(_unit in _ownerGroup) then
{
	_unit action ["CancelAction", _unit];
	["Whoops", ["Cannot access gear! You are near another player's vehicle."]] call ExileClient_gui_notification_event_addNotification;
};