/**
 * GG_onContainerOpened
 * MADE BY GR8's Anti Steal
 */
 
private["_veh","_unit","_vehicleOwner"];
_veh = _this select 0;
_unit = _this select 1;
_vehicleOwner = _veh getVariable ['GR8owner', objNull];
_ownerGroup = units group _vehicleOwner;

systemChat "EVENT HANDLER WORKING";

if !(_unit in _ownerGroup) then
{
	_unit action ["CancelAction", _unit];
	(findDisplay 602) closedisplay 0;
	closeDialog 0;closeDialog 0;closeDialog 0;
	["Whoops", ["Cannot access gear! You are near another player's vehicle."]] call ExileClient_gui_notification_event_addNotification;
};