#SingleInstance Force
SetWorkingDir %A_ScriptDir%

Gui Add, Text,, Networking
Gui Add, Text,, Application Package
Gui Add, Text,, Data Write Access
Gui Add, DropDownList, vNetStatus ym, Offline||Online
Gui Add, DropDownList, vAppPackage, Standard|Forensics||Full
Gui Add, DropDownList, vWriteAccess, Read-Only||Read-Write
Gui Add, Button, ys Default, Launch
Gui Add, Button, ys, Close

Gui Show,, WSB Toolbox Launcher

Return

ButtonLaunch:
{
Gui, Submit

if NetStatus = Online
    NetLaunch = Online
else
    NetLaunch = Isolated

if WriteAccess = Read-Write
    WriteLaunch = _RW
else
    WriteLaunch = _RO
    
if AppPackage = Full
    AppLaunch = _Full
else if AppPackage = Forensics
    AppLaunch = _Forensics

Run ..\LaunchScripts\%NetLaunch%%WriteLaunch%%AppLaunch%.ahk

ExitApp
}

ButtonClose:
ExitApp
