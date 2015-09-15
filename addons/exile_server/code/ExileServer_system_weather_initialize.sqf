/*
	infiSTAR: This allows you to set multiple _staticTimes by just copy pasting the staticTime in your 
	CfgSettings >> Time and rename the pastes like
	staticTime1
	staticTime2
	and on.
	Kepp the normal staticTime as well.
*/
private["_useRealTime","_useStaticTime","_staticTime","_staticTimers","_changetime"];
call ExileServer_system_weather_thread_weatherSimulation;
_useRealTime = getNumber (configFile >> "CfgSettings" >> "Time" >> "useRealTime");
_useStaticTime = getNumber (configFile >> "CfgSettings" >> "Time" >> "useStaticTime");
if(_useStaticTime isEqualTo 1)then
{
	_staticTimers = [];
	_staticTime = getArray (configFile >> "CfgSettings" >> "Time" >> "staticTime");
	if!(_staticTime isEqualTo [])then{_staticTimers pushBack _staticTime};
	for "_i" from 1 to 9 do{
		_staticTime = getArray (configFile >> "CfgSettings" >> "Time" >> format["staticTime%1",_i]);
		if!(_staticTime isEqualTo [])then{_staticTimers pushBack _staticTime};
	};
	_staticTimersCount = count _staticTimers;
	_staticTime = _staticTimers select (floor(random _staticTimersCount));
	setDate _staticTime;
}
else
{
	if(_useRealTime isEqualTo 1)then
	{
		setDate ExileServerStartTime;
	};
};
forceWeatherChange;
_changetime = round(getNumber (configFile >> "CfgSettings" >> "Weather" >> "interval") * 60);
[_changetime, ExileServer_system_weather_thread_weatherSimulation, [], true] call ExileServer_system_thread_addTask;
true