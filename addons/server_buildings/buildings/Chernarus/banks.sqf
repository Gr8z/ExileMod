if (isServer) then {
	private ["_objs"];
	_objs = [
		["Land_Atm_01_F",[6848.7,2508.13,0.819749],312.273,0,0,false],
	    ["Land_Atm_01_F",[6546.7,2806.44,0.540874],130,0,0,false],
	    ["Land_Atm_01_F",[2759.41,5272.58,0],100.455,0,0,false],
	    ["Land_Atm_01_F",[2016.29,2233.49,-0.37684],172.727,0,0,false],
	    ["Land_Atm_01_F",[3660.21,2399.73,0],77.2728,0,0,false],
	    ["Land_Atm_01_F",[12261.7,3529.28,0.0850906],6.10352e-005,0,0,false],
	    ["Land_Atm_01_F",[13356,6158.14,-0.416218],356.818,0,0,false],
	    ["Land_Atm_01_F",[12023.1,9152.74,-0.256134],225,0,0,false],
	    ["Land_Atm_01_F",[12993.4,10253.7,0],19.5455,0,0,false],
	    ["Land_Atm_01_F",[10055.3,1969.96,0],255.455,0,0,false]
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
	_marker setMarkerSize [1,1];
	_marker setMarkerText "ATM";
	} foreach _objs;
};