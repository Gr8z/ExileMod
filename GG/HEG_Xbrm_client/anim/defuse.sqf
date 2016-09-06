private ["_count","_fixedCount"];
_count = Xbrm_defuse_time / 10 + 2;
_fixedCount = floor _count;
for "_i" from 1 to _fixedCount do {
	if !(Xbrm_defusing) exitWith {};
	player playAction "Medic";
	uiSleep 6;
	if !(Xbrm_defusing) exitWith {};
	player playAction "MedicOther";
	uiSleep 6;			
};