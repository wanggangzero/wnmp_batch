@echo on
echo. windows����������redis������
echo. ���ܣ�ͨ���������ļ�����Redis���������������رա�������
echo. author��gwang(mail@wanggangzero.cn)
echo. version: 
echo.          2.0 ��Ӷ�汾֧��,����ѡ��2.6,2.8,3.0����3.2-preview��, 2016��6��29�� -gwang
echo.          1.0 ����, ����ͨ�������ļ����������redisʵ�� 2016��3��26�� -gwang


rem �����x64���������Զ�����64λ����˳���
if %PROCESSOR_ARCHITECTURE:~-1%==4 (set x86_64=x64) else (set x86_64=x32)

rem ���ð汾 ��������2.6
set ver=-2.8
REM set ver=-3.0
REM set ver=-3.2-preview
REM set ver=

rem �趨����
set hider=plugin\RunHiddenConsole.exe
set pro=%~dp1redis\bin\redis-x64%ver%\redis-server-sns.exe
set cmd=%hider% %pro%
set dir_conf=%~dp1redis\conf.d\

rem 2.8�汾����Ҫר��ָ�� maxheap
if "%ver%"=="-2.8" (
    set args=--maxheap 2536000
)
REM echo ��������redis-server ���2����(�˿�:6666)������......
REM %cmd% %dir_conf%port6666.conf  %args%

REM echo ��������redis-server ��ɻ�����(�˿�:6000)������......
REM %cmd% %dir_conf%port6000.conf  %args%

echo ��������redis-server ����Ŀ(�˿�:6001)������......
%cmd% %dir_conf%port6001.conf  %args%

rem ����redis ʵ����Ҫ��conf.d������conf�ļ�,�������������������.

echo .
echo .
echo .

REM pause
