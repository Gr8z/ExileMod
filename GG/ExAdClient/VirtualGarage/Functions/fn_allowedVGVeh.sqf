/*  
	fn_allowedVGVeh.sqf
*/
params ["_flag"];

_res = ExAd_VG_MIN_ALLOWED_VEH + round(ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR * (_flag getVariable ["ExileTerritoryLevel", 1]));

_res