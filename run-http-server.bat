@echo off

REM 本文为ANSI/GBK编码，在cmd中打开，代码页936，powershell也是936
REM 如果要用某些shell，可能需要改为utf-8编码，代码页65001
REM 双冒号::注释无回显，REM注释有回显，bat或cmd后缀均可
REM 双击这个bat启动npm的http服务器，以同目录的index.html为主页，默认端口8080

REM 仅限本机
:: http-server --log-ip -p 8080 -a 127.0.0.1

REM 账号密码
:: http-server --log-ip -p 8080 --username abc --password 123

REM 仅限本机，HTTPS
:: http-server --log-ip -p 8080 -a 127.0.0.1 -S -C cert.pem -K key.pem

REM 自代理，重定向不存在的资源到主页
REM 当代理服务器的DNS能解析localhost时才使用localhost，否则用127.0.0.1
:: http-server --log-ip -p 8080 --proxy http://localhost:8080?
:: http-server --log-ip -p 8080 --proxy http://127.0.0.1:8080?

REM `-c-1`禁用缓存，`-o`启动后自动打开浏览器

set /p MODE=选择模式（0-仅限本机；1-账号密码；2-仅限本机+HTTPS；3-自代理）:

if "%MODE%"=="0" (
    http-server --log-ip -p 8080 -a 127.0.0.1
) else if "%MODE%"=="1" (
    http-server --log-ip -p 8080 --username abc --password 123
) else if "%MODE%"=="2" (
    http-server --log-ip -p 8080 -a 127.0.0.1 -S -C cert.pem -K key.pem
) else if "%MODE%"=="3" (
    http-server --log-ip -p 8080 --proxy http://127.0.0.1:8080?
) else (
    echo 输入有误。
    pause
    exit
)
