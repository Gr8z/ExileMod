ExAd_XM8_Selfie_fnc_TakeSelfie = {

	try
	{
		if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) exitWith {
		  throw "Selfie Failed, You are near a base.";
		};

		if (ExileClientPlayerIsInCombat) exitWith {
		 	throw "Selfie Failed, You are in combat.";
		};

		[] spawn {
			player enablesimulation false; 
			showCinemaBorder true;
			_camera = "camera" camCreate (player modelToWorld [1,1,2]);
			_camera cameraEffect ["Internal","TOP"];  
			_camera camSetTarget vehicle player;  
			_camera camSetRelPos [0,2,2];  
			_camera camCommit 5;  

			waitUntil {camCommitted _camera};
			cutText ['','WHITE IN'];
			playSound "cam";
			uiSleep 2;
			player enablesimulation true;
			_camera cameraEffect ["terminate","back"];
			camDestroy _camera;
		};

		["extraApps", 1] call ExileClient_gui_xm8_slide;
		closeDialog 0;
	}
	catch
	{
		[_exception] spawn {
			UISleep 0.5; 
			["ErrorTitleAndText", ["Selfie", _this select 0]] call ExileClient_gui_toaster_addTemplateToast;
			["extraApps", 1] call ExileClient_gui_xm8_slide;
		};
	};

};