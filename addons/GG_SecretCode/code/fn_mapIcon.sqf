MAP_ICON__CODE = {
    objATM = [
        ["Land_Atm_01_F", [5457.49, 4047.2, 0],227,0,0,false],
        ["Land_Atm_01_F", [3429.36, 6760.93, 0],210,0,0,false],
        ["Land_Atm_01_F", [5088.08, 8696.57, 0],273,0,0,false],
        ["Land_Atm_01_F", [9325.38, 4006.55, 0],182.5,0,0,false],
        ["Land_Atm_01_F", [11043.3, 9822.49, 0],288,0,0,false],
        ["Land_Atm_01_F", [9692.19, 13503.1, 0],199,0,0,false],
        ["Land_Atm_01_F", [14287.7,11602.7,0],214,0,0,false]
    ];
    findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", "
    {
        _this select 0 drawIcon [
            'exile_assets\texture\item\Exile_Item_Codelock.paa',
            [1,1,1,1],
            _x select 1,
            25,
            25,
            0,
            '',
            1,
            0.03,
            'TahomaB',
            'right'
        ]
    } forEach objATM;
    "];
};
publicVariable 'MAP_ICON__CODE';

[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'MAP_ICON_JIP_T')then{terminate MAP_ICON_JIP_T;MAP_ICON_JIP_T=nil;};
		MAP_ICON_JIP_T = [] spawn {
			waitUntil {!isNil 'MAP_ICON__CODE'};
			waitUntil {!isNull findDisplay 46};
			waitUntil {!isNull findDisplay 12};
			[] call MAP_ICON__CODE;
		};
	},-2,'MAP_ICON_JIP'] call FN_infiSTAR_S;
};
true