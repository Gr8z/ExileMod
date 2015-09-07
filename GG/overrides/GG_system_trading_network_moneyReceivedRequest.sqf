/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * Edited by eraser1. Redistributed with permission.
 */
 
private["_newPlayerMoney","_senderName","_transferAmount"];
_newPlayerMoney = parseNumber (_this select 0);
_senderName = _this select 1;
_transferAmount = _newPlayerMoney - ExileClientPlayerMoney;
ExileClientPlayerMoney = _newPlayerMoney;
["MoneyReceived", [_transferAmount, _senderName]] call ExileClient_gui_notification_event_addNotification;
true