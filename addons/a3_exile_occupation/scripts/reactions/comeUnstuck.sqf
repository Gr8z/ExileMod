// Unstuck based on a function written by Chris (infiSTAR)
// http://pastebin.com/73pjvXPw


private["_vehicle","_curPos","_oldvehPos","_engineTime","_newPos"];
_vehicle = _this select 0;

if(isNil "_vehicle") exitWith{};

if(count(crew _vehicle) > 0)then
{
    _curPos = position _vehicle;
    _newPos = _curPos;
    _oldvehPos = _vehicle getVariable["vehPos",[0,0,0]];
    if(isNil "_oldvehPos") then { _oldvehPos = [0,0,0]; };
    if(str _oldvehPos != "[0,0,0]")then
    {
        if(_curPos distance _oldvehPos < 2)then
        {
            _engineTime  = _vehicle getVariable["engineTime",-1];
            if(_engineTime < 0)then
            {
                _vehicle setVariable["engineTime",time];
            };
            if(time - _engineTime > 10)then
            {

                _logDetail = format ["[OCCUPATION:Unstuck]:: %1 is stuck,attempting to unstick from %2 @ %3",_vehicle,_curPos,time]; 
                [_logDetail] call SC_fnc_log;
                                
                _vehicle setVariable["engineTime",-1];
                
                _vehicle setVectorUp [0,0,1];
                                    
                _originalSpawnLocation = _vehicle getVariable "SC_vehicleSpawnLocation";
                _group = group _vehicle;
                _vehClass = typeOf _vehicle;

                if(_vehicle isKindOf "LandVehicle") then
                {
                    _tempPos = _curPos findEmptyPosition [0,150,_vehClass];
                    _newPos = [_tempPos select 0, _tempPos select 1, 0];                                           
                };
                
                if(_vehicle isKindOf "Ship") then
                {
                    _newPos = [_curPos, 5, 100, 3, 2, 20, 0] call BIS_fnc_findSafePos; 
                    _newPos = _curPos;
                    _vehicle setDamage 0.2; 
                };
                
                if(_vehicle isKindOf "Air") then
                {
                    _newPos = _curPos;    
                };
                _GroupLeader = leader (group _vehicle); 
                _GroupLeader doMove _originalSpawnLocation;
                [_group, _originalSpawnLocation, 2000] call bis_fnc_taskPatrol;
                _group setBehaviour "AWARE";
                _group setCombatMode "RED"; 

                _logDetail = format ["[OCCUPATION:Unstuck]:: %1 was stuck and was moved from %2 to %3 @ %4",_vehicle,_curPos,_newPos, time]; 
                [_logDetail] call SC_fnc_log;
                
            };
        };
    };
    _vehicle setVariable["vehPos",_newPos];
};

