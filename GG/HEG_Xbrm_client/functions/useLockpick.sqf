/*
useLockpick.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/


disableSerialization;
private ["_target","_object","_isTrappedObject","_type","_timer","_chance","_diceRoll","_origin","_fixed","_counter","_pcnt","_display","_isCancelled","_fixIt"];
_target = _this select 0;
_object = netId _target;
_isTrappedObject = _target getvariable ["HegIsTrapped",1] isEqualTo -1;
_type = _this select 1;
_timer = _this select 2;
_chance = _this select 3;
player removeMagazine Xbrm_lockpick_classname;
_diceRoll = floor(random 100);
_origin = getPosATL player;
_fixed = _timer / 10;
Xbrm_network_send = [player, _object, _type, "attempt"];
publicVariableServer "Xbrm_network_send";

//open keypad
execVM "addons\HEG_Xbrm_client\keypad\keypad.sqf";

player playAction "Crouch";

//Create progress bar
with uiNamespace do {	
	progressTextBox = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	progressTextBox ctrlSetPosition [ -0.109, 1.0242, 1.215, 0.0515 ];
	progressTextBox ctrlSetBackgroundColor [0,0,0,1];
	progressTextBox ctrlCommit 0;
	
	progressBar = findDisplay 46 ctrlCreate ["RscProgress", -1]; 
	progressBar ctrlSetPosition [ -0.1, 1.034145, 1.1975, 0.0319 ]; 
	progressBar progressSetPosition 0; 
	progressBar ctrlCommit 0;
	
	progressBox = findDisplay 46 ctrlCreate ["RscFrame", -1]; 
	progressBox ctrlSetPosition [ -0.101, 1.032, 1.201, 0.0365 ];
	progressBox progressSetPosition 0; 
	progressBox ctrlCommit 0;
	
	progressText = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	progressText ctrlSetPosition [ 0.3835, 1.026, 0.43, 0.04 ];
	progressText ctrlCommit 0;
};
["SuccessTitleOnly",["Starting lockpicking sequence, good luck!"]] call ExileClient_gui_toaster_addTemplateToast;
["SuccessTitleOnly",["Press red button to cancel."]] call ExileClient_gui_toaster_addTemplateToast;

//Check if safe is trapped and exit if it is.
if (_isTrappedObject) exitWith {
	disableSerialization;
	_display = uiNameSpace getVariable ["RscExileKeypad", displayNull];
	_display closeDisplay 0;
	ctrlDelete (uiNamespace getVariable "progressBar");
	ctrlDelete (uiNamespace getVariable "progressBox");
	ctrlDelete (uiNamespace getVariable "progressText");
	ctrlDelete (uiNamespace getVariable "progressTextBox");
	[_object, _origin, 2] execVM "addons\HEG_Xbrm_client\functions\detonate.sqf";
	Xbrm_network_send = [player, _object, _type, "failed"];
	publicVariableServer "Xbrm_network_send";
	Xbrm_raiding = false;
};

_counter = _timer * 10;
_pcnt = "%";

//start timer, and action loop
_timer execVM "addons\HEG_Xbrm_client\anim\animate.sqf";
for "_i" from 1 to _counter do {

	_isCancelled = player getvariable ["LockpickIsCancelled",1] isEqualTo -1;
	_fixIt = _i / _fixed;
	// make sure player can not hide while lockpicking
	if (player distance _origin > 20) exitWith {
		["ErrorTitleOnly", ["Failed, you have moved to far away!"]] call ExileClient_gui_toaster_addTemplateToast;
	};
	if !(alive player) exitWith {};
	(uiNamespace getVariable "progressBar") progressSetPosition (_i/_counter); 
	(uiNamespace getVariable "progressText") ctrlSetStructuredText parseText format["Lockpicking Progress: %1%2", floor _fixIt, _pcnt];
	if (_isCancelled) exitWith {
		["ErrorTitleOnly", ["Cancelled!"]] call ExileClient_gui_toaster_addTemplateToast;
	};
	sleep 0.1;
};
disableSerialization;
_display = uiNameSpace getVariable ["RscExileKeypad", displayNull];
_display closeDisplay 0;
ctrlDelete (uiNamespace getVariable "progressBar");
ctrlDelete (uiNamespace getVariable "progressBox");
ctrlDelete (uiNamespace getVariable "progressText");
ctrlDelete (uiNamespace getVariable "progressTextBox");
player switchAction "StandUp";
//end action loop

_isCancelled = player getvariable ["LockpickIsCancelled",1] isEqualTo -1;

//catch triggered fails and completely exit script.
if !(alive player) exitWith {
	Xbrm_raiding = false;
	Xbrm_network_send = [player, _object, _type, "failed"];
	publicVariableServer "Xbrm_network_send";
};

if (player distance _origin > 19) exitWith {
	player playActionNow "GestureNo";
	["ErrorTitleOnly", ["You must remain within 20m!"]] call ExileClient_gui_toaster_addTemplateToast;
	Xbrm_raiding = false;
	Xbrm_network_send = [player, _object, _type, "failed"];
	publicVariableServer "Xbrm_network_send";	
};

//Pass or Fail
if (_chance < _diceRoll || _isCancelled) then {
    player playActionNow "GestureNo";
	player setVariable ["LockpickIsCancelled",0];
	["ErrorTitleOnly",["Lockpicking Failed!"]] call ExileClient_gui_toaster_addTemplateToast;
	Xbrm_network_send = [player, _object, _type, "failed"];
	publicVariableServer "Xbrm_network_send";
} else {
	_resp = ExileClientPlayerScore + 1000;
	ENIGMA_UpdateStats = [player,0,_resp];
    publicVariableServer "ENIGMA_UpdateStats";
	player playActionNow "GestureYes";
	player addMagazine Xbrm_lockpick_classname;
	["SuccessTitleOnly",["Lockpicking successful!"]] call ExileClient_gui_toaster_addTemplateToast;
	Xbrm_network_send = [player, _object, _type, "success"];
	publicVariableServer "Xbrm_network_send";
};
Xbrm_raiding = false;