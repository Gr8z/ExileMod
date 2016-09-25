[] execVM "GG\battlezones.sqf";
[] execVM "GG\AVS\AVS_fnc_init.sqf";
[] execVM "GG\HEG_Xbrm_client\Xbrm_config.sqf";
if (isServer) then {[1000,-1,true,100,1000,1000]execvm "GG\zbe_cache\main.sqf"};