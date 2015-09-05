//Init Variables
pVeh_rV_r = 	[];
pVeh_cache = [];

//Add Client Request Vehicle EventHandler
"pVeh_rV" addPublicVariableEventHandler { (_this select 1) call pVeh_requestVehicle_server; };

//Create cache of player uids and last spawn time
pVeh_cache = [
	// PlayerUID, Time When Last Used, Object
	["ExampleUID", 30, objNull]
];

//byPlayer2