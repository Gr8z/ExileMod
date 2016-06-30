_roadSpawn      = _this select 0;
_waterSpawn     = _this select 1;
_inWater        = 0;
_position       = [0,0,0];
_nearestRoad    = [0,0,0];

_pos        = if ((count _this)>2) then {_this select 2} else {false};
_maxDist    = if ((count _this)>2) then {_this select 3} else {false};

if(_waterSpawn) then
{
    _inWater = 2;    
}
else
{
    _inWater = 0;    
};

if(!_pos OR !_maxDist) then 
{
    _middle     = worldSize/2;
    _pos  = [_middle,_middle,0];
    _maxDist 	= _middle - 100; 
       
};
_validspot	= false;

while{!_validspot} do 
{
	sleep 0.2;
    _tempPosition = [_pos,0,_maxDist,15,_inWater,20,0] call BIS_fnc_findSafePos;
    _position = [_tempPosition select 0, _tempPosition select 1, 0];
    
    //diag_log format["BIS_fnc_findSafePos found position %8 using %1,%2,%3,%4,%5,%6,%7",_pos,0,_maxDist,15,_inWater,20,0,_position];
	_validspot = true;

    if(_roadSpawn) then
    {
        
        // Get position of nearest roads
        _nearRoads = _position nearRoads 500;
        if (count _nearRoads == 0 OR isNil "_nearRoads") then
        { 
            _validspot = false;  
            diag_log format["BIS_fnc_findSafePos no roads found near position  %1",_position];
        }
        else
        {
            _nearestRoad = _nearRoads select 0;
            _position = position _nearestRoad;
            diag_log format["BIS_fnc_findSafePos checking road found at %1",_position];        
        };        
    };
    
    _isOverWater = surfaceIsWater _position;
    
    if(!_waterSpawn && _isOverWater) then
    {
        _validspot = false;  
        diag_log format["BIS_fnc_findSafePos none waterspawn over water  %1",_position];
    };
    
    if(_validspot) then
    {
         _validspot = [ _position ] call SC_fnc_isSafePos;     
    };         
};

_position	