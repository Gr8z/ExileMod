if (isServer) then {
	private ["_objs"];
	_objs = [
		["Land_Atm_01_F",[3497.14,13000.4,0.19083],277.159,0,0,false],
	    ["Land_Atm_01_F",[3777.3,13517.8,0],63.0681,0,0,false],
	    ["Land_Atm_01_F",[14064.8,18717.7,0.654642],153.068,0,0,false],
	    ["Land_Atm_01_F",[13886.3,18555,0],34.8863,0,0,false],
	    ["Land_Atm_01_F",[9018.7,12029.3,0.166391],287.614,0,0,false],
	    ["Land_Atm_01_F",[20778.7,6802.23,0.216351],63.9777,0,0,false],
	    ["Land_Atm_01_F",[16886.1,12808,0.236942],220.341,0,0,false],
	    ["Land_Atm_01_F",[16407.9,12658.4,0.72113],46.2504,0,0,false],
	    ["Land_Atm_01_F",[25565.3,21415.5,0.407953],43.5231,0,0,false],
	    ["Land_Atm_01_F",[8626.52,18265,0.246948],243.978,0,0,false],
	    ["Land_Atm_01_F",[9297.92,15780,1.48478],340.796,0,0,false],
	    ["Land_Atm_01_F",[18126.3,15255,0.998499],134.887,0,0,false],
	    ["Land_Atm_01_F",[18126.8,15254.5,1.02752],315.342,0,0,false],
	    ["Land_Atm_01_F",[20943.4,16988.6,1.24694],287.16,0,0,false]
	];
	{
	private ["_object"];

    _object = (_x select 0) createVehicle [0,0,0];
    _object setDir (_x select 2);
    _object setPosATL (_x select 1);
    _object enableSimulation false; // :)
	_marker = createMarker ["cashpoint_" + str(_forEachIndex), _x select 1];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "loc_Tourism";
	_marker setMarkerColor "ColorGreen";
	_marker setMarkerSize [0.6,0.6];
	_marker setMarkerText "ATM";
	} foreach _objs;
};