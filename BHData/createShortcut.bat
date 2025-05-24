@echo off
set "INSTALL_PATH=%~1"
set "GAME_NAME=%~2"

powershell -ExecutionPolicy Bypass -File "BHData\create_shortcuts.ps1" -InstallPath "%INSTALL_PATH%" -GameName "%GAME_NAME%"

exit
