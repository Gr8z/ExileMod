[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'MAP_TEXT_JIP_T')then{terminate MAP_TEXT_JIP_T;MAP_TEXT_JIP_T=nil;};
		MAP_TEXT_JIP_T = [] spawn {
			waitUntil {!isNil 'MAP_TEXT__CODE'};
			waitUntil {!isNull findDisplay 46};
			waitUntil {!isNull findDisplay 12};
			
            _fnc_createctrl = {
                disableSerialization;
                params['_display','_type','_idc'];
                ctrlDelete (_display displayCtrl _idc);
                _ctrl = _display ctrlCreate[_type, _idc];
                _ctrl
            };
            _ctrl = [findDisplay 12,'RscStructuredText',515151] call _fnc_createctrl;
            _ctrl ctrlSetBackgroundColor [0.09,0.09,0.09,0.9];
            _ctrl ctrlSetStructuredText parseText "<t size='1.2' align='center' font='PuristaBold'> <t color='#38AAE0'>GHOSTZ</t> <t color='#878787'>GAMERZ</t></t><br/><t size='0.8' align='center' font='PuristaLight'> <a  color='#2880AC' href='http://ghostzgamerz.com'>www.GhostzGamerz.com</a></t>";
            _ctrl ctrlSetPosition [
                    0.2,
                    safezoneY+0.1,
                    0.5,
                    0.05 * safezoneH
            ];
            _ctrl ctrlCommit 0;
		};
	},-2,'MAP_TEXT_JIP'] call FN_infiSTAR_S;
};
true