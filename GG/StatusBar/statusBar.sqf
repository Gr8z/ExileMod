waitUntil {!(isNull (findDisplay 46))};
waitUntil {!isNil 'GG_fnc_statusBar'};
disableSerialization;

_rscLayer = "GGStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["GGStatusBar","PLAIN"];

uiSleep 5;

statusBarRefresh = [1, GG_fnc_statusBar, [], true] call ExileClient_system_thread_addtask;