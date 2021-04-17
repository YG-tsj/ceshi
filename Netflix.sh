#!/bin/bash
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36";
UA_Dalvik="Dalvik/2.1.0 (Linux; U; Android 9; ALP-AL00 Build/HUAWEIALP-AL00)";
Font_Black="\033[30m";
Font_Red="\033[31m";
Font_Green="\033[32m";
Font_Yellow="\033[33m";
Font_Blue="\033[34m";
Font_Purple="\033[35m";
Font_SkyBlue="\033[36m";
Font_White="\033[37m";
Font_Suffix="\033[0m";

export LANG="en_US";
export LANGUAGE="en_US";
export LC_ALL="en_US";
clear;
echo -e "${Font_Red}脚本来源于互联网，所有权归作者${Font_Suffix}";
echo -e "${Font_Red}本工具测试结果仅供参考，请以实际使用为准${Font_Suffix}";

function PharseJSON() {
    # 使用方法: PharseJSON "要解析的原JSON文本" "要解析的键值"
    # Example: PharseJSON ""Value":"123456"" "Value" [返回结果: 123456]
    echo -n $1 | jq -r .$2;
}

function MediaUnlockTest_Netflix() {
    echo -n -e " Netflix:\t\t\t\t->\c";
    local result=`curl -${1} --user-agent "${UA_Browser}" -sSL "https://www.netflix.com/" 2>&1`;
    if [ "$result" == "Not Available" ];then
        echo -n -e "\r Netflix:\t\t\t\t${Font_Red}Unsupport${Font_Suffix}\n"
        return;
    fi
    
    if [[ "$result" == "curl"* ]];then
        echo -n -e "\r Netflix:\t\t\t\t${Font_Red}Failed (Network Connection)${Font_Suffix}\n"
        return;
    fi
    
    local result=`curl -${1} --user-agent "${UA_Browser}" -sL "https://www.netflix.com/title/80018499" 2>&1`;
    if [[ "$result" == *"page-404"* ]] || [[ "$result" == *"NSEZ-403"* ]];then
        echo -n -e "\r Netflix:\t\t\t\t${Font_Red}No${Font_Suffix}\n"
        return;
    fi
    
    local result1=`curl -${1} --user-agent "${UA_Browser}" -sL "https://www.netflix.com/title/70143836" 2>&1`;
    local result2=`curl -${1} --user-agent "${UA_Browser}" -sL "https://www.netflix.com/title/80027042" 2>&1`;
    local result3=`curl -${1} --user-agent "${UA_Browser}" -sL "https://www.netflix.com/title/70140425" 2>&1`;
    local result4=`curl -${1} --user-agent "${UA_Browser}" -sL "https://www.netflix.com/title/70283261" 2>&1`;
    local result5=`curl -${1} --user-agent "${UA_Browser}"-sL "https://www.netflix.com/title/70143860" 2>&1`;
    local result6=`curl -${1} --user-agent "${UA_Browser}" -sL "https://www.netflix.com/title/70202589" 2>&1`;
    
    if [[ "$result1" == *"page-404"* ]] && [[ "$result2" == *"page-404"* ]] && [[ "$result3" == *"page-404"* ]] && [[ "$result4" == *"page-404"* ]] && [[ "$result5" == *"page-404"* ]] && [[ "$result6" == *"page-404"* ]];then
        echo -n -e "\r Netflix:\t\t\t\t${Font_Yellow}Only Homemade${Font_Suffix}\n"
        return;
    fi
    
    local region=`tr [:lower:] [:upper:] <<< $(curl -${1} --user-agent "${UA_Browser}" -fs --write-out %{redirect_url} --output /dev/null "https://www.netflix.com/title/80018499" | cut -d '/' -f4 | cut -d '-' -f1)` ;
    
    if [[ ! -n "$region" ]];then
        region="US";
    fi
    echo -n -e "\r Netflix:\t\t\t\t${Font_Green}Yes(Region: ${region})${Font_Suffix}\n"
    return;
}

function MediaUnlockTest() {
    MediaUnlockTest_Netflix ${1};
}

curl -V > /dev/null 2>&1;
if [ $? -ne 0 ];then
    echo -e "${Font_Red}Please install curl${Font_Suffix}";
    exit;
fi

jq -V > /dev/null 2>&1;
if [ $? -ne 0 ];then
    echo -e "${Font_Red}Please install jq${Font_Suffix}";
    exit;
fi
echo " ** 正在测试IPv4解锁情况";
check4=`ping 1.1.1.1 -c 1 2>&1`;
if [[ "$check4" != *"unreachable"* ]] && [[ "$check4" != *"Unreachable"* ]];then
    MediaUnlockTest 4;
else
    echo -e "${Font_SkyBlue}当前主机不支持IPv4,跳过...${Font_Suffix}";
fi

echo " ** 正在测试IPv6解锁情况";
check6=`ping6 240c::6666 -c 1 2>&1`;
if [[ "$check6" != *"unreachable"* ]] && [[ "$check6" != *"Unreachable"* ]];then
    MediaUnlockTest 6;
else
    echo -e "${Font_SkyBlue}当前主机不支持IPv6,跳过...${Font_Suffix}";
fi
