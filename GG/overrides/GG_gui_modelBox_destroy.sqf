/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
ExileClientModelBoxCamera cameraEffect ["terminate", "back"];
terminate ExileClientModelThreadHandle;
{
	clearBackpackCargoGlobal _x;
	clearItemCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearWeaponCargoGlobal _x;
	deleteVehicle _x;
} forEach [ExileClientModelBoxVehicle,ExileClientModelBoxCameraFocusObject,ExileClientModelBoxBackgroundObject];
camDestroy ExileClientModelBoxCamera;