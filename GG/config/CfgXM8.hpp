class CfgXM8
{
	extraApps[] = {"GG_VG","GG_CHVD","GG_Journal","GG_Quad","GG_Selfie","GG_Scan","GG_Chat","GG_Craft","GG_AirDrop","GG_kills"};
	
	class GG_VG 
	{
		title = "Virtual Garage";
		controlID = 50000;					//IDC:50000 -> 50015 || These need to be unique and out of range from each other 
		logo = "GG\ExAdClient\XM8\Apps\VG\Icon_VG.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\VG\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\VG\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\VG\onClose.sqf";
	};
	class GG_CHVD 
	{
		title = "View Distance Settings";
		controlID = 50200;					//IDC:50200 -> 50102 || These need to be unique and out of range from each other
		config = "GG\ExAdClient\XM8\Apps\CHVD\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\CHVD\Icon_CHVD.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\CHVD\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\CHVD\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\CHVD\onClose.sqf";
	};		
	class GG_Journal 
	{
		title = "Notepad";
		controlID = 50300;					//IDC:50300 -> 50305 || These need to be unique and out of range from each other
		config = "GG\ExAdClient\XM8\Apps\Journal\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\Journal\Icon_Journal.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\Journal\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\Journal\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\Journal\onClose.sqf";
	};
	class GG_Quad
	{
		title = "Deploy Quad";
		bambiState = 0;
		vehicleClass = "Exile_Bike_QuadBike_Fia";
		recipe[] = {{"Exile_Item_ExtensionCord",1}};
		packable = 1;
		autoCleanUp = 1;
		quickFunction = "['GG_Quad'] call ExAd_XM8_DV_fnc_spawnVehicle";
		logo = "GG\ExAdClient\XM8\Apps\DeployVehicle\icon_DeployVehicle.paa";
		config = "GG\ExAdClient\XM8\Apps\DeployVehicle\config.sqf";
	};
	class GG_Selfie
	{
		title = "Selfie";
		quickFunction = "['GG_Selfie'] spawn GG_fnc_selfie";
		logo = "GG\ExAdClient\XM8\Apps\Selfie\icon_Selfie.paa";
		config = "GG\ExAdClient\XM8\Apps\Selfie\config.sqf";
	};
	class GG_Scan
	{
		title = "Player Scan";
		config = "GG\ExAdClient\XM8\Apps\Scan\config.sqf";
		cooldownTime = 120; //cool down time on script in seconds (15 * 60 = 900) AKA 15 MINS
		scanDistance = 1000; //area sround player to scan in meters
		quickFunction = "['GG_Scan'] spawn ExAd_XM8_Scan_fnc_ScanPlayer";
		logo = "GG\ExAdClient\XM8\Apps\Scan\icon_Scan.paa";
	};
	class GG_Chat
	{
		title = "Private Chat";
		quickFunction = "createdialog 'infiSTAR_CHAT';";
		logo = "GG\ExAdClient\XM8\Apps\Chat\icon_Chat.paa";
	};
	class GG_Craft 
	{
		title = "Crafting Menu";
		controlID = 50400;
		config = "GG\ExAdClient\XM8\Apps\Crafting\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\Crafting\icon_Crafing.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\Crafting\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\Crafting\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\Crafting\onClose.sqf";
	};	
	class GG_AirDrop 
	{
		title = "Air Drop";
		controlID = 50500;
		config = "GG\ExAdClient\XM8\Apps\AirDrop\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\AirDrop\icon_AirDrop.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\AirDrop\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\AirDrop\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\AirDrop\onClose.sqf";
	};	
	class GG_kills
	{
		title = "Kill Board";
		quickFunction = "call XG_killboardClient";
		logo = "GG\ExAdClient\XM8\Apps\Kills\icon_Kills.paa";
	};
}; 