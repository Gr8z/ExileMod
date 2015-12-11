if !((vehicle player) isEqualTo player) exitWith {}; //MAKE SURE WE ARE ON FEET

//We check if we have money for that
if (ExileClientPlayerMoney > 500) then {
    titleText ["", "PLAIN DOWN"];
    player playActionNow "Medic"; //ANIMATED DELAY
    _spawnPos = player modelToWorld [0,2,0];
    _spawnDir = (getDir player) -90;
    do_MakeBike = [player, _spawnPos, _spawnDir];
    removeItem "itemRadio";
    uiSleep 3;
    publicVariableServer "do_MakeBike"; //HEY SERVER GIVE ME A BIKE
    uiSleep 1;
    ['BIKE DEPLOYED, RADIO REMOVED !',0,0.6,2,0] spawn bis_fnc_dynamictext;
};