apt update && apt install curl sudo lsb-release iptables -y
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
apt update
apt install net-tools iproute2 openresolv dnsutils -y
apt install wireguard-tools --no-install-recommends
wget https://bitbucket.org/ygtsj/euserv-warp/raw/8cccfd4ba639a5fa3a784e1ae37efb30e58310e4/wgcf
wget https://bitbucket.org/ygtsj/euserv-warp/raw/8cccfd4ba639a5fa3a784e1ae37efb30e58310e4/wireguard-go
cp wireguard-go /usr/bin
cp wgcf /usr/local/bin/wgcf
chmod +x /usr/local/bin/wgcf
chmod +x /usr/bin/wireguard-go
echo | wgcf register
wgcf generate
echo "请输入要本地IP 例：202a...../128 --->"
echo | read -p "域名:" eu6
echo "$eu6"
sed -i "5 s/^/PostUp = ip -6 rule add from 2a02:180:6:1::2a3b/128 table main\n/" wgcf-profile.conf
sed -i '6 s/^/PostDown = ip -6 rule delete from 2a02:180:6:1::2a3b/128 table main\n/' wgcf-profile.conf
sed -i 's/engage.cloudflareclient.com/2606:4700:d0::a29f:c001/g' wgcf-profile.conf
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
grep -qE '^[ ]*label[ ]*2002::/16[ ]*2' /etc/gai.conf || echo 'label 2002::/16   2' | sudo tee -a /etc/gai.conf
curl -6 ip.p3terx.com
curl -4 ip.p3terx.com

