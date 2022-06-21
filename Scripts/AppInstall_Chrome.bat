@echo off

Echo Installing Google Chrome... Please Wait
echo. 
start /wait C:\WSB\Apps\ChromeStandaloneSetup64.exe /silent /install
echo Installed Google Chrome >> %UserProfile%\StartupChanges.txt
echo Done

exit