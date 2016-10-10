params["_colorPaint"];

private["_smokeClass","_equippedMagazines","_displayName","_smokeattach"];

switch (_colorPaint) do { 
	case "White" : { 
		_smokeClass = "SmokeShell"; 			
		_texture = "\A3\Data_F\Flags\flag_white_co.paa";
	};	
	case "Red" : { 
		_smokeClass = "SmokeShellRed"; 			
		_texture = "\A3\Data_F\Flags\flag_red_co.paa";
	};	
	case "Green" : { 
		_smokeClass = "SmokeShellRGreen"; 		
		_texture = "\A3\Data_F\Flags\flag_green_co.paa";
	};	
	case "Blue" : { 
		_smokeClass = "SmokeShellBlue"; 		
		_texture = "\A3\Data_F\Flags\flag_blue_co.paa";
	};	
	case "Yellow" : { 
		_smokeClass = "SmokeShellYellow"; 	
		_texture = "GG\images\colors\flag_yellow_co.paa";
	};	
	case "Purple" : { 
		_smokeClass = "SmokeShellPurple"; 	
		_texture = "GG\images\colors\flag_purple_co.paa";
	};	
	case "Orange" : { 
		_smokeClass = "SmokeShellOrange"; 	
		_texture = "GG\images\colors\flag_orange_co.paa";
	};	
	default {}; 
};

closeDialog 0;

_equippedMagazines = magazines player;
if !(_smokeClass in _equippedMagazines) exitWith
{	
	_displayName = getText(configFile >> "CfgMagazines" >> _smokeClass >> 'displayName');
	[
		"ErrorTitleAndText", 
		["Base Paint", format["You need 2x %1 to Paint this object", _displayName]]
	] call ExileClient_gui_toaster_addTemplateToast;
	
};

_smokeattach1 = createVehicle [_smokeClass, position player, [], 0, "NONE"];
_smokeattach2 = createVehicle [_smokeClass, position player, [], 0, "NONE"];
_smokeattach1 attachto [player, [0.1,0.5,-0.2],"head"];
_smokeattach2 attachto [player, [-0.1,0.5,-0.2],"head"];

sleep 4;

deleteVehicle _smokeattach1;
deleteVehicle _smokeattach2;

ExileClientInteractionObject setObjectTexture [0, _texture];
ExileClientInteractionObject setObjectTexture [1, _texture];