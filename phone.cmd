:: ::Opens FileZilla to transfer files from or to my phone.
@echo off
setlocal
set "FILEZILLA="
if exist "%ProgramFiles%\FileZilla FTP Client\filezilla.exe" set "FILEZILLA=%ProgramFiles%\FileZilla FTP Client\filezilla.exe"
if not defined FILEZILLA if exist "%ProgramFiles(x86)%\FileZilla FTP Client\filezilla.exe" set "FILEZILLA=%ProgramFiles(x86)%\FileZilla FTP Client\filezilla.exe"
if not defined FILEZILLA for %%F in (filezilla.exe) do set "FILEZILLA=%%~$PATH:F"
if not defined FILEZILLA (
	echo Error: FileZilla was not found. 1>&2
	exit /b 1
)
start "" /b "%FILEZILLA%" -c 0/Phone
exit /b %errorlevel%