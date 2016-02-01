private["_display","_topTextCTRL1","_topTextCTRL2","_spawnButton","_listBox","_listItemIndex","_numberOfSpawnPoints","_randNum","_randData","_randomSpawnIndex","_puid"];
disableSerialization;
diag_log "Selecting spawn location...";
ExileClientSpawnLocationSelectionDone = false;
ExileClientSelectedSpawnLocationMarkerName = "";
createDialog "RscExileSelectSpawnLocationDialog";
waitUntil
{
	_display = findDisplay 24002;
	!isNull _display
};
_topTextCTRL1 = _display displayCtrl 1001;
_topTextCTRL1 ctrlSetText "[GG] Exile Mod";
_topTextCTRL2 = _display displayCtrl 1002;
_topTextCTRL2 ctrlSetText format["Welcome %1 (%2)",profileNameSteam,profileName];
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlEnable false;
_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
_listBox = _display displayCtrl 24002;
lbClear _listBox;
{
	if (getMarkerType _x == "ExileSpawnZone") then
	{
		_listItemIndex = _listBox lbAdd (markerText _x);
		_listBox lbSetData [_listItemIndex, _x];
	};
}
forEach allMapMarkers;
_numberOfSpawnPoints = {getMarkerType _x == "ExileSpawnZone"} count allMapMarkers;
if (_numberOfSpawnPoints > 0) then 
{
	_randNum = floor(random _numberOfSpawnPoints);
	_randData = lbData [24002,_randNum];
	_randomSpawnIndex = _listBox lbAdd "Random";
	_listBox lbSetData [_randomSpawnIndex, _randData];
};
_listBox = _display ctrlCreate["RscListbox", 24004];
_listBox ctrlSetPosition [1.03,0.12,0.2375,0.8];
_listBox ctrlSetBackgroundColor [0,0,0,0.25];
_listBox ctrlCommit 0;
_listBox ctrlRemoveAllEventHandlers "LBDblClick";
_listBox ctrlRemoveAllEventHandlers "LBSelChanged";		
_listBox ctrlAddEventHandler ["LBDblClick", "call fnc_LBDblClick_LBSelChanged_LO;"];
_listBox ctrlAddEventHandler ["LBSelChanged", "call fnc_LBDblClick_LBSelChanged_LO;"];
_listItemIndex = _listBox lbAdd "Respect Loadout";
_listItemIndex = _listBox lbAdd "Scout Level 1";
_listItemIndex = _listBox lbAdd "Scout Level 2";
_listItemIndex = _listBox lbAdd "Scout Level 3";
_listItemIndex = _listBox lbAdd "Marksman Level 1";
_listItemIndex = _listBox lbAdd "Marksman Level 2";
_listItemIndex = _listBox lbAdd "Marksman Level 3";
_listItemIndex = _listBox lbAdd "Soldier Level 1";
_listItemIndex = _listBox lbAdd "Soldier Level 2";
_listItemIndex = _listBox lbAdd "Soldier Level 3";
_listItemIndex = _listBox lbAdd "Medic Level 1";
_listItemIndex = _listBox lbAdd "Medic Level 2";
_listItemIndex = _listBox lbAdd "Medic Level 3";
_listItemIndex = _listBox lbAdd "Engineer Level 1";
_listItemIndex = _listBox lbAdd "Engineer Level 2";
_listItemIndex = _listBox lbAdd "Engineer Level 3";
systemChat 'These Loadouts are not forsale until they are approved- Being Reworked';
waitUntil {!isNil "Soldier3"};
FNC_GET_ACTUAL_LOADOUT = {
	waitUntil {typeOf player isEqualTo 'Exile_Unit_Player'};
	uiSleep 3;
	_puid = getPlayerUID player;
	switch (_this) do {
		case 0:{
			execVM "GG\ranks.sqf";
		};
		case 1:{
			if !(_puid in Scout1 + Scout2 + Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 1</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_CTRG_2";
			player addHeadgear "H_Booniehat_oli";
			player addGoggles "G_Bandanna_khk";
			player addBackpack "B_FieldPack_oli";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "muzzle_snds_acp";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 2:{
			if !(_puid in Scout2 + Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 2</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_CTRG_3";
			player addHeadgear "H_Booniehat_oli";
			player addGoggles "G_Bandanna_khk";
			player addVest "V_Rangemaster_belt";
			player addBackpack "B_FieldPack_oli";
			player addWeapon "hgun_PDW2000_F";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addPrimaryWeaponItem "muzzle_snds_L";
			player addPrimaryWeaponItem "optic_Holosight_smg";
			player addHandgunItem "muzzle_snds_acp";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Mag";};
			for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 3:{
			if !(_puid in Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 3</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "rhs_uniform_FROG01_m81";
			player addHeadgear "H_ShemagOpen_tan";
			player addVest "V_TacVest_camo";
			player addBackpack "B_FieldPack_oli";
			player addWeapon "arifle_MXM_Black_F";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addPrimaryWeaponItem "muzzle_snds_H";
			player addPrimaryWeaponItem "optic_MRCO";
			player addPrimaryWeaponItem "bipod_01_F_blk";
			player addHandgunItem "muzzle_snds_acp";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
			for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee ";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 4:{
			if !(_puid in Marksman1 + Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 1</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_I_G_resistanceLeader_F";
			player addHeadgear "H_Bandanna_sgg";
			player addBackpack "B_AssaultPack_khk";
			player addWeapon "hgun_ACPC2_F";
			player addHandgunItem "muzzle_snds_acp";
			for "_i" from 1 to 3 do {player addItemToUniform "9Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 5:{
			if !(_puid in Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 2</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_I_G_resistanceLeader_F";
			player addHeadgear "H_Bandanna_sgg";
			player addVest "V_Rangemaster_belt";
			player addBackpack "B_AssaultPack_khk";
			player addWeapon "Binocular";
			player addWeapon "hgun_PDW2000_F";
			player addWeapon "hgun_ACPC2_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Mag";};
			for "_i" from 1 to 3 do {player addItemToUniform "9Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 6:{
			if !(_puid in Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 3</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_FullGhillie_lsh";
			player addVest "V_TacVest_camo";
			player addBackpack "B_FieldPack_khk";
			player addWeapon "Rangefinder";
			player addWeapon "srifle_DMR_03_multicam_F";
			player addWeapon "hgun_ACPC2_F";
			player addPrimaryWeaponItem "optic_MRCO";
			player addPrimaryWeaponItem "bipod_02_F_hex";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 2 do {player addItemToUniform "20Rnd_762x51_Mag";};
			for "_i" from 1 to 3 do {player addItemToUniform "9Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee ";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 7:{
			if !(_puid in Soldier1 + Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 1</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
			player addHeadgear "H_HelmetB";
			player addBackpack "B_AssaultPack_khk";
			player addWeapon "NVGoggles";
			player addWeapon "rhsusf_weap_m1911a1";
			for "_i" from 1 to 3 do {player addItemToUniform "rhsusf_mag_7x45acp_MHP";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 8:{
			if !(_puid in Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 2</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_CombatUniform_mcam";
			player addHeadgear "H_HelmetB";
			player addVest "V_Rangemaster_belt";
			player addBackpack "B_AssaultPack_khk";
			player addWeapon "SMG_02_F";
			player addWeapon "NVGoggles";
			player addWeapon "rhsusf_weap_m1911a1";
			player addPrimaryWeaponItem "optic_Aco_smg";
			for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Mag";};
			for "_i" from 1 to 3 do {player addItemToUniform "rhsusf_mag_7x45acp_MHP";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 9:{
			if !(_puid in Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 3</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "rhs_uniform_FROG01_wd";
			player addVest "V_PlateCarrier1_rgr";
			player addHeadgear "rhsusf_lwh_helmet_marpatwd";
			player addBackpack "B_AssaultPack_rgr";
			player addWeapon "NVGoggles";
			player addWeapon "rhs_weap_m4_grip";
			player addWeapon "rhsusf_weap_m1911a1";
			player addPrimaryWeaponItem "rhsusf_acc_ACOG_wd";
			for "_i" from 1 to 2 do {player addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			for "_i" from 1 to 3 do {player addItemToUniform "rhsusf_mag_7x45acp_MHP";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 10:{
			if !(_puid in Medic1 + Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 1</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_C_Scientist";
			player addHeadgear "H_Beret_02";
			player addBackpack "B_FieldPack_oucamo";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_BeefParts";
			for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Item_Vishpirin";};
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 11:{
			if !(_puid in Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 2</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_C_Scientist";
			player addHeadgear "H_Beret_02";
			player addVest "V_Rangemaster_belt";
			player addBackpack "B_FieldPack_oucamo";
			player addWeapon "SMG_01_F";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addPrimaryWeaponItem "optic_Holosight_smg";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_45ACP_Mag_SMG_01";};
			for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_EnergyDrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Item_Vishpirin";};
			player addItemToBackpack "Exile_Item_GloriousKnakworst";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 12:{
			if !(_puid in Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 3</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "rhs_uniform_flora_patchless";
			player addVest "rhs_6b23_medic";
			player addHeadgear "rhs_fieldcap_digi";
			player addBackpack "B_FieldPack_oli";
			player addWeapon "rhs_weap_ak74m_camo_folded";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addPrimaryWeaponItem "optic_Holosight";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 2 do {player addItemToUniform "rhs_30Rnd_545x39_AK";};
			for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Item_Vishpirin";};
			for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Item_InstaDoc";};
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 13:{
			if !(_puid in Engineer1 + Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 1</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_I_pilotCoveralls";
			player addHeadgear "H_Cap_blk";
			player addBackpack "B_FieldPack_oli";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addItemToUniform "MiniGrenade";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_BeefParts";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 14:{
			if !(_puid in Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 2</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_I_pilotCoveralls";
			player addHeadgear "H_Cap_blk";
			player addVest "V_Rangemaster_belt";
			player addBackpack "B_FieldPack_oli";
			player addWeapon "SMG_02_F";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addPrimaryWeaponItem "optic_ACO_grn";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_9x21_Mag";};
			for "_i" from 1 to 3 do {player addItemToVest "11Rnd_45ACP_Mag";};
			for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_EnergyDrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			player addItemToBackpack "Exile_Item_GloriousKnakworst";
			player addItemToBackpack "Exile_Item_Vishpirin";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 15:{
			if !(_puid in Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 3</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_O_PilotCoveralls";
			player addVest "V_TacVest_khk";
			player addHeadgear "H_Cap_brn_SPECOPS";
			player addBackpack "B_FieldPack_ocamo";
			player addWeapon "NVGoggles";
			player addWeapon "arifle_MX_SW_F";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addPrimaryWeaponItem "optic_Holosight";
			player addPrimaryWeaponItem "bipod_01_F_snd";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 2 do {player addItemToUniform "100Rnd_65x39_caseless_mag_Tracer";};
			for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			for "_i" from 1 to 3 do {player addItemToVest "MiniGrenade";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_DuctTape";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
	};
};
fnc_LBDblClick_LBSelChanged_LO = {
	CURSEL_PREMIUM_LOADOUT = _this select 1;
};
fnc_ButtonClick_24003 = {
	[] call ExileClient_gui_selectSpawnLocation_event_onSpawnButtonClick;
	if(isNil"CURSEL_PREMIUM_LOADOUT")then{CURSEL_PREMIUM_LOADOUT=0;};
	CURSEL_PREMIUM_LOADOUT spawn FNC_GET_ACTUAL_LOADOUT;
};
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlRemoveAllEventHandlers "SliderPosChanged";
_spawnButton ctrlSetEventHandler["ButtonClick","call fnc_ButtonClick_24003"];
_spawnButton ctrlSetText "Let's go!";
true