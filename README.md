# wnmp_batch
nginx(openresty)+mysql+redis+php(php-fpm) On windows

---

### 项目说明

&nbsp;&nbsp;作为一名后台狗，生产环境是nginx([openresty][]) + php + mysql + [memcached][]/redis
平时在Windows下开发，很难随身带一个Lnmp系统，又想方便的调试，故有此项目。

---
### 文件说明

***

f_getproccount：

功能: 查询指定image进程存在的数量

用法: call this.bat image_name count

  image_name 进程的文件名(可匹配部分文件名)

  count      用于回传的参数，执行完毕之后将查找到的进程的数量写入此变量
***
memcached_start.bat ： 启动memcached进程

memcached_stop.bat  :  退出memcached进程

---
mysql_start.bat : 启动mysqld进程

mysql_stop.bat  : 关闭mysqld进程

---
nginx_or_start.bat : 启动openresty进程

nginx_or_stop.bat  : 关闭openresty进程

---
php_fpm_fastcgi_start.bat : 启动php-fpm进程

php_fpm_fastcgi_stop.bat  : 关闭php-fpm进程

---
redis_start.bat : 启动redis服务

redis_stop.bat  : 关闭redis服务

---
womp_start.bat ： 启动openresty + mysql + php

womp_stop.bat  : 关闭openresty + mysql + php

***
[openresty]: http://openresty.org/ "带有lua脚本二次开发功能的nginx，详情参考官网"
[memcached]: http://baike.baidu.com/item/memcached "已被redis替换"