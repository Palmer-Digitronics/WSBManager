# WSB Manager
 WSBM is a utility for creating and managing Windows Sandbox instances and automatically installing useful FOSS software inside the WSB VM.
 
## Requirements
 - Win10 build 18342 or later - Win11 works... mostly
 - 6GB RAM (8GB recommended)
 - Virtualization must be enabled
 - Windows Sandbox must be enabled
 - 'Sandbox' directory must be in root of C:\
 - AutoHotkey v1.1 must be installed on host machine (legacy v1 and the v2 beta will *probably* work but have not been tested)
 
## Install/Setup
 - I do not recommend downloading the raw files, I highly recommend cloning the repo so you can stay up to date. As of 2022/07/02, there
 are lots of quirks resulting from this being initially built exclusively for my personal use. Plenty of fixes and changes planned and 
 you'll be best served working with the repo itself
 ```
 git clone https://github.com/Palmer-Digitronics/WSBManager C:\Sandbox
 ```
 - For now, the repo MUST be in the root of C:\ for the setup script to work correctly... This will be addressed soon (well, sooner or later)
 - After the repo is in C:\Sandbox, navigate to Sandbox\Apps and run setup_apps.ps1. This will download all required applications, formatted
 for the configuration scripts
 - Windows sandbox offers a large number of customizable options for the VM - most of these are not allowed by WSBM. WSBM assigns the VM to
 act as an isolated client, and any option that requires turning isolated client off is not available.
 - That said, I do not recommend WSBM for live malware analysis. However, when you have a file that you are unsure of and would quickly like to
 determine whether it warrants moving to a dedicated malware analysis VM (or even better, your air-gapped analysis machine) WSBM is for you.
 
 ## Usage
 - Windows Sandbox provides a lightweight desktop environment to safely run applications in isolation. Software installed inside the Windows Sandbox environment remains "sandboxed" and runs separately from the host
 machine. Windows Sandbox Manager takes this a step further, and by default cuts off any write access to the host machine, and any redirection of host resources to the VM.
  - Run Sandbox\Launch\WSBM_Launcher to start. The .exe will occasionally freak any NGAV sensor out. If this is the case, the .ahk file functions the same but is (somewhat) less likely
  to trigger your AV sensors. The AHK is, of course, not *guaranteed* not to cause a false positive, but the code for WSBM modules is very simple, so reading for audit purposes should be straight-forward.
  - The Sandbox\Data folder is for moving files into and (when enabled) out of the isolated VM. By default, this folder is only for bringing files TO the sandbox. To bring anything back to the host, read/write access
  must be enabled from the launcher. This does has some security implications, so should only be used when necessary.
 
## Application Packages
 Depending on which application package is chosen from the launcher, the following apps will be installed
 
 ### Standard
 
  1. AutoHotkey
  AutoHotkey is a free, open source macro-creation and automation software utility that allows users to automate repetitive tasks.
  This is used for automation of several tasks on startup
  https://github.com/Lexikos/AutoHotkey_L
  
  2. Notepad++
  Notepad++ is a text and source code editor for use with Microsoft Windows.
  WSBM replaces notepad.exe inside the VM with Notepad++, as such any file that would by default open in notepad opens instead in NPP. In fact, Windows Sandbox is no longer able to open notepad, and can only open NPP.
  https://github.com/notepad-plus-plus/notepad-plus-plus
  
  3. 7-Zip
  7-Zip is a file archiver with a high compression ratio.
  7-Zip is used to manage the archives that contain most of the applications used by WSBM, as well as for file/archive analysis after the VM is configured and running
  https://sourceforge.net/projects/sevenzip/
  
  4. SumatraPDF
  Sumatra PDF is a free and open-source document viewer that supports many document formats 
  https://github.com/sumatrapdfreader/sumatrapdf
  
  5. IconExtractor
  Icon Extractor is a small, portable executable that allows you to extract the icon from any file or folder on your system.
  https://sourceforge.net/projects/icon-extractor/
  
  6. SysInternals Suite
  Sysinternals Suite is a bundle of the Sysinternals utilities - a set of advanced system utilities and technical information by Mark Russinovich
  Streams.exe from the SysInternals suite is used to check files in the data for alternate data streams. See 'Check_Data_for_ADS.cmd' on the desktop
  https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite
  https://github.com/MicrosoftDocs/sysinternals
  
  7. MBox Viewer
  A simple viewer to view mbox files such as thunderbird archives, google mail archives or simple eml files.
  https://github.com/eneam/mboxviewer
  
  8. Brave Browser
  The new Brave browser blocks ads and trackers that slow you down and invade your privacy. A solid FOSS chrome alternative
  Brave is only included in the standard package when networking is enabled
  https://github.com/brave/brave-browser
  
 ### Forensics
  Forensics includes everything in the Standard package, and additionally includes:
  
  1. RegShot
  Regshot is an open-source registry compare utility that allows you to quickly take a snapshot of your registry and then compare it with a second one. In addition, you can also specify folders (with subfolders) to be
  scanned for changes as well.
  https://sourceforge.net/projects/regshot/
  
  2. Wireshark
  Wireshark is a free and open-source packet analyzer.
  https://github.com/wireshark/wireshark
  
  3. Network Miner
  NetworkMiner is an open source Network Forensic Analysis Tool (NFAT) for Windows.
  https://www.netresec.com/?page=NetworkMiner
  https://www.netresec.com/?page=NetworkMinerSourceCode
  
  4. John the Ripper
  John the Ripper is an Open Source password security auditing and password recovery tool.
  https://github.com/openwall/john
  
  5. Johnny
  Johnny is the cross-platform Open Source GUI frontend for the popular password cracker John the Ripper.
  https://github.com/openwall/johnny
  
  6. Process Hacker
  Process Hacker is a free and open source process viewer. This multi-purpose tool will assist you with debugging, malware detection and system monitoring.
  https://sourceforge.net/projects/processhacker/
  
  7. CyberChef
  The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis.
  https://github.com/gchq/cyberchef
  
  8. QPDF
  QPDF is a command-line tool and C++ library that performs content-preserving transformations on PDF files.
  https://github.com/qpdf/qpdf
  
  9. OpenJDK17
  JDK 17 is the open-source reference implementation of version 17 of the Java SE Platform, as specified by by JSR 390 in the Java Community Process.
  This is required for Ghidra (see below)
  https://github.com/openjdk/jdk17
  
  10. Ghidra
  Ghidra is a software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate.
  https://github.com/NationalSecurityAgency/ghidra
  
  11. GoWitness
  gowitness is a website screenshot utility written in Golang, that uses Chrome Headless to generate screenshots of web interfaces using the command line, with a handy report viewer to process results.
  GoWitness is only included in the forensics package when networking is enabled.
  https://github.com/sensepost/gowitness
 
 ### Full
  Full includes everything in the Standard and Forensics package, except GoWitness is *still* only installed if networking is enabled. Full additionally includes:
  
  1. LibreOffice
  LibreOffice is a free and powerful office suite, and a successor to OpenOffice.
  The Full package exists mostly because LibreOffice takes an annoying amount of time to install, and it is the only package included in Full.
  https://github.com/LibreOffice/core
  
  
 
## Roadmap
 - Fix issues that only show up on Win11
 - Modify launcher to allow you to customize which applications will be installed
 - Package manager inside VM to allow easy install of applications not included in launch package
 - Define default apps on initial startup
 - Define taskbar/start menu on initial startup
 - Add utility to allow loading of additional software into setup scripts
 
 
