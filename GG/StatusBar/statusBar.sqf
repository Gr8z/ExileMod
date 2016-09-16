waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "GGStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["GGStatusBar","PLAIN"];

uiSleep 5;

statusBarRefresh = [1, GGStatusBar, [], true] call ExileClient_system_thread_addtask;