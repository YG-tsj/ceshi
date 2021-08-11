apt update
apt install python3 python3-pip -y
pip install requests beautifulsoup4
apt-get install cron 


wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/YG-tsj/ceshi/main3.py
chmod +x main3.py
python3 main3.py

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
crontab -l
echo "* * * * * /usr/bin/python3 /root/main3.py >/dev/null 2>&1" >> /var/spool/cron/crontabs/root
service cron restart
