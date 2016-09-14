@ECHO OFF
:: 初始化


set prefix=E:\Code Projects\openresty-test
REM 选择不同的版本
set ver=openresty-1.9.15.1-win32
set ver=openresty-1.11.2.1-win32
REM set ver=Openresty_1.11.3.1001_win64
:: 添加程序目录
set p=%~dp0openresty\%ver%

echo 正在退出nginx进程......
  %p%\nginx-or.exe -p "%prefix%" -s quit
echo .
echo .
echo .
