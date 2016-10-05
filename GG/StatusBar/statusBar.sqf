waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "GGStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["GGStatusBar","PLAIN"];

uiSleep 5;

tipsArray = [
    "Check out the marketplace, at trade zones, where you can buy/sell items from/to players.",
	"If you find all four prisoners magazines, you can craft them into an item worth 250k poptabs.",
	"To craft a quadbike, go into the XM8 apps page. You need an extension cord to deploy a quad.",
	"To repair vehicle wheels, you will need a wrench and wheel, in your inventory.",
	"To repair a helicopter, you will need screws, junk metal, duct tape, and a wrench.",
	"Player scans will scan for enemy players in a radius of 1 kilometer. Players with their 8G network turned off will not show up.",
	"Take a selfie to show off your character/base/vehicle/etc. Upload them to the website for competitions and bragging rights.",
	"Call in an airdrop to save you a trip to the trader. These come in 3 tiers, cost pop tabs and the loot in them is random.",
	"To see the most recent kills on the server, go into the XM8 apps page.",
	"On the XM8 apps page, in the crafting app, you can see everything you can craft on the server.",
	"You can lockpick safes utilizing knifes.",
	"Knifes are really useful! Use them to hotwire locked vehicles and lockpick safes.",
	"You can add extra protection to your gear by rigging your safes with Claymore explosives. Look out for the scrollwheel option.",
	"Players can’t steal vehicles/inventory/gear, in a safe zone, with our anti theft script.",
	"ATMs are located around the map, and labeled with the ‘$’ icon.",
	"A players ATM bank limit is 500k. You can find ATM’s at the ‘$’ on the map.",
	"You can store different amounts of money in any vehicle/container. Safes hold up to 30k pop tabs.",
	"Join our website, ts, steam group, and discord to get free 10k pop tabs.",
	"Have a suggestion? Please let us know on our website at ghostzgamerz.com.",
	"Find a bug/glitch? Please let us know on our website at ghostzgamerz.com.",
	"Want to be a part of the staff team? Apply on our website at ghostzgamerz.com.",
	"Check out our changelog for recent changes and fixes, located on our website.",
	"Need some help, or have a question? Hop on our teamspeak at ts.ghostzgamerz.com",
	"You can come to our Teamspeak, or Discord server for some quick in game support. Just look for the support channels there and a staff member will sort you out.",
	"Respect your fellow players and admins.",
	"Impersonating staff is not tolerated.",
	"All vehicles parked in a safe zone will unlock after restart.",
	"No ramming in safe zones.",
	"No kamikazing in safe zones.",
	"You may not build anywhere within 1000 meters from trader cities.",
	"You may not build on a major bridge which is over a mass of water.",
	"Hacking bases require a minimum of 15 players online.",
	"You are not allowed to kamikaze a base using an air vehicle.",
	"All dead bodies will be deleted after 15 minutes.",
	"All dead bodies, near a spawn town, will be deleted in 5 minutes.",
	"Unsold marketplace items will be deleted in 15 days.",
	"Empty containers will be deleted after 2 days.",
	"Vehicles will be deleted after 5 days of inactivity.",
	"All vehicle pincodes will be reset to 0000 after 3 days of inactivity.",
	"All safe pincodes will be reset to 0000 after 7 days of inactivity.",
	"Any base territory will be deleted 7 days after the last territory protection payment.",
	"All containers, including safes, without a territory, will be deleted if not used for 10 days.",
	"All constructions, without a territory, will be deleted if not used for 2 days.",
	"All stolen base pin codes will reset to 0000, if not paid, in ransom, in 2 days.",
	"All stolen, unpaid, territories will be deleted in 3 days.",
	"If you see someone breaking the rules, please capture a screenshot, or record a video. Report it on our forums, or teamspeak.",
	"All violations can be reported, via a support ticket or on the forums.",
	"English only on side chat.",
	"No voice on sidechat.",
	"No excessive vulgar language, sexual comments, racism, homophobic slurs, health threats, or life insults.",
	"We cannot guarantee a refund if you do not show screenshot, photo or video proof.",
	"Screenshots and videos are essential for compensation. Record your gameplay or take screens with the steam overlay by pressing F12.",
	"We can refund you in the event of a server bug, crash, or failure regarding GG equipment.",
	"You can blow up territory walls with base explosives. Each wall takes 3 charges of the specific type to be destroyed.",
	"You can hack into a territories virtual garage using a laptop, to steal a random vehicle from it.",
	"Three breaching charges (wood) are required to blow up a wood wall. Placing 1 breaching charge takes 3 minutes.",
	"Three breaching charges (metal) are required to blow up a metal wall. Placing 1 breaching charge takes 4 minutes.",
	"Three breaching charges (big momma) are required to blow up a concrete wall. Placing 1 breaching charge takes 5 minutes.",
	"Upgrading your territory is done at traders and costs poptabs, you also need a certain amount of respect per level.",
	"Make sure you read our rules which can be found on the website and accessed through the XM8.",
	"An updated list of upgrade levels, item count, radius and prices for territories can be found within the rules.",
	"Take screenshots of your progress when you feel like you hit a milestone so we can comp you easily, this game is full of bugs!",
	" Report any glitches you find instead of abusing them as it is more rewarding and helps you avoid punishment.",
	"Join every day to get your daily reward! It can be anything from items, to tabs and even respect!",
	"Set up your custom action 1 and 2 controls to lock / unlock vehicles and set 3D markers with the press of a button.",
	"Create or join a family with your friends to always be in a group with them and see their markers even when they’re offline.",
	"Do not park vehicles on exile wood structures, this is known to blow them up upon restarts.",
	"You can store your vehicles in your virtual garage to protect them from griefers that would blow them up, or steal them.",
	"There’s a lot of things to do! Go do a mission, capture a battlezone, play russian roulette, visit the Radiation Zone, just to mention a few. ",
	"Take note that buying certain gear will require a certain level of respect.",
	"If you’re looking for suppressors, ghillie suits, explosives, and high caliber guns, head over to Spec Ops Trader.",
	"If you’re looking to buy a bigger caliber gun you will have to pay a visit to the Spec Ops trader.",
	"Being a loner can be hard. Grouping up with other players will mostly contribute to your gaming experience. To meet new people, get active in the community. Find new friends on our website, teamspeak, or discord.",
	"Aerial vehicles can only be bought at the aircraft traders, marked on the map with a plane icon.",
	"Foolboxes are needed for crafting; for example breaching charges.",
	"To craft a wood wall you will need a cordless screwdriver, a handsaw, a workbench, screws, and a workbench near you.",
	"Use fortification upgrade kits to make your base more safe. You can find them at missions or craft them.",
	"Concrete is a valued resource, and more durable than wood or metal parts. Find it at missions or craft it at cement mixers marked on the map.",
	"Use the jungle to appear and disappear in the middle of combat. Tanoas landscape is perfect for guerilla style gameplay.",
	"Log out in time before the server restarts, or risk losing your gear. 4-5 minutes to restart is the closest we can recommend.",
	"Have a complaint or suggestion? Make use of our active community and visit www.GhostzGamerz.com for reporting any issues!",
	"Certain vehicles require certain respect levels to buy them.",
	"Use a mine detector to have a chance on de-fusing a safe that has been rigged with explosives.",
	"Raiding bases can be fun and profitable. There’s a few things a true raider should carry on him, from knifes to laptops, thermal scanners, mine detectors and breaching charges.",
	"Before you head out to build, please check the XM8 Rules or the Rules provided at www.ghostzgamerz.com to avoid conflicting with our building rules.",
	"To prevent your base from de-spawning, you will have to pay protection money every 7 days. You can do so at the Offices located in any trader city.",
	"Looking for some quick money? You can steal people’s flags and sell it for a ransom at traders.",
	"Some Battlezones and Missions spawn armed vehicles that can’t be found anywhere else in the server - not even be bought.",
	"All mission/battlezone vehicles are non-persistent, meaning they will be gone after restart. Use a code lock to claim them and turn them into persistent vehicles.",
	"Be careful around military bases marked on map with a red diamond. Every restart, a couple of AI soldiers spawns there to protect it!",
	"Be kind to other players - you might end up needing a favor from someone sometimes!",
	"Homeless? Looking to build a base? All you need can be bought at traders - base flag, axe, handsaw, cordless screwdriver & co. Don’t forget to bulk up on screws!",
	"Our server depends on Donations. If you want to help keeping it up visit www.ghostzgamerz.com. We appreciate every contribution"
];

