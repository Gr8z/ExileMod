/**
 * ExileServer_system_garbageCollector_unscheduled_deleteGroups
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_interval","_units"];
_interval = 60 * getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Ingame" >> "Groups" >> "interval");
{
	if !(_x isEqualTo ExileGraveyardGroup) then
	{
		_units = units _x;
		if ((count _units) isEqualTo 0) then
		{
			if (local _x) then
			{
				deleteGroup _x;
			}
			else
			{
				[groupOwner _x, "DeleteGroupPlz", [_x]] call ExileServer_system_network_send_to;
			};
		};
	};
}
forEach allGroups;
