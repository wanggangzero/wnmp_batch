@echo off

:: 初始化

set prefix=E:\Code Projects\openresty-test
REM 选择不同的版本
set ver=openresty-1.9.15.1-win32
set ver=openresty-1.11.2.1-win32
REM set ver=Openresty_1.11.3.1001_win64
:: 添加程序目录
set p=%~dp0openresty\%ver%

:: 判断已经存在nginx-or进程,则发送重新加载信号
set count=0
for /f "tokens=2 delims= " %%i in ('tasklist ^| find /i "nginx-or"') do (
:: 取一个进程ID
  set count=%%i 
  break
)
:: 不为0则代表找到了对应的进程
if "%count%"=="0" ( 
  goto start 
) else (
  goto restart
)
goto end
:: 第一次启动
:start
  echo starting...
  del /Q "%prefix%\logs\*"
  start  %p%\nginx-or.exe -p "%prefix%" -c conf/nginx.conf
goto end
:: 发送重启信号
:restart
  echo reloading..  
  start %p%\nginx-or.exe -p "%prefix%" -s reload
goto end
 
:: 结束
:end