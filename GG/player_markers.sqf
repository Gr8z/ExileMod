private ["_mrkr","_name","_pPos"];

while {true} do {
	if (visibleMap) then {
		{
			if ((!isNull _x) && {isPlayer _x} && {(driver (vehicle _x)) == _x}) then {
				_name = name _x;
				if (group _x == group player) then {
					_pPos = getPosATL _x;
					if (surfaceIsWater _pPos) then {_pPos = getPosASL _x;};
					deleteMarkerLocal _name;
					_mrkr = createMarkerLocal [_name,_pPos];
					if ({_name != name player}) then {
						_mrkr setMarkerTypeLocal "mil_box";
						_mrkr setMarkerTextLocal format ["%1 (%2m)",_name,round(_pPos distance player)];
					} else {
						_mrkr setMarkerTypeLocal "mil_dot";
						_mrkr setMarkerTextLocal format ["%1",_name];
					};
				} else {
					deleteMarkerLocal _name;
				};
			};
		} count playableUnits;
	};
	uiSleep 1;
};