@echo off 
:: ��ʼ�� 
:: ���ý�����
set xxfpm=xxfpm.exe
  
:: ����Ƿ����xxfpm����      
set curCount=0
call f_getproccount %xxfpm% curCount

if %curCount% neq 0 (
    echo �����˳�%xxfpm%����......
    plugin\process.exe -k xxfpm.exe
) else (
    echo û�з���%xxfpm%���̡�
)

goto end
:: ����
:end

:: ��ԭĿ¼
cd %~dp0 
