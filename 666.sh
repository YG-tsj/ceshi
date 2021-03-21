#!/bin/bash

apt update && apt install curl sudo lsb-release iptables -y
apt install net-tools iproute2 openresolv dnsutils -y
apt install wireguard-tools --no-install-recommends
curl -fsSL git.io/wgcf.sh | sudo bash
echo | wgcf register
wgcf generate
sed -i 's/engage.cloudflareclient.com/162.159.192.1/g' wgcf-profile.conf
sed -i 's/1.1.1.1/8.8.8.8,8.8.4.4,1.1.1.1/g' wgcf-profile.conf
sed -i '/0\.0\.0\.0\/0/d' wgcf-profile.conf
cp wgcf-profile.conf /wgcf-profile.conf
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh
