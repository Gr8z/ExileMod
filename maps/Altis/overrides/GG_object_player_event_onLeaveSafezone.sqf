/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle"];
if (alive player) then 
{
	["SafezoneLeave"] call bis_fnc_showNotification;
	removeMissionEventHandler ["Draw3D",ExileSafeZoneEspEH];
	player allowDamage true;
	player removeEventHandler ["Fired",ExileSafeZoneFiredEH];
	player addEventHandler ["HandleDamage",{_this call ExileClient_object_player_event_onHandleDamage}];
	_vehicle enableRopeAttach true;
	_vehicle = vehicle player;
	if !(_vehicle isEqualTo player) then
	{
		if (local _vehicle) then
		{
			_vehicle allowDamage true;
		};
};
ExilePlayerInSafezone = false;
true