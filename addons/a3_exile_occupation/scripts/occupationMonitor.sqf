_logDetail = format ["[OCCUPATION:Unstick]:: Initialised at %1",time];
[_logDetail] call SC_fnc_log;

{
    _logDetail = format ["[OCCUPATION:Unstick]:: Air: %1 is active",_x];
    [_logDetail] call SC_fnc_log; 
    _x setFuel 1;
    sleep 5;
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

{
    _logDetail = format ["[OCCUPATION:Unstick]:: publicBus: %1 is active",_x];
    [_logDetail] call SC_fnc_log; 
    _x setFuel 1;      
    [_x] call SC_fnc_comeUnstuck; 
    sleep 5; 
}forEach SC_publicBusArray;

_logDetail = format ["[OCCUPATION:Unstick]:: Finished at %1",time];
[_logDetail] call SC_fnc_log;