private "_crashNum";
// Number of Crashes
_crashNum = 15;
//							
switch (toLower worldName) do
{ 
	case "altis" : { _spawnCenter = [15834.2,15787.8,0]; };
	case "bornholm" : { _spawnCenter = [11264,11264,0]; };
	default { _spawnCenter = []; };
};

_min = 0; // minimum distance from the center position (Number) in meters
_max = 10000; // maximum distance from the center position (Number) in meters
_mindist = 20; // minimum distance from the nearest object (Number) in meters, ie. spawn at least this distance away from anything within x meters..
//Low _mindist means helicrashes could spawn near towns or in forests.. higher the number it would be spawning in an open field etc
_water = 0; // water mode 0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = 0; // 0: does not have to be at a shore , 1: must be at a shore



vSpawnCrashes = {
	for "_j" from 1 to _crashNum do {
		_posOfCrash = [_spawnCenter,_min,_max,_mindist,_water,20,_shoremode] call BIS_fnc_findSafePos; // find a random location
		_helicopters = ["Land_Wreck_HMMWV_F","Land_UWreck_Heli_Attack_02_F","Land_Wreck_Heli_Attack_01_F"]; //Add crash classnames here
		_element = _helicopters call BIS_fnc_SelectRandom;
		_vehHeli = _element createVehicle [0,0,0];
		_burnthefucker = "test_EmptyObjectForFireBig" createVehicle (position _vehHeli);  
		_burnthefucker attachto [_vehHeli, [0,0,-1]];
		_vehHeli setposATL [(_posOfCrash) select 0,(_posOfCrash) select 1,0];
	};
};

call vSpawnCrashes;
