#NoEnv
#Warn
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%

IniWrite, %A_ScriptDir%, WSBM.ini, Host Machine, Install Dir

AppDir = %A_ScriptDir%\Apps\

WSBMContext = %A_AppData%\Microsoft\Windows\SendTo\WSBM*.lnk
if not (FileExist(WSBMContext))
    FileCreateShortcut, %A_ScriptDir%\Data\, %A_AppData%\Microsoft\Windows\SendTo\WSBM Data Folder.lnk
IniWrite, SendTo, WSBM.ini, Host Machine, Context Menu

objWMIService := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\" A_ComputerName "\root\cimv2")
For objOperatingSystem in objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
   OS_Ver := objOperatingSystem.Caption
RegExMatch(OS_Ver, "\d\d", OS_Num)
OS_Clean = "Win"%OS_Num%

IniWrite, %OS_Clean%, WSBM.ini, Host Machine, OS

url = ""
save = ""
message = 0x1100

Download(url, save, msg = 0x1100, sleep = 250) {
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WebRequest.Open("HEAD", url)
    WebRequest.Send()
    total := WebRequest.GetResponseHeader("Content-Length")
	SetTimer, _dlprocess, %sleep%
	UrlDownloadToFile, %url%, %save%
	SetTimer, _dlprocess, Off
	Return, ErrorLevel
	_dlprocess:
	FileGetSize, current, %save%, K
	Process, Exist
	PostMessage, msg, current * 1024, total, , ahk_pid %ErrorLevel%
    Sleep, 500
    Progress, Off
	Return
}

