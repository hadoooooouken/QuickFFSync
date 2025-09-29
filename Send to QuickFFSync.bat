@echo off
title Send to QuickFFSync
mode con: lines=3 cols=60

set "APP_PATH=E:\ffmpeg\dist\QuickFFSync.exe"

start "" "%APP_PATH%" "%~f1"