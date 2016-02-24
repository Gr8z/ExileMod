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
	    [6330.98, 7800.99,0],
	    [4073.33,11677.6,0],
	    [12147.7,12747.2,0],
	    [11474.1,11343.2,0]
	];
};
