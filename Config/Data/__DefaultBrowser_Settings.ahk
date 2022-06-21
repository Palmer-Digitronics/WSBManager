﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

BlockInput, On

sleep 400

;open start menu

Send, ^{Esc} ;open start menu
Sleep 1500
Send, Settings ;search for settings (more reliable than navigating directly)
Sleep 1500
Send, {Enter} ;go to settings
Sleep 1500
WinWaitActive, Settings
Send, Default Browser ; search directly for default browser setting  
Sleep 1500
Send, {Down}
Sleep 300
Send, {Enter} ;go to default browser
Sleep 300
Send, {Enter} ;open default browser
Sleep 500
Send, {Tab} 
Sleep 300
Send, {Enter} ;select chrome
Sleep 300
Send, {Tab}
Sleep 300
Send, {Enter} ;reassure windows you still love it but need to switch browsers anyway
Sleep 500
Send, !{F4} ;close settings

return
