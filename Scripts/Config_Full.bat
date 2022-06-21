@echo off

echo Applying configuration for additional applications
echo Start menu layout for Libre Office >> %UserProfile%\Documents\StartupChanges.txt

reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v StartLayoutFile /t REG_EXPAND_SZ /d C:\WSB\Config\startmenu\fullstart.xml /f >nul

taskkill /im explorer.exe /f

start explorer.exe

exit