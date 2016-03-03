private ["_i","_safepos","_validspot","_position"];

switch(toLower worldName)do{
	case "altis":{
		_safepos		= [[15834.2,15787.8,0],0,15000,10,0,80,0];
	};
	case "chernarus":{
		_safepos		= [[7652.9634, 7870.8076,0],0,15000,10,0,80,0];
	};
};

_validspot 	= false;
while{!_validspot} do {
	sleep 1;
	_position 	= _safepos call BIS_fnc_findSafePos;
	_validspot	= true;
	if (_position call ZCP_fnc_inDebug) then {
		_validspot = false;
	};
	if(_validspot ) then {
		if ([_position,10] call ZCP_fnc_nearWater) then {
		_validspot = false;
		};
		if ([_position,10] call ZCP_fnc_nearTrader) then {
		_validspot = false;
		};
	};
};
_position set [2, 0];
_position
