/*
	Improved XM8 apps by vitaly'mind'chizhikov
	Official forum thread: 
	Original idea by Shix.
*/

XM8_apps_app1 = [
	"TERRITORY",
	"GG\XM8_apps\apps\XM8_territory\icons\territory.paa",
	{0 call XM8_territory_isInside},
	TRUE,
	"GG\XM8_apps\apps\XM8_territory\scripts\XM8_territory_init.sqf"
];
XM8_apps_app2 = [
	"AIR DROP",
	"GG\XM8_apps\apps\XM8_airDrop\icons\drop.paa",
	{["airDropSlide", 0] call ExileClient_gui_xm8_slide},
	TRUE,
	"GG\XM8_apps\apps\XM8_airDrop\scripts\XM8_airDrop_init.sqf"
];
XM8_apps_app3 = [
	"RECIPIES",
	"GG\XM8_apps\apps\XM8_crafting\icons\crafting.paa",
	{["craftSlide", 0] call ExileClient_gui_xm8_slide},
	TRUE,
	"GG\XM8_apps\apps\XM8_crafting\scripts\XM8_crafting_init.sqf"
];
XM8_apps_app4 = [
	"STATS",
	"GG\XM8_apps\apps\XM8_playerStats\icons\Stats.paa",
	{["playerStatsSlide", 0] call ExileClient_gui_xm8_slide},
	TRUE,
	"GG\XM8_apps\apps\XM8_playerStats\scripts\XM8_playerStats_init.sqf"
];

XM8_apps_app5 = [
	"PLAYER SCAN",
	"GG\XM8_apps\icons\radar.paa",
	{execVm "GG\XM8_apps\apps\playerScan.sqf"},
	false,
	""
];
XM8_apps_app6 = [
	"SELFIE",
	"GG\XM8_apps\icons\selfie.paa",
	{execVm "GG\XM8_apps\apps\selfie.sqf"},
	false,
	""
];
XM8_apps_app7 = [
	"SPAWN BIKE",
	"GG\XM8_apps\icons\bike.paa",
	{execVm "GG\XM8_apps\apps\spawn_bike.sqf"},
	false,
	""
];

XM8_apps_app8 = [
	"VIEW DISTANCE",
	"GG\XM8_apps\icons\binocs.paa",
	{[] call CHVD_fnc_openDialog;},
	false,
	""
];
XM8_apps_app9 = [
	"PRIVATE CHAT",
	"GG\XM8_apps\icons\chat.paa",
	{if(!isNil'fnc_chat_send')then{createdialog 'infiSTAR_CHAT';};true},
	false,
	""
];

/*
XM8_apps_app10 = [
	"App 10",
	"",
	{},
	false,
	""
];
XM8_apps_app11 = [
	"App 11",
	"",
	{},
	false,
	""
];
XM8_apps_app12 = [
	"App 12",
	"",
	{},
	false,
	""
];
XM8_apps_app13 = [
	"App 13",
	"",
	{},
	false,
	""
];
XM8_apps_app14 = [
	"App 14",
	"",
	{},
	false,
	""
];
XM8_apps_app15 = [
	"App 15",
	"",
	{},
	false,
	""
];
*/