private ["_camera"];

if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) exitWith {
  (findDisplay 24015) closeDisplay 0;
  ["Whoops", ["Selfie Failed, You are near a base."]] call ExileClient_gui_notification_event_addNotification;
};

if (ExileClientPlayerIsInCombat) exitWith {
	(findDisplay 24015) closeDisplay 0;
 	["Whoops", ["Selfie Failed, You are in combat."]] call ExileClient_gui_notification_event_addNotification;
};

playSound "intro";
(findDisplay 24015) closeDisplay 0;
player enablesimulation false; 
showCinemaBorder true;
_camera = "camera" camCreate (position player);
_camera cameraEffect ["internal","back"];
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,5,2];
_camera camCommit 10;
waitUntil {camCommitted _camera};
player enablesimulation true; 
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
showHUD [true,true,true,true,true,true,false,true];