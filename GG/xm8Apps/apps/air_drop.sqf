orderIDcharacters = "GG";
_Box1Name = "Starter Drop";
box1Cost = 5000;
box1DonorCost = 1000;
box1WepCount = 1;
box1RareCount = floor(random 1);
box1MagCount = floor((random 5) + 1);
box1ItemCount = floor((random 2) + 1);
 
_Box2Name = "Medium Drop";
box2Cost = 10000;
box2DonorCost = 2000;
box2WepCount = 2;
box2RareCount = floor((random 2) + 1);
box2MagCount = floor((random 10) + 2);
box2ItemCount = floor((random 4) + 4);
 
_Box3Name = "Pro Drop";
box3Cost = 30000;
box3DonorCost = 3000;
box3WepCount = 3;
box3RareCount = floor((random 2) + 2);
box3MagCount = floor((random 10) + 4);
box3ItemCount = floor((random 10) + 4);
 
rareItem = ["Exile_Item_Laptop","Exile_Item_BaseCameraKit","Exile_Item_Defibrillator","Exile_Item_SafeKit","Exile_Item_CodeLock","Exile_Magazine_Battery"];
BoxConstruction = ["Exile_Item_WoodWallKit","Exile_Item_WoodWallHalfKit","Exile_Item_WoodWindowKit","Exile_Item_WorkBenchKit","Exile_Item_WoodFloorPortKit","Exile_Item_WoodFloorKit","Exile_Item_WoodGateKit"];
BoxTools = ["Exile_Item_Rope","Exile_Item_DuctTape","Exile_Item_ExtensionCord","Exile_Item_FuelCanisterEmpty","Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_MetalBoard","Exile_Item_MetalPole","Exile_Item_CamoTentKit"];
BoxFood = ["Exile_Item_EMRE","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming","Exile_Item_SausageGravy","Exile_Item_Catfood","Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Dogfood","Exile_Item_BeefParts","Exile_Item_Cheathas","Exile_Item_Noodles","Exile_Item_SeedAstics","Exile_Item_Raisins","Exile_Item_Moobar","Exile_Item_InstantCoffee","Exile_Item_PlasticBottleCoffee","Exile_Item_PowerDrink","Exile_Item_PlasticBottleFreshWater","Exile_Item_Beer","Exile_Item_EnergyDrink","Exile_Item_MountainDupe"];
BoxWeapons = ["LMG_Zafir_F","MMG_01_hex_F","srifle_EBR_F","srifle_DMR_01_F","srifle_GM6_F","srifle_LRR_F","srifle_DMR_02_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_tan_F","srifle_DMR_05_hex_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_LRR_camo_F","srifle_GM6_camo_F","CUP_lmg_M249_para","CUP_lmg_Mk48_des","CUP_lmg_Mk48_wdl","CUP_lmg_L110A1","CUP_lmg_Pecheneg","CUP_lmg_UK59","CUP_lmg_L7A2","CUP_lmg_M60A4","CUP_lmg_M240","CUP_lmg_M249","CUP_lmg_PKM","CUP_srifle_SVD_wdl_ghillie","CUP_srifle_DMR","CUP_srifle_ksvk","CUP_srifle_M110","CUP_srifle_M14","CUP_srifle_M24_des","CUP_srifle_M24_wdl","CUP_srifle_M24_ghillie","CUP_srifle_SVD","CUP_srifle_SVD_des","CUP_srifle_VSSVintorez","CUP_srifle_CZ750","CUP_srifle_Mk12SPR","CUP_srifle_AS50","CUP_srifle_AWM_des","CUP_srifle_AWM_wdl","CUP_srifle_CZ550","CUP_srifle_LeeEnfield","CUP_srifle_M40A3"] call BIS_fnc_selectRandom;
_possibleMags = getArray (configfile >> "cfgWeapons" >> BoxWeapons >> "magazines");
mag = _possibleMags select 0;
 
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
 
//set XM8 title
(_display displayCtrl 4004) ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>AIR DROP</t>"]));
 
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
_crate1Buy ctrlSetEventHandler ["ButtonClick", "boxCost = box1Cost;boxDonorCost = box1DonorCost;boxWepCount = box1WepCount;boxMagCount = box1MagCount;boxItemCount = box1ItemCount;boxRareCount = box1RareCount;[] spawn fnc_buyselected;"];
 
_crate2Buy = _display ctrlCreate ["RscButtonMenu", 855];
_crate2Buy ctrlSetPosition [(9.5 - 3) * (0.025),(15.5 - 2) * (0.04),0.280,1 * (0.04)];
_crate2Buy ctrlCommit 0;
_crate2Buy ctrlSetStructuredText (parseText (format ["<t align='center'>CALL MEDIUM DROP"]));
_crate2Buy ctrlSetEventHandler ["ButtonClick", "boxCost = box2Cost;boxDonorCost = box2DonorCost;boxWepCount = box2WepCount;boxMagCount = box2MagCount;boxItemCount = box2ItemCount;boxRareCount = box2RareCount;[] spawn fnc_buyselected;"];
 
