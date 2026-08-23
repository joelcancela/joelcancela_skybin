::[git arguments] ::Executes given git command in all repositories of current folder.
@echo off
setlocal
bash "%~dp0sgit" %*
exit /b %errorlevel%