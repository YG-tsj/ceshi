read -p "自定义ROOT密码:" mima

sudo sed -i "$a echo root:$mima | sudo chpasswd root" /etc/cloud/cloud.cfg

sudo sed -i '$a sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;' /etc/cloud/cloud.cfg

sudo sed -i '$a sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;' /etc/cloud/cloud.cfg

sudo sed -i '$a sudo service sshd restart' /etc/cloud/cloud.cfg

reboot




