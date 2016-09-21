private["_display","_Rewardpic","_RewardText","_RewardClaim","_RewardClose"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);
_RewardClose = (_display displayCtrl 1004);

_rewardList = ["respect","tabs","crate"] call BIS_fnc_selectRandom;
switch (_rewardList) do { 
	case "respect" : { 
		_Rewardpic ctrlSetText "GG\images\reward\rewardsRespect.paa";
		_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won %1 Respect</t>","0"];
	};
	case "tabs" : { 
		_Rewardpic ctrlSetText "GG\images\reward\rewardsTabs.paa";
		_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won %1 Pop Tabs</t>","0"];
	};
	case "crate" : {  
		_Rewardpic ctrlSetText"GG\images\reward\rewardsCrate.paa";
		_RewardText ctrlSetStructuredText parseText format["<t align='center' size='1'>You won a %1</t>","0"];
	};
};

playSound "SndExileTwinkleTwisterSuccess";

_RewardClose ctrlSetText "Close";
_RewardClose ctrlEnable true;