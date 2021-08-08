apt install python3 python3-pip -y
pip install requests beautifulsoup4

read -p "自定义账户:" USERNAME
read -p "自定义密码:" PASSWORD

wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/YG-tsj/ceshi/main.py
chmod +x main.py
python3 main.py $USERNAME $PASSWORD
