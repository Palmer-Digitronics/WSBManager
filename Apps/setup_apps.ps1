Write-Output "Downloading AutoHotKey"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\AutoHotkey.exe -Uri https://www.autohotkey.com/download/ahk-install.exe

Write-Output "Downloading Notepad++"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\npp.exe -Uri https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.1/npp.8.4.1.Installer.x64.exe

Write-Output "Downloading 7-Zip"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\7z.exe -Uri https://www.7-zip.org/a/7z2107-x64.exe

Write-Output "Downloading SumatraPDF"
Invoke-WebRequest -UserAgent "Wget" -OutFile "C:\Sandbox\Apps\SumatraPDF.exe" -Uri "https://www.sumatrapdfreader.org/dl/rel/SumatraPDF-3.3.3-64-install.exe"

Write-Output "Downloading MBox EML Viewer"
Invoke-WebRequest -UserAgent "Wget" -OutFile "C:\Sandbox\Apps\mbox.zip" -MaximumRedirection 2 -Uri "https://sourceforge.net/projects/mbox-viewer/files/latest/download"

Write-Output "Downloading Icon Extractor"
Invoke-WebRequest -UserAgent "Wget" -OutFile "C:\Sandbox\Apps\IconExtractor.exe" -MaximumRedirection 2 -Uri "https://sourceforge.net/projects/icon-extractor/files/latest/download"

Write-Output "Downloading Brave Browser"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\Brave.exe -Uri https://github.com/brave/brave-browser/releases/download/v1.38.117/BraveBrowserStandaloneSetup.exe

Write-Output "Downloading SysInternals Suite"
Invoke-WebRequest -UserAgent "Wget" -OutFile "C:\Sandbox\Apps\SysInternals.zip" -Uri "https://download.sysinternals.com/files/SysinternalsSuite.zip"

Write-Output "Downloading Regshot"
Invoke-WebRequest -UserAgent "Wget" -OutFile "C:\Sandbox\Apps\Regshot.zip" -Uri "https://github.com/Seabreg/Regshot/archive/refs/heads/master.zip"

Write-Output "Downloading Wireshark"
Invoke-WebRequest -UserAgent "Wget" -OutFile C:\Sandbox\Apps\Wireshark.exe -Uri "https://2.na.dl.wireshark.org/win64/Wireshark-win64-3.6.5.exe"

Write-Output "Downloading John the Ripper Bleeding Jumbo"
Invoke-WebRequest -UserAgent "Wget" -OutFile "C:\Sandbox\Apps\JtR.zip" -Uri "https://github.com/openwall/john/archive/refs/heads/bleeding-jumbo.zip"

Write-Output "Downloading Johnny"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\Johnny.zip -Uri https://openwall.info/wiki/_media/john/johnny/johnny_2.2_win.zip

Write-Output "Downloading Process Hacker"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\processhacker.exe -Uri https://github.com/processhacker/processhacker/releases/download/v2.39/processhacker-2.39-setup.exe

Write-Output "Downloading CyberChef"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\CyberChef.zip -Uri https://github.com/gchq/CyberChef/releases/download/v9.39.1/CyberChef_v9.39.1.zip

Write-Output "Downloading Network Miner"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\networkminer.zip -Uri https://www.netresec.com/?download=NetworkMiner

Write-Output "Downloading QPDF"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\QPDF.zip -Uri https://github.com/qpdf/qpdf/releases/download/release-qpdf-10.6.3/qpdf-10.6.3-bin-msvc64.zip

Write-Output "Downloading GoWitness"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\GoWitness.exe -Uri https://github.com/sensepost/gowitness/releases/download/2.3.6/gowitness-2.3.6-windows-amd64.exe

Write-Output "Downloading LibreOffice... This may a while..."
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\libreoffice.msi -Uri https://download.documentfoundation.org/libreoffice/stable/7.3.4/win/x86_64/LibreOffice_7.3.4_Win_x64.msi

Write-Output "Downloading OpenJDK 17"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\openjdk.msi -Uri https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2%2B8/OpenJDK17U-jdk_x64_windows_hotspot_17.0.2_8.msi

Write-Output "Downloading Ghidra... This may take some time"
Invoke-WebRequest -UserAgent "Wget" -Outfile C:\Sandbox\Apps\Ghidra.zip -Uri https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.2_build/ghidra_10.1.2_PUBLIC_20220125.zip