apt update
apt install python3 python3-pip -y
pip install requests beautifulsoup4
apt-get install cron 
echo "* * * * * /usr/bin/python3 /root/main.py >/dev/null  2>&1" >> /var/spool/cron/crontabs/root
service cron restart

wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/YG-tsj/ceshi/main1.py
chmod +x main1.py
python3 main1.py
