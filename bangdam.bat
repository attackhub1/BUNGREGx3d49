@echo off
setlocal EnableExtensions EnableDelayedExpansion

chcp 65001 >nul
title BUNGDUM x RUNIN ^| BANGDAM SHOP
color 07
mode con: cols=110 lines=48

if "%~1"=="SELECT_MENU" goto SELECT_MENU

cls
echo.
echo.
echo    ██████╗ ██╗   ██╗███╗   ██╗ ██████╗ ██████╗ ██╗   ██╗███╗   ███╗
echo    ██╔══██╗██║   ██║████╗  ██║██╔════╝ ██╔══██╗██║   ██║████╗ ████║
echo    ██████╔╝██║   ██║██╔██╗ ██║██║  ███╗██║  ██║██║   ██║██╔████╔██║
echo    ██╔══██╗██║   ██║██║╚██╗██║██║   ██║██║  ██║██║   ██║██║╚██╔╝██║
echo    ██████╔╝╚██████╔╝██║ ╚████║╚██████╔╝██████╔╝╚██████╔╝██║ ╚═╝ ██║
echo    ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝
echo.
echo.
echo                  ██████╗ ██╗   ██╗███╗   ██╗
echo                  ██╔══██╗██║   ██║████╗  ██║
echo                  ██████╔╝██║   ██║██╔██╗ ██║
echo                  ██╔══██╗██║   ██║██║╚██╗██║
echo                  ██████╔╝╚██████╔╝██║ ╚████║
echo                  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝
echo.
echo                 B A N G D A M   S H O P
echo.
echo        ============================================================
echo                    BUNGDUM x RUNIN  ^|  LOADER
echo        ============================================================
echo.

timeout /t 1 /nobreak >nul

echo  [01] Starting loader............................ OK
timeout /t 1 /nobreak >nul
echo  [02] Checking Windows........................... OK
timeout /t 1 /nobreak >nul
echo  [03] Windows 10 / Windows 11 mode.............. OK
timeout /t 1 /nobreak >nul
echo  [04] Preparing configuration................... OK
timeout /t 1 /nobreak >nul
echo  [05] System ready............................... OK
echo.

:KEY

echo.
echo        ============================================================
echo                           KEY SYSTEM
echo        ============================================================
echo.
echo             Enter your BangDam Shop license key
echo.
set "KEY="
set /p "KEY=             KEY: "

if /I "%KEY%"=="BUNGDUMxRUNIN-8ee9a3s" goto KEY_OK

echo.
echo             [X] INVALID KEY
echo             [X] ACCESS DENIED
echo.
timeout /t 2 /nobreak >nul
goto KEY


:KEY_OK

cls
echo.
echo        ============================================================
echo                    BUNGDUM x RUNIN
echo                         BANGDAM SHOP
echo        ============================================================
echo.
echo             [OK] KEY ACCEPTED
echo             [OK] ACCESS GRANTED
echo.
timeout /t 1 /nobreak >nul

echo             [01] Windows Check....................... OK
echo             [02] Windows 10 / 11 Mode................. OK
echo             [03] Gaming Configuration................ READY
echo             [04] Game Mode Configuration.............. READY
echo             [05] GPU Configuration................... READY
echo             [06] Network Configuration................ READY
echo             [07] Mouse Configuration.................. READY
echo             [08] Emulator Detection................... READY
echo.

echo        ============================================================
echo                         GAMING REG CONFIG
echo        ============================================================
echo.

set "REGFILE=%TEMP%\BangDam_Gaming.reg"

echo  [REG] Creating temporary registry file...

> "%REGFILE%" echo Windows Registry Editor Version 5.00
>>"%REGFILE%" echo.
>>"%REGFILE%" echo ; BUNGDUM x RUNIN - Safe Gaming Performance
>>"%REGFILE%" echo ; Windows 10 / Windows 11
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
>>"%REGFILE%" echo "GameDVR_DXGIHonorFSEBehaviorMode"=dword:00000001
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

if not exist "%REGFILE%" (
    echo.
    echo  [X] Could not create registry file.
    timeout /t 2 /nobreak >nul
    exit /b 1
)

echo  [OK] Temporary registry created.
echo.
echo  [REG] Importing configuration...

reg.exe import "%REGFILE%" >nul 2>&1

if errorlevel 1 (
    echo  [X] Registry import failed.
    echo  [INFO] Run this BAT as Administrator.
) else (
    echo  [OK] Registry configuration imported successfully.
)

echo.
echo  [REG] Removing temporary registry file...
del /f /q "%REGFILE%" >nul 2>&1

