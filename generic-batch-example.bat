set hr=%time:~0,2%
if "%hr:~0,1%" equ " " set hr=0%hr:~1,1%
set logfile=SERVER-FOLDERNAME_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%hr%%time:~3,2%%time:~6,2%.log

robocopy "D:\Folder\Subfolder\" "X:\Folder\Subfolder\" /MIR /E /SEC /COPYALL /PURGE /ZB /R:3 /W:2 /FFT /XO /XF *.pst /log+:C:\Robocopy\Logs\%logfile%