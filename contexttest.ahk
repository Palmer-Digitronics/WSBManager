

WSBMContext = %A_AppData%\Microsoft\Windows\SendTo\WSBM*.lnk
if not (FileExist(WSBMContext))
    FileCreateShortcut, %A_ScriptDir%\Data\, %A_AppData%\Microsoft\Windows\SendTo\WSBM Data Folder.lnk
else
    FileDelete %WSBMContext%