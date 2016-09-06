_lockpickTime = _this;
_count = _lockpickTime / 10 + 2;
_fixedCount = floor _count;
for "_i" from 1 to _fixedCount do {
	if !(Xbrm_raiding) exitWith {};
	player playAction "Medic";
	uiSleep 6;
	if !(Xbrm_raiding) exitWith {};
	player playAction "MedicOther";
	uiSleep 6;			
};