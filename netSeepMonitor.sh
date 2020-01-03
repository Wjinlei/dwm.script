#!/bin/bash

# Linux下实时网速监测脚本
# 使用方法 netSeepMonitor.sh 你要监测的接口名
# example： ./netSeepMonitor.sh wlp1s0

ethn=$1

while true
do
    # 获取接收速率
    RX_pre=$(cat /proc/net/dev | grep $ethn | sed 's/:/ /g' | awk '{print $2}')
    # 获取发送速率
    TX_pre=$(cat /proc/net/dev | grep $ethn | sed 's/:/ /g' | awk '{print $10}')
    # 等待一秒
    sleep 1
    # 获取接收速率
    RX_next=$(cat /proc/net/dev | grep $ethn | sed 's/:/ /g' | awk '{print $2}')
    # 获取发送速率
    TX_next=$(cat /proc/net/dev | grep $ethn | sed 's/:/ /g' | awk '{print $10}')

    # 清屏
    clear

    # 计算两次的差,这就是一秒内发送和接收的速率
    RX=$((${RX_next}-${RX_pre}))
    TX=$((${TX_next}-${TX_pre}))

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

    echo -e "$ethn \t $RX $TX "
done
