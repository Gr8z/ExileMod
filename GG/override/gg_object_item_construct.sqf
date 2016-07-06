/**
 * ExileClient_object_item_construct
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_itemClassName","_minimumDistanceToTraderZones","_minimumDistanceToSpawnZones","_maximumNumberOfTerritoriesPerPlayer","_numberOfTerritories","_cantBuildNear","_cantBuildDist"];
_itemClassName = _this select 0;

_cantBuildNear = [
    "Land_Airport_Tower_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F","Land_u_Barracks_V2_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F",
    "Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F",
    "Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Medevac_house_V1_F","Land_Medevac_HQ_V1_F",
    "Land_HBarrierTower_F","Land_MilOffices_V1_F","Land_Dome_Big_F","Land_Dome_Small_F","Land_Research_house_V1_F","Land_Research_HQ_F","Land_FuelStation_Shed_F","Land_fs_roof_F","Land_fs_feed_F","Land_bo_A_Office01",
	"Land_Strazni_vez","Land_Posed","Land_GuardShed","Land_Army_hut3_long_int","Land_Army_hut_int","Land_Hospital","Land_Mil_House","Land_A_Villa_EP1","Land_i_House_Small_02_V1_F","Land_dp_smallFactory_F",
    "Land_Majak2","Land_Vez","Land_Mil_Barracks_i","Land_Mil_Barracks_L","Land_Mil_Barracks","Land_Hlidac_budka","Land_Ss_hangar","Land_Mil_ControlTower","Land_a_stationhouse","Land_Farm_WTower","Land_Mil_Guardhouse",
    "Land_A_TVTower_Base","Land_Ind_Pec_03b","Land_TentHangar_V1_F"
];
_cantBuildDist = 200;

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
		if ({typeOf _x in _cantBuildNear} count nearestObjects[player, _cantBuildNear, _cantBuildDist] > 0) exitWith 
        {
        	throw "You cannot build within 200m of a blacklisted building!";
        };
		if (isOnRoad getPosATL player) exitWith
        { 
        	throw "You cannot build on a road!";
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
		["ErrorTitleAndText", ["Construction aborted!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
	};
};
true