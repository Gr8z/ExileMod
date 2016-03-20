/**
 * ExileClient_object_player_event_onEnterSafezone
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 * MODIFIED BY GR8's Anti Steal
 */
 
private["_vehicle","_attachedObjects","_position"];
if (ExilePlayerInSafezone) exitWith { false };
ExilePlayerInSafezone = true;

GG_cancelAction = {
	waitUntil {!isnull (findDisplay 602)};
	closeDialog 0;closeDialog 0;closeDialog 0;
};

GG_onContainerOpened = {
	private["_veh","_unit","_vehicleOwner"];
	_veh = _this select 0;
	_unit = _this select 1;
	_vehicleOwner = _veh getVariable ['GR8owner', objNull];
	_ownerGroup = units group _vehicleOwner;

	systemChat "EVENT HANDLER WORKING";

	if !(_unit in _ownerGroup) then
	{
		_unit action ["CancelAction", _unit];
		spawn GG_cancelAction;
		waitUntil {!isnull (findDisplay 602)};
		closeDialog 0;closeDialog 0;closeDialog 0;
		["Whoops", ["Cannot access gear! You are near another player's vehicle."]] call ExileClient_gui_notification_event_addNotification;
	};
	};

if (alive player) then
{
	player allowDamage false;
	player removeAllEventHandlers "HandleDamage";
};
_vehicle = vehicle player;
if !(_vehicle isEqualTo player) then 
{

	if (local _vehicle) then 
	{
		_vehicle allowDamage false;
	};
	_attachedObjects = attachedObjects _vehicle;
	if !(_attachedObjects isEqualTo []) then 
	{
		_position = getPosATL _vehicle;
		{
			if ((typeOf _x) in ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"]) then 
			{
				detach _x;
				_x setPosATL [(_position select 0) + random 2, (_position select 1) + random 2, 0.05];
				_x setDir (random 360);
			};
		}
		forEach _attachedObjects;
	};
	ExileClientSafeZoneVehicle = _vehicle;
	 // GR8's Anti Steal
	if ((player == driver ExileClientSafeZoneVehicle) && (GG_vehicleEnter)) then {
		ExileClientSafeZoneVehicle setVariable ['GR8owner', player, true];
	};
	GG_onContainerOpenedEventHandler = ExileClientSafeZoneVehicle addEventHandler ["ContainerOpened", {_this call GG_onContainerOpened}];
	 // GR8's Anti Steal
	ExileClientSafeZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call ExileClient_object_player_event_onFiredSafeZoneVehicle}];
};
ExileClientSafeZoneESPEventHandler = addMissionEventHandler ["Draw3D", {20 call ExileClient_gui_safezone_safeESP}];
["SafezoneEnter"] call ExileClient_gui_notification_event_addNotification;
ExileClientSafeZoneUpdateThreadHandle = [1, ExileClient_object_player_thread_safeZone, [], true] call ExileClient_system_thread_addtask;
true