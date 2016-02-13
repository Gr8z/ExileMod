uiSleep 2;
_respect = ExileClientPlayerScore;

switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
    _rank = "Enforcer";  
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_U_B_Denim_T_BG_BK";
    player addBackpack "TRYK_B_tube_blk";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //  "Your rank is Enforcer";
        };
        
    case (_respect > 5000 && _respect < 9999):
   {
    _rank = "Slayer";     
    [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,10000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_hoodie_Wood";
    player addVest "V_BandollierB_oli";
    player addBackpack "B_AssaultPack_Kerry";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";

   //    "Your rank is Slayer";
   };
   
    case (_respect > 10000 && _respect < 19999):
   {
    _rank = "Hit Man";  
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,20000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_U_denim_hood_mc";
    player addHeadgear "TRYK_H_woolhat_cu";
    player addVest "V_BandollierB_oli";
    player addBackpack "B_TacticalPack_mcamo";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //   "Your rank is Hit Man";
   };
   
    case (_respect > 19999 && _respect < 29999):
   {
    _rank = "Executioner";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,30000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_shirts_DENIM_RED2_Sleeve";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_8Rnd_9x18_Makarov_M";};
    player addVest "V_BandollierB_khk";
    player addBackpack "TRYK_B_Kitbag_aaf";
    player addHeadgear "TRYK_H_headsetcap_blk";
    player addWeaponGlobal "CUP_hgun_Makarov";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Executioner";
   };
   
    case (_respect > 29999 && _respect < 39999):
   {

    player forceAddUniform "TRYK_U_denim_hood_3c";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_8Rnd_9x18_Makarov_M";};
    player addVest "V_TacVest_camo";
    player addBackpack "TRYK_B_Kitbag_Base_JSDF";
    player addHeadgear "H_Booniehat_dgtl";
    player addWeaponGlobal "CUP_hgun_Makarov";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";

    //   "Your rank is Tyrant";
   };
   
    case (_respect > 39999 && _respect < 49999):
   {
    _rank = "Triggerman";  
  call ExileClient_object_player_bambiStateEnd;
    [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_U_Bts_PCUs";
    for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag";};
    player addVest "V_PlateCarrierIA1_dgtl";
    player addBackpack "TRYK_B_Coyotebackpack";
    player addHeadgear "H_Cap_brn_SPECOPS";
    player addWeaponGlobal "CUP_hgun_Duty";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
      
    //  "Your rank is Triggerman";
   };
   
    case (_respect > 49999 && _respect < 69999):
   {
    _rank = "Trooper";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_U_B_PCUODHs";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_18Rnd_9x19_Phantom";};
    player addVest "V_PlateCarrierIA2_dgtl";
    player addBackpack "TRYK_B_Coyotebackpack";
    player addHeadgear "H_Cap_oli_hs";
    player addWeaponGlobal "CUP_hgun_Phantom";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //   "Your rank is Trooper";
   };
   
    case (_respect > 69999 && _respect < 89999):
   {
    _rank = "High Executioner";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_U_B_3cr";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_6Rnd_45ACP_M";};
    player addVest "TRYK_V_tacSVD_BK";
    player addBackpack "TRYK_B_Coyotebackpack";
    player addHeadgear "H_ShemagOpen_tan";
    player addWeaponGlobal "CUP_hgun_TaurusTracker455";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is High Executioner"
   };
   
     case (_respect > 89999 && _respect < 149999):
   {
    _rank = "Reaper";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_556x45_Stanag";};
    player addVest "V_TacVest_camo";
    player addBackpack "CUP_B_USPack_Black";
    player addHeadgear "TRYK_r_cap_od_Glasses";
    player addWeaponGlobal "CUP_arifle_M4A3_desert";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_6Rnd_45ACP_M";};
    player addWeaponGlobal "CUP_hgun_TaurusTracker455";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //   "Your rank is Reaper";
   };

     case (_respect > 149999 && _respect < 249999):
   {
    _rank = "Overlord";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_100Rnd_556x45_BetaCMag";};
    player addVest "TRYK_V_ArmorVest_AOR1_2";
    player addBackpack "CUP_B_USPack_Black";
    player addHeadgear "TRYK_H_Booniehat_MARPAT_WOOD";
    player addWeaponGlobal "CUP_arifle_M4A3_desert";
    player addPrimaryWeaponItem "CUP_muzzle_snds_M16";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Overlord";
   };
   
        case (_respect > 249999 && _respect < 349999):
   {
    _rank = "Supreme Overlord";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_100Rnd_556x45_BetaCMag";};
    player addVest "TRYK_V_ArmorVest_Ranger2";
    player addBackpack "CUP_B_ACRPara_m95";
    player addHeadgear "TRYK_H_Booniehat_MARPAT_WOOD";
    player addWeaponGlobal "CUP_arifle_M4A3_desert";
    player addPrimaryWeaponItem "CUP_muzzle_snds_M16";
    player addPrimaryWeaponItem "CUP_acc_Flashlight_wdl";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Supreme Overlord";
  };
  
     case (_respect > 349999 && _respect < 499999):
   {
    _rank = "Serial Killer";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_ZARATAKI3";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_Sa58_M_TracerR";};
    player addVest "TRYK_V_ArmorVest_tan2";
    player addBackpack "CUP_B_USPack_Coyote";
    player addHeadgear "TRYK_H_pakol2";
    player addWeaponGlobal "CUP_arifle_Sa58RIS2_camo";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Serial Killer";
  };
  
       case (_respect > 499999):
   {
    _rank = "Bringer of Death";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    player forceAddUniform "TRYK_ZARATAKI";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_Sa58_M_TracerG";};
    player addVest "TRYK_V_ArmorVest_AOR1_2";
    player addBackpack "CUP_B_GER_Pack_Tropentarn";
    player addHeadgear "H_ShemagOpen_khk";
    player addWeaponGlobal "CUP_arifle_Sa58RIS1_des";
    player addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_H";
    player addPrimaryWeaponItem "CUP_acc_Flashlight_wdl";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Bringer of Death";
  };
    default
    {   
    //  "Your rank is Inmate";
    _rank = "Inmate";  
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    };
};