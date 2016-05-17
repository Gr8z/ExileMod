/*  
	postInit.sqf
*/

execVM "GG\ExAdClient\VirtualGarage\customize.sqf";

if(isNil "ExAd_VG_MIN_ALLOWED_VEH")then{ExAd_VG_MIN_ALLOWED_VEH = 5;};
if(isNil "ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR")then{ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR = 3;};
if(isNil "ExAd_VG_ACCESS_LEVEL")then{ExAd_VG_ACCESS_LEVEL = 1;};
if(isNil "ExAd_VG_CLEAN_ON_STORE")then{ExAd_VG_CLEAN_ON_STORE = true;};
if(isNil "ExAd_VG_SHOW_ADVHINT")then{ExAd_VG_SHOW_ADVHINT = false;};