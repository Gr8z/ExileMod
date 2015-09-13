// -----------------  Declare Private Variables  -------------------- //
private ["_grp","_grpldr","_mkrtype","_mkrText","_mkrColor","_mkrName","_mkr","_grpName"];

_grp = _this select 0;
_grpldr = leader _grp;
_grpName = groupID _grp;
_mkrText = _grpName;
_mkrColor = "ColorWEST";
_mkrName = format ["mkr_%1",_grpName];

// -----------------  Exit For Empty Group  -------------------- //
// If the group is empty, this script exits.
if (isnil "_grp") exitWith {};

// -----------------  Create Marker  -------------------- //
		_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
		_mkr setMarkerShapeLocal "ICON";
		_mkrName setMarkerSizeLocal [0.8, 0.8];
		_mkrName setMarkerTextLocal _mkrText;
		_mkrName setMarkerColorLocal _mkrColor;

// -----------------  Functions  -------------------- //
_fnc_mkrtype = {
		_mkrtype = "b_inf";
		if ( (vehicle _grpldr) isKindOf "Car_F") then {
			private ["_car"];
			_car = vehicle _grpldr;
			if (_grpldr == (commander _car) OR _grpldr == (driver _car) OR _grpldr == (gunner _car)) then {
				_mkrtype = "b_motor_inf";
			};
		};
		if ( (vehicle _grpldr) isKindOf "Tank" OR (vehicle _grpldr) isKindOf "Wheeled_APC_F") then {
			private ["_tank"];
			_tank = vehicle _grpldr;
			if (_grpldr == (commander _tank) OR _grpldr == (driver _tank) OR _grpldr == (gunner _tank)) then {
				_mkrtype = "b_armor";
			};
		};
		if ( (vehicle _grpldr) isKindOf "Helicopter") then {
			private ["_heli"];
			_heli = vehicle _grpldr;
			if (_grpldr == (commander _heli) OR _grpldr == (driver _heli) OR _grpldr == (gunner _heli)) then {
				_mkrtype = "b_air";
			};
		};
		if ( (vehicle _grpldr) isKindOf "Plane") then {
			private ["_plane"];
			_plane = vehicle _grpldr;
			if (_grpldr == (commander _plane) OR _grpldr == (driver _plane) OR _grpldr == (gunner _plane)) then {
				_mkrtype = "b_plane";
			};
		};
};

// -----------------  Update Marker Position  -------------------- //
// As long as certain conditions are met (the group exists) the marker
// position is updated periodically. This only happens locally - so as not to burden
// the server.

while {{!isNull _x} count units _grp > 0} do
{
	[] call _fnc_mkrtype;
	_mkrName setMarkerType _mkrtype;
	_mkrName setMarkerPosLocal [(getPos leader _grp select 0),(getPos leader _grp select 1)];
	sleep 6;
};