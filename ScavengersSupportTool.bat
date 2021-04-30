@echo off 
TITLE "Scavengers Support Tool"
SET USERPROFILE
SET path=%userprofile%\Downloads\
ECHO.
ECHO =======================
ECHO Scavengers Support Tool
ECHO =======================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

:: Were just making the folder for everything to go into no biggie just makes it easier to housekeep after.

if not exist "%path%SST" mkdir %path%SST

:: Were just making the logfile now so our powershell script doesnt error out later.

echo > %path%SST\SST.log

:: If some Windows functions aren't working or Windows crashes, we use the System File Checker to scan Windows and restore your files.

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "%SYSTEMROOT%\System32\sfc /scannow"

:: When you run DISM with this command, DISM uses Windows Update to provide the files that are required to fix corruptions. With this LogPath command we are making a custom logfile to delete later because housekeeping.

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "%SYSTEMROOT%\System32\DISM /Online /Cleanup-Image /RestoreHealth /LogPath:%userprofile%\Downloads\SST\SST-DISM.log"

:: This calls our powershell script which gathers Windows Version, CPU, GPU, RAM, Hard Drive info, as well as the latest SFC log and DISM log and collates it all into one clean file text file for troubleshooting and issue tracking (DEVS WE LOVE YOU).

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy remotesigned -File .\SSTScripts.ps1

ECHO A log file has been created at %path%SST\SST.log Please make sure to send this to the Developers so they can track these issues!
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO *************************************************************************************
ECHO **This solution is provided to you by Cpjet64 and the amazing Void_Sentient/Hunhow **
ECHO **                            Have a fun time out there!                           **
ECHO *************************************************************************************
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
exit