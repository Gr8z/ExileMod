if ((productVersion select 3) isEqualto 138587) then
{
 // End loading screen
 endLoadingScreen;

 // End the mission
 endMission "END6";
};

[] execVM "GG\battlezones.sqf";
[] execVM "GG\AVS\AVS_fnc_init.sqf";
[] execVM "GG\HEG_Xbrm_client\Xbrm_config.sqf";