:: ::Computes the MD5 hash of a file.
@echo off
setlocal
if "%~1"=="" (
	echo Usage: %~nx0 FILE 1>&2
	exit /b 2
)
certutil -hashfile "%~1" MD5
exit /b %errorlevel%