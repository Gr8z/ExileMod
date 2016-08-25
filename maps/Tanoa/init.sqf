[] execVM "GG\zcp.sqf";
if (hasInterface || isServer) then {
[] call compileFinal preprocessFileLineNumbers "GG\welcome.sqf";
};

call ExileClient_system_map_initialize;