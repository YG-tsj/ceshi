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
