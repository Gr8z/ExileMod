_Vehicle1Name = "Mountain Bike";
box1Cost = 5000;
 
_Vehicle2Name = "Quad Bike";
box2Cost = 10000;
 
_Vehicle2Name = "Pro Drop";
box3Cost = 30000;
 
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
 
//set XM8 title
(_display displayCtrl 4004) ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>DEPLOY VEHICLE</t>"]));
 
//Hides all xm8 apps controlls then deletes them for a smooth transition
_xm8Controlls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
    _fade = _display displayCtrl _x;
    _fade ctrlSetFade 1;
    _fade ctrlCommit 0.5;
} forEach _xm8Controlls;
{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controlls;
uiSleep 0.2;
 
_drop1Info = _display ctrlCreate ["RscStructuredText", 851];
_drop1Info ctrlSetPosition [(9.5 - 3) * (0.025),(6 - 2) * (0.04),(0.28),5 * (0.04)];
_drop1Info ctrlCommit 0;
_drop1Info ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Starter Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",box1Cost]));
_drop1Info ctrlSetBackgroundColor [0.11,0.106,0.125,1];
 
_drop2Info = _display ctrlCreate ["RscStructuredText", 852];
_drop2Info ctrlSetPosition [(9.5 - 3) * (0.025),(11.5 - 2) * (0.04),(0.28),5 * (0.04)];
_drop2Info ctrlCommit 0;
_drop2Info ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Medium Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",box2Cost]));
_drop2Info ctrlSetBackgroundColor [0.11,0.106,0.125,1];
 
_drop3Info = _display ctrlCreate ["RscStructuredText", 853];
_drop3Info ctrlSetPosition [(9.5 - 3) * (0.025),(17 - 2) * (0.04),(0.28),5 * (0.04)];
_drop3Info ctrlCommit 0;
_drop3Info ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Pro Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",box3Cost]));
_drop3Info ctrlSetBackgroundColor [0.11,0.106,0.125,1];
 
_crate1Buy = _display ctrlCreate ["RscButtonMenu", 854];
_crate1Buy ctrlSetPosition [(9.5 - 3) * (0.025),(10 - 2) * (0.04),0.280,1 * (0.04)];
_crate1Buy ctrlCommit 0;
_crate1Buy ctrlSetStructuredText (parseText (format ["<t align='center'>CALL STARTER DROP"]));
_crate1Buy ctrlSetEventHandler ["ButtonClick", "VehicleName = _Vehicle1Name;[] spawn fnc_deployselected;"];
 
_crate2Buy = _display ctrlCreate ["RscButtonMenu", 855];
_crate2Buy ctrlSetPosition [(9.5 - 3) * (0.025),(15.5 - 2) * (0.04),0.280,1 * (0.04)];
_crate2Buy ctrlCommit 0;
_crate2Buy ctrlSetStructuredText (parseText (format ["<t align='center'>CALL MEDIUM DROP"]));
_crate2Buy ctrlSetEventHandler ["ButtonClick", "VehicleName = _Vehicle2Name;[] spawn fnc_deployselected;"];
 
_crate3Buy = _display ctrlCreate ["RscButtonMenu", 856];
_crate3Buy ctrlSetPosition [(9.5 - 3) * (0.025),(21 - 2) * (0.04),0.280,1 * (0.04)];
_crate3Buy ctrlCommit 0;
_crate3Buy ctrlSetStructuredText (parseText (format ["<t align='center'>CALL PRO DROP"]));
_crate3Buy ctrlSetEventHandler ["ButtonClick", "VehicleName = _Vehicle3Name;[] spawn fnc_deployselected;"];
 
_ranNumArr = ['1','2','3','4','5','6','7','8','9','0'];
a1 = _ranNumArr call BIS_fnc_selectRandom;
a2 = _ranNumArr call BIS_fnc_selectRandom;
a3 = _ranNumArr call BIS_fnc_selectRandom;
a1a2a3 = a1+a2+a3;
 
_infoBox = _display ctrlCreate ["RscStructuredText", 1230];
_infoBox ctrlSetPosition [(23 - 3) * (0.025),(6 - 2) * (0.04),(0.32),16 * (0.04)];
_infoBox ctrlCommit 0;
_infoBox ctrlSetStructuredText (parseText (format ["<t align='center'size='0.8'> Air Drop ID: %2-%3%4<br/>(%1)<br/><br/>Once you buy an Air Drop, The Drop Zone will be marked on the map and announced to every player. We will try our best to send you the random items worth your money.<br/><img image='GG\xm8Apps\images\drop.paa' size='8.0' shadow='0' />",name player, orderIDcharacters, a1, a2]));
_infoBox ctrlSetBackgroundColor [0.11,0.106,0.125,1];
 
fnc_okToDeploy = {
  _ok = true;
 
  _Time = time - lastDrop;
  _LastUsedTime = 120;

  if (_Time < _LastUsedTime) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = format["please wait %1s before calling in another Air Drop!",(round(_Time - _LastUsedTime))];
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;DropInProgress = false;
  };
 
  if (vehicle player != player) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = "You are in a vehicle and cannot perform that action!";
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;DropInProgress = false;
  };

  if (ExileClientPlayerMoney < boxCost) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = format["%1, Your order has been declined due to insufficient funds",name player];
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;DropInProgress = false;
  };
  _ok
};
 
fnc_deployselected = {
  ok = [] call fnc_okToDeploy;
  (findDisplay 24015) closeDisplay 0;
  if (ok) then {
    
  };
};
 
_GoBackBtn = _display ctrlCreate ["RscButtonMenu", 1116];
_GoBackBtn ctrlSetPosition [(23 - 3) * (0.025),(21 - 2) * (0.04),0.320,1 * (0.04)];
_GoBackBtn ctrlCommit 0;
_GoBackBtn ctrlSetStructuredText (parseText (format ["<t align='center'>CLOSE AIRDROP APP"]));
_GoBackBtn ctrlSetEventHandler ["ButtonClick", "call fnc_goBack"];
 
 
fnc_goBack = {
  _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
  _Ctrls = [1116,851,852,853,854,855,856,1230];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 1;
      _ctrl ctrlCommit 0.25;
      ctrlEnable [_x, false];
  } forEach _Ctrls;
  execVM "GG\xm8Apps\XM8Apps_Init.sqf";
  uiSleep 1;
  {
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
  } forEach _Ctrls;
};