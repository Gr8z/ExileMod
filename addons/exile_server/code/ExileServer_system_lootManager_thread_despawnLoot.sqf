/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_minimumLootLifeTime","_maximumLootLifeTime","_visualThreshold","_building","_lootSpawnTime","_despawnLoot","_lootAliveTime","_lootWeaponHolderNetIDs","_lootWeaponHolder"];
_minimumLootLifeTime = getNumber (configFile >> "CfgSettings" >> "LootSettings" >>  "minimumLifeTime");
_maximumLootLifeTime = getNumber (configFile >> "CfgSettings" >> "LootSettings" >>  "maximumLifeTime");
_visualThreshold = getNumber (configFile >> "CfgSettings" >> "LootSettings" >>  "visualThreshold");
{
	_building = objectFromNetId _x;
	_lootSpawnTime = _building getVariable ["ExileLootSpawnedAt", 0];
	_despawnLoot = false;
	_lootAliveTime = time - _lootSpawnTime;
	if (_lootAliveTime > _maximumLootLifeTime) then
	{
		_despawnLoot = true;	
	}
	else 
	{
		if (_lootAliveTime > _minimumLootLifeTime) then
		{
			if !([getPosATL _building, _visualThreshold] call ExileClient_util_world_isAlivePlayerInfantryInRange) then
			{
				_despawnLoot = true;
			};
		};
	};
	if (_despawnLoot) then
	{
		_lootWeaponHolderNetIDs = _building getVariable ["ExileLootWeaponHolderNetIDs", []];
		{
			_lootWeaponHolder = objectFromNetId _x;
			if !(isNull _lootWeaponHolder) then
			{
				deleteVehicle _lootWeaponHolder;
			};
		}
		forEach _lootWeaponHolderNetIDs;
		_building setVariable ["ExileLootSpawnedAt", nil];
		_building setVariable ["ExileHasLoot", false];
		_building setVariable ["ExileLootWeaponHolderNetIDs", []];
		ExileServerBuildingNetIdsWithLoot deleteAt _forEachIndex;
	};
}
forEach ExileServerBuildingNetIdsWithLoot;