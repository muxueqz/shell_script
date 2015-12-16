#!/bin/bash
DIALOG=${DIALOG=dialog}

IPFILE=/dev/shm/ip.txt
select=/dev/shm/select$RANDOM

touch $select
if [[ -w $select ]];then
    echo
else
    $DIALOG --msgbox "Permission denied \
        权限不够"    10 30
    exit 1
fi
function select_lang {
    $DIALOG --menu "Select Language/选择语言" 100 50 5 \
        1 "中文" \
        2 "English" \
        2>$select
    CH=$(cat $select)
    rm -rf $select
}
function dialog_ping {
    $DIALOG --title "输入IP地址"  --inputbox "请输入目标IP地址:" 10 30  2> $IPFILE
    IP=`cat $IPFILE`
    if [[ -z $IP ]];then
        $DIALOG --msgbox "IP地址为空，请输入IP地址！"    10 30
    else
        PINGSTAT=`ping -c3 $IP 2>&1`
        $DIALOG --msgbox "$PINGSTAT"    20 70
        rm -f $select
        rm -f $IPFILE
    fi
}
function dialog_chtimezone {
        $DIALOG --msgbox "更改时区"    10 30
}
function dialog_netcfg {
        $DIALOG --msgbox "网络配置"    10 30
}
function select_serv {
    if [[ $CH -eq 1 ]]
    then
        $DIALOG --menu "选择动作" 100 50 5 \
        1 "Ping网络测试" \
        2 "更改时区" \
        3 "网络配置" \
        2>$select
        CH=$(cat $select)
        rm -rf $select
    [[ $CH -eq 1 ]] && \
        dialog_ping
    [[ $CH -eq 2 ]] && \
        dialog_chtimezone
    [[ $CH -eq 3 ]] && \
        dialog_netcfg
    else
        $DIALOG --msgbox "不明选项"    10 30
    fi 
}
while true
    do
    rm -rf $select
    select_lang
    rm -rf $select
    select_serv
    exit 0
done
