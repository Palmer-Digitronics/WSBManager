#SingleInstance Force
SetWorkingDir %A_ScriptDir%

Gui Add, Text,, Write Access to Data Folder
Gui Add, Text,, Internet Connection
Gui Add, Text,, Application Package
Gui Add, Text,, Clipboard Redirection
Gui Add, Text,, Printer Redirection
Gui Add, Text,, Microphone Redirection
Gui Add, Text,, Video Redirection
Gui Add, Text,, Assigned RAM in GB
Gui Add, Text,, GPU Passthrough
Gui Add, Text,, Protected Client
Gui Add, Text,,
Gui Add, Button,, Close
Gui Add, DropDownList, vVar_Write ym, Read-Only||Read-Write
Gui Add, DropDownList, vVar_Network, Offline||Online
Gui Add, DropDownList, vVar_App, Standard|Forensics||Full
Gui Add, DropDownList, vVar_Clipboard, Enabled|Disabled||
Gui Add, DropDownList, vVar_Printer, Enabled|Disabled||
Gui Add, DropDownList, vVar_Mic, Enabled|Disabled||
Gui Add, DropDownList, vVar_Cam, Enabled|Disabled||
Gui Add, DropDownList, vVar_RAM, 1|2|4||8|16
Gui Add, DropDownList, vVar_GPU, Enabled|Disabled||
Gui Add, DropDownList, vVar_Protected, Enabled||Disabled
Gui Add, Text,,
Gui Add, Button,, Launch

Gui, Show,, WSB Launcher

Return

ButtonLaunch:
Gui, Submit

if Var_GPU = Enabled
    Lnch_GPU = Enable
else
    Lnch_GPU = Disable

if Var_Network = Online
    Lnch_Network = Enable
else
    Lnch_Network = Disable

if Var_Write = Read-Write
    Lnch_Write = false
else
    Lnch_Write = true

if Var_Mic = Enabled
    Lnch_Mic = Enable
else
    Lnch_Mic = Disable
    
if Var_Cam = Enabled
    Lnch_Cam = Enable
else
    Lnch_Cam = Disable

if Var_Protected = Disabled
    Lnch_Protected = Disable
else
    Lnch_Protected = Enable

if Var_Printer = Enabled
    Lnch_Printer = Enable
else
    Lnch_Printer = Disable

if Var_Clipboard = Enabled
    Lnch_Clipboard = Enable
else
    Lnch_Clipboard = Disable

if Var_RAM = 1
    Lnch_RAM = 1024
else if Var_RAM = 2
    Lnch_RAM = 2048
else if Var_RAM = 8
    Lnch_RAM = 8192
else if Var_RAM = 16
    Lnch_RAM = 16384
else
    Lnch_RAM = 4096

if Var_App = Standard
    if Var_Network = Online
        if Var_Write = Read-Write
            Lnch_App = Startup_Online_RW.bat
        else
            Lnch_App = Startup_Online_RO.bat
    else
        if Var_Write = Read-Write
            Lnch_App = Startup_Write.bat
        else
            Lnch_App = Startup.bat
else if Var_App = Forensics
    if Var_Network = Online
        if Var_Write = Read-Write
            Lnch_App = Startup_RW_Forensics.bat
        else
            Lnch_App = Startup_Online_RO_Forensics.bat
    else
        if Var_Write = Read-Write
            Lnch_App = Startup_RW_Forensics.bat
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
            <HostFolder>C:\Sandbox\Startup</HostFolder>
            <SandboxFolder>C:\WSB\Startup</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>C:\Sandbox\Config</HostFolder>
            <SandboxFolder>C:\WSB\Config</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>C:\Sandbox\Scripts</HostFolder>
            <SandboxFolder>C:\WSB\Scripts</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>C:\Sandbox\Apps</HostFolder>
            <SandboxFolder>C:\WSB\Apps</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>C:\Sandbox\Assets</HostFolder>
            <SandboxFolder>C:\WSB\Assets</SandboxFolder>
            <ReadOnly>true</ReadOnly>
        </MappedFolder>
        <MappedFolder>
            <HostFolder>C:\Sandbox\Data</HostFolder>
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

FileDelete, C:\Sandbox\Launch\Launcher.wsb
FileAppend, %Lnch_Scrpt%, C:\Sandbox\Launch\Launcher.wsb
Run, C:\Sandbox\Launch\LaunchScripts\Launcher.ahk


ButtonClose:
ExitApp