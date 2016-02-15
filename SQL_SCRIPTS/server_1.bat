@echo off
@REM *** PARAMETERS/VARIABLES ***
SET mysqlschema=exile_1
SET mysqlpassword=03333755478
SET mysqluser=root
@REM *** EXECUTION ***

echo.
echo.
echo.
echo RUNNING SQL Cleanup Script...
echo.
echo.
D:\MySQL\bin\mysql.exe -u %mysqluser% -p%mysqlpassword% %mysqlschema%  < "C:\ExileMod\SQL_SCRIPTS\server_1.sql"
D:\MySQL\bin\mysql.exe -h104.244.4.34 -u db12 -p3lIKH1HE6h db12 < "C:\ExileMod\SQL_SCRIPTS\server_troll.sql"
exit