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

rareItem = ["Exile_Item_Laptop","Exile_Item_BaseCameraKit","Exile_Item_Defibrillator","Exile_Item_SafeKit","Exile_Item_CodeLock"];
BoxConstruction = ["Exile_Item_WoodWallKit","Exile_Item_WoodWallHalfKit","Exile_Item_WoodWindowKit","Exile_Item_WorkBenchKit","Exile_Item_WoodFloorPortKit","Exile_Item_WoodFloorKit","Exile_Item_WoodGateKit"];
BoxTools = ["Exile_Magazine_Battery","Exile_Item_Rope","Exile_Item_DuctTape","Exile_Item_ExtensionCord","Exile_Item_FuelCanisterEmpty","Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_MetalBoard","Exile_Item_MetalPole","Exile_Item_CamoTentKit"];
BoxFood = ["Exile_Item_EMRE","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming","Exile_Item_SausageGravy","Exile_Item_Catfood","Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Dogfood","Exile_Item_BeefParts","Exile_Item_Cheathas","Exile_Item_Noodles","Exile_Item_SeedAstics","Exile_Item_Raisins","Exile_Item_Moobar","Exile_Item_InstantCoffee","Exile_Item_PlasticBottleCoffee","Exile_Item_PowerDrink","Exile_Item_PlasticBottleFreshWater","Exile_Item_Beer","Exile_Item_EnergyDrink","Exile_Item_MountainDupe"];
BoxWeapons = ["LMG_Zafir_F","MMG_01_hex_F","srifle_EBR_F","srifle_DMR_01_F","srifle_GM6_F","srifle_LRR_F","srifle_DMR_02_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_tan_F","srifle_DMR_05_hex_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_LRR_camo_F","srifle_GM6_camo_F","CUP_lmg_M249_para","CUP_lmg_Mk48_des","CUP_lmg_Mk48_wdl","CUP_lmg_L110A1","CUP_lmg_Pecheneg","CUP_lmg_UK59","CUP_lmg_L7A2","CUP_lmg_M60A4","CUP_lmg_M240","CUP_lmg_M249","CUP_lmg_PKM","CUP_srifle_SVD_wdl_ghillie","CUP_srifle_SVD_des_ghillie_pso","CUP_srifle_DMR","CUP_srifle_ksvk","CUP_srifle_M110","CUP_srifle_M14","CUP_srifle_M24_des","CUP_srifle_M24_wdl","CUP_srifle_M24_ghillie","CUP_srifle_SVD","CUP_srifle_SVD_des","CUP_srifle_VSSVintorez","CUP_srifle_CZ750","CUP_srifle_Mk12SPR","CUP_srifle_AS50","CUP_srifle_AWM_des","CUP_srifle_AWM_wdl","CUP_srifle_CZ550","CUP_srifle_LeeEnfield","CUP_srifle_M40A3"] call BIS_fnc_selectRandom;
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

_Box1Btn = _display ctrlCreate ["RscExileXM8AppButton1x1", 851];
_Box1Btn ctrlSetPosition [(7 - 3) * (0.025), (6 - 2) * (0.04)];
_Box1Btn ctrlCommit 0;
_Box1Btn ctrlSetFontHeight 0.05;
_Box1Btn ctrlSetStructuredText (parseText (format ["%1<br/><img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1.0' shadow='0' />%2",_Box1Name, box1Cost]));
_Box1Btn ctrlSetEventHandler ["ButtonClick", "boxCost = box1Cost;boxDonorCost = box1DonorCost;boxWepCount = box1WepCount;boxMagCount = box1MagCount;boxItemCount = box1ItemCount;boxRareCount = box1RareCount;"];

_Box2Btn = _display ctrlCreate ["RscExileXM8AppButton1x1", 852];
_Box2Btn ctrlSetPosition [(7 - 3) * (0.025), (11.5 - 2) * (0.04)];
_Box2Btn ctrlCommit 0;
_Box2Btn ctrlSetFontHeight 0.05;
_Box2Btn ctrlSetStructuredText (parseText (format ["%1<br/><img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1.0' shadow='0' />%2",_Box2Name, box2Cost]));
_Box2Btn ctrlSetEventHandler ["ButtonClick", "boxCost = box2Cost;boxDonorCost = box2DonorCost;boxWepCount = box2WepCount;boxMagCount = box2MagCount;boxItemCount = box2ItemCount;boxRareCount = box2RareCount;"];

_Box3Btn = _display ctrlCreate ["RscExileXM8AppButton1x1", 853];
_Box3Btn ctrlSetPosition [(7 - 3) * (0.025), (17 - 2) * (0.04)];
_Box3Btn ctrlCommit 0;
_Box3Btn ctrlSetFontHeight 0.05;
_Box3Btn ctrlSetStructuredText (parseText (format ["%1<br/><img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1.0' shadow='0' />%2",_Box3Name, box3Cost]));
_Box3Btn ctrlSetEventHandler ["ButtonClick", "boxCost = box3Cost;boxDonorCost = box3DonorCost;boxWepCount = box3WepCount;boxMagCount = box3MagCount;boxItemCount = box3ItemCount;boxRareCount = box3RareCount;"];

_BuyBtn = _display ctrlCreate ["RscButtonMenu", 854];
_BuyBtn ctrlSetPosition [(14 - 3) * (0.025),(10.5 - 2) * (0.04),0.125,1 * (0.04)];
_BuyBtn ctrlCommit 0;
_BuyBtn ctrlSetText "Call Now";
_BuyBtn ctrlSetEventHandler ["ButtonClick", "[] spawn fnc_buyselected"];

_ranNumArr = ['1','2','3','4','5','6','7','8','9','0'];
a1 = _ranNumArr call BIS_fnc_selectRandom;
a2 = _ranNumArr call BIS_fnc_selectRandom;

_userrating = _display ctrlCreate ["RscStructuredText", 1230];
_userrating ctrlSetPosition [(20.85 - 3) * (0.025),(6 - 2) * (0.04),(0.32),14 * (0.04)];
_userrating ctrlCommit 0;
_userrating ctrlSetStructuredText (parseText (format ["<t align='center'size='0.8'> Air Drop ID: %2-%3%4 (%1) <br/><br/><br/> Once you buy an Air Drop, The Drop Zone will be marked on the map and announced to every player. We will try our best to send you the random items worth you money.",name player, orderIDcharacters, a1, a2]));
_userrating ctrlSetBackgroundColor [0.11,0.106,0.125,1];

fnc_buyselected = {
  if (ExileClientPlayerMoney > boxCost) then {
    _newPoptabs = ExileClientPlayerMoney - boxCost;
    ENIGMA_UpdateStats = [player,_newPoptabs];
    publicVariableServer "ENIGMA_UpdateStats";
    hint format["Thanks for your order! your Air Drop order number is '%2-%3%4'",name player, orderIDcharacters, a1, a2];
    _playerPOS = getPOSATL player;

    for "_x" from 1 to 100 do {
      if (_x >= 2) then {cutText [format ["AIR DROP ARRIVING IN %1s", 101-_x], "PLAIN DOWN"];};
      uiSleep 1;
    };
    _crate = createVehicle ["Exile_Container_StorageCrate", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +300)], [], 0, "FLY"];
    _smokeshell = createVehicle ["SmokeShellRed", [(_playerPOS select 0),(_playerPOS select 1),((_playerPOS select 2) +300)], [], 0, "FLY"];
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
    hint format["Your Air Drop is Delivered near you!",name player];
  } else {
    (findDisplay 24015) closeDisplay 0;
    hint format["%1, Your order has been declined due to insufficient funds",name player];
  };
};

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