echo.
echo        ============================================================
echo                         CONFIGURATION DONE
echo        ============================================================
echo.
echo             Gaming Performance ............... APPLIED
echo             Game DVR ......................... DISABLED
echo             Power Throttling ................ DISABLED
echo             GPU Scheduling .................. CONFIGURED
echo             Network Settings ................ CONFIGURED
echo             Mouse Settings .................. CONFIGURED
echo.

timeout /t 1 /nobreak >nul

rem เปิด CMD ใหม่ แล้วปิดหน้าต่างหลักทันที
start "BUNGDUM x RUNIN" cmd /k ""%~f0" SELECT_MENU"
exit


:SELECT_MENU

chcp 65001 >nul
title BUNGDUM x RUNIN ^| BANGDAM SHOP
color 07
mode con: cols=100 lines=32

rem ============================================================
rem RAINBOW LOOP
rem ============================================================

for /L %%R in (1,1,12) do (
    cls

    if %%R==1 color 0C
    if %%R==2 color 06
    if %%R==3 color 0E
    if %%R==4 color 0A
    if %%R==5 color 02
    if %%R==6 color 0B
    if %%R==7 color 03
    if %%R==8 color 09
    if %%R==9 color 01
    if %%R==10 color 05
    if %%R==11 color 0D
    if %%R==12 color 0F

    echo.
    echo.
    echo              ==================================================
    echo.
    echo                       B U N G D U M   x   R U N I N
    echo.
    echo                         B A N G D A M   S H O P
    echo.
    echo              ==================================================
    echo.
    echo                         SYSTEM READY
    echo.
    echo                         LOADING EMULATOR
    echo.
    echo              ==================================================
    echo.

    timeout /t 1 /nobreak >nul
)

rem ============================================================
rem SELECT MENU
rem ============================================================

color 07
cls

echo.
echo.
echo        ============================================================
echo.
echo                         BUNGDUM x RUNIN
echo                           BANGDAM SHOP
echo.
echo        ============================================================
echo.
echo.
echo                         SELECT EMULATOR
echo.
echo.
echo                       [1]  BlueStacks
echo.
echo                       [2]  BlueStacks MSI
echo.
echo                       [0]  Exit
echo.
echo.
echo        ============================================================
echo.

set "CHOICE="
set /p "CHOICE=             Select [0-2]: "

if "%CHOICE%"=="1" goto BLUESTACKS
if "%CHOICE%"=="2" goto MSI
if "%CHOICE%"=="0" exit /b

echo.
echo             [X] Invalid selection.
timeout /t 1 /nobreak >nul
goto SELECT_MENU


:BLUESTACKS

cls
echo.
echo        ============================================================
echo                           BLUESTACKS
echo        ============================================================
echo.
echo             [SCAN] Searching for HD-Player.exe...
echo.

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_nxt\HD-Player.exe" (
    set "PLAYER=%ProgramFiles%\BlueStacks_nxt\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles%\BlueStacks\HD-Player.exe" (
    set "PLAYER=%ProgramFiles%\BlueStacks\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe" (
    set "PLAYER=%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks\HD-Player.exe" (
    set "PLAYER=%ProgramFiles(x86)%\BlueStacks\HD-Player.exe"
)

if not defined PLAYER goto NOTFOUND

goto LAUNCH


:MSI

cls
echo.
echo        ============================================================
echo                        BLUESTACKS MSI
echo        ============================================================
echo.
echo             [SCAN] Searching for HD-Player.exe...
echo.

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_msi2\HD-Player.exe" (
    set "PLAYER=%ProgramFiles%\BlueStacks_msi2\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles%\BlueStacks_msi5\HD-Player.exe" (
    set "PLAYER=%ProgramFiles%\BlueStacks_msi5\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe" (
    set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe" (
    set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe"
)

if not defined PLAYER goto NOTFOUND

goto LAUNCH


:LAUNCH

cls
echo.
echo        ============================================================
echo                         EMULATOR FOUND
echo        ============================================================
echo.
echo             [OK] Emulator detected
echo.
echo             [PATH]
echo             %PLAYER%
echo.
echo             [LAUNCH] Starting emulator...
echo.
echo        ============================================================
echo.

start "" "%PLAYER%"

timeout /t 2 /nobreak >nul

cls
echo.
echo        ============================================================
echo.
echo                     BUNGDUM x RUNIN
echo.
echo                  EMULATOR LAUNCHED
echo.
echo        ============================================================
echo.

timeout /t 2 /nobreak >nul

rem ปิด CMD ตัวเลือกเอง
exit /b 0


:NOTFOUND

cls
echo.
echo        ============================================================
echo                              ERROR
echo        ============================================================
echo.
echo             [X] Emulator not found.
echo.
echo             [INFO] Please check your BlueStacks installation.
echo.
echo        ============================================================
echo.

timeout /t 3 /nobreak >nul
exit /b 1
