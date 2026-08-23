# Skybin

![Language](https://img.shields.io/badge/language-bash%20%2F%20batch-4EAA25.svg)

Personal commands for Windows, Linux and macOS. Commands without an extension
are intended for POSIX shells; `.cmd` files are intended for Windows.

## How to use

1. Clone the project.
2. Add the project folder to `PATH`.
3. Run `shelp` to list the commands available for the current platform.
4. Put local applications used by the Windows wrappers in `.bin`.

## Requirements

The base commands require a POSIX shell and standard utilities. Git Bash is
supported for the Windows wrappers that call `sh` or `bash`.

| Command | Additional dependency |
| --- | --- |
| `about` | `fastfetch` |
| `batstats` | `upower` |
| `md2pdf` | `pandoc`, LaTeX and the `eisvogel` template |
| `phone`, `share` | FileZilla |
| `sgit` | Git |
| `wol` | `wakeonlan` |
| `wow` | `wakeonlan` and `dig` |
| `setHeadphones` | PowerShell and `AudioDeviceCmdlets` |
| `tvoff`, `tvon` | `.bin/MultiMonitorTool/MultiMonitorTool.exe` |
| `wol.cmd`, `wow.cmd` | WakeOnLanC installed under `C:\Program Files\Aquila Technology\WakeOnLAN` |
| `cpp-cli.cmd` | `.bin/cpp-cli/cpp-cli.py` and Python |

## Machine-specific settings

`wol`, `wow`, `tvoff`, `tvon` and `setHeadphones` contain settings for one
computer and network. Update the IP address, MAC address, DDNS name, monitor
IDs and audio device names before using them on another machine.

`getwifikey` displays a saved Wi-Fi password in the terminal. Treat its output
as sensitive and avoid running it in a logged or shared terminal.

`md5sum` is kept for compatibility. Use `sha256sum` for integrity checks where
an attacker could alter the file.