if (isServer) then {
	private ["_objs"];
	_objs = [
		["Land_Atm_01_F", [5457.49, 4047.2, 0],47,0,0,false],
		["Land_Atm_01_F", [3429.36, 6760.93, 0],30,0,0,false],
		["Land_Atm_01_F", [5088.08, 8696.57, 0],93,0,0,false],
		["Land_Atm_01_F", [9325.38, 4006.55, 0],2.5,0,0,false],
		["Land_Atm_01_F", [11043.3, 9822.49, 0],112,0,0,false],
		["Land_Atm_01_F", [9692.19, 13503.1, 0],19,0,0,false],
		["Land_Atm_01_F", [12785, 7448.52, 0],102,0,0,false]
	];
	{
	private ["_object"];

    _object = (_x select 0) createVehicle [0,0,0];
    _object setDir (_x select 2);
    _object setPosATL (_x select 1);
	_marker = createMarker ["cashpoint_" + str(_forEachIndex), _x select 1];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "loc_Tourism";
	_marker setMarkerColor "ColorWhite";
	_marker setMarkerSize [1.4,1.4];
	} foreach _objs;
};