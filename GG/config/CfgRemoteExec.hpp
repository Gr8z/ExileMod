class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		class fnc_AdminReq 											{ allowedTargets=2; };
		class ExileServer_system_network_dispatchIncomingMessage 	{ allowedTargets=2; };
		class ExAdServer_fnc_clientRequest 							{ allowedTargets=2; };
		class AVS_fnc_rearmVehicle									{ allowedTargets=2; };
        class AVS_fnc_refuelPayment                                 { allowedTargets=2; };
        class AVS_fnc_refuelVehicle									{ allowedTargets=2; };
		class AVS_fnc_fillCanister									{ allowedTargets=2; };
		class SA_Simulate_Towing 									{ allowedTargets=0; }; 
		class SA_Attach_Tow_Ropes 									{ allowedTargets=0; }; 
		class SA_Take_Tow_Ropes 									{ allowedTargets=0; }; 
		class SA_Put_Away_Tow_Ropes 								{ allowedTargets=0; }; 
		class SA_Pickup_Tow_Ropes 									{ allowedTargets=0; }; 
		class SA_Drop_Tow_Ropes  									{ allowedTargets=0; }; 
		class SA_Set_Owner 											{ allowedTargets=2; }; 
		class SA_Hint  												{ allowedTargets=1; }; 
		class SA_Hide_Object_Global  								{ allowedTargets=2; }; 
		class ASL_Pickup_Ropes      								{ allowedTargets=0; }; 
        class ASL_Deploy_Ropes_Index    							{ allowedTargets=0; }; 
        class ASL_Rope_Set_Mass    									{ allowedTargets=0; }; 
        class ASL_Extend_Ropes     									{ allowedTargets=0; }; 
        class ASL_Shorten_Ropes    									{ allowedTargets=0; }; 
        class ASL_Release_Cargo    									{ allowedTargets=0; }; 
        class ASL_Retract_Ropes    									{ allowedTargets=0; }; 
        class ASL_Deploy_Ropes     									{ allowedTargets=0; }; 
        class ASL_Attach_Ropes     									{ allowedTargets=0; }; 
        class ASL_Drop_Ropes       									{ allowedTargets=0; }; 
        class ASL_Hint         										{ allowedTargets=1; }; 
        class ASL_Hide_Object_Global    							{ allowedTargets=2; }; 
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};	