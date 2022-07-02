# WSB Manager
 WSBM is a utility for creating and managing Windows Sandbox instances and automatically installing useful software inside the WSB VM.
 
## Requirements
 - Win10 build 18342 or later - Win11 works... mostly
 - 6GB RAM (8GB recommended)
 - Virtualization must be enabled
 - Windows Sandbox must be enabled
 - 'Sandbox' directory must be in root of C:\
 
## Install/Setup
 - I do not recommend downloading the raw files, I highly recommend cloning the repo so you can stay up to date. As of 2022/07/02, there
 are lots of changes planned, and you'll be best served working with the repo itself
 ```
 git clone https://github.com/Palmer-Digitronics/WSBManager C:\Sandbox
 ```
 - For now, the repo MUST be in the root of C:\ for the setup script to work correctly... This will be addressed soon (well, sooner or later)
 - After the repo is in C:\Sandbox, navigate to Sandbox\Apps and run setup_apps.ps1. This will download all required applications, formatted
 for the configuration scripts
 - Run Sandbox\Launch\WSBM_Launcher to start. The .exe tends to freak any NGAV products out. If this is the case, the .ahk file functions the same but is less likely
 to trigger your AV sensors, but does require AutoHotkey be installed on the host. The AHK is not *guaranteed* not to cause a false positive, of course. Lucky for you, the code is generally very straight-forward here, so reading the code for audit purposes is pretty straight forward.
 - Windows sandbox offers a large number of customizable options for the VM - most of these are not allowed by WSBM. WSBM assigns the VM to
 act as an isolated client, and any option that requires turning isolated client off is not available.
 - That said, I do not recommend WSBM for live malware analysis. However, when you have a file that you are unsure of and would quickly like to
 determine whether it warrants moving to a dedicated malware analysis VM (or even better, your air-gapped analysis machine) WSBM is for you.
 
## Roadmap
 - Fix issues that only show up on Win11
 - Modify launcher to allow you to customize which applications will be installed
 - Package manager inside VM - to allow you to easily install applications that you didn't choose to use on launcher
 - Define default apps on initial startup
 - Define taskbar/start menu on initial startup
 - Add utility to allow loading of additional software into setup scripts
 
 
