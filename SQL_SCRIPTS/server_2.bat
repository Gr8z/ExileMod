@echo off
@REM *** PARAMETERS/VARIABLES ***
SET mysqlschema=exile
SET mysqlpassword=03333755478
SET mysqluser=root
@REM *** EXECUTION ***

echo.
echo.
echo.
echo RUNNING SQL Cleanup Script...
echo.
echo.
D:\MySQL\bin\mysql.exe -u %mysqluser% -p%mysqlpassword% %mysqlschema%  < "C:\ExileMod\SQL_SCRIPTS\server_2.sql"
exit