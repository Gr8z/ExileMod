clearBackpackCargoGlobal (_this select 6);
clearItemCargoGlobal (_this select 6);
clearMagazineCargoGlobal (_this select 6);
clearWeaponCargoGlobal (_this select 6);
deleteVehicle (_this select 6);
systemChat "You cannot shoot in safezone!";
cutText ["You cannot shoot in safezone!","PLAIN DOWN"];
hint "You cannot shoot in safezone!";
true