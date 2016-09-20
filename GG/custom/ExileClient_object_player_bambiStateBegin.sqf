/**
 * ExileClient_object_player_bambiStateBegin
 */
 
private["_duration"];
disableSerialization;
if !(ExileClientPlayerIsBambi) then 
{
	_duration = _this;
	ExileClientPlayerIsBambi = true;
	ExileClientPlayerBambiStateExpiresAt = time + _duration; 
	true call ExileClient_gui_hud_toggleBambiIcon;
	true call GG_rank_loadout;
	ExileClientEndBambiStateThread = [_duration, ExileClient_object_player_bambiStateEnd, [], true] call ExileClient_system_thread_addTask;
};
true