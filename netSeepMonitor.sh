#!/bin/bash
# 
# Linux下实时网速监测脚本
# example： ./netSeepMonitor.sh

while true
do
    # 计算上传下载的速率(上一秒)
    # 获取所有网卡的接收速率
    PRE_RX=$(cat /proc/net/dev | sed 's/:/ /g' | awk '{print $2}' | grep -v [^0-9])
    PRE_RX_SUM=0
    for i in ${PRE_RX}
    do
        # 计算所有网卡的接收速率的总和
        PRE_RX_SUM=$(expr ${PRE_RX_SUM} + ${i})
    done
    # 获取所有网卡的发送速率
    PRE_TX=$(cat /proc/net/dev | sed 's/:/ /g' | awk '{print $10}' | grep -v [^0-9])
    PRE_TX_SUM=0
    for i in ${PRE_TX}
    do
        # 计算所有网卡的发送速率的总和
        PRE_TX_SUM=$(expr ${PRE_TX_SUM} + ${i})
    done
    
    sleep 1

    # 计算上传下载的速率(下一秒)
    # 获取所有网卡的接收速率
    NEXT_RX=$(cat /proc/net/dev | sed 's/:/ /g' | awk '{print $2}' | grep -v [^0-9])
    NEXT_RX_SUM=0
    for i in ${NEXT_RX}
    do
        # 计算所有网卡的接收速率的总和
        NEXT_RX_SUM=$(expr ${NEXT_RX_SUM} + ${i})
    done
    # 获取所有网卡的发送速率
    NEXT_TX=$(cat /proc/net/dev | sed 's/:/ /g' | awk '{print $10}' | grep -v [^0-9])
    NEXT_TX_SUM=0
    for i in ${NEXT_TX}
    do
        # 计算所有网卡的发送速率的总和
        NEXT_TX_SUM=$(expr ${NEXT_TX_SUM} + ${i})
    done

    # 清屏
    clear

    # 计算两次的差,这就是一秒内发送和接收的速率
    RX=$((${NEXT_RX_SUM}-${PRE_RX_SUM}))
    TX=$((${NEXT_TX_SUM}-${PRE_TX_SUM}))

    # 换算单位
    if [[ $RX -lt 1024 ]];then
        # 如果接收速率小于1024,则单位为B/s
        RX="${RX}B/s"
    elif [[ $RX -gt 1048576 ]];then
        # 否则如果接收速率大于 1048576,则改变单位为MB/s
        RX=$(echo $RX | awk '{print $1/1048576 "MB/s"}')
    else
        # 否则如果接收速率大于1024但小于1048576,则单位为KB/s
        RX=$(echo $RX | awk '{print $1/1024 "KB/s"}')
    fi

    # 换算单位
    if [[ $TX -lt 1024 ]];then
        # 如果发送速率小于1024,则单位为B/s
        TX="${TX}B/s"
    elif [[ $TX -gt 1048576 ]];then
        # 否则如果发送速率大于 1048576,则改变单位为MB/s
        TX=$(echo $TX | awk '{print $1/1048576 "MB/s"}')
    else
        # 否则如果发送速率大于1024但小于1048576,则单位为KB/s
        TX=$(echo $TX | awk '{print $1/1024 "KB/s"}')
    fi

    echo -e "$RX $TX "
done
