/**
 * ExileServer_object_player_network_createPlayerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_requestingPlayer","_spawnLocationMarkerName","_playerUID","_accountData","_bambiPlayer","_cargoType","_respect"];
_sessionID = _this select 0;
_parameters = _this select 1;
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _requestingPlayer) then 
	{
		throw format ["Session %1 requested a bambi character, but doesn't have a player object. Hacker or Monday?", _sessionID];
	};
	_spawnLocationMarkerName = _parameters select 0;
	_playerUID = getPlayerUID _requestingPlayer;
	if(_playerUID isEqualTo "")then
	{
		throw format ["Player: '%1' has no player UID. Arma/Steam Sucks!.",name _requestingPlayer];
	};
	_accountData = format["getAccountStats:%1", _playerUID] call ExileServer_system_database_query_selectSingle;
	_group = createGroup independent;
	_bambiPlayer = _group createUnit ["Exile_Unit_Player", [0,0,0], [], 0, "CAN_COLLIDE"];
	_bambiPlayer addHeadgear "Exile_Headgear_SantaHat";
	_respect = (_accountData select 1);   // get the players respect from the database
/*
	switch (true) do 
	{
	    case (_respect > 2500 && _respect < 4999):
	    {
		_bambiPlayer forceAddUniform "U_DrestesBody";
		_bambiPlayer addBackpack "B_AssaultPack_cbr";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
	 //  "Your rank is Enforcer";
			};
			
	    case (_respect > 5000 && _respect < 9999):
	   {
		_bambiPlayer forceAddUniform "U_B_CombatUniform_mcam_worn";
		_bambiPlayer addVest "V_BandollierB_oli";
		_bambiPlayer addBackpack "B_AssaultPack_cbr";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";

	//	 "Your rank is Slayer";
	   };
	   
		case (_respect > 10000 && _respect < 19999):
	   {
		_bambiPlayer forceAddUniform "U_B_CombatUniform_mcam_tshirt";
		_bambiPlayer addHeadgear "H_booniehat_oil";
		_bambiPlayer addVest "V_BandollierB_oli";
		_bambiPlayer addBackpack "B_TacticalPack_mcamo";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_BBQSandwich";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
		_bambiPlayer addItem "Exile_Item_InstaDoc";
	//	 "Your rank is Hit Man";
	   };
	   
	    case (_respect > 19999 && _respect < 29999):
	   {
		_bambiPlayer forceAddUniform "U_B_CombatUniform_mcam_tshirt";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
		_bambiPlayer addVest "V_BandollierB_khk";
		_bambiPlayer addBackpack "B_Bergen_sgg";
		_bambiPlayer addHeadgear "H_Bandanna_khk";
	 	_bambiPlayer addWeaponGlobal "rhsusf_weap_glock17g4";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_BBQSandwich";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
		_bambiPlayer addItem "Exile_Item_InstaDoc";
	//	"Your rank is Executioner";
	   };
	   
	    case (_respect > 29999 && _respect < 39999):
	   {
	   	_bambiPlayer forceAddUniform "U_B_CombatUniform_mcam_tshirt";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_bambiPlayer addVest "V_TacVest_camo";
		_bambiPlayer addBackpack "B_Bergen_sgg";
		_bambiPlayer addHeadgear "H_Booniehat_dgtl";
	 	_bambiPlayer addWeaponGlobal "rhsusf_weap_m1911a1";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_BBQSandwich";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
		_bambiPlayer addItem "Exile_Item_InstaDoc";

	//	 "Your rank is Tyrant";
	   };
	   
	    case (_respect > 39999 && _respect < 49999):
	   {
		_bambiPlayer forceAddUniform "U_C_HunterBody_grn";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "11Rnd_45ACP_Mag";};
		_bambiPlayer addVest "V_PlateCarrierIA1_dgtl";
		_bambiPlayer addBackpack "B_Bergen_sgg";
		_bambiPlayer addHeadgear "H_Cap_brn_SPECOPS";
	 	_bambiPlayer addWeaponGlobal "hgun_Pistol_heavy_01_F";
		_bambiPlayer addHandgunItem "optic_MRD";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_BBQSandwich";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
		_bambiPlayer addItem "Exile_Item_InstaDoc";
	      
	//	"Your rank is Triggerman";
	   };
	   
	    case (_respect > 49999 && _respect < 69999):
	   {
		_bambiPlayer forceAddUniform "U_B_CTRG_1";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "11Rnd_45ACP_Mag";};
		_bambiPlayer addVest "V_PlateCarrierIA2_dgtl";
		_bambiPlayer addBackpack "B_Bergen_sgg";
		_bambiPlayer addHeadgear "H_Cap_oli_hs";
	 	_bambiPlayer addWeaponGlobal "hgun_Pistol_heavy_01_F";
		_bambiPlayer addHandgunItem "muzzle_snds_acp";
		_bambiPlayer addHandgunItem "optic_MRD";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_BBQSandwich";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
		_bambiPlayer addItem "Exile_Item_InstaDoc";
	//	 "Your rank is Trooper";
	   };
	   
	    case (_respect > 69999 && _respect < 89999):
	   {
		_bambiPlayer forceAddUniform "U_B_CTRG_2";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "11Rnd_45ACP_Mag";};
		_bambiPlayer addVest "V_TacVest_camo";
		_bambiPlayer addBackpack "B_Bergen_sgg";
		_bambiPlayer addHeadgear "H_ShemagOpen_tan";
	 	_bambiPlayer addWeaponGlobal "hgun_Pistol_heavy_01_F";
		_bambiPlayer addHandgunItem "muzzle_snds_acp";
		_bambiPlayer addHandgunItem "optic_MRD";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_BBQSandwich";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
		_bambiPlayer addItem "Exile_Item_InstaDoc";
	//  "Your rank is High Executioner";
	   };
	   
	     case (_respect > 89999 && _respect < 149999):
	   {
		_bambiPlayer forceAddUniform "U_B_CTRG_3";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
		_bambiPlayer addVest "V_TacVest_camo";
		_bambiPlayer addBackpack "B_Carryall_ocamo";
		_bambiPlayer addHeadgear "H_Beret_blk";
	 	_bambiPlayer addWeaponGlobal "rhs_weap_m4";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "11Rnd_45ACP_Mag";};
		_bambiPlayer addWeaponGlobal "hgun_Pistol_heavy_01_F";
		_bambiPlayer addHandgunItem "muzzle_snds_acp";
		_bambiPlayer addHandgunItem "optic_MRD";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_BBQSandwich";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
		_bambiPlayer addItem "Exile_Item_InstaDoc";
	//	 "Your rank is Reaper";
	   };

	     case (_respect > 149999):
	   {
		_bambiPlayer forceAddUniform "rhs_chdkz_uniform_1";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
		_bambiPlayer addVest "V_Chestrig_khk";
		_bambiPlayer addBackpack "B_Carryall_ocamo";
		_bambiPlayer addHeadgear "H_ShemagOpen_khk";
	 	_bambiPlayer addWeaponGlobal "rhs_weap_m4_carryhandle";
		_bambiPlayer addPrimaryWeaponItem "acc_flashlight";
		_bambiPlayer addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_bambiPlayer addPrimaryWeaponItem "optic_Aco";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "11Rnd_45ACP_Mag";};
		_bambiPlayer addWeaponGlobal "hgun_Pistol_heavy_01_F";
		_bambiPlayer addHandgunItem "muzzle_snds_acp";
		_bambiPlayer addHandgunItem "optic_MRD";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_BBQSandwich";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
		_bambiPlayer addItem "Exile_Item_InstaDoc";
	//	"Your rank is Supreme Overlord";
	   };
	    default
	    {	
	//  "Your rank is Inmate";
		};
	};
*/	
	{
		_cargoType = _x call ExileClient_util_cargo_getType;
		switch (_cargoType) do
		{
			case 1: 	{ _bambiPlayer addItem _x; };
			case 2: 	{ _bambiPlayer addWeaponGlobal _x; };
			case 3: 	{ _bambiPlayer addBackpackGlobal _x; };
			case 4:		{ _bambiPlayer linkItem _x; };
			default 					{ _bambiPlayer addItem _x; };
		};
	}
	forEach getArray(configFile >> "CfgSettings" >> "BambiSettings" >> "loadOut");
	[_sessionID, _requestingPlayer, _spawnLocationMarkerName, _bambiPlayer, _accountData] call ExileServer_object_player_createBambi;
}
catch
{
	_exception call ExileServer_util_log;
};