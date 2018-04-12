@echo off
mode con:cols=110 lines=18
title ScreenfetchWin

echo loading...
 :: ScreenFetchWin Software License
 :: 
 :: It's free to use for everyone, always, in all environments.
 :: Under no circumstances can our software be monetized for commercial or any other purposes.
 ::
 :: ScreenFetchWin comes with NO WARRANTY. We are not responsible for any damages.
 :: You can edit, break, and modify the program for your own personal and academic use.
 :: You cannot sell, modify and/or repackage our software and redistribute it.
 :: In short, don't be an asshole and you're good.

:: Version
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" set version=Windows 10
if "%version%" == "6.3" set version=Windows 8.1
if "%version%" == "6.2" set version=Windows 8

:: Resolution
for /f "delims=" %%# in  ('"wmic desktopmonitor get screenheight, screenwidth /format:value"') do (
  set "%%#">nul
)

rem :: CPU name
for /f "delims=" %%# in  ('"wmic cpu get name /format:value"') do (
  set "%%#">nul
)

rem :: Ram
for /f "delims=" %%# in  ('"wmic ComputerSystem get TotalPhysicalMemory /format:value"') do (
  set "%%#">nul
)

Rem :: Disk
FOR /F "usebackq tokens=1,2" %%f IN (`PowerShell -NoProfile -EncodedCommand "CgBnAHcAbQBpACAAVwBpAG4AMwAyAF8ATABvAGcAaQBjAGEAbABEAGkAcwBrACAALQBGAGkAbAB0AGUAcgAgACIAQwBhAHAAdABpAG8AbgA9ACcAQwA6ACcAIgB8ACUAewAkAGcAPQAxADAANwAzADcANAAxADgAMgA0ADsAWwBpAG4AdABdACQAZgA9ACgAJABfAC4ARgByAGUAZQBTAHAAYQBjAGUALwAkAGcAKQA7AFsAaQBuAHQAXQAkAHQAPQAoACQAXwAuAFMAaQB6AGUALwAkAGcAKQA7AFcAcgBpAHQAZQAtAEgAbwBzAHQAIAAoACQAdAAtACQAZgApACwAJABmAH0ACgA="`) DO ((SET U=%%f)&(SET F=%%g))

rem :: Boot time
for /f %%a in ('WMIC OS GET lastbootuptime ^| find "."') DO set DTS=%%a 
set BOOTTIME=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%  %DTS:~8,2%:%DTS:~10,2%


rem :: GPU Name
for /F "tokens=* skip=1" %%n in ('WMIC path Win32_VideoController get Name ^| findstr "."') do set GPU_NAME=%%n 

rem :: x86 x64
IF EXIST "%PROGRAMFILES(X86)%" (set bit=x64) ELSE (set bit=x86) 

rem ::Disk space
set /a total=%F%+%U%

rem :: In line 55 have a error because UFT8 dont work fine
set ESC=
set RD=%ESC%[31m
set GN=%ESC%[32m
set YW=%ESC%[33m
set BL=%ESC%[34m
