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
    echo -e "\033[36m\033[01m$1\033[0m"
}

get_char(){
	SAVEDSTTY=`stty -g`
	stty -echo
	stty cbreak
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -raw
	stty echo
	stty $SAVEDSTTY
}

echo "现在开始检查你的系统是否支持"
	#判断是什么Linux系统
	if [[ -f /etc/redhat-release ]]; then
		release="Centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="Debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="Ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="Centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="Debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="Ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="Centos"
    fi

yellow " 检测当前CPU架构 "
bit=`uname -m`
version=`uname -r | awk -F "-" '{print $1}'`

yellow " VPS小鸡内脏检测结果如下："
yellow " 操作系统- $release "
yellow " 系统内核版本- $version " 
yellow " CPU架构- $bit"


sleep 5s
echo "按任意键继续，或者按Ctrl+C退出"
char=$(get_char)

yellow " 检测当前CPU架构 "
bit=`uname -m`
if [[ ${bit} == "x86_64" ]]; then

elif [[ ${bit} == "aarch64" ]]; then

else
 echo "此CPU架构不是X86,也不是ARM！不支持！"
 exit
fi

if [ $release = "Centos" ]
	then
		yum -y install wget curl
		yum install yum-utils epel-release -y
		yum install wireguard-dkms wireguard-tools iproute -y
		yum --enablerepo=elrepo-kernel -y install kernel-ml-headers
	elif [ $release = "Debian" ]
	then
		apt-get update
		apt-get install sudo net-tools openresolv curl wget -y
		echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list
		printf 'Package: *\nPin: release a=unstable\nPin-Priority: 150\n' > /etc/apt/preferences.d/limit-unstable
		apt-get install linux-headers-`uname -r` -y
		apt-get install wireguard-dkms wireguard-tools -y
	elif [ $release = "Ubuntu" ]
	then
		apt-get update
		apt -y --no-install-recommends install openresolv dnsutils wireguard-tools
	else
		yellow " 不支持当前系统 "
		exit 1
	fi




