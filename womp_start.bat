@echo off
echo. windows���������� openresty + mysql + php-fpm ����
echo. ���ܣ�ͨ���������ļ�����womp���������������رա�������
echo. author��gwang(mail@wanggangzero.cn)
echo. version:
echo.    1.0.0  Created by gwang 2016.09.02.

:: php(fastcgi)
:: ���˿�����
call php_fpm_fastcgi_start.bat
:: ��˿�����
REM call php_fpm_fastcgi_multiport_start.bat


:: mysql
call mysql_start.bat

:: nginx
call nginx_or_start.bat

echo .
echo .
echo .
pause