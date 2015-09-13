diag_log "Loading Custom Buildings";

switch(toLower worldName)do{
	case "altis":{
		diag_log "Loading Altis Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\server_buildings\buildings\Altis\traders.sqf";
	};
	case "bornholm":{
		diag_log "Loading Bornholm Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\server_buildings\buildings\Bornholm\traders.sqf";
	};
};