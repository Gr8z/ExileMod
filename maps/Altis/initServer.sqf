[10,true,true,16] execFSM "GG\fsm\timeModule.fsm";
if (isDedicated || isServer) then {
	"do_MakeBike" addPublicVariableEventHandler {
		_parameters = (_this select 1);
		_parameters2  =(_parameters select 1);
		diag_log format ["createVehicleRequested %1 ", _parameters]; // YOU NEED THIS FOR LOGS TO SEE WHO DID IT
		veh = createVehicle["Exile_Bike_MountainBike", _parameters2 , [] ,0 , "NONE"];
	};
};
if (isServer) then {
    {
	  [_x,"TRADER"] call CustomServer_system_loot_disable;
	} forEach [
	    [14600,16797.199,0],
	    [23334.6,24188.9,0],
	    [2998.0601,18175.5,0],
	    [20521.777,11037.807,0]
	];
};
