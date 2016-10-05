class CfgInteractionMenus {
	class Car {
		targetType = 2;
		target = "Car";
		
		class Actions {
			class ScanLock : ExileAbstractAction {
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !ExilePlayerInSafezone && ((locked ExileClientInteractionObject) != 1)";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			class Lock : ExileAbstractAction {
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			
			class Unlock : ExileAbstractAction {
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			
			class ClaimVehicle : ExileAbstractAction {
				title = "Claim Vehicle";
				condition = "(locked ExileClientInteractionObject) == 1";
				action = "call ExileClient_ClaimVehicles_network_claimRequestSend";
			};
			
			class ReplaceWheels : ExileAbstractAction {
				title = "Repair wheel";
				condition = "true";
				action = "_this call GG_fnc_repairVehicle_repairWheels";
			};
			
			class ScavengeWheels : ExileAbstractAction {
				title = "Salvage wheel";
				condition = "!(call ExAd_XM8_DV_fnc_canPack)";
				action = "_this call GG_fnc_repairVehicle_scavengeWheel";
			};
			
			class RepairBody : ExileAbstractAction {
				title = "Repair body";
				condition = "true";
				action = "_this call GG_fnc_repairVehicle_vehicleRepairCar";
			};
			
			class Hotwire : ExileAbstractAction {
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
			
			class Flip : ExileAbstractAction {
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};
			
			class Refuel : ExileAbstractAction {
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};
			
			class DrainFuel : ExileAbstractAction {
				title = "Drain Fuel";
				condition = "(call ExileClient_object_vehicle_interaction_show) && !(call ExAd_XM8_DV_fnc_canPack)";
				action = "_this call ExileClient_object_vehicle_drain";
			};
			
			class PackDeployedVehicle : ExileAbstractAction {
				title = "Pack Vehicle";
				condition = "call ExAd_XM8_DV_fnc_canPack";
				action = "call ExAd_XM8_DV_fnc_pack";
			};
		};
	};
	
	class Air {
		target = "Air";
		targetType = 2;
		
		class Actions {
			class ScanLock : ExileAbstractAction {
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && ((locked ExileClientInteractionObject) != 1) && !ExilePlayerInSafezone";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			class Lock : ExileAbstractAction {
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			
			class Unlock : ExileAbstractAction {
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			
			class Hotwire : ExileAbstractAction {
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
			
			class ClaimVehicle : ExileAbstractAction {
				title = "Claim Vehicle";
				condition = "(locked ExileClientInteractionObject) == 1";
				action = "call ExileClient_ClaimVehicles_network_claimRequestSend";
			};
			
			class RepairFull : ExileAbstractAction {
				title = "Repair";
				condition = "true";
				action = "_this call GG_fnc_repairVehicle_repairchopper";
			};
			
			class Flip : ExileAbstractAction {
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};
			
			class Refuel : ExileAbstractAction {
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};
			
			class DrainFuel : ExileAbstractAction {
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};
			
			class RotateLeft : ExileAbstractAction {
				title = "Rotate Left";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "[ExileClientInteractionObject,-15] call ExileClient_object_vehicle_rotate";
			};
			
			class RotateRight : ExileAbstractAction {
				title = "Rotate Right";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "[ExileClientInteractionObject,15] call ExileClient_object_vehicle_rotate";
			};
		};
	};
	
	class Safe {
		targetType = 2;
		target = "Exile_Container_Safe";
		
		class Actions {
			class ScanLock : ExileAbstractAction {
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 1) && !ExilePlayerInSafezone";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			class Lock : ExileAbstractAction {
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			
			class Unlock : ExileAbstractAction {
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			
			class Pack : ExileAbstractAction {
				title = "Pack";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_container_pack";
			};
			
			class SetPinCode : ExileAbstractAction {
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
			
			class RaidSafe : ExileAbstractAction {
				title = "Attempt Lockpicking";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "[ExileClientInteractionObject,'safe'] execVM 'GG\HEG_Xbrm_client\functions\Xbrm_lockpick_init.sqf'";
			};
			
			class TrapSafe : ExileAbstractAction {
				title = "Rig With Explosives";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "ExileClientInteractionObject execVM 'GG\HEG_Xbrm_client\functions\addTrap.sqf'";
			};
			
			class ScanSafe : ExileAbstractAction {
				title = "Scan For Explosives";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "ExileClientInteractionObject execVM 'GG\HEG_Xbrm_client\functions\scanTrap.sqf'";
			};
		};
	};
	
	class ATM {
		targetType = 2;
		target = "Land_Atm_01_F";
		
		class Actions {
			class Locker : ExileAbstractAction {
				title = "Bank";
				condition = "true";
				action = "_this call ExileClient_gui_lockerDialog_show";
			};
		};
	};
	
	class Laptop {
		targetType = 2;
		target = "Exile_Construction_Laptop_Static";
		
		class Actions {
			class CameraSystem : ExileAbstractAction {
				title = "CCTV Access";
				condition = "((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5)";
				action = "_this call ExileClient_gui_baseCamera_show";
			};
			
			class StopHack : ExileAbstractAction {
				title = "Interupt Hack";
				condition = "(((([ExileClientInteractionObject, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) < ExAd_VG_ACCESS_LEVEL) && ((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5))";
				action = "_this spawn ExAd_fnc_stopHack";
			};
		};
	};
	
	class SupplyBox {
		targetType = 2;
		target = "Exile_Container_SupplyBox";
		
		class Actions {
			class Mount : ExileAbstractAction {
				title = "Mount";
				condition = "(isNull (attachedTo ExileClientInteractionObject)) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_mount";
			};
			
			class Install : ExileAbstractAction {
				title = "Install";
				condition = "isNull (attachedTo ExileClientInteractionObject) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_install";
			};
			
			class Unmount : ExileAbstractAction {
				title = "Unmount";
				condition = "!(isNull (attachedTo ExileClientInteractionObject)) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_unmount";
			};
		};
	};
	
	class Construction {
		targetType = 2;
		target = "Exile_Construction_Abstract_Static";
		
		class Actions {
			class ScanLock : ExileAbstractAction {
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_lock_scan";
			};
			
			class Unlock : ExileAbstractAction {
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			
			class Lock : ExileAbstractAction {
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			
			class Move : ExileAbstractAction {
				title = "Move";
				condition = "call ExileClient_util_world_isInOwnTerritory";
				action = "_this spawn ExileClient_object_construction_move";
			};
			
			class Deconstruct : ExileAbstractAction {
				title = "Remove";
				condition = "call ExileClient_util_world_isInOwnTerritory";
				action = "_this spawn ExileClient_object_construction_deconstruct";
			};
			
			class AddALock : ExileAbstractAction {
				title = "Add a Lock";
				condition = "call ExileClient_object_construction_lockAddShow";
				action = "_this spawn ExileClient_object_construction_lockAdd";
			};
			
			class Upgrade : ExileAbstractAction {
				title = "Upgrade";
				condition = "call ExileClient_object_construction_upgradeShow";
				action = "_this call ExileClient_object_construction_upgrade";
			};
			
			class MakeBoom : ExileAbstractAction {
				title = "Plant charge";
				condition = "call ExileClient_system_breaching_condition";
				action = "_this call ExileClient_system_breaching_action";
			};
			
			class Repair : ExileAbstractAction {
				title = "Repair";
				condition = "(!((ExileClientInteractionObject getVariable ['ExileConstructionDamage',0]) isEqualTo 0)) && (call ExileClient_util_world_isInOwnTerritory)";
				action = "_this call ExileClient_object_construction_repair";
			};
		};
	};
	
	class Container {
		targetType = 2;
		target = "Exile_Container_Abstract";
		
		class Actions {
			class Pack {
				title = "Pack";
				condition = "!((typeOf ExileClientInteractionObject) isEqualTo 'Exile_Container_SupplyBox')";
				action = "_this spawn ExileClient_object_container_pack";
			};
			
			class Move : ExileAbstractAction {
				title = "Move";
				condition = "(getNumber(configFile >> 'CfgVehicles' >> typeOf ExileClientInteractionObject >> 'exileIsLockable') isEqualTo 0) || ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_construction_move";
			};
		};
	};
	
	class Flag {
		targetType = 2;
		target = "Exile_Construction_Flag_Static";
		
		class Actions {
			class StealFlag : ExileAbstractAction {
				title = "Steal Flag";
				condition = "((ExileClientInteractionObject getvariable ['ExileFlagStolen',1]) isEqualTo 0)";
				action = "['StealFlag', _this select 0] call ExileClient_action_execute";
			};
			
			class RestoreFlag : ExileAbstractAction {
				title = "Restore Flag";
				condition = "((ExileClientInteractionObject getvariable ['ExileFlagStolen',0]) isEqualTo 1)";
				action = "['restoreFlagRequest', [netID ExileClientInteractionObject]] call ExileClient_system_network_send";
			};
			
			class HackVG : ExileAbstractAction {
				title = "Hack Virtual Garage";
				condition = "true";
				action = "_this spawn ExAd_fnc_startHack";
			};
		};
	};
	
	class Boat {
		targetType = 2;
		target = "Ship";
		
		class Actions {
			class Lock : ExileAbstractAction {
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			
			class Unlock : ExileAbstractAction {
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};
			
			class Hotwire : ExileAbstractAction {
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};
			
			class ClaimVehicle : ExileAbstractAction {
				title = "Claim Vehicle";
				condition = "(locked ExileClientInteractionObject) == 1";
				action = "call ExileClient_ClaimVehicles_network_claimRequestSend";
			};
			
			class Repair : ExileAbstractAction {
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};
			
			class Refuel : ExileAbstractAction {
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};
			
			class DrainFuel : ExileAbstractAction {
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};
			
			class Push : ExileAbstractAction {
				title = "Push";
				condition = "((crew ExileClientInteractionObject) isEqualTo [])";
				action = "_this call ExileClient_object_vehicle_push";
			};
		};
	};
	
	class Bikes {
		targetType = 2;
		target = "Bicycle";
		
		class Actions {
			class Flip : ExileAbstractAction {
				title = "Flip";
				condition = "true";
				action = "_this call ExileClient_object_vehicle_flip";
			};
			
			class PackDeployedVehicle : ExileAbstractAction {
				title = "Pack Bike";
				condition = "call ExAd_XM8_DV_fnc_canPack";
				action = "call ExAd_XM8_DV_fnc_pack";
			};
		};
	};
	
	class Player {
		targetType = 2;
		target = "Exile_Unit_Player";
		
		class Actions {
			class Free : ExileAbstractAction {
				title = "Free";
				condition = "(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) && !ExileClientIsHandcuffed";
				action = "_this call ExileClient_object_handcuffs_free";
			};
			
			class Search : ExileAbstractAction {
				title = "Search Gear";
				condition = "(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) && !ExileClientIsHandcuffed";
				action = "_this call ExileClient_object_handcuffs_searchGear";
			};
			
			class Identify : ExileAbstractAction {
				title = "Identify Body";
				condition = "!(alive ExileClientInteractionObject)";
				action = "_this call ExileClient_object_player_identifyBody";
			};
			
			class HideCorpse : ExileAbstractAction {
				title = "Hide Body";
				condition = "!(alive ExileClientInteractionObject)";
				action = "['HideBody', (_this select 0)] call ExileClient_action_execute";
			};
		};
	};
};
