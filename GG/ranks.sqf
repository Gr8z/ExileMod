uiSleep 2;
_respect = ExileClientPlayerScore;

switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
	_rank = "Enforcer";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "U_DrestesBody";
    player addBackpack "B_AssaultPack_cbr";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";

	};
	
    case (_respect > 5000 && _respect < 9999):
   {
	 _rank = "Slayer";     
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,10000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
      player forceAddUniform "U_B_CombatUniform_mcam_worn";
    player addVest "V_BandollierB_oli";
    player addBackpack "B_AssaultPack_cbr";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_PlasticBottleFreshWater";

   };
   
	case (_respect > 9999 && _respect < 19999):
   {
	_rank = "Hit Man";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,20000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
      player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
    player addHeadgear "H_booniehat_oil";
    player addVest "V_BandollierB_oli";
    player addBackpack "B_TacticalPack_mcamo";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";

   };
   
    case (_respect > 19999 && _respect < 29999):
   {
	_rank = "Executioner";  
  call ExileClient_object_player_bambiStateEnd;
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,30000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
      player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
    for "_i" from 1 to 2 do {player addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
    player addVest "V_BandollierB_khk";
    player addBackpack "B_Bergen_sgg";
    player addHeadgear "H_Bandanna_khk";
    player addWeaponGlobal "rhsusf_weap_glock17g4";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";

   };
   
    case (_respect > 29999 && _respect < 39999):
   {
	_rank = "Tyrant";  
  call ExileClient_object_player_bambiStateEnd;
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
        player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
    for "_i" from 1 to 2 do {player addItemToUniform "rhsusf_mag_7x45acp_MHP";};
    player addVest "V_TacVest_camo";
    player addBackpack "B_Bergen_sgg";
    player addHeadgear "H_Booniehat_dgtl";
    player addWeaponGlobal "rhsusf_weap_m1911a1";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";

   };
   
    case (_respect > 39999 && _respect < 49999):
   {
	_rank = "Triggerman";  
  call ExileClient_object_player_bambiStateEnd;
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,50000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
      player forceAddUniform "U_C_HunterBody_grn";
    for "_i" from 1 to 2 do {player addItemToUniform "11Rnd_45ACP_Mag";};
    player addVest "V_PlateCarrierIA1_dgtl";
    player addBackpack "B_Bergen_sgg";
    player addHeadgear "H_Cap_brn_SPECOPS";
    player addWeaponGlobal "hgun_Pistol_heavy_01_F";
    player addHandgunItem "optic_MRD";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";

   };
   
    case (_respect > 49999 && _respect < 69999):
   {
	_rank = "Trooper";  
  call ExileClient_object_player_bambiStateEnd;
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,70000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
      player forceAddUniform "U_B_CTRG_1";
    for "_i" from 1 to 2 do {player addItemToUniform "11Rnd_45ACP_Mag";};
    player addVest "V_PlateCarrierIA2_dgtl";
    player addBackpack "B_Bergen_sgg";
    player addHeadgear "H_Cap_oli_hs";
    player addWeaponGlobal "hgun_Pistol_heavy_01_F";
    player addHandgunItem "muzzle_snds_acp";
    player addHandgunItem "optic_MRD";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";

   };
   
    case (_respect > 69999 && _respect < 89999):
   {
	_rank = "High Executioner";  
  call ExileClient_object_player_bambiStateEnd;
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,90000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
      player forceAddUniform "U_B_CTRG_2";
    for "_i" from 1 to 2 do {player addItemToUniform "11Rnd_45ACP_Mag";};
    player addVest "V_TacVest_camo";
    player addBackpack "B_Bergen_sgg";
    player addHeadgear "H_ShemagOpen_tan";
    player addWeaponGlobal "hgun_Pistol_heavy_01_F";
    player addHandgunItem "muzzle_snds_acp";
    player addHandgunItem "optic_MRD";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";

   };
   
     case (_respect > 89999 && _respect < 149999):
   {

	_rank = "Reaper";  
  call ExileClient_object_player_bambiStateEnd;
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,150000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
      player forceAddUniform "U_B_CTRG_3";
    for "_i" from 1 to 2 do {player addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
    player addVest "V_TacVest_camo";
    player addBackpack "B_Carryall_ocamo";
    player addHeadgear "H_Beret_blk";
    player addWeaponGlobal "rhs_weap_m4";
    for "_i" from 1 to 2 do {player addItemToUniform "11Rnd_45ACP_Mag";};
    player addWeaponGlobal "hgun_Pistol_heavy_01_F";
    player addHandgunItem "muzzle_snds_acp";
    player addHandgunItem "optic_MRD";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";

   };

     case (_respect > 149999):
   {
	_rank = "Supreme Overlord";  
  call ExileClient_object_player_bambiStateEnd;
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/>",_rank],0,0,10,0] spawn bis_fnc_dynamictext;
      player forceAddUniform "rhs_chdkz_uniform_1";
    for "_i" from 1 to 2 do {player addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
    player addVest "V_Chestrig_khk";
    player addBackpack "B_Carryall_ocamo";
    player addHeadgear "H_ShemagOpen_khk";
    player addWeaponGlobal "rhs_weap_m4_carryhandle";
    player addPrimaryWeaponItem "acc_flashlight";
    player addPrimaryWeaponItem "rhsusf_acc_nt4_black";
    player addPrimaryWeaponItem "optic_Aco";
    for "_i" from 1 to 2 do {player addItemToUniform "11Rnd_45ACP_Mag";};
    player addWeaponGlobal "hgun_Pistol_heavy_01_F";
    player addHandgunItem "muzzle_snds_acp";
    player addHandgunItem "optic_MRD";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_CanOpener";
    player linkItem "ItemGPS";
    player addWeaponGlobal "Exile_Melee_Axe";
    player addMagazine "Exile_Magazine_Swing";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";

   };
    default
    {	
	_rank = "Inmate";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	};
};