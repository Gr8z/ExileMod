if (vehicle player isEqualTo player) then
{
	[ExileJobParachuteNoFallDamage] call ExileClient_system_thread_removeTask;

	[] spawn
	{
		uiSleep 5;
		ExileParachuteNoFallDamage = false;
	};
};