@echo off
title 🌟 Bloodline Heritage - Installateur 🌟
chcp 65001 >nul
color 08
setlocal EnableDelayedExpansion

:: === CONFIGURATION ===
set "GAME_NAME=Bloodline Heritage"
set "SEVENZIP=BHData\7za.exe"
set "DEFAULT_PATH=C:\Jeux"
set "HELP_URL=https://blood-heritage.github.io"

:: === MENU PRINCIPAL ===
:MENU
cls
echo ======================================================================
echo     🌟 Bienvenue dans l'installateur de %GAME_NAME% 🌟
echo ======================================================================
echo.
echo    1. 🎮 Installer le jeu
echo    2. 📖 Manuel en ligne
echo    3. ❌ Quitter
echo.
set /p CHOICE=👉 Choisissez une option (1-3) : 

if "%CHOICE%"=="1" goto INSTALL
if "%CHOICE%"=="2" start "" "%HELP_URL%" & goto MENU
if "%CHOICE%"=="3" exit
goto MENU

:: === INSTALLATION ===
:INSTALL
cls
chcp 65001 >nul
echo ====================================================
echo          🚀 INSTALLATION DE %GAME_NAME%
echo ====================================================
echo.

:: Vérifier 7za
if not exist "%SEVENZIP%" (
    echo [ERREUR] ❌ Le fichier %SEVENZIP% est introuvable.
    pause
    goto MENU
)

:: Demander le chemin
set /p INSTALL_PATH=📁 Entrez le dossier d'installation (Défaut: %DEFAULT_PATH%) : 
if "%INSTALL_PATH%"=="" set INSTALL_PATH=%DEFAULT_PATH%
set "INSTALL_PATH=%INSTALL_PATH%\Bloodline_Heritage"

if not exist "%INSTALL_PATH%" mkdir "%INSTALL_PATH%"

:: Décompression
echo.
echo 🔄 Décompression du jeu...
call :Run7Zip "BHData\BH_Zip.7z" "%INSTALL_PATH%"

set "DATA_PATH=%INSTALL_PATH%\BH-2_Data"
if not exist "%DATA_PATH%" mkdir "%DATA_PATH%"

echo 📦 Extraction des données supplémentaires...
call :Run7Zip "BHData\Data_Part1.7z" "%DATA_PATH%"
call :Run7Zip "BHData\Data_Part2.7z" "%DATA_PATH%"
call :Run7Zip "BHData\Data_Part3.7z" "%DATA_PATH%"

:: Fichiers complémentaires
copy /Y "BHData\Bloodline.ico" "%INSTALL_PATH%\Bloodline.ico" >nul
copy /Y "BHData\BH-Desinstallation.bat" "%INSTALL_PATH%\BH-Desinstallation.bat" >nul

:: Raccourcis
call :SHORTCUTS

echo.
echo ✅ %GAME_NAME% installé avec succès dans :
echo    %INSTALL_PATH%
echo.
pause
goto MENU

:: === SOUS-PROGRAMMES ===

:Run7Zip
"%SEVENZIP%" x %1 -o%2 -y >nul
chcp 65001 >nul
exit /b

:SHORTCUTS

start "" BHData\createShortcut.bat "%INSTALL_PATH%" "%GAME_NAME%"

exit /b
