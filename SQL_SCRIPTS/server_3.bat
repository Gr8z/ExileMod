@echo off
@REM *** PARAMETERS/VARIABLES ***
SET mysqlschema=exile_3
SET mysqlpassword=chicken123
SET mysqluser=root
@REM *** EXECUTION ***

echo.
echo.
echo.
echo RUNNING SQL Cleanup Script...
echo.
echo.
D:\MySQL\bin\mysql.exe -u %mysqluser% -p%mysqlpassword% %mysqlschema%  < "C:\ExileMod\SQL_SCRIPTS\server_3.sql"
exit