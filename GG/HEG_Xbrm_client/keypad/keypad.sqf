uiSleep 0.3;
_target = cursorTarget;
_isTrappedObject = _target getvariable ["HegIsTrapped",1] isEqualTo -1;




//function to cancel lockpicking
fnc_abortLockpick = {
  private["_display"];
  disableSerialization;
  _display = uiNameSpace getVariable ["RscExileKeypad", displayNull];
  _display closeDisplay 0;
  player setVariable ["LockpickIsCancelled",-1];
  true
};

//funtion keep dialog open
fnc_keyPressed = {
  switch (_this select 1) do
  {
	  //Esc key
	  case 1: 
	  {
		  ["Whoops",["Press red button to cancel."]] call ExileClient_gui_notification_event_addNotification;
		  execVM "addons\HEG_Xbrm_client\keypad\keypad.sqf";
	  };
	  //Enter key
	  case 28:
	  {
		  ["Whoops",["Press red button to cancel."]] call ExileClient_gui_notification_event_addNotification;
		  execVM "addons\HEG_Xbrm_client\keypad\keypad.sqf";
	  };
	  //Num Enter key
	  case 156:
	  {
		  ["Whoops",["Press red button to cancel."]] call ExileClient_gui_notification_event_addNotification;
		  execVM "addons\HEG_Xbrm_client\keypad\keypad.sqf";
	  };
  };
};

disableSerialization;
_display = uiNameSpace getVariable ["RscExileKeypad", displayNull]; 
_display displayRemoveEventHandler ["KeyDown", _KDEH];
_display closeDisplay 0;

disableSerialization;
createDialog "RscExileKeypad";
_display = uiNameSpace getVariable ["RscExileKeypad", displayNull];
_KDEH = _display displaySetEventHandler ["KeyDown","_this call fnc_keyPressed"];
_ctrlButtonCancel = _display displayCtrl 4002;
_ctrlButtonCancel ctrlSetEventHandler ["ButtonClick","call fnc_abortLockpick"];
call ExileClient_gui_keypadDialog_updateControls;
_screenText = _display displayCtrl 4001;
_screenText ctrlSetText "";

//scramble keypad
for "_i" from 1 to 9999 do {

	_isCancelled = player getvariable ["LockpickIsCancelled",1] isEqualTo -1;
	_rndChar1 = selectRandom [0,1,2,3,4,5,6,7,8,9];
	_rndChar2 = selectRandom [0,1,2,3,4,5,6,7,8,9];
	_rndChar3 = selectRandom [0,1,2,3,4,5,6,7,8,9];
	_rndChar4 = selectRandom [0,1,2,3,4,5,6,7,8,9];
	_screenText = _display displayCtrl 4001;
	_screenText ctrlSetText format ["%1%2%3%4", _rndChar1, _rndChar2, _rndChar3, _rndChar4];
	if (_isCancelled) exitWith {};
	if !(alive player) exitWith {};
	if !(Xbrm_raiding) exitWith {};
	if (_isTrappedObject) exitWith {};
	sleep 0.1;
};

disableSerialization;
_display = uiNameSpace getVariable ["RscExileKeypad", displayNull];
_display closeDisplay 0;