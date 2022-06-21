@echo off

Echo Installing More Applications... Please Wait

echo Installed LibreOffice >> %UserProfile%\Documents\StartupChanges.txt
start /wait MsiExec.exe /i C:\WSB\Apps\libreoffice.msi RebootYesNo=No /q

exit