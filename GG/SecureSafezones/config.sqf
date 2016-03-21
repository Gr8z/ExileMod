/* 
	ExileMod Secure Safezones
	Made by GR8
*/
if (!hasInterface && isServer) exitWith {
	Diag_log "[GG]: Initializing Secure Safezones";
};

private ["_code","_function","_file","_compiles"];


GG_vehicleSteal		= true; // Set this to true to prevent people from stealing your vehicle in safezones.
GG_vehicleGroup		= true; // If a vehicle is claimed by a person, his whole group should be able to access the vehicle if unlocked.

GG_gearSteal 		= true; // Set this to true to prevent people from stealing your vehicle's gear.

GG_vehicleClaim 	= true; // Set this to true to add an ability to claim an unowned vehicle in safezones by getting in the driver's seat.
GG_vehicleEnter		= true; // Set this to true to make sure all vehicles driven into a safezones are automatically claimed by the driver.
GG_UnlockClaim		= true; // Set this to true to add an ability to claim an unowned vehicle by locking or unlocking the vehicle.

GG_vehicleDump		= true; // Set this to true to prevent other people from selling your claimed vehicle at the Waste Dump.

GG_vehiclePenalty	= 10; 	// Time in seconds to freeze a player when he/she enters an enemy vehicle.

_compiles = [				// If you want to - change the file names here, but check to see if you have duplicates from other scripts.
	['ExileClient_object_player_thread_safeZone',			'GG\SecureSafezones\compiles\GG_safeZone.sqf'],
	['ExileClient_object_player_event_onEnterSafezone',		'GG\SecureSafezones\compiles\GG_onEnterSafezone.sqf'],
	['ExileClient_object_player_event_onLeaveSafezone',		'GG\SecureSafezones\compiles\GG_onLeaveSafezone.sqf'],
	['ExileClient_object_player_event_onInventoryOpened',	'GG\SecureSafezones\compiles\GG_onInventoryOpened.sqf']
];

// END OF CONFIG - Dont touch this if you dont know what you are doing.
{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function, _code];
} forEach _compiles;

systemChat "SECURE SAFEZONES LOADED"; // You may remove this line safely
// Made by GR8