[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'MAP_TIPS_JIP_T')then{terminate MAP_TIPS_JIP_T;MAP_TIPS_JIP_T=nil;};
		MAP_TIPS_JIP_T = [] spawn {
                tipsArray = [
                    "Get a pro building box By Posting 30 Posts on the Forums.",
                    "You can learn alot about our community just by Joining our Teamspeak and Forums",
                    "You can easily send your feeback on our forums.",
                    "Visit our website at www.GhostzGamerz.com",
                    "Join Our Teamspeak to get 10,000 Free Pop Tabs",
                    "We have  a marketplace trader where you can find items from other players and also sell your own.",
                    "If you find all four Prisoners Magazines, you can craft them into an item worth 500k Poptabs.",
                    "Everyone can deploy a quad bike using the XM8.",
                    "To repair vehicle wheels, you will need a wrench and a wheel in your inventory."
                ];
		};
	},-2,'MAP_TIPS_JIP'] call FN_infiSTAR_S;
};
true