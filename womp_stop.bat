REM @ECHO OFF

echo .

echo 正在退出Nginx进程......
call nginx_or_stop.bat
echo .
echo .
echo .

echo 正在退出MySQL进程......
call mysql_stop.bat
echo .
echo .
echo .

echo 正在退出PHP(FastCGI)进程......
call php_fpm_fastcgi_stop.bat
echo .
echo .
echo .



 