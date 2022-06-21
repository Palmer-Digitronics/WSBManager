@echo off

echo Applying Configuration for Forensic Applications...
echo. 
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Adding Desktop Shortcut for SysInternals
echo. >> %UserProfile%\Documents\StartupChanges.txt
echo Desktop Shortcut for SysInternals Suite >> %UserProfile%\Documents\StartupChanges.txt

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\SysInternals.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Tools\SysInternals\" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

echo Adding Desktop Shortcut for Regshot
echo. >> %UserProfile%\Documents\StartupChanges.txt
echo Desktop Shortcut for Regshot >> %UserProfile%\Documents\StartupChanges.txt

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\Regshot.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Tools\Regshot\" >> %SCRIPT%
echo oLink.IconLocation = "C:\WSB\Assets\Regshot.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

echo Adding Desktop Shortcut for John the Ripper
echo. >> %UserProfile%\Documents\StartupChanges.txt
echo Desktop Shortcut for John the Ripper >> %UserProfile%\Documents\StartupChanges.txt

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\John.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Tools\John" >> %SCRIPT%
echo oLink.IconLocation = "C:\WSB\Assets\jtr2.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

echo Adding shortcuts in start menu
echo Start menu layout for forensic applications >> %UserProfile%\Documents\StartupChanges.txt

robocopy "C:\WSB\Config\startmenu\forensicshortcut" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" /e /is /it /nfl /ndl /njs /nc /np >nul

reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v StartLayoutFile /t REG_EXPAND_SZ /d C:\WSB\Config\startmenu\forensicstartv2.xml /f >nul

taskkill /im explorer.exe /f >nul

start explorer.exe >nul

del "C:\Temp\processhacker-2.39-setup.exe"
del "C:\Temp\processhacker.7z"
rmdir C:\Temp

exit