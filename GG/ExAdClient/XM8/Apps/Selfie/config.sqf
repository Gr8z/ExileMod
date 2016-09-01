ExAd_XM8_Selfie_TakeSelfie = {

	private ["_camera"];

	if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) exitWith {
	  (findDisplay 24015) closeDisplay 0;
	  ["Whoops", ["Selfie Failed, You are near a base."]] call ExileClient_gui_notification_event_addNotification;
	};

	if (ExileClientPlayerIsInCombat) exitWith {
		(findDisplay 24015) closeDisplay 0;
	 	["Whoops", ["Selfie Failed, You are in combat."]] call ExileClient_gui_notification_event_addNotification;
	};

	(findDisplay 24015) closeDisplay 0;
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