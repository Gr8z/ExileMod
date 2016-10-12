[] spawn {
    waitUntil{!isNil'FN_infiSTAR_S'};
    ['',{
        if(!isNil'MAP_ICON_JIP_T')then{terminate MAP_ICON_JIP_T;MAP_ICON_JIP_T=nil;};
        MAP_ICON_JIP_T = [] spawn {
            waitUntil {!isNull findDisplay 46};
            waitUntil {!isNull findDisplay 12};
            objATM = [
                ["Land_Atm_01_F", [5457.49, 4047.2, 0]],
                ["Land_Atm_01_F", [3429.36, 6760.93, 0]],
                ["Land_Atm_01_F", [5088.08, 8696.57, 0]],
                ["Land_Atm_01_F", [9325.38, 4006.55, 0]],
                ["Land_Atm_01_F", [11043.3, 9822.49, 0]],
                ["Land_Atm_01_F", [9692.19, 13503.1, 0]],
                ["Land_Atm_01_F", [14287.7,11602.7,0]],
                ["Land_Atm_01_F", [10437.685,-1514,0]]
            ];
            _imagePath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
            iconToShow = _imagePath + "GG\images\ATM.paa";
            findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", "
            {
                _this select 0 drawIcon [
                    iconToShow,
                    [1,1,1,1],
                    _x select 1,
                    25,
                    25,
                    0,
                    '',
                    1,
                    0.04,
                    'TahomaB',
                    'right'
                ]
            } forEach objATM;
            "];
        };
    },-2,'MAP_ICON_JIP'] call FN_infiSTAR_S;
};
true