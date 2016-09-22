WELCOME_TEXT__CODE = {
    // Welcome messages
    private ["_NewLoginCount","_Logins","_LoginCount","_playerUID","_announcepay","_buildRights","_flag","_dueDate","_nextDueDate","_msg","_name","_missingModList","_dailyReward"];
    playSound "intro";
    uiSleep 2;
    // Login Count
    _LoginCount = profileNamespace getVariable "var_GG_Logins";
    if (isNil "_LoginCount") then {
        profileNamespace setVariable ["var_GG_Logins",1];
        saveProfileNamespace;
        _LoginCount = profileNamespace getVariable "var_GG_Logins";
    };
    _Logins = profileNamespace getVariable "var_GG_Logins";

    [
        [
            ["[GG] GHOSTZ GAMERZ EXILE TANOA ALPHA","<t align = 'center' shadow = '1' size = '0.8' font='PuristaBold' color='#38AAE0'>%1</t>"],
            [profileNameSteam,"<br/><t align = 'center' shadow = '0' size = '0.7' font='PuristaLight'>%1</t>"],
            [" ",""],
            [" ",""]
        ]
    ] spawn BIS_fnc_typeText;

    uiSleep 15;

    switch (_Logins) do {
        case 0, case 1, case 2, case 3, case 4, case 5:
        {
            [["Visit Us At:","www.GHOSTZGAMERZ.com","For Rules","Forums","Free Builders Box","Leaderboards","Kill Feed","and Changelogs","","","","","","",""], .5, .85] call BIS_fnc_typeText;
            [["Join Our Teamspeak:","ts.GhostzGamerz.com","New Players recieve 10,000 Free Pop Tabs","Free Private Channels Available","Fast Admin support Channels","People waiting to Team Up","","","","","",""], -.5, .85] call BIS_fnc_typeText;

        };
        case 10:
        {
            [["WOW! This is your 10th time logging in...","We hope you are liking it here","Don't play alone, Bring your friends too","Don't forget to leave your feedback on our forums.","","","","",""], -.5, .85] call BIS_fnc_typeText;  
        };
        case 50:
        {
            [["WOHO! you reach 50 logins on our server.","We appreciate your loyalty","Help this community by Donating","A Small $5 Donation would help us out alot on the server costs.","","","",""], -.5, .85] call BIS_fnc_typeText;  
        };
        case 100:
        {
            [["You Just achieved a milestone","You are now logging in for the 100th time","Thank you so much for beign an active member of this community","","","","",""], -.5, .85] call BIS_fnc_typeText;  
        };
        default {};
    };


    _NewLoginCount = _Logins + 1;
    profileNamespace setVariable ["var_GG_Logins",_NewLoginCount];
    saveProfileNamespace;
    
    // Territory Information
    _playerUID = getPlayerUID player;
    _announcepay = [];
    {
        _flag = _x;
        _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
        if (_playerUID in _buildRights) then
        {
            _nextDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
            _name = _flag getVariable ["ExileTerritoryName", ""];
            _dueDate = format 
            [
                    "%2/%3/%1",
                    _nextDueDate select 0,
                    _nextDueDate select 1,
                    _nextDueDate select 2
            ];
            _msg = format["Your territory payment for '%2' due: %1",_dueDate,_name];
            _announcepay pushBack _msg;
            
        };
    }
    forEach (allMissionObjects "Exile_Construction_Flag_Static");

    if !(count _announcepay == 0) then{
        uiSleep 2;
        _announcepay append ["","",""];
        [_announcepay, -.5, .85] call BIS_fnc_typeText;
    };

    // Missing Mod Information
    _missingModList = ["We detected that your game is not running the following Mods:"];
    _missingMods = false;

    if !(isClass (configFile >> "CfgPatches" >> "asdg_jointrails")) then {
        _msg = "ASDG Joint Rails";
        _missingMods = true;
        _missingModList pushBack _msg;
    };
    if !(isClass (configFile >> "CfgPatches" >> "hlcweapons_core")) then {
        _msg = "NiArms Pack";
        _missingMods = true;
        _missingModList pushBack _msg;
    };
    if !(isClass (configFile >> "CfgPatches" >> "TRYK_Uniform")) then {
        _msg = "TRYK Multiplay Uniforms";
        _missingMods = true;
        _missingModList pushBack _msg;
    };

    if (_missingMods) then {
        _missingModList append ["","",""];

        sleep 2;

        if (count _missingModList > 1) then{
            [_missingModList, .5, .85] call BIS_fnc_typeText;
        };
    };

    _dailyReward = player getVariable ["ExileDailyReward",false];
    if (_dailyReward) then
    {
       createDialog "RewardsDialog";
    };

    // Blow up useless people
    DevList =
    [
        "76561197985241690", /* Stubborn Eichi */
        "76561198022879703", /* Ignorant Grim */
        "76561197968999666", /* Poor Mr.White^ex */
        "76561198075905447", /* Crybaby Vishpala */
        
        // Other Bohemia Devs
        "76561198033149705",
        "76561198077997178",
        "76561198123905054",
        "76561198078001618",
        "76561198078010751",
        "76561198078024519",
        "76561198110395166",
        "76561198156731051",
        "76561198078005537",
        "76561198078001840",
        "76561198078024627",
        "76561198106890529",
        "76561198074569607",
        "76561198078019679",
        "76561198082788792",
        "76561198078026953",
        "76561198078059246",
        "76561198123998851",
        "76561198184305659",
        "76561198124371207",
        "76561198123998699",
        "76561198123983507",
        "76561198124066407",
        "76561198124072607",
        "76561198110322799",
        "76561198124053157",
        "76561198124014834",
        "76561198123751396",
        "76561198124446965",
        "76561198106862590",
        "76561198124457317",
        "76561198123960404",
        "76561198072279845",
        "76561198127766123"
    ];
    if (getPlayerUID player in DevList) then { // check if the player is an exilemod dev
        private["_c4"];
        _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position player; // explosive charge
        _c4 attachTo [player, [0.0, 0.1, -0.15], "Pelvis"]; // attach it down there
        detach _c4; 
        _c4 setDamage 1; // make it go boom
    };
};
publicVariable 'WELCOME_TEXT__CODE';

[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'WELCOME_TEXT_JIP_T')then{terminate WELCOME_TEXT_JIP_T;WELCOME_TEXT_JIP_T=nil;};
		WELCOME_TEXT_JIP_T = [] spawn {
			waitUntil {!isNil 'WELCOME_TEXT__CODE'};
            waitUntil {!isNil 'ExileClientLoadedIn'};
            waitUntil {getPlayerUID player != ''};  
            waitUntil {!isNull findDisplay 46};
			[] spawn WELCOME_TEXT__CODE;
		};
	},-2,'WELCOME_TEXT_JIP'] call FN_infiSTAR_S;
};
true