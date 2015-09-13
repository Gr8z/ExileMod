// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};
// ====================================================================================
// Group Markers
// ====================================================================================
[] spawn {
		{
			// check if group is friendly and have player inside them
			if(side (group player) == side _x && _x == group player) then
			{
					[_x] execVM "GG\f_localmarker.sqf";
			};
		} forEach allgroups;
};