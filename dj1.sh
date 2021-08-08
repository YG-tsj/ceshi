apt install python3 python3-pip -y
pip install requests beautifulsoup4
apt-get install cron 
crontab -e
* * * * * /usr/bin/python3 /root/main.py >/dev/null  2>&1
service cron restart

wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/YG-tsj/ceshi/main.py
chmod +x main.py
python3 main.py
