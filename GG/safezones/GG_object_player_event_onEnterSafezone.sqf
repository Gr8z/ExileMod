/*
	ANTI CAMPING SAFEZONES
	BY GR8
	v2.1
*/
 
private["_vehicle"];
if (!isNil "Gr8timer") then { terminate Gr8timer; };
if (!isNil "ExileSafeZoneFiredEH") then { player removeEventHandler ["Fired",ExileSafeZoneFiredEH]; };

["SafezoneEnter"] call ExileClient_gui_notification_event_addNotification;

ExilePlayerInSafezone = true;
ExileSafeZoneEspEH = addMissionEventHandler ["Draw3D",{20 call ExileClient_gui_safezone_safeESP}];
ExileSafeZoneFiredEH = player addEventHandler ["Fired", {_this call ExileClient_gui_safezone_fired}];
player allowDamage false;
player removeAllEventHandlers "HandleDamage";
_vehicle = vehicle player;
if !(_vehicle isEqualTo player) then
{
	if (local _vehicle) then
	{
		_vehicle allowDamage false;
	};		
};
// By Gr8
true