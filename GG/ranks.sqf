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
	player addWeaponGlobal "CUP_hgun_Makarov";
	for "_i" from 1 to 3 do {player addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
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
	player addWeaponGlobal "rhs_weap_M590_5RD";
    player addWeaponGlobal "CUP_hgun_Makarov";
    player addItemToVest "CUP_8Rnd_9x18_Makarov_M";
	for "_i" from 1 to 2 do {player addItemToBackpack "rhsusf_5Rnd_Slug";};
    for "_i" from 1 to 2 do {player addItemToBackpack "rhsusf_5Rnd_00Buck";};
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
    player addWeaponGlobal "CUP_hgun_Makarov";
	player addWeaponGlobal "CUP_smg_MP5A5";
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
	player addWeaponGlobal "CUP_smg_MP5SD6";
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
	player addWeaponGlobal "CUP_arifle_AK74";
	player addPrimaryWeaponItem "CUP_optic_Kobra";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 3 do {player addItemToVest "CUP_18Rnd_9x19_Phantom";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
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
	player addWeaponGlobal "CUP_arifle_AK74";
	player addPrimaryWeaponItem "rhs_acc_pkas";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 3 do {player addItemToVest "CUP_15Rnd_9x19_M9";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Bounty Hunter"
   };
   
     case (_respect > 89999 && _respect < 139999):
   {
    _rank = "Mercenary";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,140000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt";
    player addVest "V_TacVest_camo";
    player addBackpack "CUP_B_USPack_Black";
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_30Rnd_556x45_Stanag";};
    player addHeadgear "TRYK_r_cap_od_Glasses";
    player addWeaponGlobal "CUP_arifle_M4A3_desert";
	player addPrimaryWeaponItem "CUP_optic_HoloDesert";
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
     case (_respect > 139999 && _respect < 179999):
   {
    _rank = "Assassin";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,180000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
    player addVest "V_PlateCarrierIA2_dgtl";
    player addBackpack "CUP_B_USPack_Black";
    player addHeadgear "TRYK_H_Booniehat_MARPAT_WOOD";
    player addWeaponGlobal "CUP_arifle_M4A3_desert";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Assassin";
   };
   
    case (_respect > 179999 && _respect < 219999):
   {
    _rank = "Militant";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,220000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_MARPAT_Wood_Tshirt";
    player addVest "V_PlateCarrierIA2_dgtl";
    player addBackpack "CUP_B_ACRPara_m95";
    player addHeadgear "TRYK_H_Booniehat_MARPAT_WOOD";
    player addWeaponGlobal "CUP_arifle_M16A4_Base";
	player addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	player addPrimaryWeaponItem "optic_MRCO";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 3 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_30Rnd_556x45_Stanag";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Militant";
   };
   
    case (_respect > 219999 && _respect < 289999):
   {
    _rank = "Terrorist";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,290000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_taki_BLK";
    for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
    player addVest "V_PlateCarrierIAGL_dgtl";
    player addBackpack "B_Carryall_oli";
    player addHeadgear "TRYK_r_cap_od_Glasses";
    player addWeaponGlobal "arifle_MX_Black_F";
	player addPrimaryWeaponItem "CUP_optic_HoloBlack";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
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
   
    case (_respect > 289999 && _respect < 359999):
   {
    _rank = "Warlord";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,360000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_Woodland";
    for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
    player addVest "V_PlateCarrierIAGL_oli";
    player addBackpack "B_Carryall_oli";
    player addHeadgear "H_Shemag_olive";
    player addWeaponGlobal "arifle_MX_Black_F";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Black";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Warlord";
   };
   
    case (_respect > 359999 && _respect < 429999):
   {
    _rank = "Arms Dealer";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,430000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLK";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_blk";
	player addBackpack "TRYK_B_Carryall_blk";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_65x39_caseless_green";};
    player addHeadgear "TRYK_H_headsetcap_blk_Glasses";
    player addWeaponGlobal "arifle_Katiba_F";
	player addPrimaryWeaponItem "muzzle_snds_H";
	player addPrimaryWeaponItem "optic_MRCO";
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
    //  "Your rank is Arms Dealer";
   };
   
    case (_respect > 429999 && _respect < 509999):
   {
    _rank = "Destroyer";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,510000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
    player addHeadgear "TRYK_H_PASGT_BLK";
    player addWeaponGlobal "CUP_arifle_Sa58RIS2_camo";
	player addPrimaryWeaponItem "CUP_optic_HoloWdl";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "CUP_30Rnd_Sa58_M";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
    //  "Your rank is Destroyer";
   };
   
    case (_respect > 509999 && _respect < 599999):
   {
    _rank = "Conqueror";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,600000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_AOR2_OD_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_rgr";
    player addBackpack "TRYK_B_Carryall_JSDF";
    player addHeadgear "rhs_6b26_ess_bala";
    player addWeaponGlobal "CUP_arifle_Sa58RIS2_camo";
    player addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "CUP_30Rnd_Sa58_M";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Conqueror";
   };
       case (_respect > 599999 && _respect < 699999):
   {
    _rank = "Vanquisher";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,700000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_Woodland";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_rgr";
    player addBackpack "TRYK_B_Carryall_wood";
    player addHeadgear "rhs_6b26_ess_bala";
    player addWeaponGlobal "CUP_arifle_Sa58RIS1_des";
    player addPrimaryWeaponItem "muzzle_snds_B";
    player addPrimaryWeaponItem "optic_MRCO";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "CUP_30Rnd_Sa58_M";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Vanquisher";
   };
       case (_respect > 699999 && _respect < 799999):
   {
    _rank = "Master";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,800000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_TANOCP_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_mtp";
    player addBackpack "B_Carryall_cbr";
    player addHeadgear "rhs_6b27m_ML_ess_bala";
    player addWeaponGlobal "CUP_arifle_Sa58RIS2_gl";
    player addPrimaryWeaponItem "muzzle_snds_B";
    player addPrimaryWeaponItem "optic_MRCO";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 4 do {player addItemToBackpack "CUP_30Rnd_Sa58_M";};
	for "_i" from 1 to 2 do {player addItemToBackpack "CUP_1Rnd_HE_M203";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Master";
   };
       case (_respect > 799999 && _respect < 959999):
   {
    _rank = "Sniper Legend";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,960000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_TANOCP_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_mtp";
    player addBackpack "B_Carryall_cbr";
    player addHeadgear "rhsusf_ach_helmet_ocp_norotos";
    player addWeaponGlobal "srifle_EBR_F";
    player addPrimaryWeaponItem "muzzle_snds_B";
    player addPrimaryWeaponItem "optic_KHS_old";
    player addPrimaryWeaponItem "bipod_01_F_blk";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
	player addItemToVest "SmokeShellRed";
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
   //    "Your rank is Sniper Legend";
   };
       case (_respect > 959999 && _respect < 1249999):
   {
    _rank = "LMG Legend";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,1250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
    player addHeadgear "H_HelmetSpecO_blk";
    player addWeaponGlobal "CUP_lmg_Mk48_wdl";
    player addPrimaryWeaponItem "optic_AMS_khk";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
	player addItemToVest "SmokeShellYellow";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is LMG Legend";
   };
       case (_respect > 1249999):
   {
    _rank = "Elite";     
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,1250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "CUP_30Rnd_9x19_UZI";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
    player addHeadgear "H_HelmetSpecO_blk";
    player addWeaponGlobal "CUP_sgun_AA12";
    player addWeaponGlobal "CUP_hgun_MicroUzi";
    player addHandgunItem "CUP_muzzle_snds_MicroUzi";
    for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    for "_i" from 1 to 2 do {player addItemToVest "CUP_30Rnd_9x19_UZI";};
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_20Rnd_B_AA12_74Slug";};
    for "_i" from 1 to 2 do {player addItemToBackpack "CUP_20Rnd_B_AA12_Pellets";};
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Elite";
   };
    default
    {   
    //  "Your rank is Inmate";
    _rank = "Inmate";  
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    };
};