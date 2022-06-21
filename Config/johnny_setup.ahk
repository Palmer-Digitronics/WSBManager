SetWorkingDir, C:\Temp\Johnny
#NoEnv

BlockInput, On

Run, %ComSpec% /c johnnyInstaller.exe
Sleep, 800

WinWaitActive, Johnny Setup
Sleep, 200

Click, 379 335  ;   Next
Sleep, 100

Click, 379 335  ;   Next
Sleep, 100

Click, 379 335  ;   Next
Sleep, 100

Click, 379 335  ;   Next
Sleep, 100

Click, 379 335  ;   Install
Sleep, 3500

Click, 40 148   ;   Deselect "Run Johnny Now" checkbox
Sleep, 50

Click, 461 337  ;   Close installer
Sleep, 50

BlockInput, Off

Exit