// Add occupation script to Exile Threading System
fnc_occupationMonitor = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\occupation.sqf";

diag_log format ["[OCCUPATION MOD]:: Giving the server time to start before starting [OCCUPATION] (%1)",time];
uiSleep 120;

diag_log format ["[OCCUPATION]:: Initialised at %1",time];
[300, fnc_occupationMonitor, [], true] call ExileServer_system_thread_addTask;
