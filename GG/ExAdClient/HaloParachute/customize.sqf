/*  
	customize.sqf
*/

ExAd_HALOPARACHUTE_SAFE_MODE = false;	//BOOLEAN - Force pull parachute when player reaches ExAd_ACTION_PARACHUTE_HEIGHT if they ejected from vehicle
ExAd_HALOPARACHUTE_USE_ACTIONS = true;	//BOOLEAN - Allows player to eject from all vehicles with a pressed key combination 'alt shift x'
ExAd_HALOPARACHUTE_USE_KEY_ACTIONS = false;	//BOOLEAN - Show addActions on the screen

ExAd_ACTION_PARACHUTE_HEIGHT = 10; 		//SCALAR - What is the minimum altitude a player can pull a parachute. |RECOMMENDED 30 meters when safe_mode activated
ExAd_ACTION_EJECT_HEIGHT = 100; 		//SCALAR - What is the minimum altitude a player can Halo/Eject from a vehicle.
