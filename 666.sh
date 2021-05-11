#!/bin/bash

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}

apt update
apt -y --no-install-recommends install openresolv dnsutils wireguard-tools
wget -N https://cdn.jsdelivr.net/gh/YG-tsj/EUserv-warp/wgcf
cp wgcf /usr/local/bin/wgcf
chmod +x /usr/local/bin/wgcf

function warp6(){
echo | wgcf register
wgcf generate
sed -i 's/engage.cloudflareclient.com/162.159.192.1/g' wgcf-profile.conf
sed -i '/0\.0\.0\.0\/0/d' wgcf-profile.conf
cp wgcf-account.toml /etc/wireguard/wgcf-account.toml
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f warp6* wgcf*
yellow " 检测是否成功启动Warp！\n 显示IPV6地址：$(wget -qO- ipv6.ip.sb) "
green " 如上方显示IPV6地址：2a09:…………，则说明成功啦！\n 如上方无IP显示,（说明申请WGCF账户失败），请“无限”重复运行该脚本吧，直到成功为止！！！ "
}

function warp64(){
echo | wgcf register
wgcf generate
sed -i '5 s/^/PostUp = ip -4 rule add from eu6 table main\n/' wgcf-profile.conf
sed -i '6 s/^/PostDown = ip -4 rule delete from eu6 table main\n/' wgcf-profile.conf
read -p "粘贴（专用IP地址）:" eu6
sed -i "s#eu6#$eu6#g" wgcf-profile.conf
sed -i 's/engage.cloudflareclient.com/162.159.192.1/g' wgcf-profile.conf
cp wgcf-account.toml /etc/wireguard/wgcf-account.toml
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f warp64* wgcf*
yellow " 检测是否成功启动（IPV4+IPV6）双栈Warp！\n 显示IPV4地址：$(wget -qO- ipv4.ip.sb) 显示IPV6地址：$(wget -qO- ipv6.ip.sb) "
green " 如上方显示IPV4地址：8.…………，IPV6地址：2a09:…………，则说明成功啦！\n 如上方IPV4无IP显示,IPV6显示本地IP（说明申请WGCF账户失败），请“无限”重复运行该脚本吧，直到成功为止！！！ "
}

function warp4(){
echo | wgcf register
wgcf generate
sed -i '5 s/^/PostUp = ip -4 rule add from eu6 table main\n/' wgcf-profile.conf
sed -i '6 s/^/PostDown = ip -4 rule delete from eu6 table main\n/' wgcf-profile.conf
read -p "粘贴（专用IP地址）:" eu6
sed -i "s#eu6#$eu6#g" wgcf-profile.conf
sed -i 's/engage.cloudflareclient.com/162.159.192.1/g' wgcf-profile.conf
sed -i '/\:\:\/0/d' wgcf-profile.conf
cp wgcf-account.toml /etc/wireguard/wgcf-account.toml
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f warp4* wgcf*
yellow " 检测是否成功启动Warp！\n 显示IPV4地址：$(wget -qO- ipv4.ip.sb) "
green " 如上方显示IPV4地址：8.…………，则说明成功啦！\n 如上方显示VPS本地IP,（说明申请WGCF账户失败），请“无限”重复运行该脚本吧，直到成功为止！！！ "
}

function warp466(){
echo | wgcf register
wgcf generate
sed -i '5 s/^/PostUp = ip -6 rule add from eu6 table main\n/' wgcf-profile.conf
sed -i '6 s/^/PostDown = ip -6 rule delete from eu6 table main\n/' wgcf-profile.conf
read -p "粘贴（ipv6本地IP地址）:" eu6
sed -i "s#eu6#$eu6#g" wgcf-profile.conf
sed -i '/0\.0\.0\.0\/0/d' wgcf-profile.conf
cp wgcf-account.toml /etc/wireguard/wgcf-account.toml
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f warp466* wgcf*
echo -e "\033[1;33m 检测是否成功启动Warp！\n 显示IPV6地址：$(wget -qO- ipv6.ip.sb) \033[0m"
echo -e "\033[1;32m 如上方显示IPV6地址：2a09:…………，则说明成功啦！\n 如上方无IP显示,（说明申请WGCF账户失败），请“无限”重复运行该脚本吧，直到成功为止！！！ \033[0m"
}

function warp4646(){
echo | wgcf register
wgcf generate
sed -i '5 s/^/PostUp = ip -4 rule add from eu4 table main\n/' wgcf-profile.conf
sed -i '6 s/^/PostDown = ip -4 rule delete from eu4 table main\n/' wgcf-profile.conf
read -p "粘贴（专用IP地址）:" eu4
sed -i "s#eu4#$eu4#g" wgcf-profile.conf
sed -i '7 s/^/PostUp = ip -6 rule add from eu6 table main\n/' wgcf-profile.conf
sed -i '8 s/^/PostDown = ip -6 rule delete from eu6 table main\n/' wgcf-profile.conf
read -p "粘贴（ipv6本地IP地址）:" eu6
sed -i "s#eu6#$eu6#g" wgcf-profile.conf
cp wgcf-account.toml /etc/wireguard/wgcf-account.toml
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f warp4646* wgcf*
echo -e "\033[1;33m 检测是否成功启动（IPV4+IPV6）双栈Warp！\n 显示IPV4地址：$(wget -qO- ipv4.ip.sb) 显示IPV6地址：$(wget -qO- ipv6.ip.sb) \033[0m"
echo -e "\033[1;32m 如上方显示IPV4地址：8.…………，IPV6地址：2a09:…………，则说明成功啦！\n 如上方IPV4无IP显示,IPV6显示本地IP（说明申请WGCF账户失败），请“无限”重复运行该脚本吧，直到成功为止！！！ \033[0m"
}

function warp464(){
echo | wgcf register
wgcf generate
sed -i '5 s/^/PostUp = ip -4 rule add from eu6 table main\n/' wgcf-profile.conf
sed -i '6 s/^/PostDown = ip -4 rule delete from eu6 table main\n/' wgcf-profile.conf
read -p "粘贴（专用IP地址）:" eu6
sed -i "s#eu6#$eu6#g" wgcf-profile.conf
sed -i '/\:\:\/0/d' wgcf-profile.conf
cp wgcf-account.toml /etc/wireguard/wgcf-account.toml
cp wgcf-profile.conf /etc/wireguard/wgcf.conf
systemctl enable wg-quick@wgcf
systemctl start wg-quick@wgcf
rm -f warp464* wgcf*
echo -e "\033[1;33m 检测是否成功启动Warp！\n 显示IPV4地址：$(wget -qO- ipv4.ip.sb) \033[0m"
echo -e "\033[1;32m 如上方显示IPV4地址：8.…………，则说明成功啦！\n 如上方显示VPS本地IP,（说明申请WGCF账户失败），请“无限”重复运行该脚本吧，直到成功为止！！！ \033[0m"
}


#主菜单
function start_menu(){
    clear
    red " 123" 
    red " 456" 
    green " 789 "
    green " 000000 "
    yellow " =================================================="
    green " 1. IPV4加ipv6" 
    green " 2. ipv4加ipv6与4"
    green " 3. ipv4加ipv4"
    green " 4. 466" 
    green " 5. 4646"
    green " 6. 464"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           warp6
	;;
        2 )
           warp64
	;;
        3 )
           warp4
	;;
        4 )
           warp466
	;;
        5 )
           warp4646
	;;
	6 )
           warp464
	;;
        0 )
            exit 1
        ;;
    esac
}


start_menu "first"   
