_logDetail = format ["[OCCUPATION:Unstick]:: Initialised at %1",time];
[_logDetail] call SC_fnc_log;

{
    if(isNull _x) exitWith { SC_liveHelisArray = SC_liveHelisArray - [_x];  };
    _logDetail = format ["[OCCUPATION:Unstick]:: Air: %1 is active",_x];
    [_logDetail] call SC_fnc_log; 
    _x setFuel 1;
    sleep 2;
    _originalSpawnLocation = _x getVariable "SC_vehicleSpawnLocation";
	_pos = position _x;	
	_nearestMarker = [allMapMarkers, _pos] call BIS_fnc_nearestPosition; // Nearest Marker to the Location		
	_posNearestMarker = getMarkerPos _nearestMarker;
    
    _group = group _x;
    _isFrozen =  _group getVariable["DMS_isGroupFrozen",false];
    if (!_isFrozen && (_pos distance _posNearestMarker < 750)) then 
    {
        _GroupLeader = leader (group _x); 
        _GroupLeader doMove _originalSpawnLocation;
    }
    else
    {
        _logDetail = format ["[OCCUPATION:Unstick]:: Air: %1 is currently frozen",_x];
        [_logDetail] call SC_fnc_log;         
    };   
}forEach SC_liveHelisArray;

{
    if(isNull _x) exitWith { SC_liveVehiclesArray = SC_liveVehiclesArray - [_x];  };
    _logDetail = format ["[OCCUPATION:Unstick]:: Land: %1 is active",_x];
    [_logDetail] call SC_fnc_log; 
    _x setFuel 1; 
    _group = group _x;
    _isFrozen =  _group getVariable["DMS_isGroupFrozen",false];    
    if (!_isFrozen) then 
    {
        [_x] call SC_fnc_unstick;
    }
    else
    {
        _logDetail = format ["[OCCUPATION:Unstick]:: Land: %1 is currently frozen",_x];
        [_logDetail] call SC_fnc_log;         
    };
    sleep 2;       
}forEach SC_liveVehiclesArray;

{
    if(isNull _x) exitWith { SC_liveBoatsArray = SC_liveBoatsArray - [_x];  };
    _logDetail = format ["[OCCUPATION:Unstick]:: Sea: %1 is active",_x];
    [_logDetail] call SC_fnc_log; 
    _x setFuel 1; 
    _group = group _x;
    _isFrozen =  _group getVariable["DMS_isGroupFrozen",false];         
    if (!_isFrozen) then 
    {
        [_x] call SC_fnc_unstick;
    }
    else
    {
        _logDetail = format ["[OCCUPATION:Unstick]:: Sea: %1 is currently frozen",_x];
        [_logDetail] call SC_fnc_log;         
    };
    sleep 2; 
}forEach SC_liveBoatsArray;


_logDetail = format ["[OCCUPATION:Unstick]:: Finished at %1",time];
[_logDetail] call SC_fnc_log;