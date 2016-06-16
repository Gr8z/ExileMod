// Triggered when a ground vehicle takes damage
// Attempts to get the current vehicle driver to repair the vehicle

_vehicle = _this select 0;
_vehicle removeAllMPEventHandlers  "mphit";

_vehicleDamage 		= damage _vehicle;
_damagedWheels 		= 0;
_damageLimit 		= 1;
_engineDamage 		= false;
_fueltankDamage 	= false;
_wheelDamage 	    = false;
_assignedDriver 	= _vehicle getVariable "SC_assignedDriver";


if(isNil "_assignedDriver") then
{
    _group = group _vehicle;

    // Remove dead units from the group
    {
        if(!alive _x) then { [_x] join grpNull; };     
    }forEach units _group;  
    _groupMembers = units _group;
    _assignedDriver = _groupMembers call BIS_fnc_selectRandom;
    
    _assignedDriver removeAllMPEventHandlers  "mphit";                                          
    _assignedDriver disableAI "TARGET";
    _assignedDriver disableAI "AUTOTARGET";
    _assignedDriver disableAI "AUTOCOMBAT";
    _assignedDriver disableAI "COVER";  
    _assignedDriver disableAI "SUPPRESSION";                   
    _assignedDriver assignAsDriver _vehicle;
    _assignedDriver moveInDriver _vehicle;                
    _assignedDriver setVariable ["DMS_AssignedVeh",_vehicle];
    _assignedDriver setVariable ["SC_drivenVehicle", _vehicle,true]; 
    _assignedDriver addMPEventHandler ["mpkilled", "_this call SC_fnc_driverKilled;"];
    _vehicle setVariable ["SC_assignedDriver", _assignedDriver,true];
    
};


if(!alive _assignedDriver) exitWith 
{ 
    [_assignedDriver] call SC_fnc_driverKilled; 
};

_wheels = ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitLBWheel","HitLMWheel","HitRBWheel","HitRMWheel"]; 
{
	if ((_vehicle getHitPointDamage _x) > 0) then
	{	
		_partDamage = _vehicle getHitPointDamage _x;
        if(SC_extendedLogging) then 
        {
            _logDetail = format ["[OCCUPATION:repairVehicle]:: Vehicle %1 checking wheel %2 (damage: %4) @ %3",_vehicle, _x, time,_partDamage]; 
            [_logDetail] call SC_fnc_log;
        };        
		if(_partDamage > 0.3) then { _wheelDamage = true; };
	};
} forEach _wheels;

// Check Engine
if ((_vehicle getHitPointDamage "HitEngine") >= _damageLimit) then { _engineDamage = true; };

// Check Fuel Tank
if ((_vehicle getHitPointDamage "HitFuel") > 0) then { _fueltankDamage = true; };


if(_wheelDamage OR _engineDamage OR _fueltankDamage) then
{
	if(SC_extendedLogging) then 
	{
		_logDetail = format ["[OCCUPATION:repairVehicle]:: Unit %2 repairing vehicle at %1",time,_assignedDriver]; 
        [_logDetail] call SC_fnc_log;
	};

	
	[_vehicle,_assignedDriver ] spawn 
	{
		_vehicle  = _this select 0;
        _driver = _this select 1;
        
        _vehicle forceSpeed 0;
        sleep 0.2;    
        _group = group _vehicle;
      
        _driver disableAI "MOVE";  
        _driver disableAI "TARGET";
        _driver disableAI "AUTOTARGET";
        _driver disableAI "AUTOCOMBAT";
        _driver disableAI "COVER";  
        _driver disableAI "SUPPRESSION";    
        _driver disableAI "FSM";    
        sleep 0.3;
        _driver action ["getOut", _vehicle];
        _driver doMove (position _vehicle);
        sleep 0.3;    	        
		_driverDir = _driver getDir _vehicle;
        _driver setDir _driverDir;
        _driver setUnitPos "MIDDLE";  	
		sleep 0.1;
		_driver playMoveNow "Acts_carFixingWheel";
		sleep 4;      
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
            if(SC_extendedLogging) then 
            {
                _logDetail = format ["[OCCUPATION:repairVehicle]:: Unit %2 finished repairing vehicle %3 at %1",time,_driver,_vehicle]; 
                [_logDetail] call SC_fnc_log;
            };				
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
	    _driver enableAI "MOVE";    
        _driver enableAI "FSM"; 
	};		
}
else
{
	_logDetail = format ["[OCCUPATION:repairVehicle]:: Not repairing %2, driver is %3 at %1",time,_vehicle,_assignedDriver]; 
	[_logDetail] call SC_fnc_log;
	_logDetail = format ["[OCCUPATION:repairVehicle]:: Vehicle: %1 damage: %2 engine: %3 fuelTank: %4",_vehicle,_vehicleDamage,_engineDamage,_fueltankDamage]; 
	[_logDetail] call SC_fnc_log;
};
_vehicle addMPEventHandler ["mphit", "_this call SC_fnc_hitLand;"];