private["_code"];
//if (!hasInterface || isServer) exitWith {};

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileClient_Reward_gui_load','GG\DailyReward\functions\ExileClient_Reward_gui_load.sqf'],
    ['ExileClient_Reward_gui_animation','GG\DailyReward\functions\ExileClient_Reward_gui_animation.sqf'],
    ['ExileClient_Reward_gui_showReward','GG\DailyReward\functions\ExileClient_Reward_gui_showReward.sqf'],
    ['ExileClient_Reward_gui_RespectReward','GG\DailyReward\functions\ExileClient_Reward_gui_RespectReward.sqf'],
    ['ExileClient_Reward_gui_TabsReward','GG\DailyReward\functions\ExileClient_Reward_gui_TabsReward.sqf'],
    ['ExileClient_Reward_gui_CrateReward','GG\DailyReward\functions\ExileClient_Reward_gui_CrateReward.sqf'],
    ['ExileClient_Reward_gui_onButtonClick','GG\DailyReward\functions\ExileClient_Reward_gui_onButtonClick.sqf']
];