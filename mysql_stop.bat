@echo off
 
REM mysql\bin\mysqladmin -u root -pwanggang shutdown
rem   mysql 管理程序   用户名  密码  执行关闭指令 

:: 设置进程名
set exe=mysqld.exe 
   
:: 检查是否存在对应进程      
set curCount=0
call f_getproccount %exe% curCount

if %curCount% neq 0 (
    echo 正在退出%exe%进程......
    :: 采用进程管理器强制退出
    plugin\process.exe -k %exe%
) else (
    echo 没有发现%exe%进程。
)
 
goto end 
:: 结束
:end

:: 还原目录
cd %~dp0