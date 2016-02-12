/////////////////////
//Config
///////////////////
_donatorMode = false;
_donors = ['0'];
////////////////////////////////
//    Donors Cfg
////////////////////////////////

orderIDcharacters = "GG";
_Box1Name = "Starter Drop";
Box1Items = [
['Exile_Item_Flag',1],
['Exile_Item_Matches',2],
['Exile_Item_CookingPot',1],
['Exile_Item_CanOpener',1],
['Exile_Item_Handsaw',1],
['Exile_Item_Grinder',1],
['Exile_Item_CampFireKit',1],
['Exile_Item_WorkBenchKit',1]
];
box1Cost = 3000;
box1DonorCost = 1000;

_Box2Name = "Medium Drop";
Box2Items = [
['Exile_Item_EMRE',2],
['Exile_Item_GloriousKnakworst',2],
['Exile_Item_InstantCoffee',1],
['Exile_Item_PowerDrink',1],
['Exile_Item_Beer',1],
['Exile_Item_EnergyDrink',1],
['Exile_Item_CampFireKit',1],
['Exile_Item_Matches',1],
['Exile_Item_CookingPot',1]
];
box2Cost = 2000;
box2DonorCost = 1000;

_Box3Name = "Pro Drop";
Box3Items = [
['Exile_Item_Codelock',2],
['Exile_Item_BaseCameraKit',6],
['Exile_Item_Laptop',1]
];
box3Cost = 15000;
box3DonorCost = 1000;

if ((_donatorMode) && (getPlayerUID player in _donors)) then {
  box1Cost = box1DonorCost;
  box2Cost = box2DonorCost;
  box3Cost = box3DonorCost;
};

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


_Box1Btn = _display ctrlCreate ["RscExileXM8AppButton1x1", 851];
_Box1Btn ctrlSetPosition [(7 - 3) * (0.025), (6 - 2) * (0.04)];
_Box1Btn ctrlCommit 0;
_Box1Btn ctrlSetFontHeight 0.05;
_Box1Btn ctrlSetStructuredText (parseText (format ["%1<br/><img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1.0' shadow='true' />%2",_Box1Name, box1Cost]));
_Box1Btn ctrlSetEventHandler ["ButtonClick", "boxselected = 1;"];

_Box2Btn = _display ctrlCreate ["RscExileXM8AppButton1x1", 852];
_Box2Btn ctrlSetPosition [(7 - 3) * (0.025), (11.5 - 2) * (0.04)];
_Box2Btn ctrlCommit 0;
_Box2Btn ctrlSetFontHeight 0.05;
_Box2Btn ctrlSetStructuredText (parseText (format ["%1<br/><img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1.0' shadow='true' />%2",_Box2Name, box2Cost]));
_Box2Btn ctrlSetEventHandler ["ButtonClick", "boxselected = 2;"];

_Box3Btn = _display ctrlCreate ["RscExileXM8AppButton1x1", 853];
_Box3Btn ctrlSetPosition [(7 - 3) * (0.025), (17 - 2) * (0.04)];
_Box3Btn ctrlCommit 0;
_Box3Btn ctrlSetFontHeight 0.05;
_Box3Btn ctrlSetStructuredText (parseText (format ["%1<br/><img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1.0' shadow='true' />%2",_Box3Name, box3Cost]));
_Box3Btn ctrlSetEventHandler ["ButtonClick", "boxselected = 3;"];

_BuyBtn = _display ctrlCreate ["RscButtonMenu", 854];
_BuyBtn ctrlSetPosition [(14 - 3) * (0.025),(10.5 - 2) * (0.04),0.125,1 * (0.04)];
_BuyBtn ctrlCommit 0;
_BuyBtn ctrlSetText "Call Now";
_BuyBtn ctrlSetEventHandler ["ButtonClick", "call fnc_buyselected"];

_ranNumArr = ['1','2','3','4','5','6','7','8','9','0'];
a1 = _ranNumArr call BIS_fnc_selectRandom;
a2 = _ranNumArr call BIS_fnc_selectRandom;

_userrating = _display ctrlCreate ["RscStructuredText", 1230];
_userrating ctrlSetPosition [(20.85 - 3) * (0.025),(6 - 2) * (0.04),(0.32),14 * (0.04)];
_userrating ctrlCommit 0;
_userrating ctrlSetStructuredText (parseText (format ["<t align='center'size='0.8'> Air Drop ID: %2-%3%4 (%1) <br/><br/><br/> Once you buy an Air Drop, The Drop Zone will be marked on the map and announced to every player. We will try our best to send you the random items worth you money.",name player, orderIDcharacters, a1, a2]));
_userrating ctrlSetBackgroundColor [0.11,0.106,0.125,1];

fnc_deliverynotify = {
  uiSleep 20;
  hint format["Your Air Drop is Delivered near you!",name player];
};

fnc_ordernotify = {
  hint format["Thanks for your order! your Air Drop order number is '%2-%3%4'",name player, orderIDcharacters, a1, a2];
};