ProgressGUI() {
    Global
    Gui, Add, Progress, Section vProgressBar w500 -Smooth
    Gui, Font, bold
    Gui, Add, Text, vProgressN ys, ..........
    Gui, Add, Text, xm Section, Downloading:
    Gui, Font
    Gui, Add, Text, ys, %url%
    Gui, Add, Text, vKB ys w200
    Gui, Show, , Downloading...
    OnMessage(message, "SetCounter")
    Download(url, save, message, 50)
    GuiControl, , ProgressBar, 100
    GuiControl, , ProgressN, 100`%
    GuiControl, , KB
    Gui, Show, , Downloaded
    Gui, Destroy
    Return
}

SetCounter(wParam, lParam) {
	progress := Round(wParam / lParam * 100)
	GuiControl, , ProgressBar, %progress%
	GuiControl, , ProgressN, %progress%`%
	wParam := wParam // 1024
	lParam := lParam // 1024
	GuiControl, , KB, (%wParam%kb of %lParam%kb)
	Gui, Show, , %progress%`% - Downloading...
}

url = https://www.autohotkey.com/download/ahk-install.exe
save = %A_ScriptDir%\Apps\AutoHotkey.exe
FileDelete, %save%
ProgressGui()
IniWrite, AutoHotkey.exe, WSBM.ini, Available Applications, AutoHotkey

url = https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.1/npp.8.4.1.Installer.x64.exe
save = %AppDir%npp.exe
FileDelete, %save%
ProgressGui()
IniWrite, npp.exe, WSBM.ini, Available Applications, Notepad++

url = https://www.7-zip.org/a/7z2107-x64.exe
save = %AppDir%7z.exe
FileDelete, %save%
ProgressGui()
IniWrite, 7z.exe, WSBM.ini, Available Applications, 7-Zip

url = https://www.sumatrapdfreader.org/dl/rel/SumatraPDF-3.3.3-64-install.exe
save = %AppDir%SumatraPDF.exe
FileDelete, %save%
ProgressGui()
IniWrite, SumatraPDF.exe, WSBM.ini, Available Applications, SumatraPDF

url = https://github.com/brave/brave-browser/releases/download/v1.38.117/BraveBrowserStandaloneSetup.exe
save = %AppDir%Brave.exe
FileDelete, %save%
ProgressGui()
IniWrite, Brave.exe, WSBM.ini, Available Applications, Brave Browser

url = https://download.sysinternals.com/files/SysinternalsSuite.zip
save = %AppDir%SysInternals.zip
FileDelete, %save%
ProgressGui()
IniWrite, SysInternals.zip, WSBM.ini, Available Applications, SysInternals Suite

url = https://2.na.dl.wireshark.org/win64/Wireshark-win64-3.6.6.exe
save = %AppDir%Wireshark.exe
FileDelete, %save%
ProgressGui()
IniWrite, Wireshark.exe, WSBM.ini, Available Applications, Wireshark

url = https://www.netresec.com/?download=NetworkMiner
save = %AppDir%NetworkMiner.zip
FileDelete, %save%
ProgressGui()
IniWrite, NetworkMiner.zip, WSBM.ini, Available Applications, Network Miner

url = https://www.openwall.com/john/k/john-1.9.0-jumbo-1-win64.7z
save = %AppDir%JtR.7z
FileDelete, %save%
ProgressGui()
IniWrite, JtR.7z, WSBM.ini, Available Applications, John the Ripper Bleeding Jumbo

url = https://openwall.info/wiki/_media/john/johnny/johnny_2.2_win.zip
save = %AppDir%Johnny.zip
FileDelete, %save%
ProgressGui()
IniWrite, Johnny.zip, WSBM.ini, Available Applications, Johnny

url = https://github.com/processhacker/processhacker/releases/download/v2.39/processhacker-2.39-setup.exe
save = %AppDir%processhacker.exe
FileDelete, %save%
ProgressGui()
IniWrite, processhacker.exe, WSBM.ini, Available Applications, Process Hacker

url = https://github.com/gchq/CyberChef/releases/download/v9.39.1/CyberChef_v9.39.1.zip
save = %AppDir%CyberChef.zip
FileDelete, %save%
ProgressGui()
IniWrite, CyberChef.zip, WSBM.ini, Available Applications, CyberChef

url = https://github.com/qpdf/qpdf/releases/download/release-qpdf-10.6.3/qpdf-10.6.3-bin-msvc64.zip
save = %AppDir%QPDF.zip
FileDelete, %save%
ProgressGui()
IniWrite, QPDF.zip, WSBM.ini, Available Applications, QPDF

url = https://github.com/sensepost/gowitness/releases/download/2.3.6/gowitness-2.3.6-windows-amd64.exe
save = %AppDir%GoWitness.exe
FileDelete, %save%
ProgressGui()
IniWrite, GoWitness.exe, WSBM.ini, Available Applications, GoWitness

url = https://download.documentfoundation.org/libreoffice/stable/7.3.4/win/x86_64/LibreOffice_7.3.4_Win_x64.msi
save = %AppDir%LibreOffice.msi
FileDelete, %save%
ProgressGui()
IniWrite, LibreOffice.msi, WSBM.ini, Available Applications, LibreOffice

url = https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2`%2B8/OpenJDK17U-jdk_x64_windows_hotspot_17.0.2_8.msi
save = %AppDir%openjdk.msi
FileDelete, %save%
ProgressGui()
IniWrite, openjdk.msi, WSBM.ini, Available Applications, OpenJDK17

url = https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.2_build/ghidra_10.1.2_PUBLIC_20220125.zip
save = %AppDir%Ghidra.zip
FileDelete, %save%
ProgressGui()
IniWrite, Ghidra.zip, WSBM.ini, Available Applications, Ghidra

psscript =
(
Write-Output 'Downloading Regshot... Total size approximately 292000 bytes'
Invoke-WebRequest -Outfile 'C:\Sandbox\Apps\Regshot.zip' -Uri 'https://github.com/Seabreg/Regshot/archive/refs/heads/master.zip'
)
RunWait, powershell -Command &{%psscript%}
IniWrite, Regshot.zip, WSBM.ini, Available Applications, Regshot

psscript =
(
Write-Output 'Downloading MBox Viewer... Total size approximately 43556000 bytes'
Invoke-WebRequest -UserAgent 'Wget' -OutFile 'C:\Sandbox\Apps\mbox.zip' -MaximumRedirection 2 -Uri 'https://sourceforge.net/projects/mbox-viewer/files/latest/download'
)
RunWait, powershell -Command &{%psscript%}
IniWrite, mbox.zip, WSBM.ini, Available Applications, MBox Viewer

psscript =
(
Write-Output 'Downloading Icon Extractor... Total size approximately 794000 bytes'
Invoke-WebRequest -UserAgent 'Wget' -OutFile 'C:\Sandbox\Apps\IconExtractor.exe' -MaximumRedirection 2 -Uri 'https://sourceforge.net/projects/icon-extractor/files/latest/download'
)
RunWait, powershell -Command &{%psscript%}
IniWrite, IconExtractor.exe, WSBM.ini, Available Applications, Icon Extractor

ExitApp