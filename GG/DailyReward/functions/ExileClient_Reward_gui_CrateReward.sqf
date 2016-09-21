private["_display","_Rewardpic","_RewardText","_RewardClaim","_crateItems","_spawnPos","_crate","_crateFinalItem","_crateFullList","_crateWeapons","_crateBackpacks","_displayName","_cfg","_mag"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);

_Rewardpic ctrlSetText"GG\images\reward\rewardsCrate.paa";

_crateWeapons =	[
	"srifle_DMR_02_F",
	"srifle_GM6_F",
	"srifle_LRR_F",
	"arifle_ARX_ghex_F",
	"srifle_DMR_05_blk_F",
	"MMG_01_hex_F",
	"launch_rpg32_ghex_F",
	"launch_rpg7_F"
];

_crateBackpacks = [
	"B_Carryall_ghex_F",
	"B_Bergen_mcamo_F",
	"B_ViperHarness_blk_F"
];

_crateItems = [
	"BreachingChargeBigMomma",
	"BreachingChargeMetal",
	"BreachingChargeWood",
	"optic_Nightstalker",
	"Exile_Item_Knife",
	"Exile_Item_ThermalScannerPro",
	"ClaymoreDirectionalMine_Remote_Mag",
	"Exile_Item_Magazine01",
	"Exile_Item_Magazine02",
	"Exile_Item_Magazine03",
	"Exile_Item_Magazine04",
	"MineDetector",
	"RPG7_F",
	"RPG32_F",
	"Exile_Item_Laptop",
	"Exile_Item_BaseCameraKit",
	"Exile_Item_SafeKit",
	"Exile_Item_CodeLock"
];

_crateFinal = _crateWeapons+_crateBackpacks+_crateItems;
_crateFinalItem = _crateFinal call BIS_fnc_selectRandom;

_spawnPos = player modelToWorld [0,2,0];

_crate = createVehicle ["Box_NATO_Wps_F", _spawnPos, [], 0, "NONE"];

clearWeaponCargo _crate;
clearMagazineCargo _crate;
clearItemCargo _crate;
clearBackpackCargo _crate;

if (_crateFinalItem in _crateWeapons) then {
	_cfg="CfgWeapons";
	_mag = (getArray (configfile >> "cfgWeapons" >> _crateFinalItem >> "magazines")) select 0;
	_crate addWeaponCargo [_crateFinalItem, 1];
	_crate addMagazineCargo [_mag, 2];
};
if (_crateFinalItem in _crateBackpacks) then {_cfg="CfgVehicles";_crate addBackpackCargo [_crateFinalItem,1];};
if (_crateFinalItem in _crateItems) then {_cfg="CfgMagazines";_crate additemCargo [_crateFinalItem,1];};

_displayName = getText(configFile >> _cfg >> _crateFinalItem >> 'displayName');
_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won a <t size='1.1'>%1</t></t>",_displayName];