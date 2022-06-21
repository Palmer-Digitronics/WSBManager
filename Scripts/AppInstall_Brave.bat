@echo off

Echo Installing Brave Browser... Please Wait
start /wait C:\WSB\Apps\Brave.exe /silent /install >nul
echo Installed Brave Browser >> %UserProfile%\StartupChanges.txt

exit