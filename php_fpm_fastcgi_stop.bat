@echo off 
:: 初始化 
:: 设置进程名
set xxfpm=xxfpm.exe
  
:: 检查是否存在xxfpm进程      
set curCount=0
call f_getproccount %xxfpm% curCount

if %curCount% neq 0 (
    echo 正在退出%xxfpm%进程......
    plugin\process.exe -k xxfpm.exe
) else (
    echo 没有发现%xxfpm%进程。
)

goto end
:: 结束
:end

:: 还原目录
cd %~dp0 
