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



warpwg=$(systemctl status wg-quick@wgcf | grep Active | awk 'NR==1 {print $2}')
case ${warpwg} in
active)
     warpwg=yellow " 运行中 "
     ;;
*)
     warpwg=yellow " 未运行 "
esac


