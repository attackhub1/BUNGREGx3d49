@echo off
setlocal EnableExtensions EnableDelayedExpansion

chcp 65001 >nul
title BUNGDUM x RUNIN ^| BANGDAM SHOP
color 07

if "%~1"=="SELECT_MENU" goto SELECT_MENU

mode con: cols=90 lines=48

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Add-Type -AssemblyName System.Windows.Forms; ^
Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public class W{[DllImport(\"kernel32.dll\")]public static extern IntPtr GetConsoleWindow();[DllImport(\"user32.dll\")]public static extern bool SetWindowPos(IntPtr h,IntPtr i,int x,int y,int cx,int cy,uint f);}'; ^
Start-Sleep -Milliseconds 300; ^
$h=[W]::GetConsoleWindow(); ^
$s=[System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea; ^
[W]::SetWindowPos($h,[IntPtr]::Zero,[int](($s.Width-720)/2),[int](($s.Height-620)/2),720,620,0x0040)" >nul 2>&1

cls
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
echo                    Connecting to Key Server...
echo.

set "KEY_URL=https://raw.githubusercontent.com/attackhub1/KeyBat/refs/heads/main/Key.txt"
set "KEYFILE=%TEMP%\BangDam_Keys_%RANDOM%.txt"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$ErrorActionPreference='Stop'; try { (Invoke-WebRequest -UseBasicParsing '%KEY_URL%' -TimeoutSec 10).Content | Set-Content -LiteralPath '%KEYFILE%' -Encoding UTF8 } catch { exit 1 }" >nul 2>&1

if not exist "%KEYFILE%" (
    echo        [ERROR] Cannot connect to GitHub Key Server.
    echo.
    echo        Please check your Internet connection.
    echo.
    pause
    exit /b
)

for %%A in ("%KEYFILE%") do if %%~zA==0 (
    del /f /q "%KEYFILE%" >nul 2>&1
    echo        [ERROR] Key list is empty.
    echo.
    pause
    exit /b
)

echo        [OK] Key Server Connected
echo.
echo        ============================================================
echo.
set "INPUT_KEY="
set /p "INPUT_KEY=        Enter Key: "

if not defined INPUT_KEY (
    del /f /q "%KEYFILE%" >nul 2>&1
    echo.
    echo        [ERROR] Key cannot be empty.
    echo.
    pause
    exit /b
)

set "KEY_FOUND=0"

for /f "usebackq delims=" %%K in ("%KEYFILE%") do (
    set "LINE=%%K"

    if /i "!LINE!"=="!INPUT_KEY!" (
        set "KEY_FOUND=1"
    )
)

del /f /q "%KEYFILE%" >nul 2>&1

if "%KEY_FOUND%"=="0" (
    echo.
    echo        ============================================================
    echo.
    echo                         INVALID KEY
    echo.
    echo        This key is not registered on GitHub.
    echo.
    echo        ============================================================
    echo.
    pause
    exit /b
)

echo.
echo        ============================================================
echo.
echo                         KEY VERIFIED
echo.
echo        ============================================================
echo.
echo        Applying safe gaming performance settings...
echo.

set "REGFILE=%TEMP%\BangDam_Gaming_%RANDOM%.reg"

(
echo Windows Registry Editor Version 5.00
echo.
echo ; BUNGDUM x RUNIN
echo ; Safe Gaming Performance
echo ; Windows 10 / Windows 11
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
echo "SystemResponsiveness"=dword:00000000
echo "NetworkThrottlingIndex"=dword:ffffffff
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games]
echo "Affinity"=dword:00000000
echo "Background Only"="False"
echo "Clock Rate"=dword:00002710
echo "GPU Priority"=dword:00000008
echo "Priority"=dword:00000006
echo "Scheduling Category"="High"
echo "SFIO Priority"="High"
echo.
echo [HKEY_CURRENT_USER\System\GameConfigStore]
echo "GameDVR_Enabled"=dword:00000000
echo "GameDVR_FSEBehaviorMode"=dword:00000002
echo "GameDVR_HonorUserFSEBehaviorMode"=dword:00000001
echo "GameDVR_DXGIHonorFSEBehaviorMode"=dword:00000001
echo "GameDVR_EFSEFeatureFlags"=dword:00000000
echo.
echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR]
echo "AppCaptureEnabled"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
echo "Win32PrioritySeparation"=dword:00000026
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers]
echo "HwSchMode"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling]
echo "PowerThrottlingOff"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config]
echo "DODownloadMode"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters]
echo "Tcp1323Opts"=dword:00000001
echo "MaxUserPort"=dword:0000fffe
echo "TcpTimedWaitDelay"=dword:0000001e
echo.
echo [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
echo "SubscribedContent-338389Enabled"=dword:00000000
echo "SubscribedContent-353694Enabled"=dword:00000000
echo "SubscribedContent-353696Enabled"=dword:00000000
echo "SystemPaneSuggestionsEnabled"=dword:00000000
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "MenuShowDelay"="0"
echo.
echo [HKEY_CURRENT_USER\Control Panel\Mouse]
echo "ActiveWindowTracking"=dword:00000000
echo "Beep"="No"
echo "MouseHoverHeight"="100"
echo "MouseHoverTime"="900"
echo "MouseHoverWidth"="100"
echo "MouseSensitivity"="10"
echo "MouseSpeed"="1"
echo "MouseThreshold1"="6"
echo "MouseThreshold2"="10"
echo "SnapToDefaultButton"="0"
echo "SwapMouseButtons"="0"
echo.
echo [HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
echo "AutoRepeatDelay"="1000"
echo "AutoRepeatRate"="500"
echo "BounceTime"="0"
echo "DelayBeforeAcceptance"="1000"
echo "Flags"="126"
) > "%REGFILE%"

reg.exe import "%REGFILE%" >nul 2>&1

if errorlevel 1 (
    del /f /q "%REGFILE%" >nul 2>&1
    echo.
    echo        [ERROR] Registry import failed.
    echo        Try running this BAT as Administrator.
    echo.
    pause
    exit /b
)

del /f /q "%REGFILE%" >nul 2>&1

echo        [OK] Gaming Performance
echo        [OK] Game DVR
echo        [OK] Power Throttling
echo        [OK] GPU Scheduling
echo        [OK] Network Settings
echo        [OK] Mouse Settings
echo.
echo        ============================================================
echo.
echo                         READY
echo.
echo        Opening Emulator Selection...
echo.
echo        ============================================================
echo.

timeout /t 1 /nobreak >nul

start "BUNGDUM x RUNIN" cmd /k ""%~f0" SELECT_MENU"
exit /b


:SELECT_MENU

chcp 65001 >nul
title BUNGDUM x RUNIN ^| SELECT EMULATOR
color 07
mode con: cols=70 lines=24

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Add-Type -AssemblyName System.Windows.Forms; ^
Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public class W{[DllImport(\"kernel32.dll\")]public static extern IntPtr GetConsoleWindow();[DllImport(\"user32.dll\")]public static extern bool SetWindowPos(IntPtr h,IntPtr i,int x,int y,int cx,int cy,uint f);}'; ^
Start-Sleep -Milliseconds 300; ^
$h=[W]::GetConsoleWindow(); ^
$s=[System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea; ^
[W]::SetWindowPos($h,[IntPtr]::Zero,[int](($s.Width-560)/2),[int](($s.Height-390)/2),560,390,0x0040)" >nul 2>&1

:MENU

cls
echo.
echo        ============================================================
echo.
echo                     BUNGDUM x RUNIN
echo                       BANGDAM SHOP
echo.
echo        ============================================================
echo.
echo                       SELECT EMULATOR
echo.
echo.
echo                    [1]  BlueStacks
echo.
echo                    [2]  BlueStacks MSI
echo.
echo                    [0]  Exit
echo.
echo        ============================================================
echo.

set "CHOICE="
set /p "CHOICE=             Select [0-2]: "

if "%CHOICE%"=="1" goto BLUESTACKS
if "%CHOICE%"=="2" goto BLUESTACKS_MSI
if "%CHOICE%"=="0" exit /b

echo.
echo             Invalid selection.
timeout /t 1 /nobreak >nul
goto MENU


:BLUESTACKS

cls
echo.
echo        ============================================================
echo.
echo                     BLUE STACKS
echo.
echo        ============================================================
echo.
echo             Searching for BlueStacks...
echo.

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_nxt\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_nxt\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles%\BlueStacks\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks\HD-Player.exe"

if not defined PLAYER goto BS_NOT_FOUND

echo             [OK] BlueStacks Found
echo.
echo             Launching...
echo.

start "" "%PLAYER%"
timeout /t 1 /nobreak >nul
exit /b


:BLUESTACKS_MSI

cls
echo.
echo        ============================================================
echo.
echo                    BLUE STACKS MSI
echo.
echo        ============================================================
echo.
echo             Searching for BlueStacks MSI...
echo.

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_msi2\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_msi2\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles%\BlueStacks_msi5\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_msi5\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe"
if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe"

if not defined PLAYER goto MSI_NOT_FOUND

echo             [OK] BlueStacks MSI Found
echo.
echo             Launching...
echo.

start "" "%PLAYER%"
timeout /t 1 /nobreak >nul
exit /b


:BS_NOT_FOUND

cls
echo.
echo        ============================================================
echo.
echo                     BLUE STACKS
echo.
echo        ============================================================
echo.
echo             [ERROR] BlueStacks was not found.
echo.
echo             Please install BlueStacks first.
echo.
echo        ============================================================
echo.
pause
exit /b


:MSI_NOT_FOUND

cls
echo.
echo        ============================================================
echo.
echo                   BLUE STACKS MSI
echo.
echo        ============================================================
echo.
echo             [ERROR] BlueStacks MSI was not found.
echo.
echo             Please install BlueStacks MSI first.
echo.
echo        ============================================================
echo.
pause
exit /b