/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object","_fuelCapacity","_fuel"];
_object = _this;
pumps = ["Land_fs_feed_F","Land_FuelStation_Feed_F"];
if((typeOf _object) in pumps)exitWith{[9000,10000]};
_fuelCapacity = getNumber(configFile >> "CfgVehicles" >> typeOf _object >> "fuelCapacity");
_fuel = fuel _object;
_fuel = round (_fuelCapacity * _fuel);
[_fuel,_fuelCapacity]