JR_containerBug_check =
{
	if (isNil "ExileClientLoadedIn" || {!ExileClientLoadedIn}) exitWith {};

	params ["_uniform", "_vest"];

	if !(uniform player isEqualTo _uniform) then
	{
		_uniform = uniform player;
		_uniformGear = uniformContainer player call ExileClient_util_containerCargo_serialize;
		removeUniform player;
		player forceAddUniform _uniform;
		[uniformContainer player, _uniformGear] call ExileClient_util_containerCargo_deserialize;
	};

	if !(vest player isEqualTo _vest) then
	{
		_vest = vest player;
		_vestGear = vestContainer player call ExileClient_util_containerCargo_serialize;
		removeVest player;
		player addVest _vest;
		[vestContainer player, _vestGear] call ExileClient_util_containerCargo_deserialize;
	};
};

publicVariable "JR_containerBug_check";

JR_containerBug_thread =
{
	{
		if !(_x getVariable ["ExileDatabaseID", 0] isEqualTo 0) then
		{
			if (alive _x) then
			{
				if !(getPlayerUID _x isEqualTo "") then
				{
					[uniform _x, vest _x] remoteExecCall ["JR_containerBug_check", owner _x];
				};
			};
		};
	}
	forEach allPlayers;
};

[] spawn
{
	waitUntil {!isNil "ExileServer_system_thread_addTask"};
	{
		[30, JR_containerBug_thread, [], true] call ExileServer_system_thread_addTask;
	}
	remoteExecCall ["call", 2];
};