:: ::Switches on the TV screen (HDMI, requires MultiMonitorTool.exe).
@echo off
setlocal
set "MULTI_MONITOR_PATH=%~dp0\.bin\MultiMonitorTool\MultiMonitorTool.exe"
if not exist "%MULTI_MONITOR_PATH%" (
	echo Error: MultiMonitorTool.exe not found. 1>&2
	exit /b 1
)
"%MULTI_MONITOR_PATH%" /enable "MONITOR\TCL0000\{4d36e96e-e325-11ce-bfc1-08002be10318}\0005"
if errorlevel 1 exit /b %errorlevel%
"%MULTI_MONITOR_PATH%" /SetPrimary "MONITOR\AUS27AF\{4d36e96-e325-11ce-bfc1-08002be10318}\0002"
exit /b %errorlevel%