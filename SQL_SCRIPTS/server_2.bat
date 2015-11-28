@echo off
@REM *** PARAMETERS/VARIABLES ***
SET mysqlschema=exile_1
SET mysqlpassword=03333755478
SET mysqluser=root
@REM *** EXECUTION ***

echo.
echo.
echo RUNNING PHP FIX Script...
echo.
echo.
C:\xampp\php\php.exe C:\xampp\htdocs\database\server_2\fix_construction_protection.php
C:\xampp\php\php.exe C:\xampp\htdocs\database\server_2\delete_abandoned_vehicles.php
echo.
echo.
echo RUNNING SQL Cleanup Script...
echo.
echo.
D:\MySQL\bin\mysql.exe -u %mysqluser% -p%mysqlpassword% %mysqlschema%  < "C:\ExileMod\SQL_SCRIPTS\server_2.sql"
exit