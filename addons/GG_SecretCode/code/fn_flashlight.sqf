[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'FASH_LIGHT_JIP_T')then{terminate FASH_LIGHT_JIP_T;FASH_LIGHT_JIP_T=nil;};
		FASH_LIGHT_JIP_T = [] spawn {
            waitUntil {!isNil 'GG_adjustBrightness'};
			waitUntil {!isNil 'GG_adjustColor'};

            _adjustLight = {
                GG_light setLightAttenuation [10e10,(30000 / (GG_adjustBrightness max 10e-10)),4.31918e-005,4.31918e-005];
                GG_light setLightAmbient GG_adjustColor;
            };

            if (missionNamespace getVariable ["GG_running",false]) exitWith {systemChat "Light script already running!"};
            GG_running = true;

            GG_adjustBrightness = missionNamespace getVariable ["GG_adjustBrightness",1];
            GG_adjustColor = missionNamespace getVariable ["GG_adjustColor",[0.5,0.7,1]];

            if (!isNil "GG_light") then {deleteVehicle GG_light};
            GG_light = "#lightpoint" createVehicleLocal [0,0,0];
            GG_light setLightBrightness 1;
            GG_light setLightDayLight false;
            call _adjustLight;

            for "_i" from 0 to 1 step 0 do {
                _adjustBrightness = GG_adjustBrightness;
                _adjustColor = GG_adjustColor;
                waitUntil {!(_adjustBrightness isEqualTo GG_adjustBrightness) || !(_adjustColor isEqualTo GG_adjustColor)};
                call _adjustLight;
            };
		};
	},-2,'FASH_LIGHT_JIP'] call FN_infiSTAR_S;
};
true