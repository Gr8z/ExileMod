if (isServer) then {
    private ["_signs"];
    _signs = [
        ["Exile_Sign_TraderCity", [11684.3, 4101.84, 163.678], [-0.810608, -0.58559, 0], [0, 0, 1], false],
        ["Exile_Sign_TraderCity", [2263.16, 8557.43, 4.00864], [0.859749, 0.510717, 0], [0, 0, 1], false],
        ["Exile_Sign_TraderCity", [12187.5, 8159.79, 50.5472], [-0.57073, 0.821138, 0], [0, 0, 1], false],
        ["Exile_Sign_TraderCity", [8012.3, 12387.4, 127.362], [-0.959236, 0.282607, 0], [0, 0, 1], false]

    ];
    {
        private _sign = (_x select 0) createVehicle (_x select 1);
        _sign allowDamage false;
        _sign setPosWorld (_x select 1);
        _sign setVectorDirAndUp [_x select 2, _x select 3];
        _sign enableSimulationGlobal (_x select 4);
        _sign setObjectTextureGlobal [0, "GG\images\billboard.paa"];
    forEach _signs;
};