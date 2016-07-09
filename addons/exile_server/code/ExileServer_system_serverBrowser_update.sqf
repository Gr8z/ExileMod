/**
 * ExileServer_system_serverBrowser_update
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_mods","_data","_result"];
_mods = [];
{
	if !((configName _x) in ["A3", "Curator", "DLCBundle", "Heli", "Kart", "Mark", "Mod_Base", "Exile"]) then 
	{
		_mods pushBack
		[
			getText (_x >> "name"),
			getText (_x >> "dir"),
			getText (_x >> "action")
		];
	};
}
forEach ("true" configClasses (configFile >> "CfgMods"));
_data = "";
_data = _data + format ["name: %1\n", serverName];
_data = _data + format ["slots: %1\n", playableSlotsNumber independent];
_data = _data + format ["mission_name: %1\n", missionName];
_data = _data + format ["world_name: %1\n", worldName];
_data = _data + format ["world_description: %1\n", getText (configFile >> "CfgWorlds" >> worldName >> "description")];
_data = _data + format ["difficulty: %1\n", difficulty];
_data = _data + format ["exile_version: %1\n", getText (configFile >> "CfgMods" >> "Exile" >> "version")];
_data = _data + format ["product_version: %1.%2\n", productVersion select 2, productVersion select 3];
_data = _data + format ["platform: %1\n", productVersion select 6];
_data = _data + format ["branch: %1\n", productVersion select 4];
_data = _data + format ["mods: %1\n", _mods];
diag_log "Sending information to exilemod.com (If config file exists!)...";
_result = "ExileInfo" callExtension (str _data);
diag_log "Result: " + (str _result);
