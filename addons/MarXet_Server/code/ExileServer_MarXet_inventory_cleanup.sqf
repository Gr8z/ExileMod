/*
*
*  ExileServer_MarXet_inventory_cleanup.sqf
*  Author: WolfkillArcadia
*  © 2016 Arcas Industries
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_restrictTime","_deleteTime"];
_restrictTime = getNumber(missionConfigFile >> "CfgMarXet" >> "Database" >> "restrictTime");
_deleteTime = getNumber(missionConfigFile >> "CfgMarXet" >> "Database" >> "deleteTime");
if !(_restrictTime isEqualTo -1) then
{
    format["restrictOldListings:%1",_restrictTime] call ExileServer_system_database_query_fireAndForget;
};
if !(_deleteTime isEqualTo -1) then
{
    format["deleteOldListings:%1",_deleteTime] call ExileServer_system_database_query_fireAndForget;
};
