class CfgXM8 {
	//This slide use IDCs from 104140 to 104156
	class sideApps {
		controlID = 104140;
		title = "XM8 Apps";
		onLoadScript = "";
	};
	//This slide use IDCs from 105000 to 
	class craftSlide {
		controlID = 105000;
		title = "Crafting";
		onLoadScript = "GG\XM8_apps\apps\XM8_crafting\XM8_crafting_craftSlide_onLoad.sqf";
	};
	//This slide use IDCs from 106000 to 
	class territorySlide {
		controlID = 106000;
		title = "Territory";
		onLoadScript = "GG\XM8_apps\apps\XM8_territory\XM8_territory_territorySlide_onLoad.sqf";
	};
	//This slide use IDCs from 107000 to 
	class airDropSlide {
		controlID = 107000;
		title = "Air drop";
		onLoadScript = "GG\XM8_apps\apps\XM8_airDrop\XM8_airDrop_airDropSlide_onLoad.sqf";
	};
	//This slide use IDCs from 108000 to 
	class playerStatsSlide {
		controlID = 108000;
		title = "Player stats";
		onLoadScript = "GG\XM8_apps\apps\XM8_playerStats\XM8_playerStats_playerStatsSlide_onLoad.sqf";
	};
};