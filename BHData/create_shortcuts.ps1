param(
    [string]$InstallPath,
    [string]$GameName
)

$WshShell = New-Object -ComObject WScript.Shell

# Raccourci Menu Démarrer - Jeu
$shortcut = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\$GameName.lnk")
$shortcut.TargetPath = "$InstallPath\BH-2.exe"
$shortcut.WorkingDirectory = $InstallPath
$shortcut.IconLocation = "$InstallPath\Bloodline.ico"
$shortcut.Save()

# Raccourci Menu Démarrer - Désinstallation
$shortcut = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\$GameName - Desinstallation.lnk")
$shortcut.TargetPath = "$InstallPath\BH-Desinstallation.bat"
$shortcut.WorkingDirectory = $InstallPath
$shortcut.IconLocation = "$InstallPath\Bloodline.ico"
$shortcut.Save()

# Bureau - Jeu
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcut = $WshShell.CreateShortcut("$desktop\$GameName.lnk")
$shortcut.TargetPath = "$InstallPath\BH-2.exe"
$shortcut.WorkingDirectory = $InstallPath
$shortcut.IconLocation = "$InstallPath\Bloodline.ico"
$shortcut.Save()

# Bureau - Désinstallation
$shortcut = $WshShell.CreateShortcut("$desktop\$GameName - Desinstallation.lnk")
$shortcut.TargetPath = "$InstallPath\BH-Desinstallation.bat"
$shortcut.WorkingDirectory = $InstallPath
$shortcut.IconLocation = "$InstallPath\Bloodline.ico"
$shortcut.Save()
