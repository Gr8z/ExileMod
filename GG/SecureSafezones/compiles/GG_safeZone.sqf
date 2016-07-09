/**
 * ExileClient_object_player_thread_safeZone
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 * MODIFIED BY GR8's Anti Steal
 */
 
private["_vehicle","_playerDriver","_vehicleOwner","_ownerGroup","_friends","_near","_around","_countNear","_countNearMine"];
_vehicle = vehicle player;
if (!ExilePlayerInSafezone) exitWith {false}; 
if (_vehicle isEqualTo player) then 
{
	if !(isNull ExileClientSafeZoneVehicle) then
	{
		ExileClientSafeZoneVehicle removeEventHandler ["Fired", ExileClientSafeZoneVehicleFiredEventHandler];	
		ExileClientSafeZoneVehicle = objNull;
		ExileClientSafeZoneVehicleFiredEventHandler = nil;
	};
}
else 
{
	if (local _vehicle) then 
	{
		_vehicle allowDamage false;
	};
	if !(_vehicle isEqualTo ExileClientSafeZoneVehicle) then 
	{
		if !(isNull ExileClientSafeZoneVehicle) then 
		{
			ExileClientSafeZoneVehicle removeEventHandler ["Fired", ExileClientSafeZoneVehicleFiredEventHandler];	
			ExileClientSafeZoneVehicle = objNull;
			ExileClientSafeZoneVehicleFiredEventHandler = nil;
		};
		ExileClientSafeZoneVehicle = _vehicle;
		ExileClientSafeZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call ExileClient_object_player_event_onFiredSafeZoneVehicle}];

		// GR8's Anti Steal
		if (GG_vehicleSteal) then {
			_playerDriver = player == driver ExileClientSafeZoneVehicle;
			_vehicleOwner = ExileClientSafeZoneVehicle getVariable ['GR8owner', objNull];
			if (GG_vehicleGroup) then {_ownerGroup = units group _vehicleOwner;} else {_ownerGroup = _vehicleOwner;};
			if (isNull _vehicleOwner) then {
				if (GG_vehicleClaim) then {
					if (_playerDriver) then {
						ExileClientSafeZoneVehicle setVariable ['GR8owner', player, true]; _vehicleOwner = player;
					} else {
						if !(player in _ownerGroup) then {
							cutText [format['SECURESAFEZONES: %1, This is an abondoned vehicle. Enter in the driver/pilot seat to claim this vehicle.',name player],'PLAIN'];
							player action ['getOut', ExileClientSafeZoneVehicle];
						};
					};
				};
			} else {
				if !(player in _ownerGroup) then {
					["Whoops", ["Cannot Enter This Vehicle"]] call ExileClient_gui_notification_event_addNotification;
					player action ['getOut', ExileClientSafeZoneVehicle];
					disableUserInput true;
					cutText ["SECURESAFEZONES: YOU DO NOT OWN THIS VEHICLE !","WHITE IN", 5];
					uiSleep GG_vehiclePenalty;
					disableUserInput false;
				};
			};
		};
		// GR8's Anti Steal
	};
};
true