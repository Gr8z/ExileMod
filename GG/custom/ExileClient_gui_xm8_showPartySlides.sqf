/**
 * ExileClient_gui_xm8_showPartySlides
 */

if (ExileClientPartyID isEqualTo -1) then
{
	if (ExileClientPendingPartyInvitionGroup isEqualTo objNull) then
	{
		["hostParty", 0] call ExileClient_gui_xm8_slide;
	}
	else
	{
		[format ["Join %1?", groupID ExileClientPendingPartyInvitionGroup], "Join", "Don't join"] call ExileClient_gui_xm8_showConfirm;
		waitUntil { !(isNil "ExileClientXM8ConfirmResult") };
		if (ExileClientXM8ConfirmResult) then
		{
			[player] joinSilent ExileClientPendingPartyInvitionGroup;
			setGroupIconsVisible [true, true];
			ExileClientPartyID = netId ExileClientPendingPartyInvitionGroup;
			uiSleep 0.2;
			["party", 0] call ExileClient_gui_xm8_slide;
            ["handlePartyInvite",[ExileClientPartyID]] call ExileClient_system_network_send;
		}
		else
		{
		};
		ExileClientPendingPartyInvitionGroup = objNull;
	};
}
else
{
	["party", 0] call ExileClient_gui_xm8_slide;
};
