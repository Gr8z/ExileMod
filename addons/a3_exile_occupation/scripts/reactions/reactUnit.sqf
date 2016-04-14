_logDetail = format ["[OCCUPATION]:: Unit %2 killed at %1",time,_this];
[_logDetail] call SC_fnc_log;

// Get the variables from the event handler
_unit 			= _this select 0;
_weaponFired 	= _this select 1;

