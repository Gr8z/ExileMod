/* 
	ExileMod Secure Safezones
	Made by GR8
*/
if (!hasInterface && isServer) exitWith {
	Diag_log "[GG]: Initializing Secure Safezones";
};

GG_vehicleSteal		= true; // Set this to true to prevent people from stealing your vehicle in safezones.
GG_vehicleGroup		= true; // If a vehicle is claimed by a person, his whole group should be able to access the vehicle if unlocked.

GG_gearSteal 		= true; // Set this to true to prevent people from stealing your vehicle's gear.

GG_vehicleClaim 	= true; // Set this to true to add an ability to claim an unowned vehicle in safezones by getting in the driver's seat.
GG_vehicleEnter		= true; // Set this to true to make sure all vehicles driven into a safezones are automatically claimed by the driver.
GG_UnlockClaim		= true; // Set this to true to add an ability to claim an unowned vehicle by locking or unlocking the vehicle.

GG_vehicleDump		= true; // Set this to true to prevent other people from selling your claimed vehicle at the Waste Dump.

GG_vehiclePenalty	= 10; 	// Time in seconds to freeze a player when he/she enters an enemy vehicle.

// Made by GR8