///////////////////////////////////////////////////////////////////////////////////////////////////
// Russian Roulette
///////////////////////////////////////////////////////////////////////////////////////////////////

_objects =
[
    ["Land_WoodenTable_large_F", [6332.48,7800.71,304.996],122.588, false],
    ["Exile_Sign_RussianRoulette", [6331.6,7804.19,304.992], 307.977, false],
	["Exile_Sign_RussianRoulette", [6331.55,7804.22,304.992], 127.879, false]
    //["Land_SportGround_fence_F", [14625.692, 16818.945, 18.791378], 0.79693103, false], 
    //["Land_SportGround_fence_F", [14633.911, 16816.904, 17.9177], 5.4953084, false], 
    //["Land_CargoBox_V1_F", [14619.726, 16823.613, 18.75972], 5.4931207, false],
];

{
    private ["_object"];

    _object = (_x select 0) createVehicle [0,0,0];
    _object setDir (_x select 2);
    _object setPosASL (_x select 1);
    _object allowDamage false;
    _object enableSimulationGlobal false;
}
forEach _objects;

ExileRouletteChairs = [];

ExileRouletteChairPositions = 
[
    [[6333.39,7801.25,304.994], 0.58], 
    [[6332.78,7801.67,304.994], 0.58], 
    [[6331.24,7801.54,304.996], 5.249], 
    [[6331.66,7800.12,304.998], 3.690], 
    [[6332.29,7799.64,304.998], 3.755],
    [[6333.74,7799.86,304.995], 2.211]
];

{
    private ["_chair"];

    _chair = "Exile_RussianRouletteChair" createVehicle [0, 0, 0];
    _chair setDir (deg (_x select 1));
    _chair setPosASL (_x select 0);
    _chair allowDamage false;
    _chair enableSimulationGlobal true;

    ExileRouletteChairs pushBack _chair;
}
forEach ExileRouletteChairPositions;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Concrete Mixers
///////////////////////////////////////////////////////////////////////////////////////////////////

_concreteMixers = 
[
	[[1763.97, 7715.98, 283.087],  223.572], // Myshkino
	[[11461.8, 7482.31, 221.53],  0], // Factory
	[[8405.68, 12211.4, 159], 279.519] // Gvozdno
];

{
	_concreteMixer = "Exile_ConcreteMixer" createVehicle (_x select 0);
	_concreteMixer setDir (_x select 1);
	_concreteMixer setPosASL (_x select 0);
    _concreteMixer allowDamage false;
    _concreteMixer enableSimulationGlobal true;
}
forEach _concreteMixers;