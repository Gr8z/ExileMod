[10,true,true,16] execFSM "GG\fsm\timeModule.fsm";
if (isServer && isDedicated) then 
{
	{
	    private ["_object"];

	    _object = (_x select 0) createVehicle [0,0,0];
	    _object setDir (_x select 2);
	    _object setPosATL (_x select 1);
	    _object enableSimulationGlobal true; // for clarity
	}
	forEach
	[
	    ["Land_FuelStation_Feed_F",[6354.52,7784.86,0.272217],119.545,0,0,false],
	    ["Land_FuelStation_Feed_F",[6360.28,7781.08,0.262451],119.545,0,0,false],
	    ["Land_FuelStation_Feed_F",[6366.45,7777.91,0.272217],119.545,0,0,false]
    ];
};