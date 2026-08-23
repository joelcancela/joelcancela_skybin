:: ::Sets Speakers as default headphones.
@echo off
setlocal
PowerShell.exe -NoProfile -WindowStyle Hidden -File "%~dp0\.scripts\setHeadphones.ps1"
exit /b %errorlevel%