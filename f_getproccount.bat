:: ����1�� �������ƣ��ɲ��֣�
:: ����2�� ����ֵ����
call :getproccount %1 %2
goto end
:: ����: ��ѯָ��image���̴��ڵ�����
:: ����: ���̵�image name(�ɲ���)
:getproccount
set imagename=%1
echo %imagename%
set count=0
for /f "tokens=2 delims= " %%i in ('tasklist ^| find /i "%imagename%"') do (
:: ȡһ������ID
  set /a count+=1
)
set %2=%count%
goto :eof

:end