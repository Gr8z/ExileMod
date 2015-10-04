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
		["Land_PowerPoleWooden_L_F",[4264.91,18180.2,-0.000343323],83.629,0,0,false],
		["Land_fs_feed_F",[18110.8,8169.26,4.01591],141.818,0,0,false],
		["Land_fs_feed_F",[18190.6,8088,4.07485],0,0,0,false],
		["Land_LampHalogen_F",[18183.2,8100.47,0],0,0,0,false],
		["Land_LampHalogen_F",[18150.2,8103.13,-1.78814e-007],134.545,0,0,false],
		["Land_LampHalogen_F",[18146.7,8131.92,-1.78814e-007],328.182,0,0,false],
		["Land_LampHalogen_F",[18126.6,8136.99,-1.78814e-007],158.182,0,0,false],
		["Land_LampSolar_F",[18170.4,8088.42,3.64111],180,0,0,false],
		["Land_LampSolar_F",[18170.4,8066.82,6.96155],180,0,0,false],
		["Land_LampSolar_F",[18170.4,8056.02,5.97061],180,0,0,false],
		["Land_LampSolar_F",[18170.4,8045.22,6.20271],180,0,0,false],
		["Land_LampSolar_F",[18170.4,8034.43,4.26698],180,0,0,false],
		["Land_LampSolar_F",[18170.4,8077.62,7.40377],178.636,0,0,false]
    ];
};
[] execVM "GG\personalVehicles\init.sqf";
