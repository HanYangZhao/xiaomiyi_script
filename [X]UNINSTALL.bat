echo 
echo    *****************************************   
echo    *     TEKAN [ENTER] UNTUK UNINSTALL     *   
echo    *****************************************   
echo 
pause
IF EXIST "\script" (
rd \script /s /q
)
IF EXIST "\autoexec.ash" (
del "\autoexec.ash"
)
IF EXIST "\enable_info_display.script" (
del "\enable_info_display.script"
)
IF EXIST "\xyc.sh" (
del "\xyc.sh"
)
IF EXIST "\HarapDIBACA.txt" (
del "\HarapDIBACA.txt"
)
echo 
echo 
echo    *****************************************   
echo    *           UNINSTALL SUKSES!           *   
echo    *****************************************   
echo 
pause
sleep 1
del "[X]UNINSTALL.bat"
exit
