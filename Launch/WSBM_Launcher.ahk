#SingleInstance Force
SetWorkingDir %A_ScriptDir%

Gui Add, Text,, Write Access to Data Folder     ; Everything from here...
Gui Add, Text,, Internet Connection
Gui Add, Text,, Application Package
;Gui Add, Text,, Clipboard Redirection
;Gui Add, Text,, Printer Redirection
;Gui Add, Text,, Microphone Redirection
;Gui Add, Text,, Video Redirection
Gui Add, Text,, RAM assigned to VM
;Gui Add, Text,, GPU Passthrough
;Gui Add, Text,, Protected Client
Gui Add, Text,,
Gui Add, Button,, Close     ; ...to here is for the first column - labels etc
Gui Add, DropDownList, vVar_Write ym, Read-Only||Read-Write     ; Everything from here...
Gui Add, DropDownList, vVar_Network, Offline||Online
Gui Add, DropDownList, vVar_App, Standard|Forensics||Full
;Gui Add, DropDownList, vVar_Clipboard, Enabled|Disabled||
;Gui Add, DropDownList, vVar_Printer, Enabled|Disabled||
;Gui Add, DropDownList, vVar_Mic, Enabled|Disabled||
;Gui Add, DropDownList, vVar_Cam, Enabled|Disabled||
Gui Add, DropDownList, vVar_RAM, 1GB|2GB|4GB||8GB|16GB
;Gui Add, DropDownList, vVar_GPU, Enabled|Disabled||
;Gui Add, DropDownList, vVar_Protected, Enabled||Disabled
Gui Add, Text,,
Gui Add, Button,, Launch    ;...to here is for the second column options

Gui, Show,, WSBM Launcher ; Show the GUI created above

Return

ButtonLaunch:
Gui, Submit

;if Var_GPU = Enabled
;    Lnch_GPU = Enable
;else
;    Lnch_GPU = Disable
Lnch_GPU = Disable

if Var_Network = Online
    Lnch_Network = Enable
else
    Lnch_Network = Disable

if Var_Write = Read-Write
    Lnch_Write = false
else
    Lnch_Write = true

;if Var_Mic = Enabled
;    Lnch_Mic = Enable
;else
;    Lnch_Mic = Disable
Lnch_Mic = Disable

;if Var_Cam = Enabled
;    Lnch_Cam = Enable
;else
;    Lnch_Cam = Disable
Lnch_Cam = Disable

;if Var_Protected = Disabled
;    Lnch_Protected = Disable
;else
;    Lnch_Protected = Enable
Lnch_Protected = Enable

;if Var_Printer = Enabled
;    Lnch_Printer = Enable
;else
;    Lnch_Printer = Disable
Lnch_Printer = Disable

;if Var_Clipboard = Enabled
;    Lnch_Clipboard = Enable
;else
;    Lnch_Clipboard = Disable
Lnch_Clipboard = Disable

if Var_RAM = 1GB
    Lnch_RAM = 1024
else if Var_RAM = 2GB
    Lnch_RAM = 2048
else if Var_RAM = 8GB
    Lnch_RAM = 8192
else if Var_RAM = 16GB
    Lnch_RAM = 16384
else
    Lnch_RAM = 4096

if Var_App = Standard
    if Var_Network = Online
            Lnch_App = Startup_Online.bat
    else
            Lnch_App = Startup.bat
else if Var_App = Forensics
    if Var_Network = Online
            Lnch_App = Startup_Online_Forensics.bat
    else
            Lnch_App = Startup_Forensics.bat
else
    Lnch_App = Startup_Full.bat

Lnch_Scrpt =
(
<Configuration>
    <vGPU>%Lnch_GPU%</vGPU>
    <Networking>%Lnch_Network%</Networking>
    <MappedFolders>
        <MappedFolder>
            <HostFolder>%A_ScriptDir%\..\Startup</HostFolder>
            <SandboxFolder>C:\WSB\Startup</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>%A_ScriptDir%\..\Config</HostFolder>
            <SandboxFolder>C:\WSB\Config</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>%A_ScriptDir%\..\Scripts</HostFolder>
            <SandboxFolder>C:\WSB\Scripts</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>%A_ScriptDir%\..\Apps</HostFolder>
            <SandboxFolder>C:\WSB\Apps</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>%A_ScriptDir%\..\Assets</HostFolder>
            <SandboxFolder>C:\WSB\Assets</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>%A_ScriptDir%\..\Data</HostFolder>
            <ReadOnly>%Lnch_Write%</ReadOnly>
        </MappedFolder>
    </MappedFolders>
    <LogonCommand>
        <Command>C:\WSB\Startup\%Lnch_App%</Command>
    </LogonCommand>
    <AudioInput>%Lnch_Mic%</AudioInput>
    <VideoInput>%Lnch_Cam%</VideoInput>
    <ProtectedClient>%Lnch_Protected%</ProtectedClient>
    <PrinterRedirection>%Lnch_Printer%</PrinterRedirection>
    <ClipboardRedirection>%Lnch_Clipboard%</ClipboardRedirection>
    <MemoryInMB>%Lnch_RAM%</MemoryInMB>
</Configuration>
)

FileDelete, Launcher.wsb
FileAppend, %Lnch_Scrpt%, Launcher.wsb
Run, LaunchScripts\Launcher.ahk


ButtonClose:
ExitApp