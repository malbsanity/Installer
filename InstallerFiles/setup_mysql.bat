@echo off
REM -- MySQL Configuration and DB Import Script --

REM Set the path to MySQL executable (change if your MySQL is installed elsewhere)
set MYSQL_EXE="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

REM Check if MySQL executable exists
if not exist %MYSQL_EXE% (
    echo MySQL executable not found at %MYSQL_EXE%
    pause
    exit /b
)

REM Import the database using your exported SQL file
echo Importing database from student_management.sql...
%MYSQL_EXE% -u root -pmike < "%~dp0student_management.sql"

echo Database import complete.
pause
