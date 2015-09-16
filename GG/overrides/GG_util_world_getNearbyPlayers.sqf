/*
	infiSTAR: From my testing nearEntities is way faster. Like at least 50 times, so this might help by a fair amount!
*/
private["_position","_radius","_players"];
_position = _this select 0;
_radius = _this select 1;
_players = [];

if (_radius >= 500) then
{
	{
		if ((_x distance2D _position) < _radius) then
		{
			_players pushBack _x;
		};
	} forEach allPlayers;
}
else
{
	{
		{
			if (isPlayer _x) then
			{
				_players pushBack _x;
			};
		} forEach (crew _x);
	} forEach (_position nearEntities [["Exile_Unit_Player","LandVehicle", "Air", "Ship"], _radius]);
};
_players