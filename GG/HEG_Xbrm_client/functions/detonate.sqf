/*
detonate.sqf
Written by: -NFK- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/


private ["_object", "_origin","_which","_target","_bomb"];
_object = _this select 0;
_origin = _this select 1;
_which = _this select 2;
_target = objectFromNetId _object;



switch (_which) do {
	case 1: { 
	  ["ErrorTitleOnly", ["RIP! Defusal Failed!"]] call ExileClient_gui_toaster_addTemplateToast; 
	  Xbrm_defusing = false;
	};
	case 2: { 
	  ["ErrorTitleOnly", ["RIP! The safe was rigged!"]] call ExileClient_gui_toaster_addTemplateToast; 
	  Xbrm_raiding = false;
	};
};
_target setVariable ["HegIsTrapped", 0 ,true];
Xbrm_network_send = [player, _object, "trap", ""];
publicVariableServer "Xbrm_network_send";
playSound "safeTrap";
sleep 1.8;
_bomb = 'HelicopterExploSmall' createVehicleLocal _origin;