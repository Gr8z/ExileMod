// Triggered when a ground vehicle takes damage
// Attempts to get the current vehicle driver to repair the vehicle

_vehicle = _this select 0;
_vehicle removeAllMPEventHandlers  "mphit";

_vehicleDamage 		= damage _vehicle;
_damagedWheels 		= 0;
_damageLimit 		= 0.2;
_engineDamage 		= false;
_fueltankDamage 	= false;
_assignedDriver 	= _vehicle getVariable "SC_assignedDriver";

if(isNull assignedDriver _vehicle) exitWith { [_assignedDriver] call SC_fnc_driverKilled; };

_wheels = ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitLBWheel","HitLMWheel","HitRBWheel","HitRMWheel"]; 
_damagedWheels = 0;
{
	if ((_vehicle getHitPointDamage _x) > 0) then
	{	
		_damage = _vehicle getHitPointDamage _x;
        if(SC_extendedLogging) then 
        {
            _logDetail = format ["[OCCUPATION:repairVehicle]:: Vehicle %1 checking wheel %2 (damage: %4) @ %3",_vehicle, _x, time,_damage]; 
            [_logDetail] call SC_fnc_log;
        };        
		if(_damage > 0) then { _damagedWheels = _damagedWheels + 1; };
	};
} forEach _wheels;

// Check Engine
if ((_vehicle getHitPointDamage "HitEngine") >= _damageLimit) then { _engineDamage = true; };

// Check Fuel Tank
if ((_vehicle getHitPointDamage "HitFuel") > 0) then { _fueltankDamage = true; };


if(_damagedWheels > 0 OR _engineDamage OR _fueltankDamage) then
{
	if(SC_extendedLogging) then 
	{
		_logDetail = format ["[OCCUPATION:repairVehicle]:: Unit %2 repairing vehicle at %1",time,_assignedDriver]; 
        [_logDetail] call SC_fnc_log;
	};

	
	[_vehicle,_assignedDriver ] spawn 
	{
		_vehicle  = _this select 0;
        _vehicle forceSpeed 0;    
        _group = group _vehicle;
        _driver = _this select 1;
        _driver disableAI "TARGET";
        _driver disableAI "AUTOTARGET";
        _driver disableAI "AUTOCOMBAT";
        _driver disableAI "COVER";  
        _driver disableAI "SUPPRESSION";              
        sleep 1;
        _driver action ["getOut", _vehicle];
        
        if(SC_debug) then
        {
            _tag = createVehicle ["Sign_Arrow_Green_F", position _driver, [], 0, "CAN_COLLIDE"];
            _tag attachTo [_driver,[0,0,0.6],"Head"];  
        };
        sleep 0.2;  
        _driver doMove (position _vehicle);    	        
		_driverDir = _driver getDir _vehicle;
        _driver setUnitPos "MIDDLE";  	
		sleep 0.5;
		_driver playMoveNow "Acts_carFixingWheel";
		sleep 8;      
		_driver switchMove "";
		if(alive _driver) then
		{
			_vehicle setDamage 0;
			_driver playMoveNow "Acts_carFixingWheel";
			sleep 2;
            _driver switchMove "";
            _driver assignAsDriver _vehicle;
            _driver moveInDriver _vehicle;
            _driver action ["movetodriver", _vehicle];					
		};
        _wp = _group addWaypoint [position _vehicle, 0] ;
        _wp setWaypointFormation "Column";
        _wp setWaypointCompletionRadius 1;
        _wp setWaypointType "GETIN";		
        sleep 5;
        _spawnLocation = _vehicle getVariable "SC_vehicleSpawnLocation";	
         _driver action ["movetodriver", _vehicle];	
        _vehicle forceSpeed -1;	
        [_group, _spawnLocation, 2000] call bis_fnc_taskPatrol;
        _group setBehaviour "SAFE";
        _group setCombatMode "RED";
	
	};		
}
else
{
	_logDetail = format ["[OCCUPATION:repairVehicle]:: Not repairing %2, driver is %3 at %1",time,_vehicle,_assignedDriver]; 
	[_logDetail] call SC_fnc_log;
	_logDetail = format ["[OCCUPATION:repairVehicle]:: vehicle:%1 damage:%2 engine:%3 fuelTank:%4",_vehicle,_vehicleDamage,_engineDamage,_fueltankDamage]; 
	[_logDetail] call SC_fnc_log;
};
_vehicle addMPEventHandler ["mphit", "_this call SC_fnc_repairVehicle;"];