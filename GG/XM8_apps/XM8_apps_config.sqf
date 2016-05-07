/*
	Improved XM8 apps by vitaly'mind'chizhikov
	Official forum thread: 
	Original idea by Shix.
*/

/*
Example
XM8_apps_app1 = [
	"Deploy Bike", //Text displayed on app button
	"deployBike\bikeIcon.paa", //Icon displayd on app button
	{execVM "deployBike\deploy_bike.sqf";}, //Script executed when app button pressed
	FALSE, //FALSE if this is legacy app. TRUE if this app is compatible with Improved XM8 apps.
	"" //Empty string ("") for legacy apps. Path to scripts init file for applications, compatible with Improved XM8 apps
];
XM8_apps_app2 = [
	"Example app",
	"XM8_apps\apps\XM8_exampleApp\icons\exampleIcon.paa",
	{["exampleSlide_1", 0] call ExileClient_gui_xm8_slide},
	TRUE,
	"XM8_apps\apps\XM8_exampleApp\scripts\XM8_exampleApp_init.sqf"
];
Comment out apps, that you dont use.
If you dont have icon, use default one "XM8_apps\icons\generic_app.paa"
Always use full path from mission root folder
*/

XM8_apps_app1 = [
	"Territory",
	"GG\XM8_apps\apps\XM8_territory\icons\territory.paa",
	{0 call XM8_territory_isInside},
	TRUE,
	"GG\XM8_apps\apps\XM8_territory\scripts\XM8_territory_init.sqf"
];
XM8_apps_app2 = [
	"Air drop",
	"GG\XM8_apps\apps\XM8_airDrop\icons\drop.paa",
	{["airDropSlide", 0] call ExileClient_gui_xm8_slide},
	TRUE,
	"GG\XM8_apps\apps\XM8_airDrop\scripts\XM8_airDrop_init.sqf"
];
XM8_apps_app3 = [
	"Crafting",
	"GG\XM8_apps\apps\XM8_crafting\icons\crafting.paa",
	{["craftSlide", 0] call ExileClient_gui_xm8_slide},
	TRUE,
	"GG\XM8_apps\apps\XM8_crafting\scripts\XM8_crafting_init.sqf"
];
XM8_apps_app4 = [
	"Player stats",
	"GG\XM8_apps\apps\XM8_playerStats\icons\Stats.paa",
	{["playerStatsSlide", 0] call ExileClient_gui_xm8_slide},
	TRUE,
	"GG\XM8_apps\apps\XM8_playerStats\scripts\XM8_playerStats_init.sqf"
];
/*
XM8_apps_app5 = [
	"App 5",
	"",
	{},
	false,
	""
];
XM8_apps_app6 = [
	"App 6",
	"",
	{},
	false,
	""
];
XM8_apps_app7 = [
	"App 7",
	"",
	{},
	false,
	""
];
XM8_apps_app8 = [
	"App 8",
	"",
	{},
	false,
	""
];
XM8_apps_app9 = [
	"App 9",
	"",
	{},
	false,
	""
];
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