/*	XM8 territory app by
	
	-Script description-
*/

private ["_flag","_buildRights","_nearFlags","_msg"];
_nearFlags = (nearestObjects [player,["Exile_Construction_Flag_Static"],150]);
XM8_territory_flag = objNull;
if (count _nearFlags == 0) exitWith {
	_msg = "No flags nearby!";
	["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
};
{
	_flag = _x;
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if ((getPlayerUID player) in _buildRights) exitWith {
		XM8_territory_flag = _flag;
		["territorySlide", 0] call ExileClient_gui_xm8_slide;
	};
} forEach _nearFlags;

if (isNull XM8_territory_flag) then {
	_msg = "You must be near your territory!";
	["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
};






