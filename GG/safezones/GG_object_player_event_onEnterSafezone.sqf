/*
	ANTI CAMPING SAFEZONES
	BY GR8
	v1.1
*/
 
private["_vehicle"];

if (!isNil "Gr8timer") then { terminate Gr8timer; };
if (!isNil "ExileClientSafeZoneVehicleFiredEventHandler") then { 
	if !(isNull ExileClientSafeZoneVehicle) then
	{
		ExileClientSafeZoneVehicle removeEventHandler ["Fired", ExileClientSafeZoneVehicleFiredEventHandler];	
		ExileClientSafeZoneVehicle = objNull;
		ExileClientSafeZoneVehicleFiredEventHandler = nil;
	}; 
};

if (ExilePlayerInSafezone) exitWith { false };
ExilePlayerInSafezone = true;

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
			detach _x;
			_x setPosATL [(_position select 0) + random 2, (_position select 1) + random 2, 0.05];
			_x setDir (random 260);
		}
		forEach _attachedObjects;
	};
	ExileClientSafeZoneVehicle = _vehicle;
	ExileClientSafeZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call ExileClient_object_player_event_onFiredSafeZoneVehicle}];
};
ExileClientSafeZoneESPEventHandler = addMissionEventHandler ["Draw3D", {20 call ExileClient_gui_safezone_safeESP}];
["SafezoneEnter"] call ExileClient_gui_notification_event_addNotification;
["Whoops",["DO NOT PARK VEHICLES OVER RESTARTS"]] call ExileClient_gui_notification_event_addNotification;
SystemChat "! WARNING : DO NOT LEAVE YOUR VEHICLES IN SAFEZONES OVER A RESTART. THEY WILL BE UNLOCKED !";
ExileClientSafeZoneUpdateThreadHandle = [1, ExileClient_object_player_thread_safeZone, [], true] call ExileClient_system_thread_addtask;
// By Gr8
true