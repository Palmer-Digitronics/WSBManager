@echo off

attrib +h C:\WSB
echo Set mapped WSB folder to hidden >> %UserProfile%\Documents\StartupChanges.txt

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Desktop Shortcut for Tools Folder >> %UserProfile%\Documents\StartupChanges.txt

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\Tools.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Tools" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

echo Desktop Shortcut for Notepad++ >> %UserProfile%\Documents\StartupChanges.txt

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\Notepad++.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Program Files\Notepad++\notepad++.exe" >> %SCRIPT%
echo oLink.IconLocation = "C:\WSB\Assets\npp.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

echo Show Hidden Files, Show System Files, Show File Extensions in Explorer >> %UserProfile%\Documents\StartupChanges.txt
regedit /s "C:\WSB\Config\ExplorerConfig.reg"

echo Taskbar Configuration >> %UserProfile%\Documents\StartupChanges.txt
REM robocopy "C:\WSB\Config\ro_standard_taskbar\shortcuts" "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" /e /is /it /nfl /ndl /njh /njs /nc /np >nul
REM regedit /s "C:\WSB\Config\ro_standard_taskbar\taskbar.reg"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0x0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0x1 /f

echo Start Menu Configuration >> %UserProfile%\Documents\StartupChanges.txt
REM robocopy "C:\WSB\Config\startmenu\shortcuts" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" /e /is /it /nfl /ndl /njs /nc /np >nul
REM reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v LockedStartLayout /t REG_DWORD /d 0x1 /f >nul
REM reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v StartLayoutFile /t REG_EXPAND_SZ /d C:\WSB\Config\startmenu\standardstartv3.xml /f >nul
REM reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HideRecentlyAddedApps /t REG_DWORD /d 0x1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HidePowerOptions /t REG_DWORD /d 0x1 /f >nul

echo Set Notepad++ to replace Notepad >> %UserProfile%\Documents\StartupChanges.txt
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "\"C:\Program Files\Notepad++\notepad++.exe\" -notepadStyleCmdline -z" /f >nul

echo Set Notepad++ Config >> %UserProfile%\Documents\StartupChanges.txt
robocopy C:\WSB\Config\Notepad++ C:\Users\WDAGUtilityAccount\AppData\Roaming\Notepad++ /e /is /it /nfl /ndl /njh /njs /nc /np >nul

echo Notepad++ Folder as Workspace Context Menu >> %UserProfile%\Documents\StartupChanges.txt
regedit /s "C:\WSB\Config\nppcontext.reg"

xcopy C:\WSB\Config\Check_Data_for_ADS.cmd "C:\Users\WDAGUtilityAccount\Desktop\" /i

taskkill /im explorer.exe /f
start explorer.exe

exit