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
