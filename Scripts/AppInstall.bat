@echo off

echo Installing Applications... Please Wait

start /wait C:\WSB\Apps\npp.exe /S
echo Installed Notepad++ >> %UserProfile%\Documents\StartupChanges.txt

start /wait C:\WSB\Apps\7z.exe /S
echo Installed 7-Zip >> %UserProfile%\Documents\StartupChanges.txt

start /wait C:\WSB\Apps\SumatraPDF.exe -install -s
echo Installed SumatraPDF >> %UserProfile%\Documents\StartupChanges.txt

echo f | xcopy C:\WSB\Apps\IconExtractor.exe C:\Tools\IconExtractor.exe /c /i /y /q
echo Added Icon Extractor to Tools >> %UserProfile%\Documents\StartupChanges.txt

start "" "C:\Program Files\7-zip\7z.exe" e C:\WSB\Apps\SysInternals.zip -o"C:\Tools\SysInternals\" -y >nul
echo Added SysInternals Suite >> %UserProfile%\Documents\StartupChanges.txt

start "" "C:\Program Files\7-Zip\7z.exe" e C:\WSB\Apps\mbox.zip -o"C:\Program Files (x86)\mBox" -y >nul
echo Added mBox  >> %UserProfile%\Documents\StartupChanges.txt

exit