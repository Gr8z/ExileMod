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
 
private["_sessionID","_parameters","_requestingPlayer","_spawnLocationMarkerName","_playerUID","_accountData","_bambiPlayer","_cargoType"];
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

	_respect = (_accountData select 1);   // get the players respect from the database

	switch (true) do 
	{
	    case (_respect > 2500 && _respect < 4999):
	    {
		_bambiPlayer forceAddUniform "TRYK_U_B_Denim_T_BG_BK";
		_bambiPlayer addBackpack "TRYK_B_tube_blk";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
	 //  "Your rank is Enforcer";
			};
			
	    case (_respect > 5000 && _respect < 9999):
	   {
		_bambiPlayer forceAddUniform "TRYK_hoodie_Wood";
		_bambiPlayer addVest "V_BandollierB_oli";
		_bambiPlayer addBackpack "B_AssaultPack_Kerry";
		_bambiPlayer addItem "Exile_Item_Matches";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
		_bambiPlayer addMagazine "Exile_Magazine_Swing";
		_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";

	//	 "Your rank is Slayer";
	   };
	   
		case (_respect > 10000 && _respect < 19999):
	   {
		_bambiPlayer forceAddUniform "TRYK_U_denim_hood_mc";
		_bambiPlayer addHeadgear "TRYK_H_woolhat_cu";
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
		_bambiPlayer forceAddUniform "TRYK_shirts_DENIM_RED2_Sleeve";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "17Rnd_mas_9x21_Mag";};
		_bambiPlayer addVest "V_BandollierB_khk";
		_bambiPlayer addBackpack "TRYK_B_Kitbag_aaf";
		_bambiPlayer addHeadgear "TRYK_H_headsetcap_blk";
	 	_bambiPlayer addWeaponGlobal "hgun_mas_grach_F";
		_bambiPlayer addHandgunItem "acc_mas_flash_gun";
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
	   	_bambiPlayer forceAddUniform "TRYK_U_denim_hood_3c";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "17Rnd_mas_9x21_Mag";};
		_bambiPlayer addVest "V_TacVest_camo";
		_bambiPlayer addBackpack "TRYK_B_Kitbag_Base_JSDF";
		_bambiPlayer addHeadgear "H_Booniehat_dgtl";
	 	_bambiPlayer addWeaponGlobal "hgun_mas_grach_F";
		_bambiPlayer addHandgunItem "acc_mas_flash_gun";
		_bambiPlayer addHandgunItem "optic_mas_MRD";
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
		_bambiPlayer forceAddUniform "TRYK_U_Bts_PCUs";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "17Rnd_mas_9x21_Mag";};
		_bambiPlayer addVest "V_PlateCarrierIA1_dgtl";
		_bambiPlayer addBackpack "TRYK_B_Coyotebackpack";
		_bambiPlayer addHeadgear "H_Cap_brn_SPECOPS";
	 	_bambiPlayer addWeaponGlobal "hgun_mas_grach_F";
		_bambiPlayer addHandgunItem "acc_mas_flash_gun";
		_bambiPlayer addHandgunItem "muzzle_mas_snds_LM";
		_bambiPlayer addHandgunItem "optic_Yorris";
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
		_bambiPlayer forceAddUniform "TRYK_U_B_PCUODHs";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "25Rnd_mas_9x19_Mag";};
		_bambiPlayer addVest "V_PlateCarrierIA2_dgtl";
		_bambiPlayer addBackpack "TRYK_B_Coyotebackpack";
		_bambiPlayer addHeadgear "H_Cap_oli_hs";
	 	_bambiPlayer addWeaponGlobal "hgun_mas_uzi_F";
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
		_bambiPlayer forceAddUniform "TRYK_U_B_3cr";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "25Rnd_mas_9x19_Mag";};
		_bambiPlayer addVest "TRYK_V_tacSVD_BK";
		_bambiPlayer addBackpack "TRYK_B_Coyotebackpack";
		_bambiPlayer addHeadgear "H_ShemagOpen_tan";
	 	_bambiPlayer addWeaponGlobal "hgun_mas_uzi_F";
		_bambiPlayer addHandgunItem "muzzle_mas_snds_L";
		_bambiPlayer addHandgunItem "optic_mas_MRD";
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
		_bambiPlayer forceAddUniform "TRYK_U_B_woodR_CombatUniformTshirt";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "30Rnd_mas_9x21_Stanag";};
		_bambiPlayer addVest "V_TacVest_camo";
		_bambiPlayer addBackpack "B_mas_m_Bergen_acr_c";
		_bambiPlayer addHeadgear "H_Beret_blk";
	 	_bambiPlayer addWeaponGlobal "arifle_mas_mp5sd";
		_bambiPlayer addPrimaryWeaponItem "optic_Aco_smg";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "25Rnd_mas_9x19_Mag";};
		_bambiPlayer addWeaponGlobal "hgun_mas_uzi_F";
		_bambiPlayer addHandgunItem "muzzle_mas_snds_L";
		_bambiPlayer addHandgunItem "optic_mas_MRD";
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
		_bambiPlayer forceAddUniform "TRYK_ZARATAKI";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "30Rnd_mas_9x39_mag";};
		_bambiPlayer addVest "TRYK_V_ArmorVest_AOR1_2";
		_bambiPlayer addBackpack "B_mas_m_Bergen_acr";
		_bambiPlayer addHeadgear "H_ShemagOpen_khk";
	 	_bambiPlayer addWeaponGlobal "arifle_mas_asval";
		_bambiPlayer addPrimaryWeaponItem "acc_flashlight";
		_bambiPlayer addPrimaryWeaponItem "optic_mas_kobra";
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "25Rnd_mas_9x19_Mag";};
		_bambiPlayer addWeaponGlobal "hgun_mas_uzi_F";
		_bambiPlayer addHandgunItem "optic_Yorris";
		_bambiPlayer addHandgunItem "muzzle_mas_snds_L";
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