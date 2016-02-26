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
	    ["Land_Atm_01_F",[10055.3,1969.96,0],255.455,0,0,false],
		["Land_Atm_01_F",[1696.24,3865.68,0],75,0,0,false],
		["Land_Atm_01_F",[2696.95,5589.62,0],98.1818,0,0,false],
		["Land_Atm_01_F",[2509.32,6340.23,0],286.818,0,0,false],
		["Land_Atm_01_F",[3068.41,7982.57,-0.281738],19.5455,0,0,false],
		["Land_Atm_01_F",[3808.77,8926.08,0],114.545,0,0,false],
		["Land_Atm_01_F",[2697.28,10053.8,0],66.3636,0,0,false],
		["Land_Atm_01_F",[4460.25,4641.27,0],230,0,0,false],
		["Land_Atm_01_F",[4729.1,6388.21,-0.374329],340.909,0,0,false],
		["Land_Atm_01_F",[5325,8584.46,-0.327606],129.091,0,0,false],
		["Land_Atm_01_F",[5854.08,10109,-0.361053],110,0,0,false],
		["Land_Atm_01_F",[7546.18,5107.24,-0.360672],270,0,0,false],
		["Land_Atm_01_F",[6587.47,6039.29,-0.0742493],315,0,0,false],
		["Land_Atm_01_F",[11248.4,12203.3,-0.247803],206.818,0,0,false],
		["Land_Atm_01_F",[10444.8,8883.14,-0.437164],329.091,0,0,false],
		["Land_Atm_01_F",[9446.87,8824.7,-0.347443],94.0909,0,0,false],
		["Land_Atm_01_F",[11236,6582.32,-0.198975],44.0909,0,0,false],
		["Land_Atm_01_F",[10631.5,8022.1,-0.179382],303.636,0,0,false],
		["Land_Atm_01_F",[13000.5,7989.75,0.178655],268.182,0,0,false],
		["Land_Atm_01_F",[5842.35,4774.15,-0.031601],102.727,0,0,false],
		["Land_Atm_01_F",[12873.6,4472.98,0],10.9091,0,0,false]
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
	_marker setMarkerColor "ColorWhite";
	_marker setMarkerSize [1.4,1.4];
	} foreach _objs;
};