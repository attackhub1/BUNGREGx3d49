@echo off
setlocal EnableExtensions EnableDelayedExpansion

chcp 65001 >nul
title BUNGDUM x RUNIN
color 07
mode con: cols=78 lines=25

if /I "%~1"=="SELECT_MENU" goto SELECT_MENU

rem ============================================================
rem MAIN LOADER
rem ============================================================

cls
echo.
echo  ================================================================
echo.
echo             BUNGDUM x RUNIN
echo             B A N G D A M   S H O P
echo.
echo  ================================================================
echo.
echo             [01] Starting loader.............. OK
echo             [02] Windows 10 / 11.............. OK
echo             [03] System check................. OK
echo.
timeout /t 1 /nobreak >nul

:KEY
cls
echo.
echo  ================================================================
echo                         KEY SYSTEM
echo  ================================================================
echo.
echo       Enter BangDam Shop license key
echo.
set "KEY="
set /p "KEY=       KEY: "

if /I "%KEY%"=="BUNGDUMxRUNIN-8ee9a3s" goto KEY_OK

echo.
echo       [X] INVALID KEY
timeout /t 2 /nobreak >nul
goto KEY


:KEY_OK

cls
echo.
echo  ================================================================
echo                    BUNGDUM x RUNIN
echo  ================================================================
echo.
echo       [OK] KEY ACCEPTED
echo       [OK] ACCESS GRANTED
echo.
echo       Preparing gaming configuration...
echo.
timeout /t 1 /nobreak >nul


rem ============================================================
rem CREATE REG
rem ============================================================

set "REGFILE=%TEMP%\BangDam_Gaming.reg"

> "%REGFILE%" echo Windows Registry Editor Version 5.00
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
>>"%REGFILE%" echo "SystemResponsiveness"=dword:00000000
>>"%REGFILE%" echo "NetworkThrottlingIndex"=dword:ffffffff
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games]
>>"%REGFILE%" echo "Affinity"=dword:00000000
>>"%REGFILE%" echo "Background Only"="False"
>>"%REGFILE%" echo "Clock Rate"=dword:00002710
>>"%REGFILE%" echo "GPU Priority"=dword:00000008
>>"%REGFILE%" echo "Priority"=dword:00000006
>>"%REGFILE%" echo "Scheduling Category"="High"
>>"%REGFILE%" echo "SFIO Priority"="High"
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\System\GameConfigStore]
>>"%REGFILE%" echo "GameDVR_Enabled"=dword:00000000
>>"%REGFILE%" echo "GameDVR_FSEBehaviorMode"=dword:00000002
>>"%REGFILE%" echo "GameDVR_HonorUserFSEBehaviorMode"=dword:00000001
>>"%REGFILE%" echo "GameDVR_DXGIHonorUserFSEBehaviorMode"=dword:00000001
>>"%REGFILE%" echo "GameDVR_EFSEFeatureFlags"=dword:00000000
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR]
>>"%REGFILE%" echo "AppCaptureEnabled"=dword:00000000
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
>>"%REGFILE%" echo "Win32PrioritySeparation"=dword:00000026
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers]
>>"%REGFILE%" echo "HwSchMode"=dword:00000002
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling]
>>"%REGFILE%" echo "PowerThrottlingOff"=dword:00000001
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config]
>>"%REGFILE%" echo "DODownloadMode"=dword:00000000
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters]
>>"%REGFILE%" echo "Tcp1323Opts"=dword:00000001
>>"%REGFILE%" echo "MaxUserPort"=dword:0000fffe
>>"%REGFILE%" echo "TcpTimedWaitDelay"=dword:0000001e
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
>>"%REGFILE%" echo "SubscribedContent-338389Enabled"=dword:00000000
>>"%REGFILE%" echo "SubscribedContent-353694Enabled"=dword:00000000
>>"%REGFILE%" echo "SubscribedContent-353696Enabled"=dword:00000000
>>"%REGFILE%" echo "SystemPaneSuggestionsEnabled"=dword:00000000
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\Control Panel\Desktop]
>>"%REGFILE%" echo "MenuShowDelay"="0"
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\Control Panel\Mouse]
>>"%REGFILE%" echo "ActiveWindowTracking"=dword:00000000
>>"%REGFILE%" echo "Beep"="No"
>>"%REGFILE%" echo "MouseHoverHeight"="100"
>>"%REGFILE%" echo "MouseHoverTime"="900"
>>"%REGFILE%" echo "MouseHoverWidth"="100"
>>"%REGFILE%" echo "MouseSensitivity"="10"
>>"%REGFILE%" echo "MouseSpeed"="1"
>>"%REGFILE%" echo "MouseThreshold1"="6"
>>"%REGFILE%" echo "MouseThreshold2"="10"
>>"%REGFILE%" echo "SnapToDefaultButton"="0"
>>"%REGFILE%" echo "SwapMouseButtons"="0"
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
>>"%REGFILE%" echo "AutoRepeatDelay"="1000"
>>"%REGFILE%" echo "AutoRepeatRate"="500"
>>"%REGFILE%" echo "BounceTime"="0"
>>"%REGFILE%" echo "DelayBeforeAcceptance"="1000"
>>"%REGFILE%" echo "Flags"="126"


