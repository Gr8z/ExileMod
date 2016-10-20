
/**
 * ExileClient_gui_selectSpawnLocation_event_onSpawnButtonClick
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

if(isNil "CC_LastSpawnLocation") then
{
	CC_LastSpawnLocation = [];
};
//CC_LastSpawnLocation pushBack ExileClientSelectedSpawnLocationMarkerName;
_currentSpawn = ExileClientSelectedSpawnLocationMarkerName;
[
	900, // Default is 15 minutes.
	{
		CC_LastSpawnLocation deleteAt 0;
	},
	[],
	false
] call ExileClient_system_thread_addTask;

ExileClientSpawnLocationSelectionDone = true;
closeDialog 1;

true