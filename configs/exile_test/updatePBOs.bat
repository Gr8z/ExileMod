@echo off

set srvname=@ExileServer_test
:: Creating New Pbos

MakePBO -! -P -N "C:\ExileMod\maps\Tanoa" "C:\a3Server\mpmissions\GG_exile_test.Tanoa.pbo"

MakePBO -P -N  "C:\ExileMod\addons\exile_server" "C:\a3Server\%srvname%\addons\exile_server.pbo"
MakePBO -P -N  "C:\ExileMod\addons\exile_server_config" "C:\a3Server\%srvname%\addons\exile_server_config.pbo"
MakePBO -P -N  "C:\ExileMod\addons\a3_infiSTAR_Exile" "C:\a3Server\%srvname%\addons\a3_infiSTAR_Exile.pbo"
MakePBO -P -N  "C:\ExileMod\addons\a3_dms" "C:\a3Server\%srvname%\addons\a3_dms.pbo"
MakePBO -P -N  "C:\ExileMod\addons\a3_zcp_exile" "C:\a3Server\%srvname%\addons\a3_zcp_exile.pbo"
MakePBO -P -N  "C:\ExileMod\addons\exad_core" "C:\a3Server\%srvname%\addons\exad_core.pbo"
MakePBO -P -N  "C:\ExileMod\addons\exad_dv" "C:\a3Server\%srvname%\addons\exad_dv.pbo"
MakePBO -P -N  "C:\ExileMod\addons\exad_hacking" "C:\a3Server\%srvname%\addons\exad_hacking.pbo"
MakePBO -P -N  "C:\ExileMod\addons\exad_vg" "C:\a3Server\%srvname%\addons\exad_vg.pbo"
MakePBO -P -N  "C:\ExileMod\addons\Anti-Theft_Server" "C:\a3Server\%srvname%\addons\Anti-Theft_Server.pbo"
MakePBO -P -N  "C:\ExileMod\addons\server_buildings" "C:\a3Server\%srvname%\addons\server_buildings.pbo"
MakePBO -P -N  "C:\ExileMod\addons\MarXet_Server" "C:\a3Server\%srvname%\addons\MarXet_Server.pbo"
MakePBO -P -N  "C:\ExileMod\addons\a3_exile_occupation" "C:\a3Server\%srvname%\addons\a3_exile_occupation.pbo"
MakePBO -P -N  "C:\ExileMod\addons\XG_killboard" "C:\a3Server\%srvname%\addons\XG_killboard.pbo"
MakePBO -P -N  "C:\ExileMod\addons\AVS" "C:\a3Server\%srvname%\addons\AVS.pbo"
MakePBO -P -N  "C:\ExileMod\addons\GG_SecretCode" "C:\a3Server\%srvname%\addons\GG_SecretCode.pbo"
MakePBO -P -N  "C:\ExileMod\addons\ClaimVehicles_Server" "C:\a3Server\%srvname%\addons\ClaimVehicles_Server.pbo"
MakePBO -P -N  "C:\ExileMod\addons\HEG_Xbrm" "C:\a3Server\%srvname%\addons\HEG_Xbrm.pbo"

echo Creating new PBOs 

cls
@exit