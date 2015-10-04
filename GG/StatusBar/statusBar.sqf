waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "osefStatusBarAdmin" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBarAdmin","PLAIN"];
[] spawn 
{
	uiSleep 5;
	//set the color values.
	//Additional color codes can be found here:  http://html-color-codes.com/
	_colourDefault 	= parseText "#adadad"; //set your default colour here
	_colour108		= parseText "#FF7000";
	_colour107		= parseText "#FF9000";
	_colour106		= parseText "#FFBB00";
	_colour105		= parseText "#FFCC00";
	_colour104		= parseText "#81CCDD";
	_colour103		= parseText	"#33AACC";
	_colour102		= parseText "#3388CC";
	_colour101		= parseText "#3366CC";
	_colour100 		= parseText "#336600";
	_colour90 		= parseText "#339900";
	_colour80 		= parseText "#33CC00";
	_colour70 		= parseText "#33FF00";
	_colour60 		= parseText "#66FF00";
	_colour50 		= parseText "#CCFF00";
	_colour40 		= parseText "#CCCC00";
	_colour30 		= parseText "#CC9900";
	_colour20 		= parseText "#CC6600";
	_colour10 		= parseText "#CC3300";
	_colour0 		= parseText "#CC0000";
	_colourDead 	= parseText "#000000";
		
	while {true} do 
	{
	
		uiSleep 1;
				
		//moved the creation of the status bar inside the loop and create it if it is null,
		//this is to handle instance where the status bar is disappearing 
		if(isNull ((uiNamespace getVariable "osefStatusBarAdmin")displayCtrl 55554)) then
		{
			diag_log "statusbar is null create";
			disableSerialization;
			_rscLayer = "osefStatusBarAdmin" call BIS_fnc_rscLayer;
			_rscLayer cutRsc["osefStatusBarAdmin","PLAIN"];
		};		
		
		//initialize variables and set values
		_unit = _this select 0;
		_damage = round ((1 - (damage player)) * 100);
		_wallet = ExileClientPlayerMoney;
		_stamina = ExileClientPlayerScore;
		_serverFPS = round diag_fps;
		_time = (round(120-(serverTime)/60));
		_hours = (floor(_time/60));
		_minutes = (_time - (_hours * 60));
		
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
		
		
		//Colour coding
		//Damage
		_colourDamage = _colourDefault;
		if(_damage >= 100) then{_colourDamage = _colour100;};
		if((_damage >= 90) && (_damage < 100)) then {_colourDamage =  _colour100;};
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
		((uiNamespace getVariable "osefStatusBarAdmin")displayCtrl 55554)ctrlSetStructuredText parseText 
		format["
			<t shadow='1' shadowColor='#000000' color='%6'><img size='1.6'  shadowColor='#000000' image='GG\statusbar\icons\players.paa' color='%6'/> %2</t>
			<t shadow='1' shadowColor='#000000' color='%7'><img size='1.0'  shadowColor='#000000' image='GG\statusbar\icons\health.paa' color='%7'/> %3%1</t> 
			<t shadow='1' shadowColor='#000000' color='%6'><img size='1.0'  shadowColor='#000000' image='GG\statusbar\icons\poptab.paa' color='%6'/> %4</t> 
			<t shadow='1' shadowColor='#000000' color='%6'><img size='1.0'  shadowColor='#000000' image='GG\statusbar\icons\exile.paa' color='%6'/> %8</t> 
			<t shadow='1' shadowColor='#000000' color='%6'>FPS: %5</t>
			<t shadow='1' shadowColor='#000000' color='%6'><img size='1.6'  shadowColor='#000000' image='GG\statusbar\icons\restart.paa' color='%6'/>%9:%10</t>
			",
			"%", 
			count playableUnits,
			_damage,
			_wallet, 
			_serverFPS, 
			_colourDefault,
			_colourDamage,
			_stamina,
			_hours,
			_minutes					 
		];
		
	}; 
};
