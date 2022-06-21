@echo off

echo Setting Windows Appearance... Please Wait

echo Set Windows Color Settings to 'Dark' >> %UserProfile%\Documents\StartupChanges.txt
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 00000000 /f

echo Applied custom dark theme >> %UserProfile%\Documents\StartupChanges.txt
start /wait C:\WSB\Config\WSBDark.deskthemepack

start /wait taskkill /F /IM SystemSettings.exe

exit
