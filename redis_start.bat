@echo on
echo. windows命令行启动redis服务器
echo. 功能：通过批处理文件管理Redis服务器的启动、关闭、重启。
echo. author：gwang(mail@wanggangzero.cn)
echo. version: 
echo.          2.0 添加多版本支持,可以选择2.6,2.8,3.0或者3.2-preview版, 2016年6月29日 -gwang
echo.          1.0 创建, 可以通过配置文件方便的新增redis实例 2016年3月26日 -gwang


rem 如果是x64服务器则自动运行64位服务端程序
if %PROCESSOR_ARCHITECTURE:~-1%==4 (set x86_64=x64) else (set x86_64=x32)

rem 设置版本 空则启动2.6
set ver=-2.8
REM set ver=-3.0
REM set ver=-3.2-preview
REM set ver=

rem 设定变量
set hider=plugin\RunHiddenConsole.exe
set pro=%~dp1redis\bin\redis-x64%ver%\redis-server-sns.exe
set cmd=%hider% %pro%
set dir_conf=%~dp1redis\conf.d\

rem 2.8版本的需要专门指定 maxheap
if "%ver%"=="-2.8" (
    set args=--maxheap 2536000
)
REM echo 正在启动redis-server 神宠2手游(端口:6666)服务器......
REM %cmd% %dir_conf%port6666.conf  %args%

REM echo 正在启动redis-server 打飞机修仙(端口:6000)服务器......
REM %cmd% %dir_conf%port6000.conf  %args%

echo 正在启动redis-server 新项目(端口:6001)服务器......
%cmd% %dir_conf%port6001.conf  %args%

rem 新增redis 实例需要在conf.d中增加conf文件,并在这里添加启动代码.

echo .
echo .
echo .

REM pause
