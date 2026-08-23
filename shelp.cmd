:: ::Lists all commands available in skybin.
@echo off
setlocal
sh "%~dp0\.scripts\listCommands_win.sh"
exit /b %errorlevel%