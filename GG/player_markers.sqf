onEachFrame
{
	private["_vis","_pos"];
	{
		if(player distance _x < 2500 && isPlayer _x && _x != player && side _x == playerSide && group _x == group player) then
		{
			_vis = lineIntersects [eyePos player, eyePos _x,player, _x];
            if(!_vis) then
            {
                _pos = visiblePosition _x;
                _pos set[2,(getPosATL _x select 2) + 2.2];
                drawIcon3D ["\a3\ui_f\data\map\Markers\NATO\b_inf.paa",[1,1,1,1],_pos,1,1,0,name _x,0,0.04];
            };
		};
	} foreach playableUnits;
};