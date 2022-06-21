REM Set Terminal as Default Command Shell
ftype batfile="C:\WSB\Apps\WindowsTerminal\wt.exe" -w 0 "%1" %*
assoc .bat=batfile

Exit