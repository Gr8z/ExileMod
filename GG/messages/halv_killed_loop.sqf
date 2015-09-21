/*
	a3 epoch killfeed server loop script
	By Halv
	
	Copyright (C) 2015  Halvhjearne > README.md
*/
diag_log "[KillFeed]: Server waiting for EPOCH_deadPlayer_PVS";
waitUntil{!(isNil "EPOCH_deadPlayer_PVS")};
diag_log "[KillFeed]: Server starting EPOCH_deadPlayer_PVS loop";
while {true} do {
	_run = EPOCH_deadPlayer_PVS;
	[_run select 0,_run select 1] call Halv_fnc_playerdied;
//	diag_log format["[KillFeed] PKILL LOG: %1 - %2",_run select 0,_run select 1];
	waitUntil{sleep 1;!(_run isEqualTo EPOCH_deadPlayer_PVS)};
};