/**
 * ExileClient_object_item_construct
 */
 
private["_elevation","_itemClassName","_minimumDistanceToTraderZones","_minimumDistanceToSpawnZones","_maximumNumberOfTerritoriesPerPlayer","_numberOfTerritories"];


_elevation = (getPosATL player) select 2;
_itemClassName = _this select 0;
if !(_itemClassName in (magazines player)) exitWith {false};
if( isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Constructing") ) then
{
	if (findDisplay 602 != displayNull) then
	{
		(findDisplay 602) closeDisplay 2; 
	};
	try 
	{
		if !((vehicle player) isEqualTo player) then
		{
			throw "You cannot build while in a vehicle.";  
		};
		_minimumDistanceToTraderZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToTraderZones");
		if ([player, _minimumDistanceToTraderZones] call ExileClient_util_world_isTraderZoneInRange) then
		{
			throw "You are too close to a safe zone.";
		};
		if (player call ExileClient_util_world_isInNonConstructionZone) then 
		{
			throw "Building is disallowed here on this server.";
		};
		if (player call ExileClient_util_world_isInConcreteMixerZone) then 
		{
			throw "You are too close to a concrete mixer zone.";
		};
		_minimumDistanceToSpawnZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToSpawnZones");
		if ([player, _minimumDistanceToSpawnZones] call ExileClient_util_world_isSpawnZoneInRange) then
		{
			throw "You are too close to a spawn zone.";
		};
		ExileBuildHeightLimit = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumHeight");
		if (_elevation >= ExileBuildHeightLimit) then
		{
			throw "Whoops";
		};
		if(_itemClassName isEqualTo "Exile_Item_Flag") then 
		{ 
			_maximumNumberOfTerritoriesPerPlayer = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumNumberOfTerritoriesPerPlayer");
			_numberOfTerritories = player call ExileClient_util_territory_getNumberOfTerritories;
			if (_numberOfTerritories >= _maximumNumberOfTerritoriesPerPlayer) then
			{
				throw "You have reached the maximum number of territories you can own.";
			};
			call ExileClient_gui_setupTerritoryDialog_show;
		}
		else 
		{
			[_itemClassName] call ExileClient_construction_beginNewObject;
		};
	}
	catch 
	{
		if(_exception isEqualTo "Whoops") then
		{
			ExileBuildHeightLimit = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumHeight");
			["ErrorTitleAndText", ["Construction aborted!", "The build height limit of 30 meters has been reached."]] call ExileClient_gui_toaster_addTemplateToast;
		}
		else
		{
			["ErrorTitleAndText", ["Construction aborted!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
};
true