/**
 * ExileClient_util_gear_getCompatibleWeaponItems
 */
 
private["_weaponClassName","_weaponConfig","_compatibleItems","_getcompatibleItems"];
_weaponClassName = _this;
_weaponConfig = configFile >> "CfgWeapons" >> _weaponClassName;
_compatibleItems = getArray (_weaponConfig >> "magazines");

{
	_getcompatibleItems = [_weaponClassName] call asdg_fnc_compatibleItems;
	_compatibleItems append _getcompatibleItems;

}forEach [101,201,301,302];

{
	if !(_x isEqualTo "this") then
	{
		_compatibleItems append getArray (_weaponConfig >> _x >> "magazines");
	};
}
forEach getArray (_weaponConfig >> "muzzles");
{
	_compatibleItems set [_forEachIndex, toLower _x];
}
forEach _compatibleItems;
_compatibleItems