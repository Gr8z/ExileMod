/*  
	fn_debugHandler.sqf
*/
params ["_fnc","_exception",["_server", false]];

if(ExAd_Debug)then{
	diag_log format["ExAd%3 Debugger: Error in %1 - '%2'",_fnc, _exception, (if(_server)then{"Server"}else{""})]
}