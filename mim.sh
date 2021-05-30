echo -e nameserver 2a01:4f8:c2c:123f::1 > /etc/resolv.conf
read -p "自定义ROOT密码:" mima
echo root:$mima | sudo chpasswd root
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
sudo service sshd restart
sudo reboot




