[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'MAP_TIPS_JIP_T')then{terminate MAP_TIPS_JIP_T;MAP_TIPS_JIP_T=nil;};
		MAP_TIPS_JIP_T = [] spawn {
                tipsArray = [
                    'Check out the marketplace, at trade zones, where you can buy/sell items from/to players.',
					'If you find all four prisoners magazines, you can craft them into an item worth 500k poptabs.',
					'To craft a quadbike, go into the XM8 apps page.',
					'To repair vehicle wheels, you will need a wrench and wheel, in your inventory.',
					'Player scans will scan for enemy players in a radius of 1 kilometer. Players with their 8G network turned off will not show up.',
					'Take a selfie to show off your character/base/vehicle/etc. Upload them to the website for competitions and bragging rights.',
					'Call in an airdrop to save you a trip to the trader. These costs pop tabs are the loot in them are random.',
					'To see the most recent kills, on the server, go into the XM8 apps page.',
					'On the XM8 apps page, in the crafting app, you can see everything you can craft on the server.',
					'You can pick a lock, on a safe, with a knife.',
					'You can add extra protection to your gear by rigging your safes with explosives.',
					'Players can’t steal vehicles/inventory/gear, in a safe zone, with our anti theft script.',
					'ATMs are located around the map, and labeled with the white bank icons.',
					'A players ATM bank limit is 500k.',
					'Join our website, ts, steam group, and discord to get a free 10k pop tabs.',
					'Have a suggestion? Please let us know on our website at ghostzgamerz.com.',
					'Find a bug/glitch? Please let us know on our website at ghostzgamerz.com.',
					'Want to be a part of the staff team? Apply on our website at ghostzgamerz.com.',
					'Check out our changelog for recent changes and fixes, located on our website.',
					'Need some help, or have a question? Hop on our teamspeak at ts.ghostzgamerz.com',
					'Respect your fellow players and admins.',
					'Impersonating staff is not tolerated.',
					'All vehicles parked in a safe zone will unlock after restart.',
					'No ramming in safe zones.',
					'No kamikazing in safe zones.',
					'You may not build anywhere within 1000 meters from trader cities.',
					'You may not build on a major bridge which is over a mass of water.',
					'Hacking bases require a minimum of 15 players online.',
					'You are not allowed to kamakazi a base using an air vehicle.',
					'All dead bodies will be deleted after 15 minutes.',
					'All dead bodies, near a spawn town, will be deleted in 5 minutes.',
					'Unsold marketplace items will be deleted in 15 days.',
					'Empty containers will be deleted after 2 days.',
					'Vehicles will be deleted after 5 days of inactivity.',
					'All vehicle pincodes will be reset to 0000 after 3 days of inactivity.',
					'All safe pincodes will be reset to 0000 after 7 days of inactivity.',
					'Any base territory will be deleted 7 days after the last territory protection payment.',
					'All containers, including safes, without a territory, will be deleted if not used for 10 days.',
					'All constructions, without a territory, will be deleted if not used for 2 days.',
					'All stolen base pin codes will reset to 0000, if not paid, in ransom, in 2 days.',
					'All stolen, unpaid, territories will be deleted in 3 days.',
					'If you see someone breaking the rules, please capture a screenshot, or record a video. Report it on our forums, or teamspeak.',
					'All violations can be reported, via a support ticket,  on the forums.',
					'English only on side chat.',
					'No voice on sidechat.',
					'No excessive vulgar language, exual comments, racism, homophobic slurs, health threats, or life insults.',
					'We cannot guarantee a refund if you do not show photo or video proof.',
					'We can refund you in the event of a server bug, crash, or failure regarding GG equipment.',
					'You can blow up territory walls with base explosives.',
					'You can hack into a territories virtual garage using a laptop.',
					'Three breaching charges (wood) are required to blow up a wood wall. Placing 1 breaching charge takes 3 minutes.',
					'Three breaching charges (metal) are required to blow up a metal wall. Placing 1 breaching charge takes 4 minutes.',
					'Three breaching charges (big momma) are required to blow up a concrete wall. Placing 1 breaching charge takes 5 minutes'
                ];
		};
	},-2,'MAP_TIPS_JIP'] call FN_infiSTAR_S;
};
true