/*  
	fn_allowVGStore.sqf
*/
private ["_res","_flag"];

if(isNil "ExAdCurFlagNetId")exitWith{diag_log "ExAdClient: allowVGStore - ExAdCurFlagNetId is nil";false};
_flag = objectFromNetId ExAdCurFlagNetId;

_allowedVeh = _flag call ExAd_fnc_allowedVGVeh;
_storedVeh = count (_flag getVariable ["ExAdVGVeh", []]);

_res = if(_allowedVeh > _storedVeh)then{true}else{false};

_res