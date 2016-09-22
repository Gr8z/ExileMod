/*  
	postInit.sqf

*/

_path = "GG\ExAdClient\VirtualGarage\customize.sqf";
call compile preprocessFileLineNumbers _path;

if(isNil "ExAd_VG_MIN_ALLOWED_VEH")then{ExAd_VG_MIN_ALLOWED_VEH = 5;};
if(isNil "ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR")then{ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR = 3;};
if(isNil "ExAd_VG_ACCESS_LEVEL")then{ExAd_VG_ACCESS_LEVEL = 1;};
if(isNil "ExAd_VG_CLEAN_ON_STORE")then{ExAd_VG_CLEAN_ON_STORE = true;};
if(isNil "ExAd_VG_SHOW_ADVHINT")then{ExAd_VG_SHOW_ADVHINT = false;};
if(isNil "ExAd_VG_ALLOWED_VEH_TYPE")then{ExAd_VG_ALLOWED_VEH_TYPE = ["Car","Air"];};

["STR_ExAd_VG_NOTI_FULL", "The garage is full"] call ExAd_fnc_localize;
["STR_ExAd_VG_NOTI_NOT_PERSISTENT", "You can only store pincode protected vehicles into the garage!"] call ExAd_fnc_localize;
["STR_ExAd_VG_NOTI_NOT_AVAILABLE", "The vehicle is not available anymore!"] call ExAd_fnc_localize;

["STR_ExAd_VG_APP_DETAILS", "%2 %1 %1Fuel: %3 %1Damage: %4 %1Texture: %5"] call ExAd_fnc_localize;
["STR_ExAd_VG_APP_BTN_BACK", "Go Back"] call ExAd_fnc_localize;
["STR_ExAd_VG_APP_BTN_FETCH", "Fetch"] call ExAd_fnc_localize;
["STR_ExAd_VG_APP_BTN_STORE", "Store"] call ExAd_fnc_localize;
["STR_ExAd_VG_APP_TTL_STORED", "Stored"] call ExAd_fnc_localize;
["STR_ExAd_VG_APP_TTL_DETAILS", "Stored Vehicle Details"] call ExAd_fnc_localize;
["STR_ExAd_VG_APP_TTL_NEAR", "In Radius"] call ExAd_fnc_localize;
["STR_ExAd_VG_APP_CB_SECRET", "Stream friendly UI"] call ExAd_fnc_localize;