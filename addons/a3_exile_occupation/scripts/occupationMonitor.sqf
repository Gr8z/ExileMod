_logDetail = format ["[OCCUPATION:Unstick]:: Initialised at %1",time];
[_logDetail] call SC_fnc_log;

{
    _logDetail = format ["[OCCUPATION:Unstick]:: Air: %1 is active",_x];
    [_logDetail] call SC_fnc_log; 
    _x setFuel 1;
    sleep 5;
    _originalSpawnLocation = _x getVariable "SC_vehicleSpawnLocation";
	_pos = position _x;	
	_nearestMarker = [allMapMarkers, _pos] call BIS_fnc_nearestPosition; // Nearest Marker to the Location		
	_posNearestMarker = getMarkerPos _nearestMarker;
	if(_pos distance _posNearestMarker < 750) then 
    {
        _GroupLeader = leader (group _x); 
        _GroupLeader doMove _originalSpawnLocation;
    };    
}forEach SC_liveHelisArray;

{
    _logDetail = format ["[OCCUPATION:Unstick]:: Land: %1 is active",_x];
    [_logDetail] call SC_fnc_log; 
    _x setFuel 1; 
    [_x] call SC_fnc_comeUnstuck;
    sleep 5;       
}forEach SC_liveVehiclesArray;

{
    _logDetail = format ["[OCCUPATION:Unstick]:: Sea: %1 is active",_x];
    [_logDetail] call SC_fnc_log; 
    _x setFuel 1;      
    [_x] call SC_fnc_comeUnstuck; 
    sleep 5; 
}forEach SC_liveBoatsArray;


_logDetail = format ["[OCCUPATION:Unstick]:: Finished at %1",time];
[_logDetail] call SC_fnc_log;