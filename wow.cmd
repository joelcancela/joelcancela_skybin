:: ::Wakes up my PC from the internet (requires WakeOnLanC.exe).
@echo off
setlocal
set "WAKE_CFG=%~dp0\.bin\wake.cfg"
if not exist "%WAKE_CFG%" (
	echo Error: %WAKE_CFG% not found. 1>&2
	exit /b 1
)
for /f "usebackq eol=# tokens=1,* delims==" %%A in ("%WAKE_CFG%") do (
	if not "%%A"=="" set "%%A=%%B"
)
if not defined MAC (
	echo Error: MAC not configured in .bin/wake.cfg. 1>&2
	exit /b 1
)
if not defined HOST (
	echo Error: HOST not configured in .bin/wake.cfg. 1>&2
	exit /b 1
)
set "WAKEONLAN_DIR=C:\Program Files\Aquila Technology\WakeOnLAN"
if not exist "%WAKEONLAN_DIR%\WakeOnLanC.exe" (
	echo Error: WakeOnLanC.exe not found. 1>&2
	exit /b 1
)
pushd "%WAKEONLAN_DIR%" || exit /b 1
WakeOnLanC.exe -w -agent %HOST% -mac %MAC%
set "result=%errorlevel%"
popd
exit /b %result%