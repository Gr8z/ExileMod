GET_LOADOUT = {
        waitUntil {typeOf player isEqualTo 'Exile_Unit_Player'};
        uiSleep 3;
        _puid = getPlayerUID player;
        _locker = (player getVariable ["ExileLocker", 0]);
        _noMoneyText = [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>You do not have the money for the Loadout.</t>"],0,0,10,0];
        switch (_this) do {
            case 0:{
                execVM "GG\ranks.sqf";
            };
        /*
            case 1:{
                if !(_puid in Scout1 + Scout2 + Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {

                _cost = 799;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "TRYK_U_B_Wood_T";
                player addHeadgear "H_Bandanna_cbr";
                player addVest "V_Chestrig_khk";
                player addBackpack "B_AssaultPack_cbr";
                for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "muzzle_snds_acp";
                player addHandgunItem "optic_MRD";
                player addWeapon "Binocular";
                player addItemToUniform "Exile_Magazine_Swing";
                player linkItem "ItemGPS";
                player addItemToBackpack "Exile_Item_Bandage";
                player addItemToBackpack "Exile_Item_ExtensionCord";
                player addItemToBackpack "Exile_Item_MountainDupe";
                player addItemToBackpack "Exile_Item_Cheathas";
                player addItemToBackpack "Exile_Item_CanOpener";
                player addWeapon "Exile_Melee_Axe";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 2:{
                if !(_puid in Scout2 + Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 1494;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "Exile_Uniform_Woodland";
                player addHeadgear "TRYK_H_Booniehat_WOOD";
                player addVest "V_TacVest_camo";
                player addBackpack "B_Kitbag_rgr";
                for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
                for "_i" from 1 to 3 do {player addItemToBackpack "hlc_25Rnd_9x19mm_M882_AUG";};
                player addWeapon "hlc_rifle_augpara";
                player addPrimaryWeaponItem "hlc_muzzle_snds_a6AUG";
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "muzzle_snds_acp";
                player addHandgunItem "optic_MRD";
                player addWeapon "Binocular";
                player addItemToUniform "Exile_Magazine_Swing";
                player linkItem "ItemGPS";
                player addItemToVest "Exile_Item_ExtensionCord";
                player addItemToVest "Exile_Item_Vishpirin";
                player addItemToVest "Exile_Item_EnergyDrink";
                player addItemToVest "Exile_Item_GloriousKnakworst";
                player addItemToVest "Exile_Item_CanOpener";
                player addWeapon "Exile_Melee_Axe";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 3:{
                if !(_puid in Scout3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Scout Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 2354;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Scout Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "U_B_T_sniper_F";
                player addHeadgear "TRYK_H_Booniehat_WOOD";
                player addVest "V_PlateCarrier1_tna_F";
                player addBackpack "B_Carryall_ghex_F";
                for "_i" from 1 to 3 do {player addItemToBackpack "hlc_20Rnd_762x51_B_M14";};
                for "_i" from 1 to 4 do {player addItemToUniform "11Rnd_45ACP_Mag";};
                player addWeapon "hlc_rifle_M21";
                player addPrimaryWeaponItem "hlc_muzzle_snds_M14";
                player addPrimaryWeaponItem "hlc_optic_LRT_m14";
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "muzzle_snds_acp";
                player addHandgunItem "optic_MRD";
                player addWeapon "Binocular";
                player addItemToUniform "Exile_Magazine_Swing";
                player linkItem "ItemGPS";
                player addItemToVest "Exile_Item_InstaDoc";
                player addItemToVest "Exile_Item_PlasticBottleCoffee";
                player addItemToVest "Exile_Item_EMRE";
                player addItemToVest "Exile_Item_Matches";
                player addItemToVest "Exile_Item_ExtensionCord";
                player addItemToVest "Exile_Item_CanOpener";
                player addWeapon "Exile_Melee_Axe";
                player linkItem "O_NVGoggles_ghex_F";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 4:{
                if !(_puid in Marksman1 + Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 986;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "TRYK_B_TRYK_MTP_T";
                player addVest "V_Chestrig_rgr";
                player addHeadgear "H_Bandanna_khk_hs";
                player addBackpack "B_AssaultPack_rgr";
                for "_i" from 1 to 2 do {player addItemToBackpack "hlc_30rnd_556x45_EPR";};
                player addWeapon "hlc_rifle_SAMR";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemToBackpack "Exile_Item_MountainDupe";
                player addItemToBackpack "Exile_Item_ExtensionCord";
                player addItemToBackpack "Exile_Item_Cheathas";
                player addItemToBackpack "Exile_Item_CanOpener";
                player addWeapon "Rangefinder";
                player addWeapon "Exile_Melee_Axe";
                player linkItem "ItemGPS";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 5:{
                if !(_puid in Marksman2 + Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 1517;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;    
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "U_B_T_Soldier_SL_F";
                player addHeadgear "H_Booniehat_tna_F";
                player addVest "V_TacVest_oli";
                player addBackpack "B_ViperLightHarness_oli_F";
                for "_i" from 1 to 3 do {player addItemToUniform "11Rnd_45ACP_Mag";};
                for "_i" from 1 to 3 do {player addItemToVest "hlc_5rnd_3006_1903";};
                player addWeapon "hlc_rifle_M1903A1_unertl";
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "optic_MRD";
                player addWeapon "Rangefinder";
                player addItemToUniform "Exile_Magazine_Swing";
                player linkItem "ItemGPS";
                player addItemToVest "Exile_Item_Vishpirin";
                player addItemToVest "Exile_Item_EnergyDrink";
                player addItemToVest "Exile_Item_GloriousKnakworst";
                player addItemToVest "Exile_Item_CanOpener";
                player addItemToVest "Exile_Item_ExtensionCord";
                player addWeapon "Exile_Melee_Axe";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 6:{
                if !(_puid in Marksman3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Marksman Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 2390;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Marksman Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "U_I_FullGhillie_lsh";
                player addVest "V_PlateCarrier1_tna_F";
                player addBackpack "B_Carryall_ghex_F";
                for "_i" from 1 to 4 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
                for "_i" from 1 to 3 do {player addItemToBackpack "hlc_5rnd_300WM_FMJ_AWM";};
                player addWeapon "hlc_rifle_awmagnum_BL";
                player addPrimaryWeaponItem "optic_KHS_blk";
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "optic_MRD";
                player addHeadgear "H_Booniehat_tna_F";
                player addGoggles "G_Balaclava_oli";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemToVest "Exile_Item_InstaDoc";
                player addItemToVest "Exile_Item_PlasticBottleCoffee";
                player addItemToVest "Exile_Item_EMRE";
                player addItemToVest "Exile_Item_Matches";
                player addItemToVest "Exile_Item_ExtensionCord";
                player linkItem "TRYK_Shemagh_shade_G_N";
                player addItemToVest "Exile_Item_CanOpener";
                player linkItem "ItemGPS";
                player addWeapon "Rangefinder";
                player addWeapon "Exile_Melee_Axe";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 7:{
                if !(_puid in Soldier1 + Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 970;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "U_I_C_Soldier_Para_2_F";
                player addVest "V_Chestrig_rgr";
                player addHeadgear "H_MilCap_tna_F";
                player addBackpack "B_AssaultPack_tna_F";
                for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
                for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_45ACP_Mag_SMG_01";};
                player addWeapon "SMG_01_F";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemToBackpack "Exile_Item_Bandage";
                player addItemToBackpack "Exile_Item_MountainDupe";
                player addItemToBackpack "Exile_Item_Cheathas";
                player addItemToBackpack "Exile_Item_ExtensionCord";
                player addItemToBackpack "Exile_Item_CanOpener";
                player linkItem "ItemGPS";
                player addWeapon "Binocular";
                player addWeapon "Exile_Melee_Axe";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 8:{
                if !(_puid in Soldier2 + Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 1407;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "U_I_C_Soldier_Para_3_F";
                player addHeadgear "H_HelmetB_tna_F";
                player addVest "V_TacVest_oli";
                player addBackpack "B_Kitbag_rgr";
                for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
                for "_i" from 1 to 3 do {player addItemToBackpack "Exile_Magazine_7Rnd_45ACP";};
                for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
                player addWeapon "hlc_rifle_Colt727";
                player addWeapon "Exile_Weapon_Colt1911";
                player addWeapon "Binocular";
                player linkItem "ItemGPS";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemToVest "Exile_Item_Vishpirin";
                player addItemToVest "Exile_Item_EnergyDrink";
                player addItemToVest "Exile_Item_GloriousKnakworst";
                player addItemToVest "Exile_Item_ExtensionCord";
                player addItemToVest "Exile_Item_CanOpener";
                player addWeapon "Exile_Melee_Axe";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 9:{
                if !(_puid in Soldier3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Soldier Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 1805;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Soldier Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "U_I_C_Soldier_Camo_F";
                player addVest "V_PlateCarrier1_rgr_noflag_F";
                player addHeadgear "H_HelmetB_Enh_tna_F";
                player addBackpack "B_Carryall_oli";
                for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
                for "_i" from 1 to 3 do {player addItemToBackpack "Exile_Magazine_7Rnd_45ACP";};
                for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_65x39_caseless_mag_Tracer";};
                for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
                player addWeapon "hlc_rifle_G36MLIAG36";
                player addPrimaryWeaponItem "optic_arco_blk_F";
                player addWeapon "Exile_Weapon_Colt1911";
                player addWeapon "Binocular";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemToVest "Exile_Item_InstaDoc";
                player addItemToVest "Exile_Item_PlasticBottleCoffee";
                player addItemToVest "Exile_Item_EMRE";
                player addItemToVest "Exile_Item_Matches";
                player addItemToVest "Exile_Item_ExtensionCord";
                player addItemToVest "Exile_Item_CanOpener";
                player linkItem "ItemGPS";
                player linkItem "TRYK_Shemagh_shade_G_N";
                player addWeapon "Exile_Melee_Axe";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 10:{
                if !(_puid in Medic1 + Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 874;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "TRYK_B_TRYK_UCP_T";
                player addHeadgear "H_Beret_02";
                player addVest "V_Chestrig_blk";
                player addBackpack "B_AssaultPack_rgr";
                for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "optic_MRD";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemToBackpack "Exile_Item_Bandage";
                player addItemToBackpack "Exile_Item_MountainDupe";
                player addItemToBackpack "Exile_Item_BeefParts";
                player addItemToBackpack "Exile_Item_CanOpener";
                player addItemToBackpack "Exile_Item_ExtensionCord";
                for "_i" from 1 to 2 do {player addItemToVest "Exile_Item_Vishpirin";};
                player addWeapon "Exile_Melee_Axe";
                player linkItem "ItemGPS";
                player addWeapon "Binocular";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 11:{
                if !(_puid in Medic2 + Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 1492;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "TRYK_U_B_NATO_UCP_R_CombatUniform";
                player addHeadgear "H_Beret_02";
                player addVest "V_TacVest_blk";
                player addBackpack "TRYK_B_Medbag_ucp";
                for "_i" from 1 to 4 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
                for "_i" from 1 to 3 do {player addItemToBackpack "hlc_30Rnd_9x19_B_MP5";};
                player addWeapon "hlc_smg_MP5N";
                player addPrimaryWeaponItem "optic_ACO_grn_smg";
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "optic_MRD";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemToBackpack "Exile_Item_EnergyDrink";
                player addItemToBackpack "Exile_Item_InstaDoc";
                for "_i" from 2 to 3 do {player addItemToVest "Exile_Item_Vishpirin";};
                player addItemToBackpack "Exile_Item_GloriousKnakworst";
                player addItemToBackpack "Exile_Item_CanOpener";
                player addItemToBackpack "Exile_Item_ExtensionCord";
                player addWeapon "Exile_Melee_Axe";
                player linkItem "ItemGPS";
                player addWeapon "Binocular";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 12:{
                if !(_puid in Medic3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Medic Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 1973;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Medic Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "TRYK_U_B_NATO_UCP_CombatUniform";
                player addVest "V_PlateCarrier1_blk";
                player addHeadgear "H_Beret_Colonel";
                player addBackpack "B_ViperHarness_blk_F";
                for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
                for "_i" from 1 to 2 do {player addItemToBackpack "hlc_100rnd_556x45_EPR_G36";};
                player addWeapon "hlc_rifle_MG36";
                player addPrimaryWeaponItem "optic_ERCO_blk_F";
                player addPrimaryWeaponItem "bipod_01_F_blk";
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "optic_MRD";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemToVest "Exile_Item_PlasticBottleCoffee";
                player addItemToVest "Exile_Item_EMRE";
                player addItemToVest "Exile_Item_Matches";
                player addItemToVest "Exile_Item_ExtensionCord";
                player addItemToVest "Exile_Item_CanOpener";
                for "_i" from 3 to 4 do {player addItemToVest "Exile_Item_Vishpirin";};
                for "_i" from 2 to 3 do {player addItemToVest "Exile_Item_InstaDoc";};
                player addWeapon "Exile_Melee_Axe";
                player linkItem "ItemGPS";
                player linkItem "TRYK_Shemagh_shade_N";
                player addWeapon "Binocular";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 13:{
                if !(_puid in Engineer1 + Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 824;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 1</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "U_B_GEN_Commander_F";
                player addVest "V_TacVest_gen_F";
                player addHeadgear "H_MilCap_gen_F";
                player addBackpack "B_AssaultPack_blk";
                for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "optic_MRD";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemTovest "HandGrenade";
                player addItemToBackpack "Exile_Item_Bandage";
                player addItemToBackpack "Exile_Item_MountainDupe";
                player addItemToBackpack "Exile_Item_BeefParts";
                player addItemToBackpack "Exile_Item_CanOpener";
                player addItemToBackpack "Exile_Item_ExtensionCord";
                player addItemToBackpack "Exile_Item_DuctTape";
                player addWeapon "Exile_Melee_Axe";
                player linkItem "ItemGPS";
                player addWeapon "Binocular";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 14:{
                if !(_puid in Engineer2 + Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 1443;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 2</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "TRYK_U_B_OD_BLK";
                player addGoggles "G_Balaclava_blk";
                player addVest "V_TacVestIR_blk";
                player addBackpack "TRYK_B_Kitbag_blk";
                for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
                for "_i" from 1 to 3 do {player addItemToBackpack "hlc_10rnd_12g_buck_S12";};
                player addWeapon "hlc_rifle_saiga12k";
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "optic_MRD";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemTovest "HandGrenade";
                player addItemToBackpack "Exile_Item_EnergyDrink";
                player addItemToBackpack "Exile_Item_InstaDoc";
                player addItemToBackpack "Exile_Item_GloriousKnakworst";
                player addItemToBackpack "Exile_Item_Vishpirin";
                player addItemToBackpack "Exile_Item_CanOpener";
                player addItemToBackpack "Exile_Item_ExtensionCord";
                player addItemToBackpack "Exile_Item_DuctTape";
                player addWeapon "Exile_Melee_Axe";
                player linkItem "ItemGPS";
                player addWeapon "Binocular";
                call ExileClient_object_player_bambiStateEnd; };};
            };
            case 15:{
                if !(_puid in Engineer3) then {[parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Only Available for Engineer Loadout Donators.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;} else {
                
                _cost = 2226;
                if (_cost > _locker) then {_noMoneyText spawn bis_fnc_dynamictext} else {
                ["lockerRequest",[str(_cost)]] call ExileClient_system_network_send;
                [parseText format["<img size='2' shadow='0' image='GG\images\logo.paa'/><br/><t size='0.7'font='OrbitronLight'>Engineer Loadout 3</t><br/><img size='0.6' image='GG\images\icons\poptab_ca.paa'/><t size='0.7'font='OrbitronLight'>%1</t>",_cost],0,0,10,0] spawn bis_fnc_dynamictext;

                player forceAddUniform "TRYK_U_B_BLKTANR_CombatUniformTshirt";
                player addVest "V_PlateCarrier1_blk";
                player addHeadgear "TRYK_H_PASGT_BLK";
                player addBackpack "B_ViperHarness_blk_F";
                for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
                for "_i" from 1 to 2 do {player addItemToBackpack "hlc_200rnd_556x45_M_SAW";};
                for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Item_DuctTape";};
                player addWeapon "hlc_m249_SQuantoon";
                player addPrimaryWeaponItem "optic_ERCO_blk_F";
                player addPrimaryWeaponItem "bipod_01_F_blk";
                player addWeapon "hgun_Pistol_heavy_01_F";
                player addHandgunItem "optic_MRD";
                player addItemToUniform "Exile_Magazine_Swing";
                player addItemTovest "HandGrenade";
                player addItemToVest "Exile_Item_Vishpirin";
                player addItemToVest "Exile_Item_PlasticBottleCoffee";
                player addItemToVest "Exile_Item_EMRE";
                player addItemToVest "Exile_Item_Matches";
                player addItemToVest "Exile_Item_ExtensionCord";
                player addItemToVest "Exile_Item_CanOpener";
                player linkItem "TRYK_TAC_EARMUFF_SHADE";
                player linkItem "ItemGPS";
                player addWeapon "Binocular";
                player addWeapon "Exile_Melee_Axe";
                call ExileClient_object_player_bambiStateEnd; };};
            };
        */
        };
    };