
echo off
color 17
mode con cols=100 lines=20
title Grails Command
:first
cls
echo ----------------------------------------
echo    Choice Command
echo ----------------------------------------
echo
echo   1.mvn install								
echo   2.mvn clean								
echo                     
echo.

set /p e=Choice Command , Q Exit : 

if "%e%"=="1" cls&goto install
if "%e%"=="2" cls&goto clean
if "%e%"=="q" exit
:war
	mvn install
:clean
	mvn clean
:err
cls
echo press any key go back
pause > nul
goto first