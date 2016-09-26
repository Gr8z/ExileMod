DAILY_REWARDS__CODE = {

    ExileClient_Reward_gui_animation = {
    	private["_display","_Rewardpic","_RewardText","_suffleDone"];

		disableSerialization;
		_display = uiNamespace getVariable ["RewardsDialog",displayNull];

		_Rewardpic = (_display displayCtrl 1002);
		_RewardText = (_display displayCtrl 1003);

		playSound "SndExileTwinkleTwisterCharge01";

		_a = 0;
		while {_a =_a + 1; _a < 8} do {
		  	rewardImages = [
		  		"GG\images\reward\rewardsTabs.paa",
		  		"GG\images\reward\rewardsCrate.paa",
		  		"GG\images\reward\rewardsRespect.paa"
		  	];
		  	_Rewardpic ctrlSetText (rewardImages select 0);
		  	sleep 0.2;
		  	_Rewardpic ctrlSetText (rewardImages select 1);
		  	sleep 0.2;
		  	_Rewardpic ctrlSetText (rewardImages select 2);
		  	sleep 0.2;
		};

		_suffleDone = true;

		waitUntil {!isNil '_suffleDone'};
		[] call ExileClient_Reward_gui_showReward;
	};

    ExileClient_Reward_gui_showReward = {
    	private["_display","_Rewardpic","_RewardText","_RewardClaim","_RewardClose"];

		disableSerialization;
		_display = uiNamespace getVariable ["RewardsDialog",displayNull];

		_Rewardpic = (_display displayCtrl 1002);
		_RewardText = (_display displayCtrl 1003);
		_RewardClaim = (_display displayCtrl 1001);
		_RewardClose = (_display displayCtrl 1004);

		_rewardList = ["respect","tabs","crate"] call BIS_fnc_selectRandom;
		switch (_rewardList) do { 
			case "respect" : { 
				call ExileClient_Reward_gui_RespectReward;
			};
			case "tabs" : { 
				call ExileClient_Reward_gui_TabsReward;
			};
			case "crate" : {  
				call ExileClient_Reward_gui_CrateReward;
			};
		};

		playSound "SndExileTwinkleTwisterSuccess";

		["updateRewardDate",[str(_rewardList)]] call ExileClient_system_network_send;
		player setVariable ["ExileDailyReward",false];

		_RewardClose ctrlSetText "Close";
		_RewardClaim ctrlSetText "Claimed";
		_RewardClose ctrlEnable true;
	};

    ExileClient_Reward_gui_RespectReward = {
    	private["_display","_Rewardpic","_RewardText","_RewardClaim","_amount"];

		disableSerialization;
		_display = uiNamespace getVariable ["RewardsDialog",displayNull];

		_Rewardpic = (_display displayCtrl 1002);
		_RewardText = (_display displayCtrl 1003);

		_Rewardpic ctrlSetText "GG\images\reward\rewardsRespect.paa";

		_amount = floor((random 500) + (random 500));

		if (_amount < 50) then {_amount = 5000;};
		if (_amount < 5) then {_amount = 10000;};

		ExileClientPlayerScore = ExileClientPlayerScore + _amount;
		["addRespectReward",[str(_amount)]] call ExileClient_system_network_send;

		_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won %1 Respect</t>",_amount];
	};

    ExileClient_Reward_gui_TabsReward = {
    	private["_display","_Rewardpic","_RewardText","_RewardClaim","_amount"];

		disableSerialization;
		_display = uiNamespace getVariable ["RewardsDialog",displayNull];

		_Rewardpic = (_display displayCtrl 1002);
		_RewardText = (_display displayCtrl 1003);

		_Rewardpic ctrlSetText "GG\images\reward\rewardsTabs.paa";

		_amount = floor((random 1000) + (random 1000));

		if (_amount < 100) then {_amount = 50000;};
		if (_amount < 10) then {_amount = 100000;};

		["addPopReward",[str(_amount)]] call ExileClient_system_network_send;

		_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won %1 Pop Tabs. They are in your bank.</t>",_amount];
	};

    ExileClient_Reward_gui_CrateReward = {
    	private["_display","_Rewardpic","_RewardText","_RewardClaim","_crateItems","_spawnPos","_crate","_crateFinalItem","_crateFullList","_crateWeapons","_crateBackpacks","_displayName","_cfg","_mag","_posObject","_marker"];

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
			"MineDetector",
			"launch_rpg7_F"
		];

		_crateBackpacks = [
			"B_Carryall_ghex_F",
			"B_Bergen_mcamo_F",
			"B_ViperHarness_blk_F"
		];

		_crateItems = [
			"Exile_Item_BreachingCharge_BigMomma",
			"Exile_Item_BreachingCharge_Metal",
			"Exile_Item_BreachingCharge_Wood",
			"optic_Nightstalker",
			"Exile_Item_Knife",
			"Exile_Item_ThermalScannerPro",
			"ClaymoreDirectionalMine_Remote_Mag",
			"Exile_Item_Magazine01",
			"Exile_Item_Magazine02",
			"Exile_Item_Magazine03",
			"Exile_Item_Magazine04",
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

		_crate = "Box_NATO_Wps_F" createVehicleLocal _spawnPos; 

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
		_posObject = getPos _crate;

		_marker  = createMarkerLocal ["markerRewardCrate",_posObject];
		_marker  setMarkerTextLocal format["%1",_displayName];
		_marker  setMarkerTypeLocal "mil_dot";
		_marker  setMarkerColorLocal "ColorWhite";

		hint "Your Reward is in a loot crate near you and marked on the map.";
		_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won a <t size='1.1'>%1</t>.</t>",_displayName];
	};


    ExileClient_Reward_gui_onButtonClick = {
    	private["_display","_Rewardpic","_RewardText","_RewardClaim","_RewardClose"];

		disableSerialization;
		_display = uiNamespace getVariable ["RewardsDialog",displayNull];

		_Rewardpic = (_display displayCtrl 1002);
		_RewardText = (_display displayCtrl 1003);
		_RewardClaim = (_display displayCtrl 1001);
		_RewardClose = (_display displayCtrl 1004);

		_Rewardpic ctrlSetText "";
		_RewardClaim ctrlEnable false;
		_RewardClose ctrlEnable false;
		_RewardText ctrlSetStructuredText parseText "<t align='center' size='1'>Choosing a reward...</t>";

		[] spawn ExileClient_Reward_gui_animation;
	};
};
publicVariable 'DAILY_REWARDS__CODE';

[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'DAILY_REWARDS_JIP_T')then{terminate DAILY_REWARDS_JIP_T;DAILY_REWARDS_JIP_T=nil;};
		DAILY_REWARDS_JIP_T = [] spawn {
			waitUntil {!isNil 'DAILY_REWARDS__CODE'};
			[] call DAILY_REWARDS__CODE;
		};
	},-2,'DAILY_REWARDS_JIP'] call FN_infiSTAR_S;
};
true