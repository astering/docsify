@echo off

REM ����ΪANSI/GBK���룬��cmd�д򿪣�����ҳ936��powershellҲ��936
REM ���Ҫ��ĳЩshell��������Ҫ��Ϊutf-8���룬����ҳ65001
REM ˫ð��::ע���޻��ԣ�REMע���л��ԣ�bat��cmd��׺����
REM ˫�����bat����npm��http����������ͬĿ¼��index.htmlΪ��ҳ��Ĭ�϶˿�8080

REM ���ޱ���
:: http-server --log-ip -p 8080 -a 127.0.0.1

REM �˺�����
:: http-server --log-ip -p 8080 --username abc --password 123

REM ���ޱ�����HTTPS
:: http-server --log-ip -p 8080 -a 127.0.0.1 -S -C cert.pem -K key.pem

REM �Դ����ض��򲻴��ڵ���Դ����ҳ
REM �������������DNS�ܽ���localhostʱ��ʹ��localhost��������127.0.0.1
:: http-server --log-ip -p 8080 --proxy http://localhost:8080?
:: http-server --log-ip -p 8080 --proxy http://127.0.0.1:8080?

REM `-c-1`���û��棬`-o`�������Զ��������

set /p MODE=ѡ��ģʽ��0-���ޱ�����1-�˺����룻2-���ޱ���+HTTPS��3-�Դ���:

if "%MODE%"=="0" (
    http-server --log-ip -p 8080 -a 127.0.0.1
) else if "%MODE%"=="1" (
    http-server --log-ip -p 8080 --username abc --password 123
) else if "%MODE%"=="2" (
    http-server --log-ip -p 8080 -a 127.0.0.1 -S -C cert.pem -K key.pem
) else if "%MODE%"=="3" (
    http-server --log-ip -p 8080 --proxy http://127.0.0.1:8080?
) else (
    echo ��������
    pause
    exit
)
