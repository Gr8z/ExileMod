/**
 * ExileServer_object_flies_spawn
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_deadEntity","_fliesSound","_particleEmitteer","_fliesParticles"];
_deadEntity = _this;
_fliesSound = createSoundSource ["Exile_Sound_Flies", getPos _deadEntity, [], 0];
_fliesSound attachTo [_deadEntity, [0, 0, 0]];
_particleEmitteer = "#particlesource" createVehicle (getPos _deadEntity);
_particleEmitteer setParticleParams 
[
				["\A3\animals_f\fly.p3d", 1, 0, 1, 0], "", 
 				"spaceObject",
 			1,
 			4,
			[0, 0, 0],
		[0, 0, 0.5],
			0, 1.30, 1, 0, 
				[1.2, 1.2, 1.2, 0],
				[[1, 1, 1, 1],[1, 1, 1, 1]],
			[1.5,0.5],
		0.01,
		0.08,
 		"",
 		"",
 				""
];
_particleEmitteer setParticleRandom 
[
	 		2,
			[1.5, 1.5, 0.5],
		[0, 0, 0],
	 	1, 
				0.2, 
				[0, 0, 0, 0.1],
		0.01,
		0.03,
	 			10
];
_particleEmitteer setDropInterval 0.1;
_particleEmitteer attachTo [_deadEntity, [0, 0, 0]];
_deadEntity setVariable ["ExileFliesSound", _fliesSound];
_deadEntity setVariable ["ExileFliesParticles", _fliesParticles];