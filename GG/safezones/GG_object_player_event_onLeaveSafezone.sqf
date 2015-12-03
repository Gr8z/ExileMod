/*
	ANTI CAMPING SAFEZONES
	BY GR8
	v2.1
*/
 
private["_vehicle"];

ExilePlayerInSafezone = false;

if !(isNil "ExileClientSafeZoneUpdateThreadHandle") then 
{
	[ExileClientSafeZoneUpdateThreadHandle] call ExileClient_system_thread_removeTask;
	ExileClientSafeZoneUpdateThreadHandle = nil;
};

if (alive player) then 
{
	["SafezoneLeave"] call ExileClient_gui_notification_event_addNotification;
};

if !(GodMode) then {
	player allowDamage true;
	player addEventHandler ["HandleDamage",{_this call ExileClient_object_player_event_onHandleDamage}];
};

if (CanShoot) then {
	player removeEventHandler ["Fired",ExileSafeZoneFiredEH];
	_vehicle = vehicle player;
	if (!isNil ExileClientSafeZoneVehicleFiredEventHandler) then {vehicle player removeEventHandler ["Fired",ExileClientSafeZoneVehicleFiredEventHandler];};
};
	

if !(ProtectVehicles) then {
	_vehicle = vehicle player;
	if !(_vehicle isEqualTo player) then
	{
		if (local _vehicle) then
		{
			_vehicle allowDamage true;
		};		
	};
};

if (LooseRespect) then {
	player setVariable["Gr8Protection", true, true];
};

if !(isNil "ExileClientSafeZoneESPEventHandler") then 
{
	removeMissionEventHandler ["Draw3D", ExileClientSafeZoneESPEventHandler];
	ExileClientSafeZoneESPEventHandler = nil;
};

if (!isNil "Gr8timer") then { terminate Gr8timer; };

Gr8timer = [] spawn {
	
	
	for "_x" from 1 to TimerSecs do {
		if (ShowTime) then {if (_x >= 2) then {cutText [format ["PROTECTION ENDING IN %1s", TimerSecs+1-_x], "PLAIN DOWN"];};};
		uiSleep 1;
	};
	
	if (LooseRespect) then {
		player setVariable["Gr8Protection", false, true];
	};
	
	if (!ExilePlayerInSafezone) then {
		if !(CanShoot) then {
			player removeEventHandler ["Fired",ExileSafeZoneFiredEH];
			if (!isNil ExileClientSafeZoneVehicleFiredEventHandler) then {vehicle player removeEventHandler ["Fired",ExileClientSafeZoneVehicleFiredEventHandler];};
		};
		if (GodMode) then {
			player allowDamage true;
			player addEventHandler ["HandleDamage",{_this call ExileClient_object_player_event_onHandleDamage}];
		};	
		if (ProtectVehicles) then {
			_vehicle = vehicle player;
			if !(_vehicle isEqualTo player) then
			{
				if (local _vehicle) then
				{
					_vehicle allowDamage true;
				};		
			};
		};
		if (alive player) then 
		{
			["Whoops",["PROTECTION DISABLED"]] call ExileClient_gui_notification_event_addNotification;
		};
	};
};
// By Gr8
true