::[args, call with -h to check usage] ::CLI for C++ projects by Jeremy Junac (requires cpp-cli.py).
@echo off
setlocal
"%~dp0\.bin\cpp-cli\cpp-cli.py" %*
exit /b %errorlevel%