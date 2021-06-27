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
     WireGuard_Status_zh=$(green "运行中")
     ;;
*)
     WireGuard_Status_zh=$(red "未运行")
esac

WARPIPv4Status=$(curl -s4 https://www.cloudflare.com/cdn-cgi/trace | grep warp | cut -d= -f2)
    case ${WARPIPv4Status} in
    on)
        WARPIPv4Status=${green "WARP已开启，$(wget -qO- ipv4.ip.sb) "}
        ;;
    plus)
        WARP_IPv4_Status_zh="${WARP_IPv4_Status_en}"
        ;;
    off)
        WARPIPv4Status=${yellow "WARP未开启，$(wget -qO- ipv4.ip.sb) "}
        ;;
    *)
        WARP_IPv4_Status_zh="${FontColor_Red}未连接${FontColor_Suffix}"
    esac



Print_ALL_Status_menu() {
blue "-----------------------"
blue "WARP运行状态\t: ${WireGuard_Status_zh}"
blue "IPv4 网络状态\t: ${WARPIPv4Status}"
blue "IPv6 网络状态\t: ${WARP_IPv6_Status_zh}"
blue "-----------------------"
}

function start_menu(){
    clear
    
    yellow " 详细说明 https://github.com/YG-tsj/CFWarp-Pro  YouTube频道：甬哥探世界 " 
    
    red " 切记：进入脚本快捷方式 bash multi.sh "
    
    white " ================一、VPS调整选择（更新中）==============================================" 
    
    green " 1. 永久开启甲骨文VPS的ubuntu系统所有端口 "
    
    green " 2. 更新ARM架构Ubuntu系统内核至5.11版 "
    
    green " 3. 开启原生BBR加速 "
    
    green " 4. 检测奈飞Netflix是否解锁 "
    
    white " ================二、“内核集成模式”WARP功能选择（更新中）=================================="
    
    white " ----VPS原生IP数-------------------------------------添加WARP虚拟IP的位置----------"
    
    green " 5. 纯IPV4的VPS。                                    添加WARP虚拟IPV6          "     
    
    green " 6. 纯IPV4的VPS。                                    添加WARP虚拟IPV4+虚拟IPV6  "   
    
    green " 7. 纯IPV4的VPS。                                    添加WARP虚拟IPV4            "  
    
    green " 8. 双栈IPV4+IPV6的VPS。                             添加WARP虚拟IPV6             " 
    
    green " 9. 双栈IPV4+IPV6的VPS。                             添加WARP虚拟IPV4+虚拟IPV6     " 
    
    green " 10. 双栈IPV4+IPV6的VPS。                            添加WARP虚拟IPV4               "
    
    green " 11. 纯IPV6的VPS。                                  添加WARP虚拟IPV6               "
    
    green " 12. 纯IPV6的VPS。                                  添加WARP虚拟IPV4+虚拟IPV6       "
    
    green " 13. 纯IPV6的VPS。                                  添加WARP虚拟IPV4               "
    
    white " ------------------------------------------------------------------------------------------------"
    
    green " 14. 永久关闭WARP功能 "
    
    green " 15. 自动开启WARP功能 "
    
    green " 16. 查看当前WARP运行状态 "
    
    green " 17. 查看VPS当前正在使用的IPV4/IPV6地址 "
    
    green " 18. 有IPV4：更新脚本 "
    
    green " 19. 无IPV4：更新脚本 "
    
    white " ===============三、代理协议脚本选择（更新中）==========================================="
    
    green " 20.使用mack-a脚本（支持ARM架构VPS，支持协议：Xray, V2ray, Trojan-go） "
    
    white " ============================================================================================="
    
    green " 21. 重启VPS实例，请重新连接SSH "
    
    white " =============================================================================================" 
    
    green " 0. 退出脚本 "
    Print_ALL_Status_menu
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           iptables
	;;
	2 )
           arm5.11
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
           wro66
	;;
	12 )
           wro646
	;;
	13 )
           wro64
	;;
	14 )
           cwarp
	;;
	15 )
           owarp
	;;
	16 )
           status
	;;
	17 )
           cv46
	;;
	18 )
           up4
	;;
	19 )
           up6
	;;
	20 )
           macka
	;;
	21 )
           reboot
	;;
        0 )
            exit 1
        ;;
    esac
}


start_menu "first"  
