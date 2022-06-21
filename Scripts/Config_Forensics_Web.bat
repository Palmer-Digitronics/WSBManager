@echo off

echo Applying Configuration for Forensic Web Applications...
echo.
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Adding Desktop Shortcut for GoWitness
echo. >> %UserProfile%\Documents\StartupChanges.txt
echo Desktop Shortcut for GoWitness >> %UserProfile%\Documents\StartupChanges.txt

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\Users\WDAGUtilityAccount\Desktop\GoWitness.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Program Files\GoWitness" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

exit