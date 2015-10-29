/*
	Author: Vampire

	Description:
	launches VEMF (duuuuuuuuuuuuuuuuh) :P
*/

["Launcher", 3, format["/////// Exile_VEMF_Reloaded version %1 STARTING \\\\\\\", getNumber (configFile >> "CfgPatches" >> "Exile_VEMF_Reloaded" >> "version")]] call VEMFr_fnc_log;
uiNamespace setVariable ["VEMFrUsedLocs", []];
uiNamespace setVariable ["VEMFrHcLoad", []];
[] spawn VEMFr_fnc_checkLoot; // Check loot tables if enabled
[] spawn VEMFr_fnc_missionTimer; // Launch mission timer
west setFriend [independent, 0];
independent setFriend [west, 0];
