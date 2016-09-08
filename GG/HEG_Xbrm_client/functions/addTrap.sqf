/*
addTrap.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/

private ["_object","_objectID","_isTrappedObject"];
_object = _this;
_objectID = netId _object;
_isTrappedObject = _object getvariable ["HegIsTrapped",1] isEqualTo -1;

if !(Xbrm_safe_trap in magazines player) exitWith {
	["ErrorTitleOnly", [Xbrm_no_trap]] call ExileClient_gui_toaster_addTemplateToast;
};
player removeMagazine Xbrm_safe_trap;
player enableSimulation false;
_result = ["Do you really want to set a safe trap?", "Safe trap?", "Yes", "Nah"] call BIS_fnc_guiMessage;
waitUntil { !isNil "_result" };
if (!_result) then {
	player enableSimulation true;
	player addMagazine Xbrm_safe_trap;
};
if (_result) then {
	player enableSimulation true;
	if (_isTrappedObject) then {
		["ErrorTitleOnly", ["Safe already rigged!"]] call ExileClient_gui_toaster_addTemplateToast;
		player addMagazine Xbrm_safe_trap;
	} else {
		_object setVariable ["HegIsTrapped", -1 ,true];
		Xbrm_network_send = [player,_objectID,"trap",""];
		publicVariableServer "Xbrm_network_send";
		["SuccessTitleOnly", ["Safe trap added successfully!"]] call ExileClient_gui_toaster_addTemplateToast;
	};
};		

