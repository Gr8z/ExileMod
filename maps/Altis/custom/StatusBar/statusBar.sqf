waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "statusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["statusBar","PLAIN"];
systemChat format["ExileMod", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "statusBar")displayCtrl 1000)ctrlSetText format[" RESTART: %1 MINS LEFT | PLAYERS: %2 | FPS: %3 | HEALTH: %4 ", (120-(round(serverTime/60))), (count playableUnits), (round diag_fps), round ((1 - damage player) * 100)];
	};
};