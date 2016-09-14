:: 参数1： 进程名称（可部分）
:: 参数2： 返回值变量
call :getproccount %1 %2
goto end
:: 功能: 查询指定image进程存在的数量
:: 参数: 进程的image name(可部分)
:getproccount
set imagename=%1
echo %imagename%
set count=0
for /f "tokens=2 delims= " %%i in ('tasklist ^| find /i "%imagename%"') do (
:: 取一个进程ID
  set /a count+=1
)
set %2=%count%
goto :eof

:end