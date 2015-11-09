/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
if (missionName isEqualTo "ExileIntro") then
{
	"Intro PreInit..." call ExileClient_util_log;
}
else 
{
	if (hasInterface) then
	{
		"Client PreInit..." call ExileClient_util_log;
		ExileClientSessionId = "";
		ExileClientLastDiedPlayerObject = objNull;
		ExileClientSafeZoneVehicle = objNull;
		ExileClientIsWaitingForServerTradeResponse = false;
		ExileClientXM8IsVisible = false;
		ExileClientXM8IsPowerOn = false;
		ExileClientXM8NextPossiblePowerToggleTime = diag_tickTime;
		ExileClientXM8CurrentSlide = "apps";
		ExileClientXM8IsMessageVisible = false;
		ExileClientXM8IsWarningVisible = false;
		ExileClientXM8IsConfirmVisible = false;
		ExileClientXM8InputBoxFocused = false;
		ExileClientLoginHasPlayerResponse = nil;
		ExileClientSkipNextRespawnEvent = true;
		ExileClientBleedOutThread = -1;
		ExileClientLastLocation = "";
		ExileClientIsAutoRunning = false;
		ExileClientClanName = "";
		ExileClientPartyID = -1;
		ExileClientPendingPartyInvitionGroup = objNull;
		ExileClientCurrentInventoryContainer = objNull;
		ExilePlayerInSafezone = false;
		ExileClientLastVehicle = objNull;
		ExileClientEndBambiStateThread = -1;
		ExileClientDeliriumThread = -1;
		ExileClientHiveIsInitializing = false;
		ExileClientSelectedInventoryItem = nil;
		ExileClientPlayerIsSpawned = false;
		ExileClientLastStatusIconBlinkAt = diag_tickTime;
		ExileClientStatusIconsVisible = false;
		ExileClientInventoryOpened = false;
		ExileClientShowHUDDetails = false;
		ExileClientPlayerIsInjured = false;
		ExileClientEarplugsInserted = false;
		ExileClientInteractionObject = objNull;
		ExileClientInteractionHandles = [];
		ExileClientConstructionMode = 1;
		ExileClientConstructionConfig = objNull;
		ExileClientConstructionShowHint = true;
		ExileClientIsInConstructionMode = false; 
		ExileClientConstructionOffset = [0, 5, 1];
		ExileClientConstructionPosition = [0, 0, 0];
		ExileClientConstructionRotation = 0;
		ExileClientConstructionStartPosition = [0, 0, 0];
		ExileClientConstructionObject = objNull; 
		ExileClientConstructionKitClassName = ""; 
		ExileClientConstructionObjectDisplayName = ""; 
		ExileClientConstructionResult = 0;
		ExileClientConstructionProcess = 0;
		ExileClientConstructionBoundingRadius = 0;
		ExileClientConstructionPossibleSnapPositions = [];
		ExileClientConstructionSnapToObjectClassNames = [];
		ExileClientConstructionSupportSnapMode = false;
		ExileClientConstructionIsSnapped = false;
		ExileClientConstructionCanPlaceObject = false;
		ExileClientConstructionCurrentSnapToObject = objNull;
		ExileClientConstructionIsInSelectSnapObjectMode = false;
		ExileClientConstructionModePhysx = false;
		ExileClientConstructionLock = false;
		ExileClientConstructionGrid = [1, 1, 0.25];
		ExileClientNotificationQueue = [];
		ExileClientNotificationSlides = [0,1,2,3,4,5,6,7,8,9];
		ExileClientNotificationIsShown = false;
		ExileClientNotificationRun = diag_tickTime;
		ExileLockIsShown = false;
		ExileGuiControlClick = false;
		ExileClientParachuteNoFallDamage = false;
		[] call ExileClient_system_map_initialize;
		[] call ExileClient_object_player_stats_reset;
		[] call ExileClient_gui_postProcessing_initialize;
		[] call ExileClient_gui_hud_event_hook;
		[] call ExileClient_system_thread_initialize;
		if (isMultiplayer) then
		{
			if!(getRemoteSensorsDisabled)then
			{
				disableRemoteSensors true;
			};
			[] spawn 
			{
				waitUntil { !(isNull player) };
				[] execFSM "exile_client\fsm\login.fsm";
				true
			};
		}
		else 
		{
		};
	};
};
true