::[markdown filename with ext] ::Converts given markdown file to PDF using pandoc (requires LaTeX).
@echo off
setlocal
if "%~1"=="" (
	echo Usage: %~nx0 FILE.md 1>&2
	exit /b 2
)
if not exist "%~1" (
	echo Error: file not found: %~1 1>&2
	exit /b 1
)
"%~dp0\.bin\pandoc\pandoc.exe" "%~1" -o "%~dpn1.pdf" --from markdown --template eisvogel
exit /b %errorlevel%