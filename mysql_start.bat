REM @echo off
rem 多版本MySQL管理,
rem 待升级：innodb库在不同版本切换之后会出问题

echo. windows命令行启动mysql服务器
echo. 功能：通过批处理文件管理mysql服务器的启动、关闭、重启。
echo. author：gwang(mail@wanggangzero.cn)
echo. version:
echo.    1.0.0  Created by gwang 2016.09.02.


rem 设置版本 默认启动5.6
set ver=-5.5.24
REM set ver=-5.6
REM set ver=-5.7.14-winx64


:: 设置进程名
set exe=mysqld.exe 
rem 设定变量
set hider=plugin\RunHiddenConsole.exe
set pro=%~dp0MySQL\mysql%ver%\bin\mysqld.exe
set cmd=%hider% %pro%
   
:: 检查是否存在对应进程      
set curCount=0
call f_getproccount %exe% curCount


:: 启动前检查下是否已经存在了服务器进程，提前关闭服务器进程
REM start /b /wait mysql_stop.bat
if %curCount% neq 0 (
    echo 正在退出%exe%进程......
    :: 采用进程管理器强制退出
    plugin\process.exe -k %exe%
) else (
    echo 没有发现%exe%进程。
)
 
  
  
echo 正在启动MySQL进程......

%cmd%  

echo .
echo .
echo .