_crate3Buy = _display ctrlCreate ["RscButtonMenu", 856];
_crate3Buy ctrlSetPosition [(9.5 - 3) * (0.025),(21 - 2) * (0.04),0.280,1 * (0.04)];
_crate3Buy ctrlCommit 0;
_crate3Buy ctrlSetStructuredText (parseText (format ["<t align='center'>CALL PRO DROP"]));
_crate3Buy ctrlSetEventHandler ["ButtonClick", "boxCost = box3Cost;boxDonorCost = box3DonorCost;boxWepCount = box3WepCount;boxMagCount = box3MagCount;boxItemCount = box3ItemCount;boxRareCount = box3RareCount;[] spawn fnc_buyselected;"];
 
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
 
fnc_okToDrop = {
  _ok = true;
 
  _Time = time - lastDrop;
  _LastUsedTime = 300;
  _OnlineLimit = 15;
  _traderZoneNearLimit = 200;

  if (DropInProgress) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = "Please Wait.. An Air Drop is already in progress.";
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;DropInProgress = false;
  };
  if (_Time < _LastUsedTime) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = format["please wait %1s before calling in another Air Drop!",(round(_Time - _LastUsedTime))];
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;DropInProgress = false;
  };
 
  if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = "You are near a Base and cannot perform that action!";
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;DropInProgress = false;
  };
 
  if (vehicle player != player) then {
    (findDisplay 24015) closeDisplay 0;
    _msg = "You are in a vehicle and cannot perform that action!";
    ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
    _ok = false;DropInProgress = false;
  };
 
  {
    if ((_traderZoneNearLimit>0) && {((markertype _x) == "ExileTraderZone") && {((getMarkerPos _x) distance2D getPos player)<=_traderZoneNearLimit}}) then
    {
      (findDisplay 24015) closeDisplay 0;
        _msg = "You need to be far away from a Trader to call an Airdrop.";
        ["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
        _ok = false;DropInProgress = false;
    };
  } forEach allMapMarkers;
 
  if ((count playableUnits) < _OnlineLimit) then  {
    (findDisplay 24015) closeDisplay 0;
     _msg = format["Air Drop Failed. Less Than %1 Players online.",_OnlineLimit];
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
 
fnc_buyselected = {
  ok = [] call fnc_okToDrop;
  (findDisplay 24015) closeDisplay 0;
  if (ok) then {
    DropInProgress = true;
    _namePlayer = name player;
    ExileClientPlayerMoney = ExileClientPlayerMoney - boxCost;
    ["buyRequest",[str(boxCost)]] call ExileClient_system_network_send;
    hint format["Thanks for your order! your Air Drop order number is '%2-%3%4%5'",name player, orderIDcharacters, a1, a2, a3];
    _playerPOS = getPOSATL player;
 
    a1a2a3  = createMarker [a1a2a3,_playerPOS];
    a1a2a3  setMarkerText format["%1's Air Drop - %2%3%4",_namePlayer, a1, a2, a3];
    a1a2a3  setMarkerType "mil_objective";
    a1a2a3  setMarkerColor "ColorRed";

    //["systemChatRequest", [format ["%1 JUST CALLED IN AN AIRDROP - CHECK YOUR MAP FOR LOCATION", _namePlayer]]] call ExileServer_system_network_send_broadcast;
 
     for "_x" from 1 to 100 do {
      if (_x >= 2) then {cutText [format ["AIR DROP ARRIVING IN %1s", 101-_x], "PLAIN DOWN"];};
      uiSleep 1;
    };

    lastDrop = time;
    publicVariable "lastDrop";
 
    _crate = createVehicle ["Exile_Container_SupplyBox", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +150)], [], 0, "FLY"];
    _smokeshell = createVehicle ["SmokeShellRed", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +150)], [], 0, "FLY"];
    clearMagazineCargoGlobal _crate;clearWeaponCargoGlobal _crate;clearItemCargoGlobal _crate;clearBackpackCargoGlobal _crate;
 
    _i=0;
    while {_i < boxItemCount} do {
      _crate addMagazineCargoGlobal [(BoxConstruction call BIS_fnc_selectRandom), (floor((random 10) + 1))];
      _crate addMagazineCargoGlobal [(BoxTools call BIS_fnc_selectRandom), (floor((random 5) + 5))];
      _crate addMagazineCargoGlobal [(BoxFood call BIS_fnc_selectRandom), (floor((random 5) + 1))];
      _crate addMagazineCargoGlobal [(rareItem call BIS_fnc_selectRandom), (floor((random 1) + 1))];
      _i = _i + 1;
    };
 
    _crate addMagazineCargoGlobal [mag, boxMagCount];
    _crate addWeaponCargoGlobal [BoxWeapons, boxWepCount];
 
    _cratePOS = getPOSATL _crate;
    _parachute = "B_Parachute_02_F" createVehicle (_cratePOS);
    _parachute setPos _cratePOS;
    _crate attachTo [_parachute, [0, 0, 0.1] ];
    _smokeshell attachTo [_crate, [0, 0, 0.1] ];
    hint format["Your Air Drop Was Successfully Delivered %1!",name player];
    DropInProgress = false;

    uiSleep 400;
    deleteMarker a1a2a3;
    uiSleep 300;
    deleteVehicle _crate;
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