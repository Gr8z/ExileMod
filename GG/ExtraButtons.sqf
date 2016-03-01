waituntil {!isnull (finddisplay 46)};


player addEventHandler ["InventoryOpened", {

	_inventory = [] spawn {

		disableSerialization;

		waitUntil { !(isNull (findDisplay 602)) };

		_button1 = (findDisplay 602) ctrlCreate ["RscButtonMenu",44927];
		_button1 ctrlSetPosition  [20.5*(((safezoneW/safezoneH)min 1.2)/40)+(safezoneX+(safezoneW-((safezoneW/safezoneH)min 1.2))/2),
		25.1*((((safezoneW/safezoneH)min 1.2)/1.2)/25)+(safezoneY+(safezoneH-(((safezoneW/safezoneH)min 1.2)/1.2))/2),
		8.5*(((safezoneW/safezoneH)min 1.2)/40),
		1*((((safezoneW/safezoneH)min 1.2)/1.2)/25)];
		
		_button1 ctrlCommit 0;
		_button1 ctrlSetText "DEPLOY BIKE";
		_button1 buttonSetAction "[] execVM 'GG\xm8Apps\apps\spawn_bike.sqf';";
		
		_button2 = (findDisplay 602) ctrlCreate ["RscButtonMenu",44928];
		_button2 ctrlSetPosition  [30*(((safezoneW/safezoneH)min 1.2)/40)+(safezoneX+(safezoneW-((safezoneW/safezoneH)min 1.2))/2),
		25.1*((((safezoneW/safezoneH)min 1.2)/1.2)/25)+(safezoneY+(safezoneH-(((safezoneW/safezoneH)min 1.2)/1.2))/2),
		8.5*(((safezoneW/safezoneH)min 1.2)/40),
		1*((((safezoneW/safezoneH)min 1.2)/1.2)/25)];
		
		_button2 ctrlCommit 0;
		_button2 ctrlSetText "View Distance";
		_button2 buttonSetAction "[] call CHVD_fnc_openDialog;";

	};

}];