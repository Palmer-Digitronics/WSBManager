@echo off
cd %1
setx NPP_PROJECT %1
set "NPP_PROJECT=%1"

REM hide dependency folders as they cause NPP workspace filetree glitches
REM Node projects
if exist "%NPP_PROJECT%\node_modules" && exist "%NPP_PROJECT%\package.json" (
  attrib +h "%NPP_PROJECT%\node_modules"
)
REM Laravel/ composer projects
if exist "%NPP_PROJECT%\vendor" && exist "%NPP_PROJECT%\composer.json" (
  attrib +h "%NPP_PROJECT%\vendor"
)

start "" "%NPP_PATH%\notepad++.exe" -multiInst -nosession -openFoldersAsWorkspace ""%1""