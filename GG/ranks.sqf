
uiSleep 2;
_respect = ExileClientPlayerScore;
switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
    _rank = "Scavenger";  
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_Denim_T_BG_BK";
	player addHeadgear "H_Bandanna_camo";
	player addVest "V_Rangemaster_belt";
    player addBackpack "TRYK_B_tube_blk";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_ExtensionCord";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //  "Your rank is Scavenger";
    };
     
    case (_respect > 4999 && _respect < 49999):
   {
   call ExileClient_object_player_bambiStateEnd;
    _rank = "Pickpocket";     
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,50000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_denim_hood_mc";
	player addHeadgear "H_Cap_blk";
    player addVest "V_BandollierB_rgr";
    player addBackpack "B_AssaultPack_rgr";
	for "_i" from 1 to 3 do {player addItemToVest "16Rnd_9x21_Mag";};
	player addWeapon "hgun_P07_F";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addItem "Exile_Item_ExtensionCord";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //    "Your rank is Pickpocket";
   };
   
    case (_respect > 49999 && _respect < 99999):
   {
    _rank = "Thief";
    call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,100000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_B_TRYK_UCP_T";
    player addHeadgear "H_Watchcap_blk";
    player addVest "V_BandollierB_blk";
    player addBackpack "B_AssaultPack_blk";
	for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
	player addWeapon "hgun_Pistol_heavy_01_F";
	player addHandgunItem "muzzle_snds_acp";
	player addHandgunItem "optic_MRD";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addItem "Exile_Item_ExtensionCord";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //   "Your rank is Thief";
   };
   
    case (_respect > 99999 && _respect < 149999):
   {
    _rank = "Gangster";  
    call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,150000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_shirts_OD_PAD_BK";
    player addVest "V_BandollierB_blk";
    player addBackpack "TRYK_B_FieldPack_Wood";
	for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Magazine_8Rnd_74Slug";};
    for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Magazine_8Rnd_74Pellets";};
    player addHeadgear "H_Bandanna_khk_hs";
	player addGoggles "G_Bandanna_oli";
	player addWeaponGlobal "Exile_Weapon_M1014";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addItem "Exile_Item_ExtensionCord";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Gangster";
   };
   
    case (_respect > 149999 && _respect < 249999):
   {
   _rank = "Hitman";
   call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_PCUGs_BLK";
    player addVest "TRYK_V_harnes_blk_L";
    player addBackpack "B_FieldPack_blk";
    player addHeadgear "TRYK_H_woolhat";
	for "_i" from 1 to 3 do {player addItemToBackpack "hlc_30Rnd_9x19_GD_MP5";};
	player addWeaponGlobal "hlc_smg_mp5sd5";
	player addPrimaryWeaponItem "optic_Aco_smg";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addItem "Exile_Item_ExtensionCord";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //   "Your rank is Hitman";
   };
   
    case (_respect > 249999 && _respect < 349999):
   {
    _rank = "Bounty Hunter";  
  call ExileClient_object_player_bambiStateEnd;
    [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,350000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_T_PAD";
    player addVest "TRYK_V_ArmorVest_tan";
    player addBackpack "B_TacticalPack_blk";
	for "_i" from 1 to 3 do {player addItemToBackpack "hlc_30Rnd_545x39_B_AK";};
    player addHeadgear "H_Cap_tan";
	player addWeapon "hlc_rifle_ak74";
	player addPrimaryWeaponItem "HLC_Optic_1p29";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addItem "Exile_Item_ExtensionCord";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Bounty Hunter";
   };
   
    case (_respect > 349999 && _respect < 449999):
   {
    _rank = "Mercenary";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,450000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_PCUODHs";
    player addVest "TRYK_V_ArmorVest_Ranger";
    player addBackpack "B_FieldPack_blk";
	for "_i" from 1 to 3 do {player addItemToVest "hlc_30rnd_556x45_EPR";};
    player addHeadgear "H_Cap_oli_hs";
	player addWeaponGlobal "hlc_rifle_CQBR";
	player addPrimaryWeaponItem "optic_MRCO";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_ExtensionCord";
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
   
    case (_respect > 449999 && _respect < 599999):
   {
    _rank = "Assassin";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,600000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_Woodland";
    player addVest "V_I_G_resistanceLeader_F";
    player addBackpack "TRYK_B_BAF_BAG_OD";
	for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
    player addHeadgear "H_Shemag_olive_hs";
	player addWeaponGlobal "arifle_MX_khk_F";
	player addPrimaryWeaponItem "muzzle_snds_h_khk_f";
	player addPrimaryWeaponItem "optic_ERCO_khk_F";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_ExtensionCord";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Assassin"
   };
   
     case (_respect > 599999 && _respect < 799999):
   {
    _rank = "Terrorist";  
	call ExileClient_object_player_bambiStateEnd;
		[parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,800000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
		player forceAddUniform "TRYK_U_hood_nc";
		player addItem "Exile_Item_Matches";
		player addVest "V_TacVest_khk";
		for "_i" from 1 to 3 do {this addItemToVest "hlc_30Rnd_762x39_b_ak";};
		player addBackpack "B_Kitbag_cbr";
		for "_i" from 1 to 3 do {this addItemToBackpack "hlc_45Rnd_762x39_m_rpk";};
		player addHeadgear "H_Shemag_olive";
		player addWeapon "hlc_rifle_akm_MTK";
		player addPrimaryWeaponItem "optic_MRCO";
		player linkItem "ItemGPS";
		player addWeaponGlobal "Exile_Melee_Axe";
		player additem "Exile_Item_ExtensionCord";
		player addMagazine "Exile_Magazine_Swing";
		player addItem "Exile_Item_BBQSandwich";
		player addItem "Exile_Item_PlasticBottleFreshWater";
		player addItem "Exile_Item_InstaDoc";
		player addItem "Exile_Item_CanOpener";
		player addItem "Exile_Item_PlasticBottleFreshWater";
    //   "Your rank is Terrorist";
   };
   
       case (_respect > 800000):
   {
    _rank = "Warlord";
    call ExileClient_object_player_bambiStateEnd;  
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t>",_rank],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_MTP_R_CombatUniform"; 
	for "_i" from 1 to 4 do {this addItemToUniform "20Rnd_762x51_Mag";};
	player addVest "V_PlateCarrierGL_rgr";
	player addBackpack "TRYK_B_Carryall_wood";
	for "_i" from 1 to 2 do {this addItemToBackpack "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 2 do {this addItemToBackpack "HandGrenade";};
	player addHeadgear "TRYK_H_PASGT_OD";
	player addGoggles "TRYK_kio_balaclavas";
	player addWeapon "srifle_DMR_03_multicam_F";
	player addPrimaryWeaponItem "optic_Arco_ghex_F";
	player addWeapon "hgun_ACPC2_F";
	player addHandgunItem "muzzle_snds_acp";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_ExtensionCord";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_GloriousKnakworst";
    player addItem "Exile_Item_PowerDrink";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PowerDrink";
   //    "Your rank is Warlord";
   };
   
    default
    {   
    //  "Your rank is Inmate";
    _rank = "Inmate";  
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	 player linkItem "ItemMap";
    };
};
