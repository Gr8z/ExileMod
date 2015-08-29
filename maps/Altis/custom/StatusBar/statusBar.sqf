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
		((uiNamespace getVariable "statusBar")displayCtrl 1000)ctrlSetText format[" Restart: %1 Minutes Left | Players Online: %2 | FPS: %3 | Pop Tabs: %4 ", (120-(round(serverTime/60))), (count playableUnits), (round diag_fps), ExileClientPlayerMoney, ExileClientPlayerScore];
	};
};