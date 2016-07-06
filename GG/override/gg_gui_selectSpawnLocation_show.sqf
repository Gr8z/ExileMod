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
_listBox ctrlSetPosition [1.08,0.764,0.556,0.545];
_listBox ctrlSetBackgroundColor [0,0,0,0.25];
_listBox ctrlCommit 0;
_listBox ctrlEnable true;
_listBox ctrlRemoveAllEventHandlers "LBDblClick";
_listBox ctrlRemoveAllEventHandlers "LBSelChanged";
_listBox ctrlAddEventHandler ["LBDblClick", "call fnc_LBDblClick_LBSelChanged_LO;"];
_listBox ctrlAddEventHandler ["LBSelChanged", "call fnc_LBDblClick_LBSelChanged_LO;"];
_listItemIndex = _listBox lbAdd "Respect Loadout";
_listItemIndex = _listBox lbSetColor [0, [0, 1, 0, 0.5]];
_listItemIndex = _listBox lbSetTooltip [0, "Get a Free Loadout based on your respect"];
_listItemIndex = _listBox lbAdd "Scout Level 1 Loadout";
_listItemIndex = _listBox lbSetTooltip [1, "$4.69 / month"];
_listItemIndex = _listBox lbAdd "Scout Level 2 Loadout";
_listItemIndex = _listBox lbSetTooltip [2, "$7.98 / month"];
_listItemIndex = _listBox lbAdd "Scout Level 3 Loadout";
_listItemIndex = _listBox lbSetTooltip [3, "$19.89 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 1 Loadout";
_listItemIndex = _listBox lbSetTooltip [4, "$4.69 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 2 Loadout";
_listItemIndex = _listBox lbSetTooltip [5, "$7.98 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 3 Loadout";
_listItemIndex = _listBox lbSetTooltip [6, "$19.89 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 1 Loadout";
_listItemIndex = _listBox lbSetTooltip [7, "$3.22 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 2 Loadout";
_listItemIndex = _listBox lbSetTooltip [8, "$5.70 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 3 Loadout";
_listItemIndex = _listBox lbSetTooltip [9, "$9.89 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 1 Loadout";
_listItemIndex = _listBox lbSetTooltip [10, "$3.89 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 2 Loadout";
_listItemIndex = _listBox lbSetTooltip [11, "$5.75 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 3 Loadout";
_listItemIndex = _listBox lbSetTooltip [12, "$8.00 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 1 Loadout";
_listItemIndex = _listBox lbSetTooltip [13, "$5.90 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 2 Loadout";
_listItemIndex = _listBox lbSetTooltip [14, "$8.90 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 3 Loadout";
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

			_cost = 853;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_denim_jersey_blk";
			player addHeadgear "H_Bandanna_gry";
			player addVest "V_Chestrig_blk";
			player addBackpack "B_mas_Kitbag_black";
			for "_i" from 1 to 3 do {player addItemToUniform "30Rnd_mas_9x21_Stanag";};
			for "_i" from 1 to 4 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
			player addWeapon "arifle_mas_mp40_o";
			player addWeapon "hgun_mas_usp_F";
			player addHandgunItem "muzzle_mas_snds_L";
            player addHandgunItem "optic_mas_MRD";
			player addWeapon "Binocular";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 2:{
			if !(_puid in Scout2 + Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1200;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_denim_hood_blk";
			player addHeadgear "H_Watchcap_blk";
			player addVest "V_PlateCarrier1_blk";
			player addGoggles "G_mas_wpn_gog_d";
			player addBackpack "B_mas_m_Bergen_us_b";
			for "_i" from 1 to 4 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
            for "_i" from 1 to 3 do {player addItemToVest "64Rnd_mas_9x18sd_mag";};
			player addWeapon "arifle_mas_bizon";
			player addPrimaryWeaponItem "muzzle_mas_snds_AK";
			player addPrimaryWeaponItem "optic_mas_kobra";
			player addWeapon "hgun_mas_usp_F";
			player addHandgunItem "muzzle_mas_snds_L";
			player addHandgunItem "optic_mas_MRD";
			player addWeapon "Binocular";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 3:{
			if !(_puid in Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 3420;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_B_GhillieSuit";
			player addHeadgear "H_Watchcap_blk";
			player addVest "V_PlateCarrierSpec_mtp";
			player addBackpack "B_mas_m_Bergen_acr_g";
			for "_i" from 1 to 4 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
			for "_i" from 1 to 4 do {player addItemToVest "20Rnd_mas_762x51sd_Stanag";};
			player addWeapon "srifle_mas_m110";
			player addWeapon "hgun_mas_usp_F";
			player addPrimaryWeaponItem "muzzle_mas_snds_SMc";
			player addPrimaryWeaponItem "optic_mas_zeiss_eo_c";
			player addPrimaryWeaponItem "bipod_02_F_hex";
			player addHandgunItem "muzzle_mas_snds_L";
			player addHandgunItem "optic_mas_MRD";
			player addWeapon "Binocular";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "TRYK_G_Shades_Black_NV";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 4:{
			if !(_puid in Marksman1 + Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1250;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_NATO_OCPD_CombatUniform";
			player addVest "V_Chestrig_khk";
			player addHeadgear "TRYK_r_cap_od_Glasses";
			player addBackpack "B_mas_Kitbag_mul";
			for "_i" from 1 to 4 do {player addItemToUniform "15Rnd_mas_9x21_Mag";};
			for "_i" from 1 to 5 do {player addItemToVest "40Rnd_mas_46x30_Mag";};
			player addWeapon "hgun_mas_mp7_F";
			player addPrimaryWeaponItem "optic_Aco";
			player addWeapon "hgun_mas_bhp_F";
			player addHandgunItem "muzzle_mas_snds_L";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Binocular";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 5:{
			if !(_puid in Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 2433;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];	
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_NATO_OCPD_CombatUniform";
			player addHeadgear "TRYK_r_cap_od_Glasses";
			player addVest "V_PlateCarrierL_CTRG";
			player addBackpack "B_mas_m_Bergen_us";
			for "_i" from 1 to 4 do {player addItemToUniform "15Rnd_mas_9x21_Mag";};
			for "_i" from 1 to 5 do {player addItemToVest "5Rnd_mas_762x51_Stanag";};
			player addWeapon "Binocular";
			player addWeapon "arifle_mas_lee";
			player addWeapon "hgun_mas_bhp_F";
			player addPrimaryWeaponItem "optic_DMS";
			player addPrimaryWeaponItem "bipod_02_F_blk";
			player addHandgunItem "muzzle_mas_snds_L";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 6:{
			if !(_puid in Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 3032;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_I_GhillieSuit";
			player addVest "V_PlateCarrierSpec_rgr";
			player addBackpack "B_mas_m_Bergen_acr_c";
			for "_i" from 1 to 4 do {player addItemToUniform "15Rnd_mas_9x21_Mag";};
			for "_i" from 1 to 4 do {player addItemToBackpack "10Rnd_mas_762x54sd_mag";};
			player addWeapon "srifle_mas_svd";
			player addWeapon "hgun_mas_bhp_F";
			player addPrimaryWeaponItem "optic_mas_PSO_kv";
			player addPrimaryWeaponItem "bipod_02_F_hex";
			player addHeadgear "TRYK_r_cap_od_Glasses";
			player addHandgunItem "optic_mas_MRD";
			player addHandgunItem "muzzle_mas_snds_L";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player linkItem "TRYK_ShemaghESSOD_NV";
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
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_Woodland";
			player addVest "V_Chestrig_rgr";
			player addHeadgear "H_Bandanna_camo";
			player addGoggles "G_mas_wpn_wrap_mask_b";
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
			for "_i" from 1 to 3 do {player addItemToVest "30Rnd_mas_9x21sd_Stanag";};
			for "_i" from 1 to 3 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
			player addBackpack "B_mas_Kitbag_rng";
			player addWeapon "arifle_mas_mp5";
			player addWeapon "hgun_mas_acp_F";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_CanOpener";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 8:{
			if !(_puid in Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1850;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_Woodland";
			player addHeadgear "H_Bandanna_camo";
			player addGoggles "G_mas_wpn_wrap_mask_c";
			player addVest "V_PlateCarrier1_rgr";
			player addBackpack "B_mas_m_Bergen_us_g";
			player addHeadgear "H_Bandanna_camo";
			player addGoggles "G_mas_wpn_wrap_mask_c";
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
			for "_i" from 1 to 3 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
			for "_i" from 1 to 4 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
			player addWeapon "arifle_mas_hk416c_v";
			player addPrimaryWeaponItem "muzzle_mas_snds_Mc";
			player addPrimaryWeaponItem "optic_mas_acog_rd_c";
			player addWeapon "Binocular";
			player linkItem "ItemGPS";
			player addWeapon "hgun_mas_acp_F";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 9:{
			if !(_puid in Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 2470;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_Woodland";
			player addVest "V_PlateCarrierSpec_rgr";
			player addHeadgear "H_HelmetSpecB";
			player addGoggles "G_mas_wpn_wrap_mask_c";
			player addBackpack "B_mas_m_Bergen_acr_c";
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
			for "_i" from 1 to 3 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
			for "_i" from 1 to 4 do {player addItemToVest "20Rnd_mas_762x51_Stanag";};
			for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
			player addWeapon "Binocular";
			player addWeapon "arifle_mas_fal_m203";
			player addWeapon "hgun_mas_acp_F";
			player addPrimaryWeaponItem "muzzle_mas_snds_Mc";
			player addPrimaryWeaponItem "optic_mas_acog_rd_c";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_CanOpener";
			player linkItem "ItemGPS";
			player linkItem "TRYK_TAC_SET_NV_MESH_2";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 10:{
			if !(_puid in Medic1 + Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 440;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_NATO_UCP_CombatUniform";
			player addHeadgear "H_Beret_02";
			player addVest "TRYK_V_ArmorVest_tan";
			player addBackpack "B_mas_Kitbag_des";
			player addGoggles "G_mas_wpn_shemag";
			for "_i" from 1 to 4 do {player addItemToUniform "25Rnd_mas_9x19_Mag";};
			player addWeapon "hgun_mas_uzi_F";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_BeefParts";
			player addItemToBackpack "Exile_Item_CanOpener";
			for "_i" from 1 to 2 do {player addItemToVest "Exile_Item_Vishpirin";};
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 11:{
			if !(_puid in Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1408;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_NATO_UCP_CombatUniform";
			player addHeadgear "H_Beret_02";
			player addVest "V_PlateCarrier1_blk";
			player addGoggles "G_mas_wpn_shemag";
			player addBackpack "B_mas_m_Bergen_us_b";
			for "_i" from 1 to 4 do {player addItemToVest "15Rnd_mas_9x21_Mag";};
			for "_i" from 1 to 3 do {player addItemToUniform "30Rnd_mas_556x45_Stanag";};
			player addWeapon "arifle_mas_m16";
			player addWeapon "hgun_mas_p226_F";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_EnergyDrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			for "_i" from 2 to 3 do {player addItemToVest "Exile_Item_Vishpirin";};
			player addItemToBackpack "Exile_Item_GloriousKnakworst";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 12:{
			if !(_puid in Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1745;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_NATO_UCP_CombatUniform";
			player addVest "V_PlateCarrier2_blk";
			player addHeadgear "H_Beret_Colonel";
			player addGoggles "G_mas_wpn_shemag";
			player addBackpack "TRYK_B_Carryall_blk";
			for "_i" from 1 to 4 do {player addItemToVest "15Rnd_mas_9x21_Mag";};
			for "_i" from 1 to 4 do {player addItemToUniform "30Rnd_mas_556x45_Stanag";};
			player addWeapon "arifle_mas_m4vlt";
			player addWeapon "hgun_mas_p226_F";
			player addPrimaryWeaponItem "optic_mas_acog_eo";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_CanOpener";
			for "_i" from 3 to 4 do {player addItemToVest "Exile_Item_Vishpirin";};
			for "_i" from 2 to 3 do {player addItemToVest "Exile_Item_InstaDoc";};
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player linkItem "TRYK_TAC_SET_NV_MESH_2";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 13:{
			if !(_puid in Engineer1 + Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1823;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_OVERALL_SAGE_BLKboots_nk_blk2";
			player addVest "V_Chestrig_oli";
			player addGoggles "G_Shades_Black";
			player addHeadgear "H_Shemag_olive_hs";
			player addBackpack "B_mas_Kitbag_rng";
			for "_i" from 1 to 4 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
			player addItemToVest "150Rnd_mas_556x45_Stanag";
			player addWeapon "arifle_mas_m27m";
			player addPrimaryWeaponItem "optic_mas_Holosight_blk";
			player addPrimaryWeaponItem "bipod_03_F_blk";
			player addWeapon "hgun_mas_acp_F";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_BeefParts";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 14:{
			if !(_puid in Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 2145;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_OVERALL_SAGE_BLKboots";
			player addHeadgear "H_Shemag_olive_hs";
			player addGoggles "G_Shades_Black";
			player addVest "V_PlateCarrier1_rgr";
			player addBackpack "B_mas_m_Bergen_us";
			for "_i" from 1 to 3 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
			for "_i" from 1 to 2 do {player addItemToVest "200Rnd_mas_556x45_Stanag";};
			player addWeapon "LMG_mas_M249_F_v";
			player addPrimaryWeaponItem "optic_mas_acog_eo";
			player addPrimaryWeaponItem "bipod_03_F_blk";
			player addWeapon "hgun_mas_acp_F";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_EnergyDrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			player addItemToBackpack "Exile_Item_GloriousKnakworst";
			player addItemToBackpack "Exile_Item_Vishpirin";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };};
		};
		case 15:{
			if !(_puid in Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 2650;
			if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
			player setVariable ["ExileLocker", ((player getVariable ["ExileLocker", 0]) - _cost)];
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_OVERALL_SAGE_BLKboots";
			player addVest "V_PlateCarrierGL_rgr";
			player addHeadgear "TRYK_H_GR";
			player addGoggles "G_Shades_Black";
			player addBackpack "B_mas_m_Bergen_acr_c";
			for "_i" from 1 to 4 do {player addItemToUniform "12Rnd_mas_45acp_Mag";};
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
            for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Item_DuctTape";};
			for "_i" from 1 to 3 do {player addItemToBackpack "100Rnd_mas_762x51_Stanag";};
			player addWeapon "LMG_mas_mk48_F_v";
			player addPrimaryWeaponItem "optic_mas_acog_eo";
			player addPrimaryWeaponItem "bipod_03_F_oli";
			player addWeapon "hgun_mas_acp_F";
			player addHandgunItem "optic_mas_MRD";
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_DuctTape";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_CanOpener";
			player linkItem "TRYK_Shemagh_G_NV";
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
