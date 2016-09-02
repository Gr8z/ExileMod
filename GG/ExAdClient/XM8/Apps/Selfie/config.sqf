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

			_ranNumArr = ['1','2','3','4','5','6','7','8','9','0'];
			a1 = _ranNumArr call BIS_fnc_selectRandom;
			a2 = _ranNumArr call BIS_fnc_selectRandom;
			a3 = _ranNumArr call BIS_fnc_selectRandom;
			XM8_airDrop_a1a2a3 = a1+a2+a3;

			_filepath = "GG\Selfie\GG"+ round(random 1000) +".png";
			_filepathFull = "Documents\Arma 3 - Other Profiles\"+ name player +"\Screenshots\"+_filepath;
			screenshot _filepath;

			uiSleep 2;
			player enablesimulation true;
			_camera cameraEffect ["terminate","back"];
			camDestroy _camera;

			2 cutText [format["Selfie Saved at %1", _filepathFull], "PLAIN DOWN", 1];
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