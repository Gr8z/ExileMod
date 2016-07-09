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
    call ExileClient_object_player_bambiStateEnd;
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,20000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_denim_hood_mc";
    player addHeadgear "TRYK_H_woolhat_cu";
    player addVest "V_BandollierB_rgr";
    player addBackpack "B_AssaultPack_mcamo";
	for "_i" from 1 to 3 do {player addItemToVest "8Rnd_mas_9x18_Mag";};
	player addWeaponGlobal "hgun_mas_mak_F";
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
    for "_i" from 1 to 2 do {player addItemToUniform "8Rnd_mas_9x18_Mag";};
    player addVest "V_BandollierB_blk";
    player addBackpack "TRYK_B_FieldPack_Wood";
	for "_i" from 1 to 2 do {player addItemToBackpack "7Rnd_mas_12Gauge_Slug";};
    for "_i" from 1 to 2 do {player addItemToBackpack "7Rnd_mas_12Gauge_Pellets";};
    player addHeadgear "TRYK_R_CAP_BLK";
	player addWeaponGlobal "arifle_mas_m1014";
    player addWeaponGlobal "hgun_mas_mak_F";
    player addItemToVest "8Rnd_mas_9x18_Mag";
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
    for "_i" from 1 to 3 do {player addItemToVest "8Rnd_mas_9x18_Mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "40Rnd_mas_46x30_Mag";};
    player addWeaponGlobal "hgun_mas_mp7_F";
	player addWeaponGlobal "hgun_mas_mak_F";
	player addPrimaryWeaponItem "optic_Aco_smg";
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
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_mas_9x21_Stanag";};
	for "_i" from 1 to 3 do {player addItemToBackpack "15Rnd_mas_9x21_Mag";};
    player addHeadgear "H_Cap_tan_specops_US";
	player addWeaponGlobal "arifle_mas_mp40_o";
    player addWeaponGlobal "hgun_mas_m9_F";
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
   
    case (_respect > 49999 && _respect < 69999):
   {
    _rank = "Hitman";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,70000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_PCUODHs";
    player addVest "TRYK_V_ArmorVest_Ranger";
    player addBackpack "B_FieldPack_blk";
	for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_mas_9x21_Stanag";};
    player addHeadgear "H_Cap_oli_hs";
	player addWeaponGlobal "arifle_mas_mp5_v";
    player addWeaponGlobal "hgun_Pistol_heavy_01_F";
	player addPrimaryWeaponItem "muzzle_mas_snds_C";
	player addPrimaryWeaponItem "optic_mas_aim_c";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
	for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_mas_545x39_mag";};
    player addHeadgear "TRYK_H_Bandana_H";
	player addWeaponGlobal "arifle_mas_aks74u_c";
    player addWeaponGlobal "hgun_Pistol_heavy_01_F";
	player addPrimaryWeaponItem "optic_mas_kobra_c";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    player addBackpack "B_mas_Kitbag_rng";
	for "_i" from 1 to 4 do {player addItemToVest "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_mas_545x39_mag";};
    player addHeadgear "TRYK_r_cap_od_Glasses";
    player addWeaponGlobal "arifle_mas_ak74";
	player addPrimaryWeaponItem "optic_mas_PSO_eo";
    player addWeaponGlobal "hgun_ACPC2_F";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
	player addBackpack "B_mas_Kitbag_rng";
	for "_i" from 1 to 2 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
    for "_i" from 1 to 2 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
    player addHeadgear "TRYK_H_Booniehat_MARPAT_WOOD";
    player addWeaponGlobal "arifle_mas_m4c";
    player addPrimaryWeaponItem "optic_mas_aim";
    player addWeaponGlobal "hgun_mas_acp_F";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    player addBackpack "TRYK_B_Carryall_wood";
	for "_i" from 1 to 3 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_mas_556x45_Stanag";};
    player addHeadgear "TRYK_H_Booniehat_MARPAT_WOOD";
    player addWeaponGlobal "arifle_mas_m4_v";
	player addPrimaryWeaponItem "optic_mas_acog_rd_c";
    player addWeaponGlobal "hgun_mas_m23_F";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
	for "_i" from 1 to 2 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 3 do {player addItemToUniform "17Rnd_mas_9x21_Mag";};
    player addHeadgear "H_Shemag_olive";
    player addWeaponGlobal "arifle_MX_Black_F";
	player addPrimaryWeaponItem "optic_Hamr";
    player addWeaponGlobal "hgun_mas_grach_F";
    player addHandgunItem "optic_mas_MRD";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
	for "_i" from 1 to 2 do {player addItemToUniform "25Rnd_mas_9x19_Mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
    for "_i" from 1 to 2 do {player addItemToVest "25Rnd_mas_9x19_Mag";};
    player addHeadgear "H_Shemag_olive";
    player addWeaponGlobal "arifle_MX_Black_F";
	player addPrimaryWeaponItem "muzzle_snds_H";
    player addPrimaryWeaponItem "optic_Hamr";
    player addWeaponGlobal "hgun_mas_uzi_F";
    player addHandgunItem "muzzle_snds_L";
	player addHandgunItem "optic_mas_MRD";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    for "_i" from 1 to 2 do {player addItemToUniform "25Rnd_mas_9x19_Mag";};
    player addVest "V_PlateCarrierGL_blk";
	player addBackpack "TRYK_B_Carryall_blk";
	player addItemToVest "1Rnd_HE_Grenade_shell";
    for "_i" from 1 to 2 do {player addItemToVest "25Rnd_mas_9x19_Mag";};
    for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_65x39_caseless_green";};
    player addHeadgear "TRYK_H_headsetcap_blk_Glasses";
    player addWeaponGlobal "arifle_Katiba_GL_F";
	player addPrimaryWeaponItem "muzzle_snds_H";
	player addPrimaryWeaponItem "optic_MRCO";
    player addWeaponGlobal "hgun_mas_uzi_F";
    player addHandgunItem "muzzle_snds_L";
	player addHandgunItem "optic_mas_MRD";
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
    for "_i" from 1 to 2 do {player addItemToUniform "25Rnd_mas_9x19_Mag";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
	for "_i" from 1 to 2 do {player addItemToVest "25Rnd_mas_9x19_Mag";};
    for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_mas_762x39_mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addHeadgear "TRYK_H_PASGT_BLK";
    player addWeaponGlobal "arifle_mas_akm";
	player addPrimaryWeaponItem "optic_mas_kobra";
    player addWeaponGlobal "hgun_mas_uzi_F";
    player addHandgunItem "muzzle_snds_L";
	player addHandgunItem "optic_mas_MRD";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    call ExileClient_object_player_bambiStateEnd; 
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,600000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_AOR2_OD_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "25Rnd_mas_9x19_Mag";};
    player addVest "V_PlateCarrierGL_rgr";
    player addBackpack "TRYK_B_Carryall_JSDF";
	for "_i" from 1 to 2 do {player addItemToVest "25Rnd_mas_9x19_Mag";};
    for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_mas_762x39sd_mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addHeadgear "TRYK_H_AOR2";
    player addWeaponGlobal "arifle_mas_akm";
    player addPrimaryWeaponItem "optic_mas_PSO_eo";
	player addPrimaryWeaponItem "muzzle_mas_snds_AK";
    player addWeaponGlobal "hgun_mas_uzi_F";
    player addHandgunItem "muzzle_snds_L";
	player addHandgunItem "optic_mas_MRD";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    call ExileClient_object_player_bambiStateEnd;    
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,700000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_Woodland";
    for "_i" from 1 to 2 do {player addItemToUniform "40Rnd_mas_46x30_Mag";};
    player addVest "V_PlateCarrierGL_rgr";
    player addBackpack "TRYK_B_Carryall_wood";
	player addItemToVest "1Rnd_HE_Grenade_shell";
	for "_i" from 1 to 2 do {player addItemToVest "40Rnd_mas_46x30_Mag";};
    for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_mas_762x39sd_mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addHeadgear "TRYK_H_Helmet_WOOD";
    player addWeaponGlobal "arifle_mas_akm_gl";
    player addPrimaryWeaponItem "muzzle_mas_snds_AK";
    player addPrimaryWeaponItem "optic_mas_PSO_eo";
    player addWeapon "hgun_mas_mp7p_F";
	player addHandgunItem "muzzle_mas_snds_MP7";
	player addHandgunItem "optic_mas_aim";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    call ExileClient_object_player_bambiStateEnd;  
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,800000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_TANOCP_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "40Rnd_mas_46x30_Mag";};
    player addVest "V_PlateCarrierGL_mtp";
    player addBackpack "B_Carryall_cbr";
	for "_i" from 1 to 2 do {player addItemToVest "40Rnd_mas_46x30_Mag";};
    for "_i" from 1 to 5 do {player addItemToBackpack "20Rnd_mas_762x51sd_Stanag";};
	for "_i" from 1 to 2 do {this addItemToBackpack "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addHeadgear "H_HelmetB_sand";
    player addWeaponGlobal "arifle_mas_g3_m203";
    player addPrimaryWeaponItem "muzzle_mas_snds_M";
	player addPrimaryWeaponItem "optic_SOS";
    player addWeapon "hgun_mas_mp7p_F";
	player addHandgunItem "muzzle_mas_snds_MP7";
	player addHandgunItem "optic_mas_aim";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    call ExileClient_object_player_bambiStateEnd;  
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,960000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "U_B_GhillieSuit";
    for "_i" from 1 to 2 do {player addItemToUniform "40Rnd_mas_46x30_Mag";};
    player addVest "V_PlateCarrierGL_mtp";
    player addBackpack "B_Carryall_cbr";
	for "_i" from 1 to 2 do {player addItemToVest "40Rnd_mas_46x30_Mag";};
    for "_i" from 1 to 4 do {player addItemToBackpack "20Rnd_762x51_Mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addHeadgear "H_HelmetB_sand";
    player addWeaponGlobal "srifle_EBR_F";
    player addPrimaryWeaponItem "muzzle_snds_B";
    player addPrimaryWeaponItem "optic_KHS_old";
    player addPrimaryWeaponItem "bipod_01_F_blk";
    player addWeapon "hgun_mas_mp7p_F";
	player addHandgunItem "muzzle_mas_snds_MP7";
	player addHandgunItem "optic_mas_aim";
	player addItemToVest "SmokeShellRed";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    call ExileClient_object_player_bambiStateEnd;  
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,1250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "40Rnd_mas_46x30_Mag";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
	player addGoggles "G_mas_wpn_bala";
	for "_i" from 1 to 2 do {player addItemToVest "40Rnd_mas_46x30_Mag";};
    for "_i" from 1 to 2 do {player addItemToBackpack "100Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addHeadgear "H_HelmetSpecO_blk";
    player addWeaponGlobal "arifle_MX_SW_Black_F";
    player addPrimaryWeaponItem "optic_AMS";
	player addPrimaryWeaponItem "bipod_03_F_blk";
    player addWeapon "hgun_mas_mp7p_F";
	player addHandgunItem "muzzle_mas_snds_MP7";
	player addHandgunItem "optic_mas_aim";
	player addItemToVest "SmokeShellYellow";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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
    call ExileClient_object_player_bambiStateEnd;  
   [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,1250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
    for "_i" from 1 to 2 do {player addItemToUniform "40Rnd_mas_46x30_Mag";};
    player addVest "V_PlateCarrierGL_blk";
    player addBackpack "TRYK_B_Carryall_blk";
	player addGoggles "G_mas_wpn_bala_mask_b";
	for "_i" from 1 to 2 do {player addItemToVest "40Rnd_mas_46x30_Mag";};
    for "_i" from 1 to 2 do {player addItemToBackpack "150Rnd_762x54_Box";};
	for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
    player addHeadgear "H_HelmetSpecO_blk";
    player addWeaponGlobal "LMG_Zafir_F";
	player addPrimaryWeaponItem "optic_AMS";
    player addWeapon "hgun_mas_mp7p_F";
	player addHandgunItem "muzzle_mas_snds_MP7";
	player addHandgunItem "optic_mas_aim";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
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