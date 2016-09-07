/*
*  Ported From Wasteland
*  Author: ContractCoders.net
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/

// Colors of all Markers
CC_col_empty = "ColorYellow"; // Map Marker Color When its empty
CC_col_enemy = "ColorRed"; // Map Marker Color When it has enemies
CC_col_friendly = "ColorGreen"; // Map Marker Color When it has friendlies
CC_col_mixed = "ColorOrange"; // Map Marker Color When its mixed 

// Names of all Markers
CC_name_empty = "BLACK MARKET"; // Map Marker Name When its empty
CC_name_enemy = "BLACK MARKET (Enemies)"; // Map Marker Name When it has enemies
CC_name_friendly = "BLACK MARKET (Friendlies)"; // Map Marker Name When it has friendlies
CC_name_mixed = "BLACK MARKET (Enemies and Friendlies)"; // Map Marker Name When its mixed 

CC_blackMarketIntruderWarning = true;   // Warn players in gunstore areas of enemy intruders (false = no, true = yes)
CC_blackMarketMarkerTransparency = 0.5; // Set how transparent you want the markers to be. (0 - 1)

CC_storesPos = // Define all your BlackMarkets Below
[
	// ["NAME", [X,Y], RADIUS],
    ["Zelenogorsk", [2080.181,5249.057], 100],
    ["Shalka", [2129.555,12845.642], 100],
    ["factorySolnichiy", [13100.316,7178.036], 100]
];