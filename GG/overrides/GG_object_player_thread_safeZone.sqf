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
 
private["_vehicle"];
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

	// GR8's Anti Steal
	_friends = units group player;
	_near = [];
	_around = player nearEntities [['LandVehicle','Air','ship'],25];_near = [];
	{if (player distance _x < ((sizeOf typeOf _x)/2) + 3) then {_near = _near + [_x];};} forEach _around;
	_countNear = count _near;
	_countNearMine = {
		_owner = _x getVariable ['GR8owner',objNull];
		_owner in _friends
	} count _near;
	if (_countNear > _countNearMine && !isNull findDisplay 602) then {
		(findDisplay 602) closedisplay 0;
		closeDialog 0;closeDialog 0;closeDialog 0;
		["Whoops", ["Cannot access gear! You are near another player's vehicle."]] call ExileClient_gui_notification_event_addNotification;
	};
	// GR8's Anti Steal
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
		_playerDriver = player == driver ExileClientSafeZoneVehicle;
		_vehicleOwner = ExileClientSafeZoneVehicle getVariable ['GR8owner', objNull];
		_ownerGroup = units group _vehicleOwner;
		_ownerGroupTag = _vehicleOwner getVariable ["friendlies",[]];
		_playerID = player getVariable ["CharacterID","0"];
		if (isNull _vehicleOwner) then {
			if (_playerDriver) then {
				ExileClientSafeZoneVehicle setVariable ['GR8owner', player, true]; _vehicleOwner = player;
			} else {
				if !(player in _ownerGroup) then {
					cutText [format['%1, This is an abondoned vehicle. Enter in the driver/pilot seat to claim this vehicle.',name player],'PLAIN'];
					player action ['getOut', ExileClientSafeZoneVehicle];
				};
			};
		} else {
			if !(player in _ownerGroup) then {
				cutText [format['%1, You are in a vehicle owned by another player',name player],'WHITE IN'];
				["Whoops", ["Cannot Enter! You are in a vehicle owned by another player"]] call ExileClient_gui_notification_event_addNotification;
				player action ['getOut', ExileClientSafeZoneVehicle];
			};
		};
		// GR8's Anti Steal
	};
};
true