fnc_buybox1 = {
  if (ExileClientPlayerMoney > box1Cost) then {
    _newPoptabs = ExileClientPlayerMoney - box1Cost;
    ENIGMA_UpdateStats = [player,_newPoptabs];
    publicVariableServer "ENIGMA_UpdateStats";
    call fnc_ordernotify;
    
    for "_x" from 1 to 100 do {
      if (_x >= 2) then {cutText [format ["AIR DROP ARRIVING IN %1s", 101-_x], "PLAIN DOWN"];};
      uiSleep 1;
    };

    _playerPOS = getPOSATL player;
    _crate = createVehicle ["Exile_Container_StorageCrate", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +100)], [], 0, "FLY"];
    _smokeshell = createVehicle ["SmokeShellRed", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +100)], [], 0, "FLY"];
    clearMagazineCargoGlobal _crate;
    clearWeaponCargoGlobal _crate;
    clearItemCargoGlobal _crate;
    clearBackpackCargoGlobal _crate;
    {
        _crate addItemCargoGlobal [(_x select 0), (_x select 1)];
    } forEach Box1Items;

    _cratePOS = getPOSATL _crate;
    _parachute = "B_Parachute_02_F" createVehicle (_cratePOS);
    _parachute setPos _cratePOS;
    _crate attachTo [_parachute, [0, 0, 0.1] ];
    _smokeshell attachTo [_crate, [0, 0, 0.1] ];
    [] spawn { call fnc_deliverynotify; };
  } else {
    (findDisplay 24015) closeDisplay 0;
  hint format["%1, Your order has been declined due to insufficient funds",name player];
  };
};

fnc_buybox2 = {
  if (ExileClientPlayerMoney > box2Cost) then {
  _newPoptabs = ExileClientPlayerMoney - box2Cost;
  ENIGMA_UpdateStats = [player,_newPoptabs];
  publicVariableServer "ENIGMA_UpdateStats";
  call fnc_ordernotify;

  for "_x" from 1 to 100 do {
    if (_x >= 2) then {cutText [format ["AIR DROP ARRIVING IN %1s", 101-_x], "PLAIN DOWN"];};
    uiSleep 1;
  };

  _playerPOS = getPOSATL player;
  _crate = createVehicle ["Exile_Container_StorageCrate", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +100)], [], 0, "FLY"];
  _smokeshell = createVehicle ["SmokeShellRed", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +100)], [], 0, "FLY"];
  clearMagazineCargoGlobal _crate;
  clearWeaponCargoGlobal _crate;
  clearItemCargoGlobal _crate;
  clearBackpackCargoGlobal _crate;
  {
      _crate addItemCargoGlobal [(_x select 0), (_x select 1)];
  } forEach Box2Items;

  _cratePOS = getPOSATL _crate;
  _parachute = "B_Parachute_02_F" createVehicle (_cratePOS);
  _parachute setPos _cratePOS;
  _crate attachTo [_parachute, [0, 0, 0.1] ];
  _smokeshell attachTo [_crate, [0, 0, 0.1] ];
[] spawn { call fnc_deliverynotify; };
  } else {
    (findDisplay 24015) closeDisplay 0;
  hint format["%1, Your order has been declined due to insufficient funds",name player];
  };
};

fnc_buybox3 = {
  if (ExileClientPlayerMoney > box2Cost) then {
  _newPoptabs = ExileClientPlayerMoney - box3Cost;
  ENIGMA_UpdateStats = [player,_newPoptabs];
  publicVariableServer "ENIGMA_UpdateStats";
call fnc_ordernotify;

  for "_x" from 1 to 100 do {
    if (_x >= 2) then {cutText [format ["AIR DROP ARRIVING IN %1s", 101-_x], "PLAIN DOWN"];};
    uiSleep 1;
  };

  _playerPOS = getPOSATL player;
  _crate = createVehicle ["Exile_Container_StorageCrate", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +100)], [], 0, "FLY"];
  _smokeshell = createVehicle ["SmokeShellRed", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +100)], [], 0, "FLY"];
  clearMagazineCargoGlobal _crate;
  clearWeaponCargoGlobal _crate;
  clearItemCargoGlobal _crate;
  clearBackpackCargoGlobal _crate;
  {
      _crate addItemCargoGlobal [(_x select 0), (_x select 1)];
  } forEach Box3Items;

  _cratePOS = getPOSATL _crate;
  _parachute = "B_Parachute_02_F" createVehicle (_cratePOS);
  _parachute setPos _cratePOS;
  _crate attachTo [_parachute, [0, 0, 0.1] ];
  _smokeshell attachTo [_crate, [0, 0, 0.1] ];
[] spawn { call fnc_deliverynotify; };
  } else {
    (findDisplay 24015) closeDisplay 0;
  hint format["%1, Your order has been declined due to insufficient funds",name player];
  };
};

fnc_buyselected = {
  switch (boxselected) do {
    case (1): {call fnc_buybox1;};
    case (2): {call fnc_buybox2;};
    case (3): {call fnc_buybox3;};
  };
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Created the go back button and add the button click event handeler to it
//Note you do need to add all Idds for all the controlls you have created to the _Ctrls array

_GoBackBtn = _display ctrlCreate ["RscButtonMenu", 1116];
_GoBackBtn ctrlSetPosition [(14 - 3) * (0.025),(13 - 2) * (0.04),4.5 * (0.025),1 * (0.04)];
_GoBackBtn ctrlCommit 0;
_GoBackBtn ctrlSetText "Cancel";
_GoBackBtn ctrlSetEventHandler ["ButtonClick", "call fnc_goBack"];


fnc_goBack = {
  _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
  _Ctrls = [1116,851,852,853,854,1230];
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
