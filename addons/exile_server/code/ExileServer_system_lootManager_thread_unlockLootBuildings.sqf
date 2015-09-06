/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_lootLifetime","_lootDespawnRadius","_building","_timeAlive","_forceDespawnTime"];
_lootLifetime = ((getNumber(configFile >> "CfgSettings" >> "LootSettings" >>  "lifeTime") max 300) min 600);
_lootDespawnRadius = ((getNumber(configFile >> "CfgSettings" >> "LootSettings" >>  "despawnRadius") max 10) min 200);
_forceDespawnTime = getNumber(configFile >> "CfgSettings" >> "GarbageCollector" >> "despawnAfterMinutes") * 60;

["Checking unlock building."] call Exile_DebugLog;
{
	_building = objectFromNetId _x;
	
	_timeAlive = time - (_building getVariable ["ExileLootSpawnedAt", _lootLifetime]);
	_isPlayerNearby = [getPosATL _building, _lootDespawnRadius] call ExileServer_util_position_isPlayerNearby;

	[format ["Building _timeAlive: %1, _isPlayerNearby: %2", _timeAlive, _isPlayerNearby]] call Exile_DebugLog;

	if (_timeAlive >= _forceDespawnTime || (_timeAlive >= _lootLifetime && !_isPlayerNearby)) then
	{
			["Unlocking Building."] call Exile_DebugLog;
			_building setVariable ["ExileLootSpawnedAt", nil];
			_building setVariable ["ExileHasLoot", false];
			ExileServerBuildingNetIdsWithLoot deleteAt _forEachIndex;
	};
}
forEach ExileServerBuildingNetIdsWithLoot;
true