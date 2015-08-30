waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "statusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["statusBar","PLAIN"];
systemChat format["ExileMod", _rscLayer];

UPTIMER = 7201;
_stime = 0;
if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
_upTimeLeft = UPTIMER - _stime;
_hours = (_upTimeLeft/60/60);
_hours = toArray (str _hours);
_hours resize 1;
_hours = toString _hours;
_hours = compile _hours;
_hours = call  _hours;
_minutes = floor(_upTimeLeft/60);
_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if(_minutes2 < 10)then{_minutes2 = format['0%1',_minutes2];};
_mytime = format['%1h %2min',_hours,_minutes2];

[] spawn {
	sleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "statusBar")displayCtrl 1000)ctrlSetText format[" RESTART: %1 | PLAYERS: %2 | FPS: %3 | HEALTH: %4%5", _mytime, (count playableUnits), (round diag_fps), round ((1 - damage player) * 100), "%"];
	};
};