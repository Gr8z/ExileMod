waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

StatusEnabled = true;

[] spawn
{
	uiSleep 5;
	_uid = getPlayerUID player;

	while {true} do
	{
		uisleep 1;
		if !(StatusEnabled) then
		{
			_rscLayer = "RscExileStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutText ["","PLAIN",1,false];
		}
		else
		{
			_rscLayer = "RscExileStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["RscExileStatusBar","PLAIN",1,false];

			if(isNull ((uiNamespace getVariable "RscExileStatusBar")displayCtrl 55554)) then
			{
				diag_log "StatusBar is null create";
				disableSerialization;
				_rscLayer = "RscExileStatusBar" call BIS_fnc_rscLayer;
				_rscLayer cutRsc ["RscExileStatusBar","PLAIN",1,false];
			};
			//initialize variables and set values
			_unit = _this select 0;
			_damage = round ((1 - (damage player)) * 100);
			_wallet = ExileClientPlayerMoney;
			_respect = ExileClientPlayerScore;
			_serverFPS = round diag_fps;
			_pos = getPosATL player;
			_dir = round (getDir (vehicle player));
			_grid = mapGridPosition  player; _xx = (format[_grid]) select  [0,3];
			_yy = (format[_grid]) select  [3,3];
			_time = (round(120-(serverTime)/60));
			_hours = (floor(_time/60));
			_minutes = (_time - (_hours * 60));

			if (_dir >= 330 || _dir < 30) then
			{
				_dir = "N";
			};
			if (_dir >= 30 && _dir < 73) then
			{
				_dir = "NE";
			};
			if (_dir >= 73 && _dir < 118) then
			{
				_dir = "E";
			};
			if (_dir >= 118 && _dir < 163) then
			{
				_dir = "SE";
			};
			if (_dir >= 163 && _dir < 208) then
			{
				_dir = "S";
			};
			if (_dir >= 208 && _dir < 253) then
			{
				_dir = "SW";
			};
			if (_dir >= 253 && _dir < 298) then
			{
				_dir = "W";
			};
			if (_dir >= 298 && _dir < 330) then
			{
				_dir = "NW";
			};
			
			switch(_minutes) do
			{
				case 9: {_minutes = "09"};
				case 8: {_minutes = "08"};
				case 7: {_minutes = "07"};
				case 6: {_minutes = "06"};
				case 5: {_minutes = "05"};
				case 4: {_minutes = "04"};
				case 3: {_minutes = "03"};
				case 2: {_minutes = "02"};
				case 1: {_minutes = "01"};
				case 0: {_minutes = "00"};
			};

			//Color Gradient
			_colourDefault 	= parseText "#FBFCFE"; //Exile White - Defualt Color
			_colour90 		= parseText "#F5E6EC"; //
			_colour80 		= parseText "#F0D1DB"; //
			_colour70 		= parseText "#EBBBC9"; //
			_colour60 		= parseText "#E6A6B8"; //
			_colour50 		= parseText "#E191A7"; //
			_colour40 		= parseText "#DB7B95"; //
			_colour30 		= parseText "#D66684"; //
			_colour20 		= parseText "#D15072"; //
			_colour10 		= parseText "#CC3B61"; //
			_colour0 		= parseText "#C72650"; //Exile Red
			_colourDead 	= parseText "#000000";

			//Colour coding
			//Damage
			_colourDamage = _colourDefault;
			if(_damage >= 100) then{_colourDamage = _colourDefault;};
			if((_damage >= 90) && (_damage < 100)) then {_colourDamage =  _colour90;};
			if((_damage >= 80) && (_damage < 90)) then {_colourDamage =  _colour80;};
			if((_damage >= 70) && (_damage < 80)) then {_colourDamage =  _colour70;};
			if((_damage >= 60) && (_damage < 70)) then {_colourDamage =  _colour60;};
			if((_damage >= 50) && (_damage < 60)) then {_colourDamage =  _colour50;};
			if((_damage >= 40) && (_damage < 50)) then {_colourDamage =  _colour40;};
			if((_damage >= 30) && (_damage < 40)) then {_colourDamage =  _colour30;};
			if((_damage >= 20) && (_damage < 30)) then {_colourDamage =  _colour20;};
			if((_damage >= 10) && (_damage < 20)) then {_colourDamage =  _colour10;};
			if((_damage >= 1) && (_damage < 10)) then {_colourDamage =  _colour0;};
			if(_damage < 1) then{_colourDamage =  _colourDead;};

			//display the information
			((uiNamespace getVariable "RscExileStatusBar")displayCtrl 55554) ctrlSetStructuredText
			parseText
			format
			["
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.6'  shadowColor='#000000' image='GG\images\icons\players.paa' color='%7'/> %2</t>
				<t shadow='1' shadowColor='#000000' color='%10'><img size='1.0'  shadowColor='#000000' image='GG\images\icons\health.paa' color='%7'/> %3%1</t>
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.0'  shadowColor='#000000' image='GG\images\icons\poptab_ca.paa' color='%7'/> %4</t>
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.0'  shadowColor='#000000' image='GG\images\icons\exile.paa' color='%7'/> %6</t>
				<t shadow='1' shadowColor='#000000' color='%7'>FPS: %5</t>
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.0'  shadowColor='#000000' image='GG\images\icons\compass.paa' color='%7'/> %11</t>
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.6'  shadowColor='#000000' image='GG\images\icons\restart.paa' color='%7'/>%8:%9</t>",

						"%", // 1
						count playableUnits,// 2
						_damage,// 3
						_wallet,// 4
						_serverFPS,// 5
						_respect,// 6
						_colourDefault,// 7
						_hours,// 8
						_minutes,// 9
						_colourDamage,// 10
						_dir //11
			];
		};
	};
};
