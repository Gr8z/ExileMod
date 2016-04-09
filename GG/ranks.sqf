uiSleep 2;
_respect = ExileClientPlayerScore;
switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
    _rank = "Scavenger";  
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_Denim_T_BG_BK";
    player addBackpack "TRYK_B_tube_blk";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //  "Your rank is Scavenger";
    };
     
    case (_respect > 5000 && _respect < 9999):
   {
    _rank = "Pickpocket";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,10000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_denim_hood_blk";
    player addVest "V_BandollierB_blk";
    player addBackpack "B_AssaultPack_blk";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //    "Your rank is Pickpocket";
   };
   
    case (_respect > 10000 && _respect < 19999):
   {
    _rank = "Thief";  
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,20000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_denim_hood_mc";
    player addHeadgear "TRYK_H_woolhat_cu";
    player addVest "V_BandollierB_rgr";
    player addBackpack "B_AssaultPack_mcamo";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //   "Your rank is Thief";
   };
   
    case (_respect > 19999 && _respect < 29999):
   {
    _rank = "Armed Robber";  
    call ExileClient_object_player_bambiStateEnd;
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,30000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_shirts_OD_PAD_BK";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_8Rnd_9x18_Makarov_M";};
    player addVest "V_BandollierB_blk";
    player addBackpack "TRYK_B_FieldPack_Wood";
    player addHeadgear "TRYK_R_CAP_BLK";
    player addWeaponGlobal "CUP_hgun_Makarov";
    player addItemToVest "CUP_8Rnd_9x18_Makarov_M";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Armed Robber";
   };
   
    case (_respect > 29999 && _respect < 39999):
   {
   _rank = "Gangster";
   call ExileClient_object_player_bambiStateEnd;
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_PCUGs_BLK";
    player addVest "TRYK_V_harnes_blk_L";
    player addBackpack "B_FieldPack_blk";
    player addHeadgear "TRYK_H_woolhat";
    for "_i" from 1 to 3 do {player addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_30Rnd_9x19_MP5";};
    player addWeapon "CUP_hgun_Makarov";
	player addWeapon "CUP_smg_MP5A5";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //   "Your rank is Gangster";
   };
   
    case (_respect > 39999 && _respect < 49999):
   {
    _rank = "Serial Killer";  
  call ExileClient_object_player_bambiStateEnd;
    [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,50000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_Bts_PCUs";
    player addVest "TRYK_V_ArmorVest_Ranger";
    player addBackpack "B_FieldPack_khk";
    player addHeadgear "H_Cap_tan_specops_US";
    player addWeaponGlobal "CUP_hgun_Duty";
	player addWeapon "CUP_smg_MP5SD6";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_30Rnd_9x19_MP5";};
	for "_i" from 1 to 3 do {player addItemToBackpack "16Rnd_9x21_Mag";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Serial Killer";
   };
   
    case (_respect > 49999 && _respect < 69999):
   {
    _rank = "Hitman";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,70000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_PCUODHs";
    player addVest "TRYK_V_ArmorVest_Ranger";
    player addBackpack "CUP_B_CivPack_WDL";
    player addHeadgear "H_Cap_oli_hs";
    player addWeaponGlobal "CUP_hgun_Phantom";
	player addWeapon "arifle_TRG20_F";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 3 do {player addItemToVest "CUP_18Rnd_9x19_Phantom";};
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_556x45_Stanag";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //   "Your rank is Hitman";
   };
   
    case (_respect > 69999 && _respect < 89999):
   {
    _rank = "Bounty Hunter";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,90000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_hoodie_Wood";
    player addVest "TRYK_V_tacSVD_BK";
    player addBackpack "TRYK_B_BAF_BAG_OD";
    player addHeadgear "TRYK_H_Bandana_H";
    player addWeaponGlobal "CUP_hgun_M9";
	player addWeapon "arifle_TRG21_F";
	player addPrimaryWeaponItem "CUP_optic_HoloWdl";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 3 do {player addItemToVest "CUP_15Rnd_9x19_M9";};
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_556x45_Stanag";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Bounty Hunter"
   };
   
     case (_respect > 89999 && _respect < 149999):
   {
    _rank = "Mercenary";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,150000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_556x45_Stanag";};
    player addVest "V_TacVest_camo";
    player addBackpack "CUP_B_USPack_Black";
    player addHeadgear "TRYK_r_cap_od_Glasses";
    player addWeaponGlobal "CUP_arifle_M4A3_desert";
    player addWeaponGlobal "CUP_hgun_Colt1911";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 4 do {player addItemToVest "CUP_7Rnd_45ACP_1911";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //   "Your rank is Mercenary";
   };
     case (_respect > 149999 && _respect < 249999):
   {
    _rank = "Assassin";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
    player addVest "V_PlateCarrierIA2_dgtl";
    player addBackpack "CUP_B_USPack_Black";
    player addHeadgear "TRYK_H_Booniehat_MARPAT_WOOD";
    player addWeaponGlobal "CUP_arifle_M4A3_desert";
    player addPrimaryWeaponItem "CUP_muzzle_snds_M16";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_M67";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Assassin";
   };
   
    case (_respect > 249999 && _respect < 349999):
   {
    _rank = "Militant";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,350000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
    player addVest "V_PlateCarrierIA2_dgtl";
    player addBackpack "CUP_B_ACRPara_m95";
    player addHeadgear "TRYK_H_Booniehat_MARPAT_WOOD";
    player addWeapon "CUP_arifle_Sa58P_des";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 3 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_30Rnd_Sa58_M_TracerG";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Militant";
   };
   
    case (_respect > 349999 && _respect < 499999):
   {
    _rank = "Terrorist";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,500000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_taki_BLK";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_Sa58_M_TracerR";};
    player addVest "V_PlateCarrierIAGL_dgtl";
    player addBackpack "B_Carryall_oli";
    player addHeadgear "TRYK_r_cap_od_Glasses";
    player addWeaponGlobal "CUP_arifle_Sa58RIS2_camo";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addItemToVest "CUP_30Rnd_Sa58_M_TracerR";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_Sa58_M_TracerG";};
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_M67";};
    player addItemToVest "CUP_30Rnd_9x19_UZI";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Terrorist";
   };
   
    case (_respect > 499999 && _respect < 749999):
   {
    _rank = "Warlord";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,750000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_Woodland";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_Sa58_M_TracerG";};
    player addVest "V_PlateCarrierIAGL_oli";
    player addBackpack "B_Carryall_oli";
    player addHeadgear "H_Shemag_olive";
    player addWeaponGlobal "CUP_arifle_Sa58RIS1_des";
    player addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_H";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_30Rnd_Sa58_M_TracerG";};
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_M67";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Warlord";
   };
   
    case (_respect > 749999 && _respect < 999999):
   {
    _rank = "Arms Dealer";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,1000000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLK";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_blk";
	player addBackpack "TRYK_B_Carryall_blk";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "CUP_20Rnd_762x51_FNFAL_M";};
    player addHeadgear "TRYK_H_headsetcap_blk_Glasses";
    player addWeaponGlobal "CUP_arifle_FNFAL_railed";
	player addPrimaryWeaponItem "CUP_optic_CompM4";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_M67";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Arms Dealer";
   };
   
    case (_respect > 999999 && _respect < 1999999):
   {
    _rank = "God";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2000000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
    player addHeadgear "TRYK_H_PASGT_BLK";
    player addWeaponGlobal "CUP_arifle_FNFAL_railed";
	player addPrimaryWeaponItem "muzzle_snds_B";
    player addPrimaryWeaponItem "optic_DMS";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_HandGrenade_M67";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "CUP_20Rnd_762x51_FNFAL_M";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
    //  "Your rank is God";
   };
   
    case (_respect > 1999999 && _respect < 3499999):
   {
    _rank = "Destroyer";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,3500000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_AOR2_OD_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_rgr";
    player addBackpack "TRYK_B_Carryall_oli";
    player addHeadgear "rhs_6b26_ess_bala";
    player addWeaponGlobal "rhs_weap_sr25_ec";
    player addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Black";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Destroyer";
   };
       case (_respect > 3499999 && _respect < 4999999):
   {
    _rank = "Conqueror";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_Woodland";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_rgr";
    player addBackpack "TRYK_B_Carryall_wood";
    player addHeadgear "rhs_6b26_ess_bala";
    player addWeaponGlobal "rhs_weap_sr25_ec";
    player addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
    player addPrimaryWeaponItem "optic_MRCO";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Conqueror";
   };
       case (_respect > 4999999 && _respect < 7499999):
   {
    _rank = "Vanquisher";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,7500000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_TANOCP_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_mtp";
    player addBackpack "B_Carryall_cbr";
    player addHeadgear "rhs_6b27m_ML_ess_bala";
    player addWeaponGlobal "srifle_DMR_03_tan_F";
    player addPrimaryWeaponItem "CUP_optic_Eotech533";
    player addPrimaryWeaponItem "bipod_02_F_hex";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "20Rnd_762x51_Mag";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Vanquisher";
   };
       case (_respect > 7499999 && _respect < 9999999):
   {
    _rank = "Master";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,10000000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_TANOCP_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_mtp";
    player addBackpack "B_Carryall_cbr";
    player addHeadgear "rhsusf_ach_helmet_ocp_norotos";
    player addWeaponGlobal "srifle_DMR_03_tan_F";
    player addPrimaryWeaponItem "optic_Arco";
    player addPrimaryWeaponItem "bipod_02_F_hex";
    player addPrimaryWeaponItem "muzzle_snds_B";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "CUP_20Rnd_762x51_FNFAL_M";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Master";
   };
       case (_respect > 9999999 && _respect < 24999999):
   {
    _rank = "Legend";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,25000000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
    player addHeadgear "H_HelmetSpecO_blk";
    player addWeaponGlobal "CUP_arifle_Mk20";
    player addPrimaryWeaponItem "CUP_optic_ELCAN_SpecterDR";
    player addPrimaryWeaponItem "bipod_01_F_snd";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "CUP_20Rnd_762x51_B_SCAR";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Legend";
   };
       case (_respect > 24999999):
   {
    _rank = "Blood God";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,10000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
    player addHeadgear "H_HelmetSpecO_blk";
    player addWeaponGlobal "CUP_lmg_Mk48_wdl";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Woodland";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Blood God";
   };
    default
    {   
    //  "Your rank is Inmate";
    _rank = "Inmate";  
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    };
};