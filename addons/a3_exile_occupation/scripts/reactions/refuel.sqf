// Triggered when a vehicle runs out of fuel but only if not damaged

_vehicle    = _this select 0;
_fuel       = _this select 1;

diag_log format["[OCCUPATION:refuelcheck] _vehicle: %1 ---- _fuel: %2 ",_vehicle,_fuel];
/*
if(!isNil "_vehicle" && !isNil "_fuel") then
{
    _damage = getdammage _vehicle;

    if(_damage <> 0 && !_fuel) then
    {
        _vehicle setFuel 1;
        _vehicle engineOn true;       
    };      
};
*/
