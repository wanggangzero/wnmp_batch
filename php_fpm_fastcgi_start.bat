@echo off

echo. windows����������php_fpm����������
echo. ���ܣ�ͨ���������ļ�����php_fpm���������������رա�������
echo. author��gwang(mail@wanggangzero.cn)
echo. version:
echo.    1.0.0  Created by gwang 2016.09.02.


echo ��������PHP(FastCGI)����......

:: ��ʼ��
:: ���ý��̹�����Ŀ¼
set xxfpm=plugin\xxfpm\bin\xxfpm.exe

:: php�汾��
set phpver=php-5.3.27
REM set phpver=php-5.6.21-Win32-VC11-x86
REM set phpver=php-7.0.6-Win32-VC14-x64

:: ����php-cgi����Ŀ¼
set php-cgi=php/%phpver%/php-cgi.exe
:: ��������
set worker=1
:: �󶨵�ַ
set band=127.0.0.1
:: �˿ں�
set port=9000
 
 :: ȡphp-cgi.exe��������
set curCount=0
call f_getproccount php-cgi.exe curCount

if %curCount% gtr 0 ( 
    echo ��ǰ�Ѿ�����%curCount%��php-cgi����
)
:: ������Ҫ�����Ľ�������
set /a n=%worker%-%curCount%
:: ��ӡ��ʾ��Ϣ
if %n% equ 0 (
    echo ����Ҫ��������������
    goto end 
) else (  
    echo ������������xxfpm���̡�����
    satrt /b /wait php_fpm_fastcgi_stop.bat
)
 
:: ����php-cgi 
plugin\RunHiddenConsole.exe %xxfpm% %php-cgi% -n %worker% -i %band% -p %port% 
 
 
goto end
  
:end

:: ��ԭĿ¼
cd %~dp0