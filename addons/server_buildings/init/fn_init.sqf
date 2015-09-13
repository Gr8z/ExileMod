diag_log "Loading Custom Buildings";

switch(toLower worldName)do{
	case "altis":{
		diag_log "Loading Altis Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Altis\traders.sqf";
	};
	case "bornholm":{
		diag_log "Loading Bornholm Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Bornholm\traders.sqf";
	};
};