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


private ["_target","_type","_concreteClasses","_metalClasses","_woodClasses","_doorKind","_timer","_chance"];

_target = _this select 0;
_type = _this select 1;
_concreteClasses = ["Exile_Construction_ConcreteFloorHatch_Static","Exile_Construction_ConcreteGate_Static","Exile_Construction_ConcreteDoor_Static"];
_metalClasses = ["Exile_Construction_WoodDoor_Reinforced_Static", "Exile_Construction_WoodGate_Reinforced_Static"];
_woodClasses = ["Exile_Construction_WoodGate_Static","Exile_Construction_WoodDoor_Static"];
if ((typeOf _target) in _concreteClasses) then { doorKind = "concrete"; };
if ((typeOf _target) in _metalClasses) then { doorKind = "metal"; };
if ((typeOf _target) in _woodClasses) then { doorKind = "wood"; };
_doorKind = doorKind;

if(Xbrm_raiding) exitWith {
	["ErrorTitleOnly", ["You are already lockpicking!"]] call ExileClient_gui_toaster_addTemplateToast;
};
if!(Xbrm_lockpick_classname in magazines player) exitWith {
	["ErrorTitleOnly", [Xbrm_no_lockpick]] call ExileClient_gui_toaster_addTemplateToast;
};
_isLockedObject =_target getvariable ["ExileIsLocked",1] isEqualTo -1;
if!(_isLockedObject) exitWith {	
	_note = format ["The %1 is not locked", _type];
	["ErrorTitleOnly", [_note]] call ExileClient_gui_toaster_addTemplateToast;
};
player enableSimulation false;
_result = ["Do you really want to use the lockpick?", "Lockpick?", "Yes", "Nah"] call BIS_fnc_guiMessage;
waitUntil { !isNil "_result" };
if (!_result) then {
	player enableSimulation true;
};
if(_result) then {
	player enableSimulation true;
	Xbrm_raiding = true;

	switch (_type) do {
		case "door": {
			switch (_doorKind) do {
				case "wood": {
					_timer = Xbrm_door_time;
					_chance = Xbrm_door_chance;
					[_target, _type, _timer, _chance] execVM "addons\HEG_Xbrm_client\functions\useLockpick.sqf";
				};
				case "metal": {
					_timer = Xbrm_doorM_time;
					_chance = Xbrm_doorM_chance;
					[_target, _type, _timer, _chance] execVM "addons\HEG_Xbrm_client\functions\useLockpick.sqf";
				};
				case "concrete": {
					_timer = Xbrm_doorC_time;
					_chance = Xbrm_doorC_chance;
					[_target, _type, _timer, _chance] execVM "addons\HEG_Xbrm_client\functions\useLockpick.sqf";
				};
			};
		};
		case "safe": {
			_timer = Xbrm_safe_time;
			_chance = Xbrm_safe_chance;
			[_target, _type, _timer, _chance] execVM "addons\HEG_Xbrm_client\functions\useLockpick.sqf";
		};
	};
};
