SECRET_FUNCTIONS__CODE = {

    // Draw Lines on the map
    [] call GG_fnc_drawToMap;

    // Status Bar
    [] call GG_fnc_statusBar;

    // Loadouts
    [] call GG_fnc_getLoadout;
};
publicVariable 'SECRET_FUNCTIONS__CODE';

[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'SECRET_FUNCTIONS_JIP_T')then{terminate SECRET_FUNCTIONS_JIP_T;SECRET_FUNCTIONS_JIP_T=nil;};
		SECRET_FUNCTIONS_JIP_T = [] spawn {
			waitUntil {!isNil 'SECRET_FUNCTIONS__CODE'};
			[] call SECRET_FUNCTIONS__CODE;
		};
	},-2,'SECRET_FUNCTIONS_JIP'] call FN_infiSTAR_S;
};
true