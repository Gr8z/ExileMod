[10,true,true,16] execFSM "GG\timeModule.fsm";
if (isDedicated || isServer) then {
	"do_MakeBike" addPublicVariableEventHandler {
		_parameters = (_this select 1);
		_parameters2  =(_parameters select 1);
		diag_log format ["createVehicleRequested %1 ", _parameters]; // YOU NEED THIS FOR LOGS TO SEE WHO DID IT
		veh = createVehicle["Exile_Bike_QuadBike_Black", _parameters2 , [] ,0 , "NONE"];
	};
};
if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "GG\loot\fn_LSgetBuildingstospawnLoot.sqf";
    LSdeleter = compile preProcessFileLineNumbers "GG\loot\LSdeleter.sqf";
    execVM "GG\loot\Lootspawner.sqf";
    execVM "SearchAndReplace.sqf";
};
