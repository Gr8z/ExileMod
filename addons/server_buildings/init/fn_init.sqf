switch(toLower worldName)do{
	case "tanoa":{
		diag_log "Loading Tanoa Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Tanoa\banks.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Tanoa\millitary.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Tanoa\bridge.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Tanoa\signs.sqf";
	};
};