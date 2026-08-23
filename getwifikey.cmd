::[SSID] ::Find Wi-Fi password for a given registered Wi-Fi on this PC.
@echo off
setlocal
if "%~1"=="" (
	echo Usage: %~nx0 SSID 1>&2
	exit /b 2
)
netsh wlan show profile name="%~1" key=clear
exit /b %errorlevel%