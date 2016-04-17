/*
	Custom configs for Chernarus.
	Created by Hollow (slight edits by eraser1).
*/

DMS_findSafePosBlacklist =
[
	//Insert position blacklists here.
];

// Altis is pretty flat, so we can make the min surfaceNormal ... stricter? more strict? Who cares, you get the idea.
DMS_MinSurfaceNormal				= 0.95;

// Making these configs below as strict as possible will help in reducing the number of attempts taken to find a valid position, and as a result, improve performance.

DMS_MinDistFromWestBorder			= 2000;	// There's at least 2km of ocean from the west edge to the first bit of land.
DMS_MinDistFromEastBorder			= 2250;	// There's over 2km of ocean from the east edge to the first bit of land.
DMS_MinDistFromSouthBorder			= 5000;	// There's about 5km of ocean from the south edge to the first bit of land.
DMS_MinDistFromNorthBorder			= 5200;	// There's around 5km of ocean from the north edge to the first bit of land (including the island).