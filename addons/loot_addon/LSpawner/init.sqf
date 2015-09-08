if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "loot_addon\LSpawner\fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "loot_addon\LSpawner\LSdeleter.sqf";
	execVM "loot_addon\LSpawner\Lootspawner.sqf";
};