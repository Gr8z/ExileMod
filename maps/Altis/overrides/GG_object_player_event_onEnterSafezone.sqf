/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle"];
["SafezoneEnter"] call bis_fnc_showNotification;
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
	
	if ((_vehicle isKindOf "Helicopter") && (_vehicle getVariable ["ropeAttachEH",-1]) == -1) then 
	{ 
		_ropeEH = _vehicle addEventHandler ["ropeAttach",{ {(_this select 0) ropeDetach _vehicle;}forEach ropes(_this select 0)}]; 
		_vehicle setVariable ["ropeAttachEH",_ropeEH,true]; 
	}	
};
true