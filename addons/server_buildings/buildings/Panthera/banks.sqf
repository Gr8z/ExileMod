if (isServer) then {
	private _objects = [
	    ["Land_Atm_01_F",[8409.97,8723,4.84541],[[-0.903554,-0.428473,0],[0,0,1]],[false,false]],
	    ["Land_Atm_01_F",[6715.65,7297.89,47.25],[[0.999715,-0.0238814,0],[0,0,1]],[false,false]],
	    ["Land_Atm_01_F",[306.717,6682.43,7.12231],[[-0.361207,-0.932486,0],[0,0,1]],[false,false]],
	    ["Land_Atm_01_F",[2016.89,1265.19,8],[[-0.985808,-0.16788,0],[0,0,1]],[false,false]],
	    ["Land_Atm_01_F",[5882.97,911.734,6.30844],[[0.999656,0.0262393,0],[0,0,1]],[false,false]],
	    ["Land_Atm_01_F",[7898.05,1619.91,3.15201],[[-0.999984,-0.00569721,0],[0,0,1]],[false,false]],
	    ["Land_Atm_01_F",[8325.56,4772.32,7.25201],[[-0.235459,0.971884,0],[0,0,1]],[false,false]],
	    ["Land_Atm_01_F",[3053.17,4471.76,5.15],[[0.980385,0.197093,0],[0,0,1]],[false,false]],
	    ["Land_Atm_01_F",[4509.86,6284.99,52.5004],[[-0.999986,-0.0053043,0],[0,0,1]],[false,false]]
	];
	{
	    private _object = (_x select 0) createVehicle [0,0,0];
	    _object setPosASL (_x select 1);
	    _object setVectorDirAndUp (_x select 2);
	    _object enableSimulation ((_x select 3) select 0);
	    _object allowDamage ((_x select 3) select 1);
	    _marker = createMarker ["cashpoint_" + str(_forEachIndex), _x select 1];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "loc_Tourism";
		_marker setMarkerColor "ColorWhite";
		_marker setMarkerSize [1.4,1.4];
	} forEach _objects;
};