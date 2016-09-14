@echo off
echo. windows命令行启动 openresty + mysql + php-fpm 环境
echo. 功能：通过批处理文件管理womp服务器的启动、关闭、重启。
echo. author：gwang(mail@wanggangzero.cn)
echo. version:
echo.    1.0.0  Created by gwang 2016.09.02.

:: php(fastcgi)
:: 单端口侦听
call php_fpm_fastcgi_start.bat
:: 多端口侦听
REM call php_fpm_fastcgi_multiport_start.bat


:: mysql
call mysql_start.bat

:: nginx
call nginx_or_start.bat

echo .
echo .
echo .
pause