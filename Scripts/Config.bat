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

REM echo Desktop Shortcut for Kernel EML Viewer >> %UserProfile%\Documents\StartupChanges.txt

REM echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
REM echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\KernelEMLViewer.lnk" >> %SCRIPT%
REM echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
REM echo oLink.TargetPath = "C:\Program Files (x86)\Kernel EML Viewer\Kernel EML Viewer.exe" >> %SCRIPT%
REM echo oLink.IconLocation = "C:\WSB\Assets\KEV.ico" >> %SCRIPT%
REM echo oLink.Save >> %SCRIPT%

echo Desktop Shortcut for Windows Terminal >> %UserProfile%\Documents\StartupChanges.txt

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\WindowsTerminal.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\WSB\Apps\WindowsTerminal\WindowsTerminal.exe" >> %SCRIPT%
echo oLink.IconLocation = "C:\WSB\Assets\term.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

echo Desktop Shortcut for Universal Silent Switch Finder >> %UserProfile%\Documents\StartupChanges.txt

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\UniversalSilentSwitchFinder.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\WSB\Apps\ussf.exe" >> %SCRIPT%
echo oLink.IconLocation = "C:\WSB\Assets\ussf.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

echo Show Hidden Files, Show System Files, Show File Extensions in Explorer >> %UserProfile%\Documents\StartupChanges.txt
regedit /s "C:\WSB\Config\ExplorerConfig.reg"

echo Taskbar Configuration >> %UserProfile%\Documents\StartupChanges.txt
robocopy "C:\WSB\Config\ro_standard_taskbar\shortcuts" "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" /e /is /it /nfl /ndl /njh /njs /nc /np >nul
regedit /s "C:\WSB\Config\ro_standard_taskbar\taskbar.reg"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0x0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0x1 /f

echo Start Menu Configuration >> %UserProfile%\Documents\StartupChanges.txt
robocopy "C:\WSB\Config\startmenu\shortcuts" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" /e /is /it /nfl /ndl /njs /nc /np >nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v LockedStartLayout /t REG_DWORD /d 0x1 /f >nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v StartLayoutFile /t REG_EXPAND_SZ /d C:\WSB\Config\startmenu\standardstartv3.xml /f >nul
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HideRecentlyAddedApps /t REG_DWORD /d 0x1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HidePowerOptions /t REG_DWORD /d 0x1 /f >nul

echo Set Notepad++ to replace Notepad >> %UserProfile%\Documents\StartupChanges.txt
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "\"C:\Program Files\Notepad++\notepad++.exe\" -notepadStyleCmdline -z" /f >nul

echo Set Notepad++ Config >> %UserProfile%\Documents\StartupChanges.txt
robocopy C:\WSB\Config\Notepad++ C:\Users\WDAGUtilityAccount\AppData\Roaming\Notepad++ /e /is /it /nfl /ndl /njh /njs /nc /np >nul

echo Notepad++ Folder as Workspace Context Menu >> %UserProfile%\Documents\StartupChanges.txt
regedit /s "C:\WSB\Config\nppcontext.reg"

xcopy C:\WSB\Config\Check_Data_for_ADS.cmd "C:\Users\WDAGUtilityAccount\Desktop\" /i

REM echo Set Terminal as Default Command Shell >> %UserProfile%\Documents\StartupChanges.txt
REM call C:\WSB\Config\WTDefaults.cmd >nul

echo "Windows Terminal Here" Context Menu >> %UserProfile%\Documents\StartupChanges.txt
reg import "C:\WSB\Config\termcontext.reg" >nul

taskkill /im explorer.exe /f
start explorer.exe

exit