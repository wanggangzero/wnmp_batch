@ECHO OFF
:: ��ʼ��


set prefix=E:\Code Projects\openresty-test
REM ѡ��ͬ�İ汾
set ver=openresty-1.9.15.1-win32
set ver=openresty-1.11.2.1-win32
REM set ver=Openresty_1.11.3.1001_win64
:: ��ӳ���Ŀ¼
set p=%~dp0openresty\%ver%

echo �����˳�nginx����......
  %p%\nginx-or.exe -p "%prefix%" -s quit
echo .
echo .
echo .
