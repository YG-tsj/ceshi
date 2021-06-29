#!/usr/bin/env bash

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
white(){
    echo -e "\033[1;37m\033[01m$1\033[0m"
}

bblue(){
    echo -e "\033[1;34m\033[01m$1\033[0m"
}

rred(){
    echo -e "\033[1;35m\033[01m$1\033[0m"
}

warpwg=$(systemctl is-active wg-quick@wgcf)
case ${warpwg} in
active)
     WireGuardStatus=$(green "运行中")
     ;;
*)
     WireGuardStatus=$(red "未运行")
esac


v4=`wget -qO- ipv4.ip.sb`
WARPIPv4Status=$(curl -s4 https://www.cloudflare.com/cdn-cgi/trace | grep warp | cut -d= -f2)
    case ${WARPIPv4Status} in
    on)
        WARPIPv4Status=$(green "WARP已开启,当前IPV4地址：$v4 ")
        ;;
    off)
        WARPIPv4Status=$(yellow "WARP未开启，当前IPV4地址：$v4 ")
        ;;
    *)
        WARPIPv4Status=$(red "无IPV4 ")
    esac

V66=`ping6 240c::6666 -c 1 | grep received | awk 'NR==1 {print $4}'`

if [[ ${v66} == " 1" ]]; then
 v6=`wget -qO- ipv6.ip.sb` 
 WARPIPv6Status=$(curl -s6 https://www.cloudflare.com/cdn-cgi/trace | grep warp | cut -d= -f2) 
 case ${WARPIPv6Status} in 
 on) 
 WARPIPv6Status=$(green "WARP已开启,当前IPV6地址：$v6 ") 
 ;; 
 off) 
 WARPIPv6Status=$(yellow "WARP未开启，当前IPV6地址：$v6 ") 
 ;; 
 *) 
 WARPIPv6Status=$(red "无IPV6 ") 
 esac 

else  
exit 1 
 fi 

Print_ALL_Status_menu() {
blue "-----------------------"
blue "WARP 运行状态\t: ${WireGuardStatus}"
blue "IPv4 网络状态\t: ${WARPIPv4Status}"
blue "IPv6 网络状态\t: ${WARPIPv6Status}"
blue "-----------------------"
}

function start_menu(){
    clear
    yellow " 详细说明 https://github.com/YG-tsj/CFWarp-Pro  YouTube频道：甬哥探世界 " 
    
    red " 切记：进入脚本快捷方式 bash multi.sh "
    
    white " ==================一、VPS相关调整选择（更新中）==========================================" 
    
    green " 1. 永久开启甲骨文VPS的ubuntu系统所有端口 "
    
    green " 2. 更新系统内核 "
    
    green " 3. 开启原生BBR加速 "
    
    green " 4. 检测奈飞Netflix是否解锁 "
    
    white " ==================二、“内核集成模式”WARP功能选择（更新中）======================================"
    
    yellow " ----VPS原生IP数------------------------------------添加WARP虚拟IP的位置--------------"
    
    green " 5. 纯IPV4的VPS。                                   添加WARP虚拟IPV6               "
    
    green " 6. 纯IPV4的VPS。                                   添加WARP虚拟IPV4+虚拟IPV6      "
    
    green " 7. 纯IPV4的VPS。                                   添加WARP虚拟IPV4              "
    
    green " 8. 双栈IPV4+IPV6的VPS。                            添加WARP虚拟IPV6               "
    
    green " 9. 双栈IPV4+IPV6的VPS。                            添加WARP虚拟IPV4+虚拟IPV6      "
    
    green " 10. 双栈IPV4+IPV6的VPS。                           添加WARP虚拟IPV4               "
    
    green " 11. 纯IPV6的VPS。                                  添加WARP虚拟IPV6               "
    
    green " 12. 纯IPV6的VPS。                                  添加WARP虚拟IPV4+虚拟IPV6       "
    
    green " 13. 纯IPV6的VPS。                                  添加WARP虚拟IPV4               "
    
    white " ------------------------------------------------------------------------------------------------"
    
    green " 14. 永久关闭WARP功能 "
    
    green " 15. 自动开启WARP功能 "
    
    green " 16. 有IPV4：更新脚本 "
    
    green " 17. 无IPV4：更新脚本 "
    
    white " ==================三、代理协议脚本选择（更新中）==========================================="
    
    green " 18.使用mack-a脚本（支持Xray, V2ray, Trojan-go） "
    
    green " 19.使用phlinhng脚本（支持Xray, Trojan-go, SS+v2ray-plugin） "
    
    white " ============================================================================================="
    
    green " 20. 重启VPS实例，请重新连接SSH "
    
    white " ===============================================================================================" 
    
    green " 0. 退出脚本 "
    Print_ALL_Status_menu
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           iptables
	;;
	2 )
           upcore
	;;
        3 )
           BBR
	;;
	4 )
           Netflix
	;;    
        5 )
           warp6
	;;
        6 )
           warp64
	;;
        7 )
           warp4
	;;
        8 )
           warp466
	;;
        9 )
           warp4646
	;;
	10 )
           warp464
	;;
	11 )
           wo66
	;;
	12 )
           wo646
	;;
	13 )
           wo64
	;;
	14 )
           cwarp
	;;
	15 )
           owarp
	;;
	16 )
           up4
	;;
	17 )
           up6
	;;
	18 )
           macka
	;;
	19 )
           phlinhng
	;;
	20 )
           reboot
	;;
        0 )
            exit 1
        ;;
    esac
}
