[10,true,true,16] execFSM "GG\timeModule.fsm";

// any items that need simulation need to put in here (EX: actually refuel from fuel pumps)
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
	    ["Land_fs_feed_F",[4293.6,18067.9,0.230392],66.0433,0,0,false],
	    ["Land_fs_feed_F",[4287.22,18065.1,0.230392],66.0433,0,0,false],
	    ["Land_fs_feed_F",[4280.88,18062.2,0.230392],66.0433,0,0,false],
		["Land_PowerPoleWooden_L_F",[4284.78,18280.9,0.00120544],97.629,0,0,false],
		["Land_PowerPoleWooden_L_F",[4276.78,18254.4,0.00120544],104.629,0,0,false],
		["Land_PowerPoleWooden_L_F",[4270.39,18229.9,0.00120544],104.629,0,0,false],
		["Land_PowerPoleWooden_L_F",[4266.02,18204.9,-0.000167847],98.629,0,0,false],
		["Land_PowerPoleWooden_L_F",[4264.91,18180.2,-0.000343323],83.629,0,0,false]
    ];
};
[] execVM "GG\personalVehicles\init.sqf";
