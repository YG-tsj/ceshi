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

function warpv4v46(){
wget -N --no-check-certificate https://raw.githubusercontent.com/YG-tsj/Oracle-warp/main/multiV464.sh && chmod +x multiV464.sh && ./multiV464.sh
}

function warpv6(){
echo -e nameserver 2a00:1098:2c::1 > /etc/resolv.conf && wget -N --no-check-certificate https://raw.githubusercontent.com/YG-tsj/Oracle-warp/main/multiOV6.sh && chmod +x multiOV6.sh && ./multiOV6.sh
}


function start_menu(){
    clear
    red " 详细说明 https://github.com/YG-tsj/Oracle-warp  YouTube频道：甬哥探世界 " 
    
    red " 围绕WARP功能的脚本，支持KVM的X86/ARM架构，还在优化添加新功能中…… "  
    
    red " ==============================================================================================" 
    
    yellow " 切记：进入脚本快捷方式 bash ~/multiV464.sh "
    
    blue " ==========================一、VPS状态调整选择（更新中）==========================================" 
    
    blue " 1. 纯IPV4/双栈IPV4+IPV6 "
    
    blue " 2. 纯IPV6"
    
    blue " 3. 退出 "
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           warpv4v46
	;;
	2 )
           warpv6
	;;
        3 )
            exit 1
        ;;
    esac
}


start_menu "first"  
