@echo off
 
REM mysql\bin\mysqladmin -u root -pwanggang shutdown
rem   mysql �������   �û���  ����  ִ�йر�ָ�� 

:: ���ý�����
set exe=mysqld.exe 
   
:: ����Ƿ���ڶ�Ӧ����      
set curCount=0
call f_getproccount %exe% curCount

if %curCount% neq 0 (
    echo �����˳�%exe%����......
    :: ���ý��̹�����ǿ���˳�
    plugin\process.exe -k %exe%
) else (
    echo û�з���%exe%���̡�
)
 
goto end 
:: ����
:end

:: ��ԭĿ¼
cd %~dp0