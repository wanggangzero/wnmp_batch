@echo off
echo. windows����������memcached������
echo. ���ܣ�ͨ���������ļ�����memcached���������������رա�������
echo. author��gwang(mail@wanggangzero.cn)
echo. version:
echo.    1.0.0  Created by gwang 2016.4.15.

rem �����x64���������Զ�����64λ����˳���
if %PROCESSOR_ARCHITECTURE:~-1%==4 (set x86_64=win64) else set x86_64=win32

rem �趨����
set hider=plugin\RunHiddenConsole.exe
set pro=%~dp1memcached\memcached_%x86_64%\memcached.exe
set cmd=%hider% %pro%
  
 
echo ��������memcached-server default(�˿�:11211)������......
%cmd% -m 10 -p 11211

echo ��������memcached-server �������999��(�˿�:11215)������......
%cmd% -m 10 -p 11215

echo ��������memcached-server (�˿�:11213)������......
%cmd% -m 10 -p 11213

rem ����memcachedʵ����Ҫ���������һ���µ���������..



echo .
echo .
echo .
:: �˳�
exit

======================

memcached ����˵��:
-d ��daemon����ʽ����
    -d start ����memcached����
    -d restart ����memcached����
    -d stop|shutdown �ر��������е�memcached����
    -d install ��װmemcached����
    -d uninstall ж��memcached����
    
-u ��x��������� (������root���е�ʱ����Ч)

-m ����ڴ�ʹ�ã���λMB��Ĭ��64MB

-l ���ӵ�IP��ַ, Ĭ���Ǳ���
-p ������Memcache�����Ķ˿�,�����1024���ϵĶ˿�,Ĭ����11211

-c ѡ����������еĲ�����������Ĭ����1024��������������ĸ��������趨
-f ���С�������ӣ�Ĭ����1.25 
-n ��С����ռ䣬key+value+flagsĬ����48
-h ��ʾ����

-M �ڴ�ľ�ʱ���ش��󣬶�����ɾ����
-P �����ñ���Memcache��pid�ļ�
  

Memcache�������ԣ�
���������php�ļ����������� Hello Memcache! �ͱ�ʾ������ɹ���
<?php
$mem = new Memcache;
$mem->connect('127.0.0.1', 11211);
$mem->set('key', 'Hello Memcache!', 0, 60);
$val = $mem->get('key');
echo $val;
?>
