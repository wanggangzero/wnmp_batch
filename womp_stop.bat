REM @ECHO OFF

echo .

echo �����˳�Nginx����......
call nginx_or_stop.bat
echo .
echo .
echo .

echo �����˳�MySQL����......
call mysql_stop.bat
echo .
echo .
echo .

echo �����˳�PHP(FastCGI)����......
call php_fpm_fastcgi_stop.bat
echo .
echo .
echo .



 