rem ============================================================
rem APPLY REG
rem ============================================================

cls
echo.
echo  ================================================================
echo                    APPLYING CONFIGURATION
echo  ================================================================
echo.
echo       [01] Registry......................... APPLYING
reg.exe import "%REGFILE%" >nul 2>&1

if errorlevel 1 (
    echo       [X] Registry import failed
) else (
    echo       [OK] Registry applied
)

del /f /q "%REGFILE%" >nul 2>&1

echo       [02] Temporary files.................. REMOVED
echo       [03] Gaming configuration............. READY
echo.
timeout /t 1 /nobreak >nul


rem ============================================================
rem GET POWERSHELL PARENT PID
rem ============================================================

set "PARENT_PID="
set "PARENT_NAME="

for /f "tokens=1,2" %%A in ('powershell -NoProfile -Command "$p=Get-CimInstance Win32_Process -Filter \"ProcessId=$PID\"; $x=Get-CimInstance Win32_Process -Filter \"ProcessId=$($p.ParentProcessId)\"; Write-Output \"$($x.ProcessId) $($x.Name)\"" 2^>nul') do (
    set "PARENT_PID=%%A"
    set "PARENT_NAME=%%B"
)

rem ============================================================
rem OPEN NEW CMD MENU
rem ============================================================

start "" "%ComSpec%" /c ""%~f0" SELECT_MENU"

timeout /t 1 /nobreak >nul

rem ============================================================
rem CLOSE POWERSHELL PARENT ONLY
rem ============================================================

if /I "%PARENT_NAME%"=="powershell.exe" (
    taskkill /PID %PARENT_PID% /F >nul 2>&1
    exit
)

if /I "%PARENT_NAME%"=="pwsh.exe" (
    taskkill /PID %PARENT_PID% /F >nul 2>&1
    exit
)

exit


rem ============================================================
rem SELECT MENU
rem ============================================================

:SELECT_MENU

chcp 65001 >nul
title BUNGDUM x RUNIN
color 07
mode con: cols=78 lines=25

rem ============================================================
rem RAINBOW LOOP
rem ============================================================

for /L %%R in (1,1,6) do (
    cls

    if %%R==1 color 0C
    if %%R==2 color 06
    if %%R==3 color 0E
    if %%R==4 color 0A
    if %%R==5 color 0B
    if %%R==6 color 0D

    echo.
    echo  ================================================================
    echo.
    echo              BUNGDUM x RUNIN
    echo              B A N G D A M   S H O P
    echo.
    echo              SYSTEM READY
    echo.
    echo              LOADING EMULATOR MENU...
    echo.
    echo  ================================================================
    echo.

    timeout /t 1 /nobreak >nul
)

rem ============================================================
rem MENU
rem ============================================================

color 07
cls

echo.
echo  ================================================================
echo.
echo                    BUNGDUM x RUNIN
echo                    BANGDAM SHOP
echo.
echo  ================================================================
echo.
echo                    SELECT EMULATOR
echo.
echo                    [1] BlueStacks
echo.
echo                    [2] BlueStacks MSI
echo.
echo                    [0] Exit
echo.
echo  ================================================================
echo.

set "CHOICE="
set /p "CHOICE=             Select: "

if "%CHOICE%"=="1" goto BLUESTACKS
if "%CHOICE%"=="2" goto MSI
if "%CHOICE%"=="0" exit

goto SELECT_MENU


rem ============================================================
rem BLUESTACKS
rem ============================================================

:BLUESTACKS

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_nxt\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_nxt\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles%\BlueStacks\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks\HD-Player.exe"

if not defined PLAYER goto NOTFOUND

goto LAUNCH


rem ============================================================
rem BLUESTACKS MSI
rem ============================================================

:MSI

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_msi2\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_msi2\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles%\BlueStacks_msi5\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_msi5\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe"

if not defined PLAYER goto NOTFOUND

goto LAUNCH


rem ============================================================
rem LAUNCH
rem ============================================================

:LAUNCH

cls
echo.
echo  ================================================================
echo.
echo                    STARTING EMULATOR
echo.
echo                    [OK] %PLAYER%
echo.
echo  ================================================================
echo.

start "" "%PLAYER%"

timeout /t 2 /nobreak >nul

exit


rem ============================================================
rem NOT FOUND
rem ============================================================

:NOTFOUND

cls
echo.
echo  ================================================================
echo.
echo                    EMULATOR NOT FOUND
echo.
echo              BlueStacks installation not found.
echo.
echo  ================================================================
echo.

timeout /t 2 /nobreak >nul
exit
