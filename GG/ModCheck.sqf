waitUntil {!isNull (findDisplay 46)};
waitUntil {!dialog};

sleep 6;

if(getText(configFile >> "cfgWeapons" >> "rhs_weap_M107" >> "displayname") isEqualTo "" || getText(configFile >> "cfgWeapons" >> "rhs_weap_svd" >> "displayname") isEqualTo "" || getText(configFile >> "cfgWeapons" >> "TRYK_H_headset2" >> "displayname") isEqualTo "" )then{
    _att = format["[WARNING %1!]",name player];
    _att hintC [
        parseText "<t shadow='2' size='3'align='center'color='#cf2e4e'>THIS SERVER IS RUNNING </t><br/><t shadow='2' size='1.75'align='center'color='#b0eb00'>@RHSUSAF @RHSAFRF @TRYK </t><br/><br/><t shadow='2'align='center' size='1.25'>These mods add new weapons, vehicles and Uniforms</t><br/><t shadow='2'align='center'>You will not be able to see or use the new items. It is recomended that you download:</t>",
        parseText "<t shadow='2'size='1.1' >TRYK's Uniforms</t><br/><a shadow='2'size='0.8'align='center' href='http://www.armaholic.com/page.php?id=26661'>http://www.armaholic.com/page.php?id=26661</a>",
        parseText "<t shadow='2'size='1.1' >RHS : United States</t><br/><a shadow='2'size='0.8'align='center' href='http://www.armaholic.com/page.php?id=27149'>http://www.armaholic.com/page.php?id=27149</a>",
        parseText "<t shadow='2'size='1.1' >RHS : Russian Federation</t><br/><a shadow='2'size='0.8'align='center' href='http://www.armaholic.com/page.php?id=27150'>http://www.armaholic.com/page.php?id=27150</a>
        <br/><br/><t shadow='2'size='1.1'>Those links can be clicked for a direct link, or get them from the Steam Workshop or A3Launcher.com</t><br/><br/><t shadow='2'align='center'size='1.75'color='#3d94af'>See you in game!</t>"
    ];
};