@echo off

echo Installing Web Forensics Applications, Please Wait...

echo.
echo Adding GoWitness...
echo f | xcopy C:\WSB\Apps\GoWitness.exe C:\Tools\GoWitness.exe /c /i /y /q
echo GoWitness Web Imager Added to Tools >> %UserProfile%\Documents\StartupChanges.txt

exit