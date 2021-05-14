#!/bin/bash

main=`uname  -r | awk -F . '{print $1 }'`
minor=`uname -r | awk -F . '{print $2}'`

if [ "$main" -lt 5 ]|| [ "$minor" -lt 6 ]; then 
	echo '内核太低，需要内核大于5.6 执行 wget -N "https://github.000060000.xyz/tcpx.sh" && chmod +x tcpx.sh && ./tcpx.sh 换内核吧'
	exit 1
fi

sudo lsattr /etc/passwd /etc/shadow
sudo chattr -i /etc/passwd /etc/shadow
sudo chattr -a /etc/passwd /etc/shadow
sudo lsattr /etc/passwd /etc/shadow

read -p "自定义ROOT密码:" mima
echo root:$mima | sudo chpasswd root
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
sudo service sshd restart
sudo reboot
