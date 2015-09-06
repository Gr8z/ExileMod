/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle"];

ExilePlayerInSafezone = false;

if (alive player) then 
{
	["SafezoneLeave"] call ExileClient_gui_notification_event_addNotification;
};
_vehicle = vehicle player;
if !(_vehicle isEqualTo player) then
{
	if (local _vehicle) then
	{
		_vehicle allowDamage true;
	};		
};
removeMissionEventHandler ["Draw3D",ExileSafeZoneEspEH];

if (!isNil "timer30") then { terminate timer30; };

timer30 = [] spawn {
	
	for "_x" from 1 to 30 do {
		if (_x >= 2) then {cutText [format ["PROTECTION ENDING IN %1s", 31-_x], "PLAIN DOWN"];};
		uiSleep 1;
	};
	
	if (!ExilePlayerInSafezone) then {
		player allowDamage true;
		player removeEventHandler ["Fired",ExileSafeZoneFiredEH];
		player addEventHandler ["HandleDamage",{_this call ExileClient_object_player_event_onHandleDamage}];
		
		if (alive player) then 
		{
			["Whoops",["PROTECTION DISABLED"]] call ExileClient_gui_notification_event_addNotification;
		};
	};
};

true