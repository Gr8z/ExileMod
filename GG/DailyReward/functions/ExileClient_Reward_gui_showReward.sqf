private["_display","_Rewardpic","_RewardText","_RewardClaim","_RewardClose"];

disableSerialization;
_display = uiNamespace getVariable ["RewardsDialog",displayNull];

_Rewardpic = (_display displayCtrl 1002);
_RewardText = (_display displayCtrl 1003);
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

_RewardClose ctrlSetText "Close";
_RewardClose ctrlEnable true;