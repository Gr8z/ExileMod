if ((productVersion select 3) isEqualto 138587) then
{
	systemChat "Please download a different perf build";
    (findDisplay 46) closeDisplay 0;
};

[] execVM "GG\battlezones.sqf";
[] execVM "GG\AVS\AVS_fnc_init.sqf";
[] execVM "GG\HEG_Xbrm_client\Xbrm_config.sqf";
[] execVM "GG\DailyReward\init.sqf";
[] execVM "GG\repairVehicle\init.sqf";
[] execVM "GG\BasePaint\init.sqf";