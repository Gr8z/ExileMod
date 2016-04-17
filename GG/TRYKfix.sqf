waituntil{hasInterface};
private["_glasses","_removeTRYK"];
_removeTRYK=[

"TRYK_H_ghillie_top_headless3glass",
"TRYK_kio_balaclava_WH"

];
{
	player unassignItem _x;
	player removeItem _x;
	_glasses = goggles player;
	if(_glasses isEqualTo _x )then{
		removeGoggles player;
	};
	
}forEach _removeTRYK;