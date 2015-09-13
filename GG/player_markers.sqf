private ["_mrkr","_name","_pPos"];

while {true} do {
	if (visibleMap || (!isNull (findDisplay 88890))) then {
		{
			if ((!isNull _x) && {isPlayer _x} && {(driver (vehicle _x)) == _x}) then {
				_name = name _x;
				if ((group _x == group player) && {_name != name player}) then {
					_pPos = getPosATL _x;
					if (surfaceIsWater _pPos) then {_pPos = getPosASL _x;};
					deleteMarkerLocal _name;
					_mrkr = createMarkerLocal [_name,_pPos];
					_mrkr setMarkerTypeLocal "hd_dot";
					_mrkr setMarkerTextLocal format ["%1 (%2m)",_name,(player distance _x)];
				} else {
					deleteMarkerLocal _name;
				};
			};
		} count playableUnits;
	};
	uiSleep 1;
};