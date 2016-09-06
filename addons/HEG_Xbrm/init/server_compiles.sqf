diag_log format['Xbrm: Compiles started at %1',time];

Xbrm_lockToggle					=compile preprocessFileLineNumbers "\HEG_Xbrm\dbFunctions\Xbrm_lockToggle.sqf";
Xbrm_dbLogRaid					=compile preprocessFileLineNumbers "\HEG_Xbrm\dbFunctions\Xbrm_dbLogRaid.sqf";
Xbrm_updateTrap					=compile preprocessFileLineNumbers "\HEG_Xbrm\dbFunctions\Xbrm_updateTrap.sqf";
Xbrm_EH							=compileFinal preprocessFileLineNumbers "\HEG_Xbrm\EH\Xbrm_EH.sqf";
Xbrm_server_network_send		=compileFinal preprocessFileLineNumbers "\HEG_Xbrm\EH\Xbrm_server_network_send.sqf";
Xbrm_notifyMembers 				=compile preprocessFileLineNumbers "\HEG_Xbrm\services\Xbrm_notifyMembers.sqf";
Xbrm_notifyOwner 				=compile preprocessFileLineNumbers "\HEG_Xbrm\services\Xbrm_notifyOwner.sqf";

diag_log format['Xbrm: Compiles finished loading at %1',time];