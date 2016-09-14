@echo off
echo. windows命令行启动memcached服务器
echo. 功能：通过批处理文件管理memcached服务器的启动、关闭、重启。
echo. author：gwang(mail@wanggangzero.cn)
echo. version:
echo.    1.0.0  Created by gwang 2016.4.15.

rem 如果是x64服务器则自动运行64位服务端程序
if %PROCESSOR_ARCHITECTURE:~-1%==4 (set x86_64=win64) else set x86_64=win32

rem 设定变量
set hider=plugin\RunHiddenConsole.exe
set pro=%~dp1memcached\memcached_%x86_64%\memcached.exe
set cmd=%hider% %pro%
  
 
echo 正在启动memcached-server default(端口:11211)服务器......
%cmd% -m 10 -p 11211

echo 正在启动memcached-server xx项目(端口:11215)服务器......
%cmd% -m 10 -p 11215

echo 正在启动memcached-server xx(端口:11213)服务器......
%cmd% -m 10 -p 11213

rem 新增memcached实例需要在这里添加一行新的启动代码..



echo .
echo .
echo .
:: 退出
exit

======================

memcached 参数说明:
-d 以daemon的形式运行
    -d start 启动memcached服务
    -d restart 重起memcached服务
    -d stop|shutdown 关闭正在运行的memcached服务
    -d install 安装memcached服务
    -d uninstall 卸载memcached服务
    
-u 以x的身份运行 (仅在以root运行的时候有效)

-m 最大内存使用，单位MB。默认64MB

-l 连接的IP地址, 默认是本机
-p 是设置Memcache监听的端口,最好是1024以上的端口,默认是11211

-c 选项是最大运行的并发连接数，默认是1024，按照你服务器的负载量来设定
-f 块大小增长因子，默认是1.25 
-n 最小分配空间，key+value+flags默认是48
-h 显示帮助

-M 内存耗尽时返回错误，而不是删除项
-P 是设置保存Memcache的pid文件
  

Memcache环境测试：
运行下面的php文件，如果有输出 Hello Memcache! 就表示环境搭建成功。
<?php
$mem = new Memcache;
$mem->connect('127.0.0.1', 11211);
$mem->set('key', 'Hello Memcache!', 0, 60);
$val = $mem->get('key');
echo $val;
?>
