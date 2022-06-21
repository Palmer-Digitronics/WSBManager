@echo off

echo Starting configuration...

echo Installed AutoHotKey scripting language >> %UserProfile%\Documents\StartupChanges.txt
start /wait C:\WSB\Apps\AutoHotKey.exe /S
echo Block user input until setup has completed. >> %UserProfile%\Documents\StartupChanges.txt
echo. >> %UserProfile%\Documents\StartupChanges.txt
start "C:\Program Files\AutoHotKey\AutoHotKey.exe" "C:\WSB\Config\Func\BlockInput.ahk"

echo Changes to Appearance: >> %UserProfile%\Documents\StartupChanges.txt
echo. >> %UserProfile%\Documents\StartupChanges.txt
start /wait C:\WSB\Scripts\Appearance.bat

echo. >> %UserProfile%\Documents\StartupChanges.txt

echo Applications Installed: >> %UserProfile%\Documents\StartupChanges.txt
echo. >> %UserProfile%\Documents\StartupChanges.txt
start /wait C:\WSB\Scripts\AppInstall.bat

echo. >> %UserProfile%\Documents\StartupChanges.txt

echo Configuration Changes Applied: >> %UserProfile%\Documents\StartupChanges.txt
echo. >> %UserProfile%\Documents\StartupChanges.txt
start /wait C:\WSB\Scripts\Config.bat