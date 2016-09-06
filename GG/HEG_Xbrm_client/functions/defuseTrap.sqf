/*
defuseTrap.sqf
Written by: -NFK- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/

private ["_target","_object","_getLucky","_origin","_fixed","_KDEH","_counter","_pcnt","_fixIt","_isCancelled","_chance"];
_target = cursorTarget;
_object = netId _target;
_getLucky = floor(random 100);
_origin = getPosATL player;
_fixed = Xbrm_defuse_time / 10;

fnc_keyPressed = {
  switch (_this select 1) do
  {
	  case 28: 
	  {
		  player setVariable ["DefuseIsCancelled",-1];
	  };
	  case 156: 
	  {
		  player setVariable ["DefuseIsCancelled",-1];
	  };
  };
};

Xbrm_defusing = true;
player enableSimulation true;

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
	progressText ctrlSetPosition [ 0.3885, 1.026, 0.43, 0.04 ];
	progressText ctrlCommit 0;
};
_KDEH = findDisplay 46 displayAddEventHandler ["KeyDown","_this call fnc_keyPressed"];
["SuccessTitleOnly", ["Starting defusing sequence, good luck!"]] call ExileClient_gui_toaster_addTemplateToast;
["SuccessTitleOnly", ["Press ENTER to cancel."]] call ExileClient_gui_toaster_addTemplateToast;

//start action loop and timer
execVM "addons\HEG_Xbrm_client\anim\defuse.sqf";
_counter = Xbrm_defuse_time * 10;
_pcnt = "%";

for "_i" from 1 to _counter do {

	_isCancelled = player getvariable ["DefuseIsCancelled",1] isEqualTo -1;
	_fixIt = _i / _fixed;
	// make sure player can not hide while lockpicking
	if (_isCancelled) exitWith {};
	if (player distance _origin > 5) exitWith {
		["ErrorTitleOnly", ["Failed, you have moved to far away!"]] call ExileClient_gui_toaster_addTemplateToast;
	};
	(uiNamespace getVariable "progressBar") progressSetPosition (_i/_counter); 
	(uiNamespace getVariable "progressText") ctrlSetStructuredText parseText format["Defusal Progress: %1%2", floor _fixIt, _pcnt];
	if !(alive player) exitWith {};
	sleep 0.1;
};
ctrlDelete (uiNamespace getVariable "progressBar");
ctrlDelete (uiNamespace getVariable "progressBox");
ctrlDelete (uiNamespace getVariable "progressText");
ctrlDelete (uiNamespace getVariable "progressTextBox");
player switchMove "StandUp";
//end action loop
_isCancelled = player getvariable ["DefuseIsCancelled",1] isEqualTo -1;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _KDEH];
//catch  fails and completely exit script.
if (_isCancelled) exitWith {
	Xbrm_defusing = false;
	player setVariable ["DefuseIsCancelled",0];	
	["ErrorTitleOnly", ["Sequence cancelled!"]] call ExileClient_gui_toaster_addTemplateToast;
};
if !(alive player) exitWith { Xbrm_defusing = false; };
if (player distance _origin >= 5) exitWith {
	player playActionNow "GestureNo";
	["ErrorTitleOnly", ["You must remain within 5m!"]] call ExileClient_gui_toaster_addTemplateToast;
	Xbrm_defusing = false;	
};
_chance = Xbrm_defuse_chance;
if (_chance < _getLucky) then {
	player playActionNow "GestureNo";
	[_object, _origin, 1] execVM "addons\HEG_Xbrm_client\functions\detonate.sqf";
	Xbrm_defusing = false;
} else {
	player playActionNow "GestureYes";
	_target setVariable ["HegIsTrapped", 0 ,true];
	_resp = ExileClientPlayerScore + 1000;
	ENIGMA_UpdateStats = [player,0,_resp];
	publicVariableServer "ENIGMA_UpdateStats";
	player playActionNow "GestureYes";
	player addItem Xbrm_trap_defuser;
	player addMagazine Xbrm_safe_trap;
	["SuccessTitleOnly", ["Defusal Successful!"]] call ExileClient_gui_toaster_addTemplateToast;
	Xbrm_defusing = false;
	Xbrm_network_send = [player, _object, "trap", ""];
	publicVariableServer "Xbrm_network_send";
};
Xbrm_defusing = false;