/*  
	customize.sqf
*/

ExAd_VG_MIN_ALLOWED_VEH = 2;			//SCALAR - Minimun allowed vehicles in the virtual garage.

ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR = 2;//SCALAR - How many extra vehicle slots for each territory level.

ExAd_VG_ACCESS_LEVEL = 1; 				//SCALAR - Lowest level that can access the Virtual Garage --> 1|2|3 -> Pleb|Moderator|Owner.

ExAd_VG_CLEAN_ON_STORE = true;			//BOOLEAN - If vehicle inventory should reset when stored.

ExAd_VG_SHOW_ADVHINT = false; 			//BOOLEAN - If the virtual garage should display an Advanced hint upon store and fetch.

ExAd_VG_ALLOWED_VEH_TYPE = ["Car","Air"];//ARRAY - Array with allowed vehicle types for the virtual garage. | "Car", "Tank", "Helicopter", "Plane" or "Air" for both WARNING DON'T USE "LandVehicle" Can crash the Exile system.  