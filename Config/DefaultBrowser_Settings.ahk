#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

BlockInput, On

sleep 400

Run, %comspec% /c start ms`-settings`:defaultapps
Sleep 4000
Send, {Tab 5}
Sleep, 150
Send, {Enter}
Sleep, 150
Send, {Tab}
Sleep, 150
Send, {Enter}
Sleep, 150
Send, {Tab}
Sleep, 150
Send, {Enter}
Sleep, 500
Send, !{F4}

BlockInput, Off

return
