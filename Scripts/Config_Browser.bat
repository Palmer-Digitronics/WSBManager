@echo off

echo Applying Configuration for Brave Browser...
echo. 
echo Setting Brave as Default Browser
echo Set Brave as Default Browser >> %UserProfile%\Documents\StartupChanges.txt

start /wait "C:\Program Files\AutoHotKey\AutoHotKey.exe" "C:\WSB\Config\DefaultBrowser_Settings.ahk"

REM echo Added Chrome to Taskbar >> %UserProfile%\Documents\StartupChanges.txt

REM robocopy "C:\WSB\Config\chrome_taskbar\shortcuts" "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" /e /is /it /nfl /ndl /njh /njs /nc /np >nul

REM regedit /s "C:\WSB\Config\chrome_taskbar\chrometaskbar.reg" >nul

REM robocopy "C:\WSB\Config\startmenu\chromeshortcut" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" /e /is /it /nfl /ndl /njs /nc /np >nul

REM reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v StartLayoutFile /t REG_EXPAND_SZ /d C:\WSB\Config\startmenu\chromestartlayout.xml /f >nul

taskkill /im explorer.exe /f >nul

start explorer.exe >nul

exit