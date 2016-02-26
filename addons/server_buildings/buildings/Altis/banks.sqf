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
	    ["Land_Atm_01_F",[20943.4,16988.6,1.24694],287.16,0,0,false],
		["Land_Atm_01_F",[5066.08,11191.8,0.387394],27.7273,0,0,false],
		["Land_Atm_01_F",[4182.11,11785.4,0.196873],95.4545,0,0,false],
		["Land_Atm_01_F",[10655.6,12201.5,0.252983],132.727,0,0,false],
		["Land_Atm_01_F",[10962.1,13494.5,0],280.909,0,0,false],
		["Land_Atm_01_F",[11843.8,14146.3,0],207.727,0,0,false],
		["Land_Atm_01_F",[12934.2,15073.1,0.225691],295.909,0,0,false],
		["Land_Atm_01_F",[12287.2,8873.04,0],258.636,0,0,false],
		["Land_Atm_01_F",[20581.5,8922.92,0],334.091,0,0,false],
		["Land_Atm_01_F",[19958.7,11437.4,0],144.091,0,0,false],
		["Land_Atm_01_F",[19306.6,13232.2,-0.104912],53.6364,0,0,false],
		["Land_Atm_01_F",[5760.32,20075.8,-0.176468],184.091,0,0,false],
		["Land_Atm_01_F",[9434.26,20286.2,0.241478],249.091,0,0,false],
		["Land_Atm_01_F",[14616.9,20810.5,0],235.455,0,0,false],
		["Land_Atm_01_F",[18779.7,16633.5,0.14336],224.091,0,0,false],
		["Land_Atm_01_F",[17864.1,18148.5,-0.00348139],128.636,0,0,false],
		["Land_Atm_01_F",[21264,16314.8,0.0913849],227.727,0,0,false],
		["Land_Atm_01_F",[23364.4,19810.6,0],51.3636,0,0,false],
		["Land_Atm_01_F",[27029.7,23282.5,0.100529],45.9091,0,0,false],
		["Land_Atm_01_F",[14901.6,11061.2,-0.0341234],313.636,0,0,false],
		["Land_Atm_01_F",[6190.42,15093.9,0.23978],54.0909,0,0,false]
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