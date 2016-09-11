class CfgMostWanted
{
    class Database
    {
        class Cleanup
        {
            /*
                Lifetime of the "Friends" security array will stay populated in DAYS

                NOTE:
                The friends list is a security feature designed to keep players from assigning bounties to friends and
                claiming bounties on friends.

                The sooner the array gets reset, the more often players are able to claim bounties or place bounties on their friends
            */

            friendsLifetime = 1;
        };

        class Immunity
        {
            /*
                How long a player has immunity from a bounty in DAYTS
                While a player has immunity, they won't be able to have a bounty set on them
            */
            interval = 0.5;
        };
    };
    class BountyValues
    {
        /*
            The Bounty values that will be displayed in the dropdown
            Left value: Poptabs
            Right Value: Percentage of Respect Loss
        */
        Values[]=
        {
            { "1000",  "0.5"  },
            { "2500",  "1"  },
            { "5000",  "1.5"  },
            { "7500",  "2"  },
            { "10000",  "3"  },
            { "15000",  "4"  },
            { "20000",  "5"  },
            { "25000",  "6"  },
            { "50000",  "8"  },
            { "75000", "10" },
            { "100000", "12" },
            { "200000", "15" }
        };
    };
};
