@echo off

echo Installing Forensics Applications... Please Wait

echo. >> %UserProfile%\StartupChanges.txt

start "" "C:\Program Files\7-Zip\7z.exe" e "C:\WSB\Apps\Regshot.zip" -o"C:\Tools\Regshot\" -y >nul
echo Regshot Added to Tools>> %UserProfile%\Documents\StartupChanges.txt

start /wait C:\WSB\Apps\Wireshark.exe /S /desktopicon=yes /quicklaunchicon=yes >nul
echo Wireshark Installed >> %UserProfile%\StartupChanges.txt

start /wait "" "C:\Program Files\7-zip\7z.exe" e "C:\WSB\Apps\JtR.zip" -o"C:\Tools\John\" -y >nul
echo John the Ripper Added to Tools >> %UserProfile%\Documents\StartupChanges.txt

start /wait "" "C:\Program Files\7-zip\7z.exe" e "C:\WSB\Apps\Johnny.zip" -o"C:\Temp\Johnny" -y >nul
start /wait "C:\Program Files\AutoHotKey\AutoHotKey.exe" C:\WSB\Config\johnny_setup.ahk
echo Johnny Installed >> %UserProfile%\Documents\StartupChanges.txt

start /wait C:\WSB\Apps\processhacker.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART >nul
echo Process Hacker Installed >> %UserProfile%\Documents\StartupChanges.txt

start "" "C:\Program Files\7-Zip\7z.exe" e "C:\WSB\Apps\CyberChef.zip" -o"C:\Tools\CyberChef" -y >nul
echo CyberChef Added to Tools >> %UserProfile%\Documents\StartupChanges.txt

start /wait "" "C:\Program Files\7-Zip\7z.exe" e "C:\WSB\Apps\networkminer.zip" -o"C:\Tools\NetworkMiner\" -y >nul
echo NetworkMiner Added to Tools >> %UserProfile%\Documents\StartupChanges.txt

start "" "C:\Program Files\7-zip\7z.exe" e "C:\WSB\Apps\QPDF.zip" -o"C:\Tools\QPDF\" -y >nul
echo QPDF Added to Tools >> %UserProfile%\Documents\StartupChanges.txt

msiexec /i "C:\WSB\Apps\openjdk.msi" /qn >nul
echo OpenJDK17 installed >> %UserProfile%\Documents\StartupChanges.txt

start /wait "" "C:\Program Files\7-zip\7z.exe" x "C:\WSB\Apps\Ghidra.zip" -o"C:\Tools\" -y >nul
echo Ghidra Added to Tools >> %UserProfile%\Documents\StartupChanges.txt

echo Done

exit