@echo off

echo. windows命令行启动php_fpm服务器进程
echo. 功能：通过批处理文件管理php_fpm服务器的启动、关闭、重启。
echo. author：gwang(mail@wanggangzero.cn)
echo. version:
echo.    1.0.0  Created by gwang 2016.09.02.


echo 正在启动PHP(FastCGI)进程......

:: 初始化
:: 设置进程管理工具目录
set xxfpm=plugin\xxfpm\bin\xxfpm.exe

:: php版本号
set phpver=php-5.3.27
REM set phpver=php-5.6.21-Win32-VC11-x86
REM set phpver=php-7.0.6-Win32-VC14-x64

:: 设置php-cgi程序目录
set php-cgi=php/%phpver%/php-cgi.exe
:: 进程数量
set worker=1
:: 绑定地址
set band=127.0.0.1
:: 端口号
set port=9000
 
 :: 取php-cgi.exe进程数量
set curCount=0
call f_getproccount php-cgi.exe curCount

if %curCount% gtr 0 ( 
    echo 当前已经存在%curCount%个php-cgi进程
)
:: 计算需要启动的进程数量
set /a n=%worker%-%curCount%
:: 打印提示信息
if %n% equ 0 (
    echo 不需要额外启动进程了
    goto end 
) else (  
    echo 正在重新启动xxfpm进程。。。
    satrt /b /wait php_fpm_fastcgi_stop.bat
)
 
:: 启动php-cgi 
plugin\RunHiddenConsole.exe %xxfpm% %php-cgi% -n %worker% -i %band% -p %port% 
 
 
goto end
  
:end

:: 还原目录
cd %~dp0