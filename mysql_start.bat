REM @echo off
rem ��汾MySQL����,
rem ��������innodb���ڲ�ͬ�汾�л�֮��������

echo. windows����������mysql������
echo. ���ܣ�ͨ���������ļ�����mysql���������������رա�������
echo. author��gwang(mail@wanggangzero.cn)
echo. version:
echo.    1.0.0  Created by gwang 2016.09.02.


rem ���ð汾 Ĭ������5.6
set ver=-5.5.24
REM set ver=-5.6
REM set ver=-5.7.14-winx64


:: ���ý�����
set exe=mysqld.exe 
rem �趨����
set hider=plugin\RunHiddenConsole.exe
set pro=%~dp0MySQL\mysql%ver%\bin\mysqld.exe
set cmd=%hider% %pro%
   
:: ����Ƿ���ڶ�Ӧ����      
set curCount=0
call f_getproccount %exe% curCount


:: ����ǰ������Ƿ��Ѿ������˷��������̣���ǰ�رշ���������
REM start /b /wait mysql_stop.bat
if %curCount% neq 0 (
    echo �����˳�%exe%����......
    :: ���ý��̹�����ǿ���˳�
    plugin\process.exe -k %exe%
) else (
    echo û�з���%exe%���̡�
)
 
  
  
echo ��������MySQL����......

%cmd%  

echo .
echo .
echo .
