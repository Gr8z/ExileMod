_Vehicle1Name = "Mountain Bike";
_Vehicle1ClassName = "Exile_Bike_MountainBike";
_Vehicle1Cost = "1 Radio";
 
_Vehicle2Name = "Quad Bike";
_Vehicle2ClassName = "Exile_Bike_QuadBike_Blue";
_Vehicle2Cost = 250;
 
_Vehicle3Name = "Boat";
_Vehicle3ClassName = "Exile_Boat_RubberDuck_CSAT";
_Vehicle3Cost = 800;
 
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
_drop1Info ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>%2</t><br/><t align='center'size='0.8'>Price = <img image='a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa' size='0.8' shadow='0' />%1</t>",_Vehicle1Cost,_Vehicle1Name]));
_drop1Info ctrlSetBackgroundColor [0.11,0.106,0.125,1];
 
_drop2Info = _display ctrlCreate ["RscStructuredText", 852];
_drop2Info ctrlSetPosition [(9.5 - 3) * (0.025),(11.5 - 2) * (0.04),(0.28),5 * (0.04)];
_drop2Info ctrlCommit 0;
_drop2Info ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>%2</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",_Vehicle2Cost,_Vehicle2Name]));
_drop2Info ctrlSetBackgroundColor [0.11,0.106,0.125,1];
 
_drop3Info = _display ctrlCreate ["RscStructuredText", 853];
_drop3Info ctrlSetPosition [(9.5 - 3) * (0.025),(17 - 2) * (0.04),(0.28),5 * (0.04)];
_drop3Info ctrlCommit 0;
_drop3Info ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>%2</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",_Vehicle3Cost,_Vehicle3Name]));
_drop3Info ctrlSetBackgroundColor [0.11,0.106,0.125,1];
 
_crate1Buy = _display ctrlCreate ["RscButtonMenu", 854];
_crate1Buy ctrlSetPosition [(9.5 - 3) * (0.025),(10 - 2) * (0.04),0.280,1 * (0.04)];
_crate1Buy ctrlCommit 0;
_crate1Buy ctrlSetStructuredText (parseText (format ["<t align='center'>DEPLOY"]));
_crate1Buy ctrlSetEventHandler ["ButtonClick", "VehicleName = _Vehicle1Name;VehicleClassName = _Vehicle1ClassName;VehicleCost = _Vehicle1Cost;[] spawn fnc_deployselected;"];
 
_crate2Buy = _display ctrlCreate ["RscButtonMenu", 855];
_crate2Buy ctrlSetPosition [(9.5 - 3) * (0.025),(15.5 - 2) * (0.04),0.280,1 * (0.04)];
_crate2Buy ctrlCommit 0;
_crate2Buy ctrlSetStructuredText (parseText (format ["<t align='center'>DEPLOY"]));
_crate2Buy ctrlSetEventHandler ["ButtonClick", "VehicleName = _Vehicle2Name;VehicleClassName = _Vehicle2ClassName;VehicleCost = _Vehicle2Cost;donorVeh = true;[] spawn fnc_deployselected;"];
 
_crate3Buy = _display ctrlCreate ["RscButtonMenu", 856];
_crate3Buy ctrlSetPosition [(9.5 - 3) * (0.025),(21 - 2) * (0.04),0.280,1 * (0.04)];
_crate3Buy ctrlCommit 0;
_crate3Buy ctrlSetStructuredText (parseText (format ["<t align='center'>DEPLOY"]));
_crate3Buy ctrlSetEventHandler ["ButtonClick", "VehicleName = _Vehicle3Name;VehicleClassName = _Vehicle3ClassName;VehicleCost = _Vehicle3Cost;donorVeh = true;[] spawn fnc_deployselected;"];
 
_infoBox = _display ctrlCreate ["RscStructuredText", 1230];
_infoBox ctrlSetPosition [(23 - 3) * (0.025),(6 - 2) * (0.04),(0.32),16 * (0.04)];
_infoBox ctrlCommit 0;
_infoBox ctrlSetStructuredText (parseText (format ["<t align='center'size='0.8'> Deploy Vehicles<br/>(%1)<br/><br/>You can buy vehicles from your xm8 through this app. You can deploy one anywhere you want but some vehicles are only allowed to Donators. Money will be deducted from your bank if you pick a boat or a Quad.<br/><img image='\dbo\dbo_old_bike\data\icon_mmt_ca.paa' size='8.0' shadow='0' />",name player]));
_infoBox ctrlSetBackgroundColor [0.11,0.106,0.125,1];
 
fnc_okToDeploy = {
  _ok = true;

  if (ExileClientPlayerIsInCombat) then { 
    (findDisplay 24015) closeDisplay 0;
    _msg = "You cannot deploy a vehicle in combat";
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;
  };

  if ((donorVeh) && !(getPlayerUID player in vehicleDonor)) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = "You have not donated for this perk.";
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;
  };

  if (!("ItemRadio" in (items player) || "ItemRadio" in (assigneditems player)) && !(donorVeh)) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = "You need a radio to deploy a vehicle !";
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;
  };
 
  if (vehicle player != player) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = "You are in a vehicle and cannot perform that action!";
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;
  };

  if (ExileClientPlayerMoney < VehicleCost) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = format["%1, Your order has been declined due to insufficient funds",name player];
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;
  };
  _ok
};
 
fnc_deployselected = {
  ok = [] call fnc_okToDeploy;
  (findDisplay 24015) closeDisplay 0;
  if (ok) then {
    _spawnPos = player modelToWorld [0,2,0];
    _spawnDir = (getDir player) -90;
    _veh = createVehicle[VehicleClassName, _spawnPos , [] ,0 , "NONE"];
    _veh setDir _spawnDir;

    if !(donorVeh) then {
      player unlinkItem "ItemRadio";
      ["Success",[format["%1 Deployed! Radio removed...",VehicleName]]] call ExileClient_gui_notification_event_addNotification;
    } else {
      ["buyRequest",["BANK",str(VehicleCost)]] call ExileClient_system_network_send;
      ["Success",[format["%1 Deployed! Poptabs deducted from bank...",VehicleName]]] call ExileClient_gui_notification_event_addNotification;
    };
    _veh addEventHandler ["getin", "'down' cutText ['WARNING: Deployed Vehicles do not save through restarts','PLAIN DOWN'];"];
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