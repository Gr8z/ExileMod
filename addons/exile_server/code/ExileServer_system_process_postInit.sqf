/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if (!isNil "PublicHiveVersion") then
{
	call ExileServer_system_thread_initialize;
	call ExileServer_system_playerLoadQueue_initialize;
	call ExileServer_system_playerSaveQueue_initialize;
	call ExileServer_system_playerCreateQueue_initialize;
	call ExileServer_system_swapOwnershipQueue_initialize;
	call ExileServer_system_vehicleSaveQueue_initialize;
	call ExileServer_system_simulationMonitor_initialize;
	call ExileServer_system_lootManager_initialize;
	call ExileServer_system_weather_initialize;
	call ExileServer_world_initialize;
	call ExileServer_system_LocalityMonitor_initialize;
	PublicHiveIsLoaded = true; 
	publicVariable "PublicHiveIsLoaded";
	format ["Server is up and running! Version: %1", PublicHiveVersion] call ExileServer_util_log;
	[] execFSM "exile_server\fsm\main.fsm";
};