private["_display","_topTextCTRL1","_topTextCTRL2","_spawnButton","_listBox","_listItemIndex","_numberOfSpawnPoints","_randNum","_randData","_randomSpawnIndex"];
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
_listItemIndex = _listBox lbAdd "Scout";
_listItemIndex = _listBox lbAdd "Sniper";
_listItemIndex = _listBox lbAdd "Soldier";
_listItemIndex = _listBox lbAdd "Medic";
_listItemIndex = _listBox lbAdd "Engineer";
if(isNil"donors")exitWith{systemChat 'Donor Loadouts Coming Soon !';true};
if!((getPlayerUID player) in donors)exitWith{systemChat 'Donor Loadouts Coming Soon !';true};
FNC_GET_ACTUAL_LOADOUT = {
	waitUntil {typeOf player isEqualTo 'Exile_Unit_Player'};
	uiSleep 3;
	switch (_this) do {
		case 0:{
			[parseText format["<img size='2' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout</t>"],0,0,10,0] spawn bis_fnc_dynamictext;
			clearWeaponCargo player;
			clearMagazineCargo player;
			removeBackpackGlobal player;
			player forceAddUniform "U_O_OfficerUniform_ocamo";
			player addBackpack "B_Carryall_cbr";
			player addVest "V_PlateCarrierGL_blk";
			player addWeapon "ItemRadio";
			player addWeapon "ItemGPS";
			player addWeapon 'Exile_Item_XM8';
			player addWeapon "ItemCompass";
			player addWeapon 'rangefinder';
			player addHeadgear "H_HelmetB_light";
			player addItemToVest "Exile_Item_BBQSandwich_Cooked";
			player addItemToVest "Exile_Item_Energydrink";
			player addItemToVest "H_Watchcap_cbr";
			player addItemToVest "Exile_Item_InstaDoc";		
			player addItemToVest "Exile_Item_DuctTape";
			player addWeapon 'SMG_02_F';
			player addPrimaryWeaponItem "optic_Holosight_smg";
			player addItemToVest "30Rnd_9x21_Mag";
			player addItemToVest "30Rnd_9x21_Mag";
			call ExileClient_object_player_bambiStateEnd;
		};
		case 1:{
			[parseText format["<img size='2' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Sniper Loadout</t>"],0,0,10,0] spawn bis_fnc_dynamictext;
			clearWeaponCargo player;
			clearMagazineCargo player;
			removeBackpackGlobal player;
			player forceAddUniform "U_O_PilotCoveralls";
			player addBackpack "B_Carryall_oucamo";
			player addVest "V_TacVest_blk_POLICE";
			player addWeapon "ItemRadio";
			player addWeapon "ItemGPS";
			player addWeapon 'Exile_Item_XM8';
			player addWeapon "ItemCompass";
			player addWeapon 'rangefinder';
			player addHeadgear "H_Watchcap_cbr";
			player addItemToBackpack "Exile_Item_BBQSandwich_Cooked";
			player addItemToBackpack "Exile_Item_Energydrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_DuctTape";
			player addWeapon 'SMG_02_F';
			player addPrimaryWeaponItem "optic_Holosight_smg";
			player addItemToVest "30Rnd_9x21_Mag";
			player addItemToVest "30Rnd_9x21_Mag";
			call ExileClient_object_player_bambiStateEnd;
		};
		case 2:{
			[parseText format["<img size='2' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout</t>"],0,0,10,0] spawn bis_fnc_dynamictext;
			clearWeaponCargo player;
			clearMagazineCargo player;
			removeBackpackGlobal player;
			player forceAddUniform "U_O_GhillieSuit";
			player addBackpack "B_Carryall_cbr";
			player addVest "V_TacVest_blk_POLICE";
			player addWeapon "ItemRadio";
			player addWeapon "ItemGPS";
			player addWeapon 'Exile_Item_XM8';
			player addWeapon "ItemCompass";
			player addWeapon 'Laserdesignator';
			player addHeadgear "H_HelmetB_light";
			player addItemToBackpack "Exile_Item_BBQSandwich_Cooked";
			player addItemToBackpack "Exile_Item_Energydrink";
			player addItemToVest "Exile_Item_DuctTape";
			player addItemToBackpack "Exile_Item_InstaDoc";
			player addWeapon 'SMG_02_F';
			player addPrimaryWeaponItem "optic_Holosight_smg";
			player addItemToVest "30Rnd_9x21_Mag";
			player addItemToVest "30Rnd_9x21_Mag";
			call ExileClient_object_player_bambiStateEnd;
		};
		case 3:{
			[parseText format["<img size='2' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout</t>"],0,0,10,0] spawn bis_fnc_dynamictext;
			clearWeaponCargo player;
			clearMagazineCargo player;
			removeBackpackGlobal player;
			player forceAddUniform "U_B_FullGhillie_lsh";
			player addBackpack "B_Carryall_cbr";
			player addVest "V_TacVest_blk_POLICE";
			player addWeapon "ItemRadio";
			player addWeapon "ItemGPS";
			player addWeapon 'Exile_Item_XM8';
			player addWeapon "ItemCompass";
			player addWeapon 'Laserdesignator';
			player addHeadgear "H_HelmetB_light";
			player addItemToBackpack "Exile_Item_BBQSandwich_Cooked";
			player addItemToBackpack "Exile_Item_Energydrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_DuctTape";
			player addWeapon 'SMG_02_F';
			player addPrimaryWeaponItem "optic_Holosight_smg";
			player addItemToVest "30Rnd_9x21_Mag";
			player addItemToVest "30Rnd_9x21_Mag";
			call ExileClient_object_player_bambiStateEnd;
		};
		case 4:{
			[parseText format["<img size='2' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout</t>"],0,0,10,0] spawn bis_fnc_dynamictext;
			clearWeaponCargo player;
			clearMagazineCargo player;
			removeBackpackGlobal player;
			player forceAddUniform "U_O_CombatUniform_ocamo";
			player addBackpack "B_Carryall_cbr";
			player addVest "V_TacVest_blk_POLICE";
			player addWeapon "ItemRadio";
			player addWeapon "ItemGPS";
			player addWeapon 'Exile_Item_XM8';
			player addWeapon "ItemCompass";
			player addWeapon 'rangefinder';
			player addHeadgear "H_HelmetB_light";
			player addItemToBackpack "Exile_Item_BBQSandwich_Cooked";
			player addItemToBackpack "Exile_Item_Energydrink";
			player addItemToBackpack "Exile_Item_InstaDoc";
			player addItemToVest "Exile_Item_DuctTape";
			player addWeapon 'SMG_02_F';
			player addPrimaryWeaponItem "optic_Holosight_smg";
			player addItemToVest "30Rnd_9x21_Mag";
			player addItemToVest "30Rnd_9x21_Mag";
			call ExileClient_object_player_bambiStateEnd;
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