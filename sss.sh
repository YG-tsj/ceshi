read -p "自定义ROOT密码:" mima

sudo sed -i "$a echo root:$mima | sudo chpasswd root" 123.txt

sudo echo "sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;" >> 123.txt

sudo echo "sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;" >> 123.txt

sudo sed -i '$a sudo service sshd restart' 123.txt

reboot

