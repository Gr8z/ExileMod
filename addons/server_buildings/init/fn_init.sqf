switch(toLower worldName)do{
	case "altis":{
		diag_log "Loading Altis Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Altis\traders.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Altis\roadblock.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Altis\banks.sqf";
	};
	case "tanoa":{
		diag_log "Loading Tanoa Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Tanoa\banks.sqf";
	};
	case "chernarus":{
		diag_log "Loading Chernarus Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Chernarus\traders.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Chernarus\water.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Chernarus\millitary.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Chernarus\banks.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_exile_server_building\buildings\Chernarus\bor.sqf";
	};
};