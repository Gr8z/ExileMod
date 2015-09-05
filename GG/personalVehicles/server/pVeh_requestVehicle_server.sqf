private ["_out", "_plyr", "_plyrPos", "_reqVeh", "_dist", "_moveVeh", "_vehName", "_msg", "_canDo", "_vehObj", "_client", "_cacheCheckResult", "_timeUntilCan", "_lastVeh", "_ind", "_oldVehCrew", "_oldVehCrewCount", "_safePos"];

//get player object
_plyr = (_this select 0);

//get player position
_plyrPos = getPos _plyr;

//get requested vehicle name
_reqVeh = (_this select 1);

//set default message
_msg = "Error - Unknown Server Error";

//set default timeCheck result
_cacheCheckResult = [true, 0, objNull, 0];

//set default canDo
_canDo = true;

//set default dir
_dir = 0;

//set default distance
_dist = 20;

//set default veh name
_vehName = pVeh_vehClassName;

//set default veh obj
_vehObj = objNull;

//Get Client ID to send Response back to
_client = owner _plyr;

//Set default safePos
_safePos = nil;

//Set default _moveVeh
_moveVeh = false;

//set default output to send to client
_out = [format["%1 %2", pVeh_messagePrefix, _msg]];

//Check if request is valid veh
if (_reqVeh != pVeh_vehClassName) then {
	_msg = "Error - Invalid Request";
};

//Check if player spawned vehicle in last <pVeh_requestTimeLimit> seconds
_cacheCheckResult = (getPlayerUID _plyr) call pVeh_cacheCheck;

//Get info from result
_canDo        = _cacheCheckResult select 0;
_timeUntilCan = _cacheCheckResult select 1;
_lastVeh      = _cacheCheckResult select 2;
_ind          =	_cacheCheckResult select 3;

//If player can spawn personal vehicle
if (_canDo) then {

	//Check if last vehicle exists
	if (!isNull _lastVeh) then {

		//Check if old personal vehicle is empty
		_oldVehCrew = crew _lastVeh;
		_oldVehCrewCount = count _oldVehCrew;

		//If old vehicle does not have crew
		if (_oldVehCrewCount < 1) then {

			//Save var so we know to MOVE the old Personal Vehicle to a new location nearer the player instead of just deleting it (perf reasons)
			_moveVeh = true;

		//If old vehicle does have crew
		} else {

			//Change message to tell them they cant request a new vehicle until old vehicle is empty
			_msg = "You cannot request a new vehicle while your old vehicle is occupied.";

			//Change _canDo to false
			_canDo = false;
		};
	};

//If player cant spawn personal vehicle yet
} else {
	_msg = format["You can request your personal vehicle again in %1 seconds.", (abs _timeUntilCan)];
};

//Semi-Final canDo check
if (_canDo) then {

	//Attempt to find safe position for new vehicle
	_safePos = [_plyrPos, 1.5, 20, 1, 0, 5, 0] call BIS_fnc_findSafePos;

	//Error if no safePos found
	if (isNil '_safePos') then {
		_canDo = false;
		_msg = "Sorry, we could not find a safe location to spawn the vehicle. Please stand clear of any obstacles and call again.";
	};

	if ((str(_safePos) == "[10801.9,10589.6,100]")) then {
		_canDo = false;
		_msg = "Sorry, we could not find a safe location to spawn the vehicle. Please stand clear of any obstacles and call again.";
	};
};

//Final canDo check
if (_canDo) then {

	//Spawn New Vehicle / Move old Vehicle
	if (_moveVeh) then {
		//Set lastVeh to current
		_vehObj = _lastVeh;

		//Move Vehicle
		_vehObj setPosATL _safePos;
	} else {
		//Create new Veh
		_vehObj = [pVeh_vehClassName, _safePos, 0, true] call ExileServer_object_vehicle_createNonPersistentVehicle;
	};

	//Save last vehicle spawn time & last vehicle object to cache for this user
	pVeh_cache set [_ind, [(getPlayerUID _plyr), time, _vehObj]];

	//Reveal object to player
	_plyr reveal _vehObj;

	//Get veh display name
	_vehName = getText (configFile >> "CfgVehicles" >> pVeh_vehClassName >> "displayname");

	//Get veh distance from player
	_dist = _plyr distance _vehObj;

	//round distance to whole number
	_dist = round(_dist);

	//Update message to send to client
	_msg = format["Your %1 has been delivered by Player2 Industries (C) and is %2 meters away.",_vehName,_dist];

	//Create output to send to client
	_out = [format["%1 %2", pVeh_messagePrefix, _msg], _vehObj];
} else {
	//Create output to send to client
	_out = [format["%1 %2", pVeh_messagePrefix, _msg]];
};

//Inform player of result
pVeh_rV_r = _out;
_client publicVariableClient "pVeh_rV_r";

//byPlayer2