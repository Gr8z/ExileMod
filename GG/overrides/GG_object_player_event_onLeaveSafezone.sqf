/**
 * ExileClient_object_player_event_onLeaveSafezone
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 * MODIFIED BY GR8's Anti Steal
 */
 
private["_vehicle"];
if !(ExilePlayerInSafezone) exitWith { false };
ExilePlayerInSafezone = false;
if !(isNil "ExileClientSafeZoneUpdateThreadHandle") then 
{
	[ExileClientSafeZoneUpdateThreadHandle] call ExileClient_system_thread_removeTask;
	ExileClientSafeZoneUpdateThreadHandle = nil;
};
player allowDamage true;
player addEventHandler ["HandleDamage", {_this call ExileClient_object_player_event_onHandleDamage}];
if !(isNull ExileClientSafeZoneVehicle) then
{
	if (local ExileClientSafeZoneVehicle) then 
	{
		ExileClientSafeZoneVehicle allowDamage true;
		ExileClientSafeZoneVehicle setVariable ['GR8owner', objNull, true];
	};
	ExileClientSafeZoneVehicle removeEventHandler ["Fired", ExileClientSafeZoneVehicleFiredEventHandler];	
	ExileClientSafeZoneVehicle = objNull;
	ExileClientSafeZoneVehicleFiredEventHandler = nil;
};
_vehicle = vehicle player; 
if !(_vehicle isEqualTo player) then 
{
	if (local _vehicle) then 
	{
		_vehicle allowDamage true;
	};
};
if !(isNil "ExileClientSafeZoneESPEventHandler") then 
{
	removeMissionEventHandler ["Draw3D", ExileClientSafeZoneESPEventHandler];
	ExileClientSafeZoneESPEventHandler = nil;
};
if (alive player) then 
{
	["SafezoneLeave"] call ExileClient_gui_notification_event_addNotification;
};
true