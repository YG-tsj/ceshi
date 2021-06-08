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
yellow " 操作系统-$release "
yellow " 系统内核版本-$version " 
yellow " CPU架构-$bit"

sleep 5s
echo "按任意键继续，或者按Ctrl+C退出"
char=$(get_char)

yellow " 检测当前内核版本 "
main=`uname  -r | awk -F . '{print $1 }'`
minor=`uname -r | awk -F . '{print $2}'`

if [ "$main" -lt 5 ]|| [ "$minor" -lt 6 ]; then 
	red " 检测到内核版本小于5.6，为实现WARP网络效能最高的内核集成Wireguard方案，回到菜单，选择2，更新内核吧"
	exit 1
fi


yellow " 检测当前CPU架构 "
bit=`uname -m`
if [[ ${bit} == "x86_64" ]]; then

elif [[ ${bit} == "aarch64" ]]; then

else
 echo "此CPU架构不是X86,也不是ARM！不支持！"
 exit
fi






