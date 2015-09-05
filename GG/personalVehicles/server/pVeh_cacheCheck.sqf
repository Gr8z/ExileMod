private ["_canDo", "_t", "_v", "_ind", "_out"];

//Get input uid to retrieve last used time for
_uid = _this;

//Set default canSpawn result
_canDo = true;

//Set default time val
_t = 0;

//Set default veh val
_v = objNull;

//set default index value
_ind = ((count pVeh_cache) - 1);

//Set default output
_out = [_canDo, _t, _v, _ind];

//Check if player uid in cache
{	
	//If UID found in cache
	if (_uid in _x) then {

		//Get last used time from arr
		_t = _x select 1;

		//Get last used veh from arr
		_v = _x select 2;

		//Find out how long since last use
		_t = time - _t;

		//Save position in array
		_ind = _forEachIndex;

		//Check if time since last use > pVeh_requestTimeLimit and return a boolean (true if can use)
		if (_t > pVeh_requestTimeLimit) then {
			_canDo = true;
		} else {
			_canDo = false;
			_t = _t - pVeh_requestTimeLimit;
		};
	};
} forEach pVeh_cache;		

//return output
_out = [_canDo, _t, _v, _ind];
_out

//byPlayer2