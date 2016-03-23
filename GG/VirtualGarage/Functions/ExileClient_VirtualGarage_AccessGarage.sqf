/*

 	Name: ExileClient_AccessGarage.sqf
 	Author(s): Shix
    Copyright (c) 2016 Shix
 	Description: Runs some of the dankest checks known to man before allowing a player to access the garage.

*/
private ["_Flag","_BuildRights"];
_playerHasToBeOnFlag = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_PlayerHasToBeOnFlag");
if(_playerHasToBeOnFlag == 1)then{
  _Flag = nearestObject [player, "Exile_Construction_Flag_Static"];
  _BuildRights = _Flag getVariable ["ExileTerritoryBuildRights", []];
  if(getPlayerUID player in _BuildRights) then
  {
    if (ExileClientPlayerIsInCombat) then
    {
          ["Whoops",["You're in combat!"]] call ExileClient_gui_notification_event_addNotification;
    } else {
          createDialog "VirtualGarageDialog";
    }
  } else {
    ["Whoops",["You Do Not have access to this Garage"]] call ExileClient_gui_notification_event_addNotification;
  };
}
else
{
  createDialog "VirtualGarageDialog";
};
