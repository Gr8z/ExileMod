/**
 * ExileClient_gui_selectSpawnLocation_show
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_display","_topTextCTRL1","_topTextCTRL2","_spawnButton","_listBox","_listItemIndex","_numberOfSpawnPoints","_randNum","_randData","_randomSpawnIndex","_puid","_title"];
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
_title	 = _display ctrlCreate["RscText",24005];
_title ctrlSetPosition [1.1625,0.781684,0.481313,0.0583164];
_title ctrlSetBackgroundColor [0,0,0,1];
_title ctrlCommit 0;
_title ctrlEnable true;
_title ctrlSetText "LOADOUTS";
_title ctrlSetFont "PuristaBold";

_listBox = _display ctrlCreate["RscListbox", 24004];
_listBox ctrlSetPosition [1.1625,0.86505,0.481313,0.27495];
_listBox ctrlSetBackgroundColor [0.07,0.07,0.08,1];
_listBox ctrlCommit 0;
_listBox ctrlEnable true;
_listBox ctrlRemoveAllEventHandlers "LBDblClick";
_listBox ctrlRemoveAllEventHandlers "LBSelChanged";
_listBox ctrlAddEventHandler ["LBDblClick", "call fnc_LBDblClick_LBSelChanged_LO;"];
_listBox ctrlAddEventHandler ["LBSelChanged", "call fnc_LBDblClick_LBSelChanged_LO;"];
_listItemIndex = _listBox lbAdd "Respect Loadout";
_listItemIndex = _listBox lbSetColor [0, [0, 1, 0, 0.5]];
_listItemIndex = _listBox lbSetTooltip [0, "Get a Free Loadout based on your respect"];
_listItemIndex = _listBox lbAdd "Scout Level 1";
_listItemIndex = _listBox lbSetTooltip [1, "$4.69 / month"];
_listItemIndex = _listBox lbAdd "Scout Level 2";
_listItemIndex = _listBox lbSetTooltip [2, "$7.98 / month"];
_listItemIndex = _listBox lbAdd "Scout Level 3";
_listItemIndex = _listBox lbSetTooltip [3, "$19.89 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 1";
_listItemIndex = _listBox lbSetTooltip [4, "$4.69 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 2";
_listItemIndex = _listBox lbSetTooltip [5, "$7.98 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 3";
_listItemIndex = _listBox lbSetTooltip [6, "$19.89 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 1";
_listItemIndex = _listBox lbSetTooltip [7, "$3.22 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 2";
_listItemIndex = _listBox lbSetTooltip [8, "$5.70 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 3";
_listItemIndex = _listBox lbSetTooltip [9, "$9.89 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 1";
_listItemIndex = _listBox lbSetTooltip [10, "$3.89 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 2";
_listItemIndex = _listBox lbSetTooltip [11, "$5.75 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 3";
_listItemIndex = _listBox lbSetTooltip [12, "$8.00 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 1";
_listItemIndex = _listBox lbSetTooltip [13, "$5.90 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 2";
_listItemIndex = _listBox lbSetTooltip [14, "$8.90 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 3";
_listItemIndex = _listBox lbSetTooltip [15, "$15.00 / month"];

systemChat 'DONOR LOADOUTS CAN BE PURCHASED FROM GHOSTZGAMERZ.COM';
waitUntil {!isNil "Soldier3"};
FNC_GET_ACTUAL_LOADOUT = {
	waitUntil {typeOf player isEqualTo 'Exile_Unit_Player'};
	uiSleep 3;
	_puid = getPlayerUID player;
	_locker = (player getVariable ["ExileLocker", 0]);
	_noMoneyText = [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>You do not have the money for the Loadout.</t>"],0,0,10,0];
	switch (_this) do {
		case 0:{
			execVM "GG\ranks.sqf";
		};
		case 1:{
			if !(_puid in Scout1 + Scout2 + Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {

			_cost = 1353;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 1</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_Wood_T";
			player addHeadgear "H_Bandanna_cbr";
			player addVest "V_Chestrig_khk";
			player addBackpack "B_AssaultPack_cbr";
			for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "muzzle_snds_acp";
            player addHandgunItem "optic_MRD";
			player addWeapon "Binocular";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_ExtensionCord";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 2:{
			if !(_puid in Scout2 + Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 4200;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 2</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "Exile_Uniform_Woodland";
			player addHeadgear "TRYK_H_Booniehat_WOOD";
			player addVest "V_TacVest_camo";
			player addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
            for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_9x21_Mag_SMG_02_Tracer_Red";};
			player addWeapon "SMG_02_F";
			player addPrimaryWeaponItem "muzzle_snds_L";
			player addPrimaryWeaponItem "optic_MRCO";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "muzzle_snds_acp";
			player addHandgunItem "optic_MRD";
			player addWeapon "Binocular";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_ExtensionCord";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 3:{
			if !(_puid in Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 8420;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 3</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_GhillieSuit";
			player addHeadgear "TRYK_H_Booniehat_WOOD";
			player addVest "V_PlateCarrier1_tna_F";
			player addBackpack "B_Carryall_ghex_F";
			for "_i" from 1 to 2 do {player addItemToBackpack "hlc_50Rnd_762x51_B_M14";};
			for "_i" from 1 to 4 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			player addWeapon "hlc_rifle_m14dmr";
			player addPrimaryWeaponItem "hlc_muzzle_snds_M14";
			player addPrimaryWeaponItem "hlc_optic_LRT_m14";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "muzzle_snds_acp";
			player addHandgunItem "optic_MRD";
			player addWeapon "Binocular";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_ExtensionCord";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "TRYK_Shemagh_G_NV";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 4:{
			if !(_puid in Marksman1 + Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1250;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 1</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_B_TRYK_MTP_T";
			player addVest "V_Chestrig_rgr";
			player addHeadgear "H_Bandanna_khk_hs";
			player addBackpack "B_AssaultPack_rgr";
			for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addPrimaryWeaponItem "optic_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_ExtensionCord";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Rangefinder";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 5:{
			if !(_puid in Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 6433;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];	
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 2</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_T_Soldier_SL_F";
			player addHeadgear "H_Booniehat_tna_F";
			player addVest "V_TacVest_oli";
			player addBackpack "B_ViperLightHarness_oli_F";
			for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
			for "_i" from 1 to 3 do {player addItemToVest "hlc_30Rnd_9x19_B_MP5";};
			player addWeapon "hlc_smg_mp5k_PDW";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			player addWeapon "Rangefinder";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_CanOpener";
			player addItemToVest "Exile_Item_ExtensionCord";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 6:{
			if !(_puid in Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 9032;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 3</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_T_FullGhillie_tna_F";
			player addVest "V_PlateCarrier1_tna_F";
			player addBackpack "B_Carryall_ghex_F";
			for "_i" from 1 to 4 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
			for "_i" from 1 to 8 do {player addItemToBackpack "hlc_5rnd_3006_1903";};
			player addWeapon "hlc_rifle_M1903A1_unertl";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			player addHeadgear "H_Booniehat_tna_F";
			player addGoggles "G_Balaclava_oli";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_ExtensionCord";
			player linkItem "TRYK_Shemagh_shade_G_N";
			player addItemToVest "Exile_Item_CanOpener";
			player linkItem "ItemGPS";
			player addWeapon "Rangefinder";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 7:{
			if !(_puid in Soldier1 + Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1062;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 1</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_I_C_Soldier_Para_2_F";
			player addVest "V_Chestrig_rgr";
			player addHeadgear "H_MilCap_tna_F";
			player addBackpack "B_AssaultPack_tna_F";
			for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
			for "_i" from 1 to 3 do {player addItemToBackpack "Exile_Magazine_7Rnd_45ACP";};
			player addWeapon "Exile_Weapon_Colt1911";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_ExtensionCord";
			player addItemToBackpack "Exile_Item_CanOpener";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 8:{
			if !(_puid in Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 4850;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 2</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_I_C_Soldier_Para_3_F";
			player addHeadgear "H_HelmetB_tna_F";
			player addVest "V_TacVest_oli";
			player addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
			for "_i" from 1 to 3 do {player addItemToBackpack "Exile_Magazine_7Rnd_45ACP";};
			for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_9x21_Mag_SMG_02_Tracer_Red";};
			player addWeapon "SMG_05_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addWeapon "Exile_Weapon_Colt1911";
			player addWeapon "Binocular";
			player linkItem "ItemGPS";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_ExtensionCord";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 9:{
			if !(_puid in Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 8470;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 3</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_I_C_Soldier_Camo_F";
			player addVest "V_PlateCarrier1_rgr_noflag_F";
			player addHeadgear "H_HelmetB_Enh_tna_F";
			player addBackpack "B_Carryall_oli";
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
			for "_i" from 1 to 3 do {player addItemToBackpack "Exile_Magazine_7Rnd_45ACP";};
			for "_i" from 1 to 3 do {player addItemToBackpack "hlc_30Rnd_556x45_B_AUG";};
			for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
			player addWeapon "hlc_rifle_auga3_GL";
			player addPrimaryWeaponItem "optic_ERCO_khk_F";
			player addWeapon "Exile_Weapon_Colt1911";
			player addWeapon "Binocular";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_ExtensionCord";
			player addItemToVest "Exile_Item_CanOpener";
			player linkItem "ItemGPS";
			player linkItem "TRYK_Shemagh_shade_G_N";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 10:{
			if !(_puid in Medic1 + Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1440;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 1</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_B_TRYK_UCP_T";
			player addHeadgear "H_Beret_02";
			player addVest "V_Chestrig_blk";
			player addBackpack "B_AssaultPack_rgr";
			for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_BeefParts";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addItemToBackpack "Exile_Item_ExtensionCord";
			for "_i" from 1 to 2 do {player addItemToVest "Exile_Item_Vishpirin";};
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 11:{
			if !(_puid in Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 5408;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 2</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_NATO_UCP_R_CombatUniform";
			player addHeadgear "H_Beret_02";
			player addVest "V_TacVest_blk";
			player addBackpack "TRYK_B_Medbag_ucp";
			for "_i" from 1 to 4 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
			for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_9x21_Mag";};
			player addWeapon "hgun_PDW2000_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_EnergyDrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			for "_i" from 2 to 3 do {player addItemToVest "Exile_Item_Vishpirin";};
			player addItemToBackpack "Exile_Item_GloriousKnakworst";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addItemToBackpack "Exile_Item_ExtensionCord";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 12:{
			if !(_puid in Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 8745;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 3</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_NATO_UCP_CombatUniform";
			player addVest "V_PlateCarrier1_blk";
			player addHeadgear "H_Beret_Colonel";
			player addBackpack "B_ViperHarness_blk_F";
			for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
			for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
			player addWeapon "arifle_MX_SW_Black_F";
			player addPrimaryWeaponItem "optic_ERCO_blk_F";
			player addPrimaryWeaponItem "bipod_01_F_blk";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_ExtensionCord";
			player addItemToVest "Exile_Item_CanOpener";
			for "_i" from 3 to 4 do {player addItemToVest "Exile_Item_Vishpirin";};
			for "_i" from 2 to 3 do {player addItemToVest "Exile_Item_InstaDoc";};
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player linkItem "TRYK_Shemagh_shade_N";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 13:{
			if !(_puid in Engineer1 + Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1823;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 1</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_GEN_Commander_F";
			player addVest "V_TacVest_gen_F";
			player addHeadgear "H_MilCap_gen_F";
			player addBackpack "B_AssaultPack_blk";
			for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_BeefParts";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addItemToBackpack "Exile_Item_ExtensionCord";
			player addItemToBackpack "Exile_Item_DuctTape";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 14:{
			if !(_puid in Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 5145;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 2</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_GEN_Soldier_F";
			player addHeadgear "H_MilCap_gen_F";
			player addVest "V_TacVest_gen_F";
			player addBackpack "TRYK_B_Kitbag_blk";
			for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
			for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_45ACP_Mag_SMG_01";};
			player addWeapon "SMG_01_F";
			player addPrimaryWeaponItem "optic_Aco_smg";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_EnergyDrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			player addItemToBackpack "Exile_Item_GloriousKnakworst";
			player addItemToBackpack "Exile_Item_Vishpirin";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addItemToBackpack "Exile_Item_ExtensionCord";
			player addItemToBackpack "Exile_Item_DuctTape";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 15:{
			if !(_puid in Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 7650;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 3</t><br/><img size='0.6' image='GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_GEN_Soldier_F";
			player addVest "V_PlateCarrier1_blk";
			player addHeadgear "H_Beret_gen_F";
			player addBackpack "B_ViperHarness_blk_F";
			for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
			for "_i" from 1 to 2 do {player addItemToBackpack "hlc_200rnd_556x45_M_SAW";};
			for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Item_DuctTape";};
			player addWeapon "hlc_m249_SQuantoon";
			player addPrimaryWeaponItem "optic_ERCO_blk_F";
			player addPrimaryWeaponItem "bipod_01_F_blk";
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "optic_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_ExtensionCord";
			player addItemToVest "Exile_Item_CanOpener";
			player linkItem "TRYK_TAC_EARMUFF_SHADE";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
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