/*  
	fn_allowVGStore.sqf
*/
private ["_res","_flag"];

if(isNil "ExAdCurFlagNetId")exitWith{diag_log "ExAdClient: allowVGStore - ExAdCurFlagNetId is nil";false};
_flag = objectFromNetId ExAdCurFlagNetId;

_allowedVeh = ExAd_VG_MIN_ALLOWED_VEH + ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR * (_flag getVariable ["ExileTerritoryLevel", 1]);
_storedVeh = count (_flag getVariable ["ExAdVGVeh", []]);

_res = if(_allowedVeh > _storedVeh)then{true}else{false};

_res