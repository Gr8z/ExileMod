/*
*
*  MarXet_Traders.sqf
*  Author: WolfkillArcadia
*  © 2016 Arcas Industries
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_traders","_trader","_signs","_sign"];
_traders = [];
switch (toLower worldName) do {

	// Thanks to John Lemon for these.
	case "tanoa":
    {
        //////////////////////////////////////////////////////////
        //             East MarXet Trader
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [12187.9,8115.48,0],
            60
        ]


        call ExileClient_object_trader_create;
        _traders pushBack _trader;
        //////////////////////////////////////////////////////////
        //             West MarXet Trader
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [2271.38,8586.25,0],
            310
        ]


        call ExileClient_object_trader_create;
        _traders pushBack _trader;


		   //////////////////////////////////////////////////////////
        //             South MarXet Trader
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [11773.9,4131.5,0],
            261
        ]

        call ExileClient_object_trader_create;
        _traders pushBack _trader;


        //////////////////////////////////////////////////////////
        //             North MarXet Trader
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [7973.27,12401.8,0],
            40



        ]
        call ExileClient_object_trader_create;
        _traders pushBack _trader;
        private ["_signs"];
        _signs = [



			//NORTH TRADER SIGN
			["Exile_Sign_Armory",[7975.08,12399.7,0],0,[[-0.1, -0.1,0],[-0,0,1]], false],



			//WEST TRADER SIGN
			["Exile_Sign_Armory",[2272.65,8584.95,0],0,[[0.14, -0.1,0],[-0,0,1]], false],



			//SOUTH TRADER SIGN
			["Exile_Sign_Armory",[11776.8,4132.15,0],10,[[0.578185, 0.207734,0],[-0,0,1]], false],


			//EAST TRADER SIGN
			["Exile_Sign_Armory",[12189.6,8112.45,0],50.097,[[-0.515773, -0.856725,0],[-0,0,1]], false]



        ];
        {
            private ["_sign"];
            _sign = createVehicle [_x select 0, [0,0,0], [], 0, ""];
            _sign enableSimulationGlobal false;
            _sign setObjectTextureGlobal [0, "GG\images\MarXet_Sign.jpg"];
            if (_x select 4) then {
                _sign setDir (_x select 2);
                _sign setPos (_x select 1);
            } else {
                _sign setPosATL (_x select 1);
                _sign setVectorDirAndUp (_x select 3);
            };
        } foreach _signs;
    };
};

{
	_x forceAddUniform "U_BG_Guerilla2_1";
	_x addVest "Exile_Vest_Snow";
	_x addHeadgear "H_Watchcap_blk";
	_x addGoggles "G_Bandanna_aviator";
	_x addWeapon "srifle_DMR_04_F";
	_x addPrimaryWeaponItem "optic_LRPS";
	_x addWeapon "hgun_ACPC2_F";
	_x addAction ["<img image='\a3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa' size='1' shadow='false' />Access Marketplace","createDialog 'RscMarXetDialog'","",1,false,true,"","((position player) distance _target) <= 4"];
} forEach _traders;
[format["MarXet Traders have been placed. Trader count: %1. Map: %2",(count(_traders)),worldName],"Client Traders"] call ExileClient_MarXet_util_log;
