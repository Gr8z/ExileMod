uiSleep 2;
_respect = ExileClientPlayerScore;
switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
	    _rank = "Scavenger";  
	     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	    player forceAddUniform "U_I_C_Soldier_Bandit_2_F";
		player addVest "V_Rangemaster_belt";
		player addBackpack "CUP_B_SLA_Medicbag";
		player addHeadgear "H_Bandanna_sgg";
		player linkItem "ItemMap";
		player addItem "Exile_Item_Matches";
	    player addItem "Exile_Item_ExtensionCord";
	    player addItem "Exile_Item_PlasticBottleFreshWater";
	    player addItem "Exile_Item_CanOpener";
		//  "Your rank is Scavenger";
    };
     
    case (_respect > 4999 && _respect < 49999):
    {
	   call ExileClient_object_player_bambiStateEnd;
	    _rank = "Pickpocket";     
	   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,50000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	    player forceAddUniform "U_I_C_Soldier_Bandit_3_F";
		player addWeapon "hgun_P07_F";
		player addVest "V_BandollierB_rgr";
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		player addBackpack "B_AssaultPack_cbr";
		player addHeadgear "CUP_H_PMC_Cap_Grey";
		player linkItem "ItemMap";
		player addItem "Exile_Item_Matches";
	    player addItem "Exile_Item_ExtensionCord";
	    player addItem "Exile_Item_ChristmasTinner";
	    player addItem "Exile_Item_PlasticBottleFreshWater";
	    player addItem "Exile_Item_CanOpener";
		//    "Your rank is Pickpocket";
    };
   
    case (_respect > 49999 && _respect < 99999):
    {
	    _rank = "Thief";
	    call ExileClient_object_player_bambiStateEnd;
	   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,100000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	    player forceAddUniform "CUP_U_C_Woodlander_01";
		player addVest "V_BandollierB_blk";
		for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
		player addBackpack "B_AssaultPack_blk";
		player addHeadgear "H_Watchcap_blk";
		player addWeapon "hgun_Pistol_heavy_01_F";
		player addHandgunItem "muzzle_snds_acp";
		player addHandgunItem "optic_MRD";
		player addItem "Exile_Item_Matches";
	    player linkItem "ItemGPS";
		player linkItem "ItemMap";
	    player addItem "Exile_Item_ExtensionCord";
	    player addItem "Exile_Item_BBQSandwich";
	    player addItem "Exile_Item_Vishpirin";
	    player addItem "Exile_Item_CanOpener";
	    player addItem "Exile_Item_PlasticBottleFreshWater";
	   //   "Your rank is Thief";
    };
   
    case (_respect > 99999 && _respect < 159999):
    {
	    _rank = "Gangster";  
	    call ExileClient_object_player_bambiStateEnd;
	   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,150000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	    player forceAddUniform "CUP_U_C_Rocker_02";
	    player addVest "V_BandollierB_rgr";
	    player addBackpack "B_FieldPack_khk";
		for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Magazine_8Rnd_74Slug";};
	    for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Magazine_8Rnd_74Pellets";};
		player addHeadgear "CUP_H_PMC_Cap_Grey";
		player addGoggles "G_Bandanna_oli";
		player addWeaponGlobal "Exile_Weapon_M1014";
	    player addItem "Exile_Item_Matches";
	    player linkItem "ItemGPS";
		player linkItem "ItemMap";
	    player addItem "Exile_Item_ExtensionCord";
	    player addItem "Exile_Item_BBQSandwich";
	    player addItem "Exile_Item_PlasticBottleFreshWater";
	    player addItem "Exile_Item_InstaDoc";
	    player addItem "Exile_Item_CanOpener";
	    player addItem "Exile_Item_PlasticBottleFreshWater";
	    //  "Your rank is Gangster";
    };
   
    case (_respect > 159999 && _respect < 224999):
    {
	   _rank = "Hitman";
	   call ExileClient_object_player_bambiStateEnd;
	   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	    player forceAddUniform "CUP_U_I_GUE_Anorak_03";
	    player addVest "V_BandollierB_blk";
	    player addBackpack "B_FieldPack_oli";
	    player addHeadgear "H_Watchcap_blk";
		player addGoggles "G_Aviator";
		for "_i" from 1 to 3 do {player addItemToBackpack "hlc_30Rnd_9x19_GD_MP5";};
		player addWeaponGlobal "hlc_smg_mp5sd5";
		player addPrimaryWeaponItem "optic_Aco_smg";
		player linkItem "ItemGPS";
		player linkItem "ItemMap";
	    player addItem "Exile_Item_Matches";
	    player addItem "Exile_Item_ExtensionCord";
	    player addItem "Exile_Item_BBQSandwich";
	    player addItem "Exile_Item_PlasticBottleFreshWater";
	    player addItem "Exile_Item_InstaDoc";
	    player addItem "Exile_Item_CanOpener";
	    player addItem "Exile_Item_PlasticBottleFreshWater";
	    //   "Your rank is Hitman";
    };
   
    case (_respect > 224999 && _respect < 274999):
    {
	    _rank = "Bounty Hunter";  
	  call ExileClient_object_player_bambiStateEnd;
	    [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,350000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
		player forceAddUniform "CUP_U_B_FR_Scout";
		for "_i" from 1 to 3 do {player addItemToUniform "hlc_30rnd_556x45_EPR_G36";};
		player addVest "CUP_V_OI_TKI_Jacket2_02";
		player addBackpack "B_TacticalPack_blk";
		player addHeadgear "H_Cap_oli";
		player addGoggles "G_Bandanna_sport";
		player addWeaponGlobal "hlc_rifle_G36CV";
		player addPrimaryWeaponItem "CUP_optic_SUSAT";
		player linkItem "ItemGPS";
		player linkItem "ItemMap";
		player addItem "Exile_Item_Matches";
		player addItem "Exile_Item_ExtensionCord";
		player addItem "Exile_Item_BBQSandwich";
		player addItem "Exile_Item_PlasticBottleFreshWater";
		player addItem "Exile_Item_PlasticBottleFreshWater";
		player addItem "Exile_Item_InstaDoc";
		player addItem "Exile_Item_CanOpener";
	    //  "Your rank is Bounty Hunter";
    };
  
    case (_respect > 274999 && _respect < 324999):
    {
	    _rank = "Mercenary";  
	  call ExileClient_object_player_bambiStateEnd;
	     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,450000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
		player forceAddUniform "U_I_C_Soldier_Para_2_F";
		player addVest "V_TacChestrig_oli_F";
		for "_i" from 1 to 3 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
		player addBackpack "B_FieldPack_khk";
		player addHeadgear "H_Cap_oli_hs";
		player addGoggles "G_Bandanna_sport";
		player addWeaponGlobal "CUP_arifle_L85A2";
		player addPrimaryWeaponItem "CUP_optic_HoloWdl";
		player linkItem "ItemGPS";
		player linkItem "ItemMap";
		player addItem "Exile_Item_Matches";
		player addItem "Exile_Item_ExtensionCord";
		player addItem "Exile_Item_BBQSandwich";
		player addItem "Exile_Item_InstaDoc";
		player addItem "Exile_Item_CanOpener";
		player addItem "Exile_Item_PlasticBottleFreshWater";
		player addItem "Exile_Item_PlasticBottleFreshWater";
	    //   "Your rank is Mercenary";
    };
   
    case (_respect > 324999 && _respect < 399999):
    {
	    _rank = "Assassin";  
	  	call ExileClient_object_player_bambiStateEnd;
	    [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,600000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
		player forceAddUniform "CUP_U_B_FR_Scout";
		player addVest "V_I_G_resistanceLeader_F";
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		player addBackpack "B_TacticalPack_blk";
		player addHeadgear "H_Shemag_olive_hs";
		player addGoggles "G_Balaclava_blk";
		player addWeaponGlobal "arifle_MX_khk_F";
		player addPrimaryWeaponItem "muzzle_snds_H_khk_F";
		player addPrimaryWeaponItem "optic_Hamr_khk_F";
		player linkItem "ItemGPS";
		player linkItem "ItemMap";
		player addItem "Exile_Item_Matches";
		player addItem "Exile_Item_ExtensionCord";
		player addItem "Exile_Item_BBQSandwich";
		player addItem "Exile_Item_InstaDoc";
		player addItem "Exile_Item_CanOpener";
		player addItem "Exile_Item_PlasticBottleFreshWater";
		player addItem "Exile_Item_PlasticBottleFreshWater";
	    //  "Your rank is Assassin";
    };
   
    case (_respect > 399999 && _respect < 499999):
    {
	    _rank = "Terrorist";  
		call ExileClient_object_player_bambiStateEnd;
			[parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,800000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
		player forceAddUniform "U_I_C_Soldier_Para_4_F";
		player addVest "V_TacVest_khk";
		for "_i" from 1 to 3 do {player addItemToVest "hlc_30Rnd_762x39_b_ak";};
		for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
		player addBackpack "B_Kitbag_cbr";
		player addHeadgear "H_ShemagOpen_tan";
		player addWeaponGlobal "hlc_rifle_akm_MTK";
		player addPrimaryWeaponItem "optic_MRCO";
		player linkItem "ItemGPS";
		player linkItem "ItemMap";
		player addItem "Exile_Item_Matches";
		player addItem "Exile_Item_ExtensionCord";
		player addItem "Exile_Item_BBQSandwich";
		player addItem "Exile_Item_InstaDoc";
		player addItem "Exile_Item_CanOpener";
		player addItem "Exile_Item_PlasticBottleFreshWater";
		player addItem "Exile_Item_PlasticBottleFreshWater";
	    //   "Your rank is Terrorist";
    };
   
    case (_respect > 499999):
    {
	    _rank = "Warlord";
	    call ExileClient_object_player_bambiStateEnd;  
	   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t>",_rank],0,0,10,0] spawn bis_fnc_dynamictext;
		player forceAddUniform "CUP_U_O_RUS_EMR_1";
		player addVest "V_PlateCarrierGL_rgr";
		player addBackpack "B_Carryall_oli";
		player addHeadgear "CUP_H_RACS_Helmet_olive";
		player addGoggles "TRYK_kio_balaclava_ear";
		player addWeaponGlobal "hlc_m249_pip3";
		player addPrimaryWeaponItem "CUP_optic_RCO";
		player addWeapon "hgun_ACPC2_F";
		player addHandgunItem "muzzle_snds_acp";
		player addItem "hlc_200rnd_556x45_B_SAW";
		player addItemToUniform "9Rnd_45ACP_Mag";
		player addItemToUniform "9Rnd_45ACP_Mag";
		for "_i" from 1 to 3 do {player addItemToBackpack "HandGrenade";};
		player linkItem "ItemGPS";
		player linkItem "ItemMap";
		player addItem "Exile_Item_Matches";
		player addItem "Exile_Item_ExtensionCord";
		player addItem "Exile_Item_GloriousKnakworst";
		player addItem "Exile_Item_CanOpener";
		for "_i" from 1 to 2 do {player addItemToVest "Exile_Item_PowerDrink";};
		player addItem "Exile_Item_InstaDoc";
	   //    "Your rank is Warlord";
    };
   
    default
    {
	    _rank = "Inmate";  
	    [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
		player linkItem "ItemMap";
		//  "Your rank is Inmate";
    };
};
