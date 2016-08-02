/*
	Config
*/
_XG_KillConfig = 2; //1 or 2
_XG_colorVictim = "#DD2626";
_XG_ColorKiller = "#A0DF3B";
_XG_ColorVW = "#3FD4FC";
_XG_ColorText = "#FAF775";



/*
	Functions
*/
params[["_PV",""],["_type",""],["_killer",objNull],["_victim",objNull],"_message"];
_vehicle = vehicle _killer;
switch (_PV) do
{
	case "Vehicle":
	{
		switch (_XG_KillConfig) do
		{
			case 1:
			{
				_display = getText(configFile >> "CfgVehicles" >> (typeof _vehicle) >> "displayName");
				switch (_type) do
				{
					case "Driver:Para":
					{
						_message = format["<t color='%4'>%1</t> <t color='%7'>killed by</t> <t color='%5'>%2</t> <t color='%7'>in</t> <t color='%6'>%3</t>",(name _victim),(name _killer),_display,_XG_colorVictim,_XG_ColorKiller,_XG_ColorVW,_XG_ColorText];
					};
					case "Driver:Air":
					{
						_message = format["<t color='%4'>%1</t> <t color='%7'>was squashed by</t> <t color='%5'>%2</t> <t color='%7'>in</t> <t color='%6'>%3</t>",(name _victim),(name _killer),_display,_XG_colorVictim,_XG_ColorKiller,_XG_ColorVW,_XG_ColorText];
					};
					case "Driver:Vehicle":
					{
						_message = format["<t color='%4'>%1</t> <t color='%7'>was ran over by</t> <t color='%5'>%2</t> <t color='%7'>in</t> <t color='%6'>%3</t>",(name _victim),(name _killer),_display,_XG_colorVictim,_XG_ColorKiller,_XG_ColorVW,_XG_ColorText];
					};
					case "Turret:Static":
					{
						_message = format["<t color='%4'>%1</t> <t color='%7'>was gunned down by</t> <t color='%5'>%2</t> <t color='%7'>in</t> <t color='%6'>%3</t>",(name _victim),(name _killer),_display,_XG_colorVictim,_XG_ColorKiller,_XG_ColorVW,_XG_ColorText];
					};
					case "Turret:Vehicle":
					{
						_message = format["<t color='%4'>%1</t> <t color='%7'>was gunned down by</t> <t color='%5'>%2</t> <t color='%7'>in</t> <t color='%6'>%3</t>",(name _victim),(name _killer),_display,_XG_colorVictim,_XG_ColorKiller,_XG_ColorVW,_XG_ColorText];
					};
					case "Cargo:Vehicle":
					{
						_message = format["<t color='%4'>%1</t> <t color='%7'>was gunned down by</t> <t color='%5'>%2</t> <t color='%7'>in</t> <t color='%6'>%3</t>",(name _victim),(name _killer),_display,_XG_colorVictim,_XG_ColorKiller,_XG_ColorVW,_XG_ColorText];
					};
				};
			};
			case 2:
			{
				_display = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "icon");
				_message = format["<t color='%4'>%1</t> <img image='%3' color='%5' size='2'/> <t color='%6'>%2</t>",(name _victim),(name _killer),_display,_XG_colorVictim,_XG_ColorVW,_XG_ColorKiller];
			};
		};
	};
	case "Player":
	{
		switch (_XG_KillConfig) do
		{
			case 1:
			{
				_display = getText(configFile >> "CfgWeapons" >> (currentWeapon _killer) >> "picture");
				switch (_type) do
				{
					case "Weapon":
					{
						_message = format["<t color='%5'>%1</t> <t color='%8'>was killed by</t> <t color='%6'>%2</t> <t color='%8'>from</t> <t color='%7'>%3m</t> <t color='%8'>with</t> <img image='%4' size='2'/>",(name _victim),(name _killer),round((position _victim) distance (position _killer)),_display,_XG_colorVictim,_XG_ColorKiller,_XG_ColorVW,_XG_ColorText];
					};
					case "NoWeapon":
					{
						_message = format["<t color='%3'>%1</t> <t color='%5'>was killed by</t> <t color='%4'>%2</t> <t color='%5'>without a gun!</5>",(name _victim),(name _killer),_XG_colorVictim,_XG_ColorKiller,_XG_ColorText];
					};
				};
			};
			case 2:
			{
				switch (_type) do
				{
					case "Weapon":
					{
						_display = getText(configFile >> "CfgWeapons" >> (currentWeapon _killer) >> "picture");
						_message = format["<t color='%4'>%1</t> <img image='%3' size='2'/> <t color='%6'>%2</t> <t color='%5'>[%7m]</t>",(name _victim),(name _killer),_display,_XG_colorVictim,_XG_ColorVW,_XG_ColorKiller,round((position _victim) distance (position _killer))];
					};
					case "NoWeapon":
					{
						_message = format["<t color='%3'>%1</t> <t color='%5'>was killed by</t> <t color='%4'>%2</t> <t color='%5'>without a gun!</5>",(name _victim),(name _killer),_XG_colorVictim,_XG_ColorKiller,_XG_ColorText];
					};
				};
			};
		};
	};
	case "Exile":
	{
		switch(_type) do
		{
			case "Unknown":
			{
				_message = format["<t color='%2'>%1</t> <t color='%3'>died for an unknown reason</t>",(name _victim),_XG_colorVictim,_XG_ColorText];
			};
			case "Suicide":
			{
				_message = format["<t color='%2'>%1</t> <t color='%3'>commited suicide</t>",(name _victim),_XG_colorVictim,_XG_ColorText];
			};
			case "Roulette":
			{
				_message = format["<t color='%2'>%1</t> <t color='%3'>died while playing Russian Roulette</t>",(name _victim),_XG_colorVictim,_XG_ColorText]
			};
			case "Crashed":
			{
				_message = format["<t color='%2'>%1</t> <t color='%3'>crashed to death</t>",(name _victim),_XG_colorVictim,_XG_ColorText];
			};
			case "NPC":
			{
				_message = format["<t color='%2'>%1</t> <t color='%3'>was killed by an NPC</t>",(name _victim),_XG_colorVictim,_XG_ColorText];
			};
			case "TK":
			{
				_message = format["<t color='%2'>%1</t> <t color='%3'>was team-killed by</t> <t color='%5'>%4</t>",(name _victim),_XG_colorVictim,_XG_ColorText,(name _killer),_XG_ColorKiller];
			};
		};
	};
};
_rscLayer = "KillMessages" call BIS_fnc_rscLayer;
_rscLayer cutRsc ["KillMessages", "PLAIN", 0, false];
_display = uiNamespace getVariable ["KillMessages",displayNull];
(_display displayCtrl 1000) ctrlSetStructuredText parseText _message;