GG_fnc_statusBar = {
	
	if !(visibleMap) then {

	    GG_text_tips = nil;

	    _colourDefault  = parseText "#ffffff";
	    _colourExtra    = parseText "#38bee1";
	    _colour108      = parseText "#FF7000";
	    _colour107      = parseText "#FF9000";
	    _colour106      = parseText "#FFBB00";
	    _colour105      = parseText "#FFCC00";
	    _colour104      = parseText "#81CCDD";
	    _colour103      = parseText "#33AACC";
	    _colour102      = parseText "#3388CC";
	    _colour101      = parseText "#3366CC";
	    _colour100      = parseText "#336600";
	    _colour90       = parseText "#339900";
	    _colour80       = parseText "#33CC00";
	    _colour70       = parseText "#33FF00";
	    _colour60       = parseText "#66FF00";
	    _colour50       = parseText "#CCFF00";
	    _colour40       = parseText "#CCCC00";
	    _colour30       = parseText "#CC9900";
	    _colour20       = parseText "#CC6600";
	    _colour10       = parseText "#CC3300";
	    _colour0        = parseText "#CC0000";
	    _colourDead     = parseText "#000000";

	    if(isNull ((uiNamespace getVariable "GGStatusBar")displayCtrl 55554)) then
	    {
	        diag_log "statusbar is null create";
	        disableSerialization;
	        _rscLayer = "GGStatusBar" call BIS_fnc_rscLayer;
	        _rscLayer cutRsc["GGStatusBar","PLAIN"];
	    };      

	    _unit = _this select 0;
	    _damage = round ((1 - (damage player)) * 100);
	    _hunger = round (ExileClientPlayerAttributes select 2);
	    _thirst = round (ExileClientPlayerAttributes select 3);
	    _wallet = (player getVariable ["ExileMoney", 0]);
	    _stamina = ExileClientPlayerScore;
	    _energy = 100;
	    _energyPercent = 100;
	    _serverFPS = round diag_fps;
	    _pos = getPosATL player;
	    _dir = round (getDir (vehicle player));
	        _grid = mapGridPosition  player; _xx = (format[_grid]) select  [0,3]; 
	    _yy = (format[_grid]) select  [3,3];  
	    _time = (round(180-(serverTime)/60));
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

	    //Hunger
	    _colourHunger = _colourDefault;
	    if(_hunger >= 100) then{_colourHunger = _colour100;};
	    if((_hunger >= 90) && (_hunger < 100)) then {_colourHunger =  _colour90;};
	    if((_hunger >= 80) && (_hunger < 90)) then {_colourHunger =  _colour80;};
	    if((_hunger >= 70) && (_hunger < 80)) then {_colourHunger =  _colour70;};
	    if((_hunger >= 60) && (_hunger < 70)) then {_colourHunger =  _colour60;};
	    if((_hunger >= 50) && (_hunger < 60)) then {_colourHunger =  _colour50;};
	    if((_hunger >= 40) && (_hunger < 50)) then {_colourHunger =  _colour40;};
	    if((_hunger >= 30) && (_hunger < 40)) then {_colourHunger =  _colour30;};
	    if((_hunger >= 20) && (_hunger < 30)) then {_colourHunger =  _colour20;};
	    if((_hunger >= 10) && (_hunger < 20)) then {_colourHunger =  _colour10;};
	    if((_hunger >= 1) && (_hunger < 10)) then {_colourHunger =  _colour0;};
	    if(_hunger < 1) then{_colourHunger =  _colourDead;};
	             
	    //Thirst
	    _colourThirst = _colourDefault;     
	    switch true do{
	        case(_thirst >= 100) : {_colourThirst = _colour101;};
	        case((_thirst >= 90) && (_thirst < 100)) :  {_colourThirst =  _colour102;};
	        case((_thirst >= 80) && (_thirst < 90)) :  {_colourThirst =  _colour103;};
	        case((_thirst >= 70) && (_thirst < 80)) :  {_colourThirst =  _colour104;};
	        case((_thirst >= 60) && (_thirst < 70)) :  {_colourThirst =  _colour105;};
	        case((_thirst >= 50) && (_thirst < 60)) :  {_colourThirst =  _colour106;};
	        case((_thirst >= 40) && (_thirst < 50)) :  {_colourThirst =  _colour107;};
	        case((_thirst >= 30) && (_thirst < 40)) :  {_colourThirst =  _colour108;};
	        case((_thirst >= 20) && (_thirst < 30)) :  {_colourThirst =  _colour20;};
	        case((_thirst >= 10) && (_thirst < 20)) :  {_colourThirst =  _colour10;};
	        case((_thirst >= 1) && (_thirst < 10)) :  {_colourThirst =  _colour0;};
	        case(_thirst < 1) : {_colourThirst =  _colourDead;};
	    };

	    //Energy
	    _colourEnergy = _colourDefault;
	    if(_energyPercent >= 100) then{_colourEnergy = _colour100;};
	    if((_energyPercent >= 90) && (_energyPercent < 100)) then {_colourEnergy =  _colour90;};
	    if((_energyPercent >= 80) && (_energyPercent < 90)) then {_colourEnergy =  _colour80;};
	    if((_energyPercent >= 70) && (_energyPercent < 80)) then {_colourEnergy =  _colour70;};
	    if((_energyPercent >= 60) && (_energyPercent < 70)) then {_colourEnergy =  _colour60;};
	    if((_energyPercent >= 50) && (_energyPercent < 60)) then {_colourEnergy =  _colour50;};
	    if((_energyPercent >= 40) && (_energyPercent < 50)) then {_colourEnergy =  _colour40;};
	    if((_energyPercent >= 30) && (_energyPercent < 40)) then {_colourEnergy =  _colour30;};
	    if((_energyPercent >= 20) && (_energyPercent < 30)) then {_colourEnergy =  _colour20;};
	    if((_energyPercent >= 10) && (_energyPercent < 20)) then {_colourEnergy =  _colour10;};
	    if((_energyPercent >= 1) && (_energyPercent < 10)) then {_colourEnergy =  _colour0;};
	    if(_energyPercent < 1) then{_colourEnergy =  _colour0;};


	    //Stamina
	    _colourStamina = _colourDefault;

	    //display the information 
	    ((uiNamespace getVariable "GGStatusBar")displayCtrl 55554)ctrlSetStructuredText parseText 
	    format["
	        <t color='%10'><img size='1.6' image='GG\images\icons\players.paa' color='%19'/> %2</t>
	        <t color='%10'><img size='1.0' image='GG\images\icons\health.paa' color='%19'/> %3%1</t> 
	        <t color='%10'><img size='1.0' image='GG\images\icons\poptab_ca.paa' color='%19'/> %4</t> 
	        <t color='%10'><img size='1.6' image='GG\images\icons\hunger.paa' color='%19'/> %5%1</t> 
	        <t color='%10'><img size='1.6' image='GG\images\icons\thirst.paa' color='%19'/> %6%1</t> 
	        <t color='%10'><img size='1.0' image='GG\images\icons\exile.paa' color='%19'/> %9</t>
	        <t color='%10'>FPS:  %7</t>
	        <t color='%10'><img size='1.6' image='GG\images\icons\restart.paa' color='%19'/>%17:%18</t>",
	        "%", 
	        ((playersNumber west)+(playersNumber east)+(playersNumber civilian)+(playersNumber resistance)),
	        _damage,
	        _wallet,
	        _hunger, 
	        _thirst, 
	        _serverFPS, 
	        _energyPercent, 
	        _stamina, 
	        _colourDefault,
	        _colourDamage,
	        _colourHunger,
	        _colourThirst,
	        _colourEnergy,
	        _colourStamina,
	        format["%1/%2",_xx,_yy],
	        _hours,
	        _minutes,
	        _colourExtra
	    ];
	} else {

	    if (isNil "GG_text_tips") then {
	        GG_text_tips = tipsArray select (random (count tipsArray - 1));
	    };
	    ((uiNamespace getVariable "GGStatusBar")displayCtrl 55554)ctrlSetStructuredText parseText format["<t size='1.2' font='PuristaMedium'>%1</t>",GG_text_tips];
	};
};

waitUntil {!isNil 'GG_fnc_statusBar'};
statusBarRefresh = [0.30, GG_fnc_statusBar, [], true] call ExileClient_system_thread_addtask;