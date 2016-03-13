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
_listBox ctrlSetPosition [1.03,0.12,0.3,0.3];
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

systemChat 'Donor Loadouts Are coming SOON !';
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

			_cost = 294;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_denim_jersey_blu";
			player addVest "V_Chestrig_blk";
			player addBackpack "B_TacticalPack_blk";
			player addWeapon "CUP_hgun_Phantom";
			player addHandgunItem "muzzle_snds_L";
            player addHandgunItem "CUP_acc_CZ_M3X";
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_18Rnd_9x19_Phantom";};
			player addWeapon "Binocular";
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 2:{
			if !(_puid in Scout2 + Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 394;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_pad_j_blk";
			player addHeadgear "TRYK_r_cap_blk_Glasses";
			player addVest "V_Chestrig_blk";
			player addBackpack "TRYK_B_Coyotebackpack_BLK";
			player addWeapon "CUP_srifle_CZ550_rail";
			player addWeapon "CUP_hgun_Phantom";
			player addPrimaryWeaponItem "optic_MRCO";
			player addHandgunItem "muzzle_snds_L";
			player addHandgunItem "CUP_acc_CZ_M3X";
			player addWeapon "Binocular";
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_18Rnd_9x19_Phantom";};
            for "_i" from 1 to 5 do {player addItemToVest "CUP_5x_22_LR_17_HMR_M";};
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 3:{
			if !(_puid in Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1259;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_denim_jersey_blk";
			player addHeadgear "TRYK_r_cap_blk_Glasses";
			player addVest "V_PlateCarrier1_blk";
			player addBackpack "TRYK_B_Coyotebackpack_BLK";
			player addWeapon "CUP_srifle_M14_DMR";
			player addWeapon "CUP_hgun_Phantom";
			player addPrimaryWeaponItem "muzzle_snds_B";
			player addPrimaryWeaponItem "optic_KHS_old";
			player addPrimaryWeaponItem "bipod_01_F_blk";
			player addHandgunItem "muzzle_snds_L";
			player addHandgunItem "CUP_acc_CZ_M3X";
			player addWeapon "Binocular";
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_18Rnd_9x19_Phantom";};
			for "_i" from 1 to 4 do {player addItemToVest "CUP_20Rnd_762x51_DMR";};
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "TRYK_G_Shades_Black_NV";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 4:{
			if !(_puid in Marksman1 + Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 302;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_AOR2_OD_CombatUniform";
			player addVest "V_Chestrig_oli";
			player addHeadgear "TRYK_r_cap_od_Glasses";
			player addBackpack "CUP_B_CivPack_WDL";
			player addWeapon "CUP_hgun_M9";
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_15Rnd_9x19_M9";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Binocular";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 5:{
			if !(_puid in Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 362;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;	
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_AOR2_BLK_CombatUniform";
			player addHeadgear "TRYK_r_cap_od_Glasses";
			player addVest "V_Chestrig_oli";
			player addBackpack "CUP_B_CivPack_WDL";
			player addWeapon "Binocular";
			player addWeapon "CUP_srifle_LeeEnfield_rail";
			player addWeapon "CUP_hgun_M9";
			player addPrimaryWeaponItem "CUP_optic_ZDDot";
			player addPrimaryWeaponItem "bipod_02_F_blk";
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_15Rnd_9x19_M9";};
			for "_i" from 1 to 3 do {player addItemToVest "CUP_10x_303_M";};
			player addItemToUniform "Exile_Magazine_Swing";
			player linkItem "ItemGPS";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 6:{
			if !(_puid in Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1819;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_U_B_ARO2_CombatUniform";
			player addVest "V_PlateCarrier1_rgr";
			player addBackpack "CUP_B_HikingPack_Civ";
			player addWeapon "CUP_srifle_M110";
			player addWeapon "CUP_hgun_M9";
			player addPrimaryWeaponItem "optic_AMS";
			player addHeadgear "TRYK_H_ghillie_over_green";
			player addPrimaryWeaponItem "bipod_02_F_hex";
			player addHandgunItem "CUP_muzzle_snds_M9";
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_15Rnd_9x19_M9";};
			for "_i" from 1 to 4 do {player addItemToVest "CUP_20Rnd_762x51_B_M110";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player linkItem "TRYK_ShemaghESSOD_NV";
			player addItemToVest "Exile_Item_CanOpener";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 7:{
			if !(_puid in Soldier1 + Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 162;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "rhs_uniform_cu_ucp";
			player addVest "rhsusf_iotv_ucp_Grenadier";
			player addHeadgear "rhsusf_patrolcap_ucp";
			player addBackpack "rhsusf_assault_eagleaiii_ucp";
			player addWeapon "CUP_hgun_Colt1911";
			for "_i" from 1 to 3 do {player addItemToUniform "CUP_7Rnd_45ACP_1911";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_Cheathas";
			player addItemToBackpack "Exile_Item_CanOpener";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 8:{
			if !(_puid in Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 262;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "rhs_uniform_cu_ucp";
			player addHeadgear "rhsusf_patrolcap_ucp";
			player addVest "rhsusf_iotv_ucp_Grenadier";
			player addBackpack "rhsusf_assault_eagleaiii_ucp";
			player addWeapon "SMG_02_F";
			player addPrimaryWeaponItem "rhsusf_acc_compm4";
			player addWeapon "Binocular";
			player linkItem "ItemGPS";
			player addWeapon "CUP_hgun_Colt1911";
			for "_i" from 1 to 3 do {player addItemToUniform "CUP_7Rnd_45ACP_1911";};
			for "_i" from 1 to 4 do {player addItemToVest "30Rnd_9x21_Mag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_Vishpirin";
			player addItemToVest "Exile_Item_EnergyDrink";
			player addItemToVest "Exile_Item_GloriousKnakworst";
			player addItemToVest "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 9:{
			if !(_puid in Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 1169;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "rhs_uniform_cu_ucp";
			player addVest "rhsusf_iotv_ucp_Grenadier";
			player addHeadgear "rhsusf_ach_helmet_headset_ucp";
			player addBackpack "rhsusf_assault_eagleaiii_ucp";
			player addWeapon "Binocular";
			player addWeapon "CUP_arifle_M4A1_desert";
			player addWeapon "CUP_hgun_Colt1911";
			player addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
			player addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
			for "_i" from 1 to 3 do {player addItemToUniform "CUP_7Rnd_45ACP_1911";};
			for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_556x45_Stanag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_CanOpener";
			player linkItem "ItemGPS";
			player linkItem "TRYK_TAC_SET_NV_MESH_2";
			player addWeapon "Exile_Melee_Axe";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 10:{
			if !(_puid in Medic1 + Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 259;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_C_Scientist";
			player addHeadgear "H_Beret_02";
			player addVest "TRYK_V_ArmorVest_Winter";
			player addBackpack "TRYK_B_Coyotebackpack_WH";
			player addWeapon "CUP_hgun_Glock17";
			player addHandgunItem "CUP_acc_Glock17_Flashlight";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_17Rnd_9x19_glock17";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_BeefParts";
			player addItemToBackpack "Exile_Item_CanOpener";
			for "_i" from 1 to 2 do {player addItemToVest "Exile_Item_Vishpirin";};
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 11:{
			if !(_puid in Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 434;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_C_Scientist";
			player addHeadgear "H_Beret_02";
			player addVest "TRYK_V_ArmorVest_Winter";
			player addBackpack "TRYK_B_Coyotebackpack_WH";
			player addWeapon "CUP_smg_MP5A5";
			player addWeapon "CUP_hgun_Glock17";
			player addHandgunItem "optic_MRD";
			player addHandgunItem "CUP_acc_Glock17_Flashlight";
			for "_i" from 1 to 4 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_30Rnd_9x19_MP5";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_EnergyDrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			for "_i" from 1 to 2 do {player addItemToVest "Exile_Item_Vishpirin";};
			player addItemToBackpack "Exile_Item_GloriousKnakworst";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 12:{
			if !(_puid in Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 735;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "U_C_Scientist";
			player addVest "TRYK_V_ArmorVest_Winter";
			player addHeadgear "H_Beret_Colonel";
			player addBackpack "TRYK_V_ArmorVest_Winter";
			player addWeapon "CUP_arifle_CZ805_A1";
			player addWeapon "CUP_hgun_Glock17";
			player addPrimaryWeaponItem "optic_Hamr";
			player addHandgunItem "CUP_acc_Glock17_Flashlight";
			player addHandgunItem "optic_MRD";
			for "_i" from 1 to 4 do {player addItemToVest "CUP_17Rnd_9x19_glock17";};
			for "_i" from 1 to 4 do {player addItemToUniform "CUP_30Rnd_556x45_Stanag";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToVest "Exile_Item_PlasticBottleCoffee";
			player addItemToVest "Exile_Item_EMRE";
			player addItemToVest "Exile_Item_Matches";
			player addItemToVest "Exile_Item_CanOpener";
			for "_i" from 1 to 2 do {player addItemToVest "Exile_Item_Vishpirin";};
			for "_i" from 1 to 2 do {player addItemToVest "Exile_Item_InstaDoc";};
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 13:{
			if !(_puid in Engineer1 + Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 464;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_OVERALL_SAGE_BLKboots_nk_blk2";
			player addHeadgear "TRYK_ESS_CAP_OD";
			player addVest "V_Chestrig_oli";
			player addBackpack "CUP_B_CivPack_WDL";
			player addItemToVest "rhs_mag_mk3a2";
			player addItemToVest "CUP_HandGrenade_M67";
			player addWeapon "CUP_hgun_Compact";
			for "_i" from 1 to 4 do {player addItemToVest "CUP_10Rnd_9x19_Compact";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_Bandage";
			player addItemToBackpack "Exile_Item_MountainDupe";
			player addItemToBackpack "Exile_Item_BeefParts";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 14:{
			if !(_puid in Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 753;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_OVERALL_SAGE_BLKboots_nk_blk2";
			player addHeadgear "TRYK_ESS_CAP_OD";
			player addVest "rhs_6b23_engineer";
			player addBackpack "CUP_B_CivPack_WDL";
			player addWeapon "CUP_arifle_AKS74U";
			player addPrimaryWeaponItem "CUP_optic_Kobra";
			player addWeapon "CUP_hgun_Compact";
			player addItemToVest "CUP_HandGrenade_M67";
			for "_i" from 1 to 3 do {player addItemToUniform "CUP_10Rnd_9x19_Compact";};
			for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_545x39_AK_M";};
			player addItemToUniform "Exile_Magazine_Swing";
			player addItemToBackpack "Exile_Item_EnergyDrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			player addItemToBackpack "Exile_Item_GloriousKnakworst";
			player addItemToBackpack "Exile_Item_Vishpirin";
			player addItemToBackpack "Exile_Item_CanOpener";
			player addWeapon "Exile_Melee_Axe";
			player linkItem "ItemGPS";
			player addWeapon "Binocular";
			call ExileClient_object_player_bambiStateEnd; };
		};
		case 15:{
			if !(_puid in Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
			
			_cost = 889;
			["buyRequest",["BANK",str(_cost)]] call ExileClient_system_network_send;
			[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

			player forceAddUniform "TRYK_OVERALL_SAGE_BLKboots";
			player addVest "V_PlateCarrierSpec_rgr";
			player addHeadgear "TRYK_ESS_CAP";
			player addBackpack "CUP_B_ACRPara_m95";
			player addWeapon "CUP_arifle_AK74M_GL";
			player addWeapon "CUP_hgun_Phantom";
			player addHandgunItem "CUP_acc_CZ_M3X";
			player addItemToVest "CUP_HandGrenade_M67";
			for "_i" from 1 to 3 do {player addItemToVest "CUP_IlumFlareGreen_GP25_M";};
            for "_i" from 1 to 4 do {player addItemToVest "CUP_30Rnd_545x39_AK_M";};
            for "_i" from 1 to 4 do {player addItemToUniform "CUP_18Rnd_9x19_Phantom";};
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