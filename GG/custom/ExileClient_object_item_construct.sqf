/**
 * ExileClient_object_item_construct
 */
 
private["_cantBuildNear","_cantBuildDist","_elevation","_itemClassName","_minimumDistanceToTraderZones","_minimumDistanceToSpawnZones","_maximumNumberOfTerritoriesPerPlayer","_numberOfTerritories","_cantBuildNear"];


_elevation = (getPosATL player) select 2;
_itemClassName = _this select 0;
if !(_itemClassName in (magazines player)) exitWith {false};

_cantBuildNear = [	
	"Land_TentHangar_V1_F","Land_Hangar_F","Land_Airport_Tower_F","Land_Cargo_House_V1_F",
    "Land_Cargo_House_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F",
    "Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_i_Barracks_V1_F","Land_Cargo_Patrol_V1_F",
    "Land_Cargo_Patrol_V2_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F",
    "Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F",
    "Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_MilOffices_V1_F",
    "Land_Radar_F","Land_budova4_winter","land_hlaska","Land_Vysilac_FM","land_st_vez","Land_ns_Jbad_Mil_Barracks",
    "Land_ns_Jbad_Mil_ControlTower","Land_ns_Jbad_Mil_House","land_pozorovatelna","Land_vys_budova_p1",
    "Land_Vez","Land_Mil_Barracks_i","Land_Mil_Barracks_L","Land_Mil_Barracks",
    "Land_Hlidac_budka","Land_Ss_hangar","Land_Mil_ControlTower","Land_a_stationhouse",
    "Land_Farm_WTower","Land_Mil_Guardhouse","Land_A_statue01","Land_A_Castle_Gate",
    "Land_A_Castle_Donjon","Land_A_Castle_Wall2_30","Land_A_Castle_Stairs_A",
    "Land_i_Barracks_V1_dam_F","Land_Cargo_Patrol_V3_F","Land_Radar_Small_F","Land_Dome_Big_F",
    "Land_Dome_Small_F","Land_Army_hut3_long_int","Land_Army_hut_int","Land_Army_hut2_int",
    // Additional Buildings
    "Land_Barracks_01_camo_F","Land_Barracks_01_grey_F","land_AII_last_floor","land_AII_middle_floor",
    "land_AII_upper_part","Land_Ind_IlluminantTower","Land_Misc_deerstand","Land_ns_Jbad_A_Stationhouse",
    "Land_Airport_01_controlTower_F","Land_Airport_01_terminal_F","Land_Airport_02_controlTower_F",
    "Land_Airport_02_terminal_F","Land_Cargo_House_V4_F","Land_Cargo_HQ_V4_F","Land_Cargo_Patrol_V4_F",
    "Land_Cargo_Tower_V4_F","Land_Atm_01_F"
]; 
_cantBuildDist = 200;

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
        	throw "You cannot build within 200m of a blacklisted building.";
        };
		ExileBuildHeightLimit = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumHeight");
		if (_elevation >= ExileBuildHeightLimit) then
		{
			throw "You are scared of heights and can't build here.";
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