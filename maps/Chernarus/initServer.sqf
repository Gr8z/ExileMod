[10,true,true,16] execFSM "GG\timeModule.fsm";
[] execVM "GG\personalVehicles\init.sqf";

if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "GG\loot\fn_LSgetBuildingstospawnLoot.sqf";
    LSdeleter = compile preProcessFileLineNumbers "GG\loot\LSdeleter.sqf";
    execVM "GG\loot\Lootspawner.sqf";
    execVM "SearchAndReplace.sqf";
};
