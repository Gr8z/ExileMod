createDialog "XG_killBoard";
lbClear 1500;
{
	_x params[["_victimName",""],["_killerName",""],["_killerWeapon",""],["_killerVehicle",""],["_distance",""],"_text","_killerWeapon"];
	if(_killerVehicle isEqualTo "Exile Player") then
	{
		if(_killerWeapon isEqualTo "") then
		{
			_killerWeapon = "No weapon";
		};	
		_text = format["%1 was killed by %2 with %3 from %4m",_victimName,_killerName,_killerWeapon,_distance];
	}
	else
	{
		_text = format["%1 was killed by %2 in %3",_victimName,_killerName,_killerVehicle];
	};
	_lb = lbAdd [1500, _text];
} forEach XG_killBoard;
