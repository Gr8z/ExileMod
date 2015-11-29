diag_log "Waiting for Bornholm Custom Buildings";
if (isServer) then {
	diag_log "Spawning Bornholm Custom Buildings";
	private ["_objs"];
	_objs = [
		// Water Locations

	    ["Land_WaterCooler_01_new_F",[6524.74,2298.2,1.17478],131.932,0,0,false],
	    ["Land_WaterCooler_01_new_F",[10434.3,2366.46,0],233.864,0,0,false],
	    ["Land_WaterCooler_01_new_F",[12262.5,9477.19,1.04111],144.886,0,0,false],
	    ["Land_WaterCooler_01_new_F",[6023.3,7817.1,0],222.273,0,0,false],
	    ["Land_WaterCooler_01_new_F",[3820.54,8935.42,0],292.841,0,0,false],
	    ["Land_WaterCooler_01_new_F",[4719.13,2602.8,0],177.955,0,0,false],
	    ["Land_WaterCooler_01_new_F",[4722.16,10218.4,0],240.341,0,0,false],
	    ["Land_WaterCooler_01_new_F",[12198.5,12595.4,0],291.477,0,0,false],
	    ["Land_WaterCooler_01_new_F",[11240.9,12205.4,0],27.2727,0,0,false],
	    ["Land_WaterTank_F",[10376.3,2217.3,0],300.196,0,0,false],
	    ["Land_WaterTank_F",[10412.6,2268.55,0],131.133,0,0,false],
	    ["Land_WaterTank_F",[10491.2,2328.97,0],132.858,0,0,false],
	    ["Land_WaterTank_F",[12020.2,3475.12,0],350.799,0,0,false],
	    ["Land_WaterTank_F",[13377.6,5456.65,0],94.3301,0,0,false],
	    ["Land_WaterTank_F",[13448.5,6219.94,0],101.806,0,0,false],
	    ["Land_WaterTank_F",[13373.8,6599.18,0],78.7809,0,0,false],
	    ["Land_WaterTank_F",[13112.6,10357.2,-2.38419e-007],278.344,0,0,false],
	    ["Land_WaterTank_F",[11000.5,12401.5,-2.38419e-007],198.39,0,0,false],
	    ["Land_WaterTank_F",[9889.67,12314.2,-2.38419e-007],142.611,0,0,false],
	    ["Land_WaterTank_F",[8593.57,11888.4,-2.38419e-007],69.5802,0,0,false],
	    ["Land_WaterTank_F",[10717.9,8083.61,-2.38419e-007],312.248,0,0,false],
	    ["Land_WaterTank_F",[7041.15,7681.36,-2.38419e-007],169.638,0,0,false],
	    ["Land_WaterTank_F",[6111.62,7747.37,-2.38419e-007],211.064,0,0,false],
	    ["Land_WaterTank_F",[5363.21,8578.87,-2.38419e-007],205.888,0,0,false],
	    ["Land_WaterTank_F",[3864.69,8848.67,-2.38419e-007],204.163,0,0,false],
	    ["Land_WaterTank_F",[2739.87,9997.88,-2.38419e-007],90.8568,0,0,false],
	    ["Land_WaterTank_F",[2707.86,10009,-2.38419e-007],284.071,0,0,false],
	    ["Land_WaterTank_F",[3081.6,7949.26,-2.38419e-007],288.695,0,0,false],
	    ["Land_WaterTank_F",[2701.32,5438.94,-2.38419e-007],27.027,0,0,false],
	    ["Land_WaterTank_F",[2751.68,5237.48,-2.38419e-007],293.272,0,0,false],
	    ["Land_WaterTank_F",[1694.27,3863.09,-2.38419e-007],248.442,0,0,false],
	    ["Land_WaterTank_F",[1699,3790.96,-2.38419e-007],78.7809,0,0,false],
	    ["Land_WaterTank_F",[1913.42,2236.06,-2.38419e-007],349.074,0,0,false],
	    ["Land_WaterTank_F",[3554.76,2454.26,-2.38419e-007],160.437,0,0,false],
	    ["Land_WaterTank_F",[4558.06,2442.75,-2.38419e-007],196.688,0,0,false],
	    ["Land_WaterTank_F",[4815.11,2526.13,-2.38419e-007],245.566,0,0,false],
	    ["Land_WaterTank_F",[5149.47,2366.33,-2.38419e-007],211.064,0,0,false]
	];

	{
	private ["_object"];

    _object = (_x select 0) createVehicle [0,0,0];
    _object setDir (_x select 2);
    _object setPosATL (_x select 1);
    _object enableSimulation false; // :)
	} foreach _objs;
};