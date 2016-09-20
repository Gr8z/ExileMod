/*  
	fn_debugHandler.sqf
*/
params ["_fnc","_exception"];

if(ExAd_Debug)then{
	diag_log format["ExAd%3 Debugger: Error in %1 - '%2'",_fnc, _exception, (if(isDedicated)then{"Server"}else{""})]
}