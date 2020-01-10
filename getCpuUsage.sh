#!/bin/sh
#
# 获取1秒内的CPU使用率
# CPU使用率计算公式：CPU_USAGE=(IDLE2-IDLE1) / (CPU_TIME2-CPU_TIME1) * 100
# CPU_TIME计算公式 ：CPU_TIME=user + system + nice + idle + iowait + irq + softirq

# 计算CPU使用率(上一秒)
PRE_CPU_INFO=$(cat /proc/stat | grep -w cpu | awk '{print $2,$3,$4,$5,$6,$7,$8}')
IDLE1=$(echo $PRE_CPU_INFO | awk '{print $4}')
CPU_TIME1=$(echo $PRE_CPU_INFO | awk '{print $1+$2+$3+$4+$5+$6+$7}')
sleep 1
# 计算CPU使用率(下一秒)
NEXT_CPU_INFO=$(cat /proc/stat | grep -w cpu | awk '{print $2,$3,$4,$5,$6,$7,$8}')
IDLE2=$(echo $NEXT_CPU_INFO | awk '{print $4}')
CPU_TIME2=$(echo $NEXT_CPU_INFO | awk '{print $1+$2+$3+$4+$5+$6+$7}')
# (IDLE2 - IDLE1)
SYSTEM_IDLE=`echo ${IDLE2} ${IDLE1} | awk '{print $1-$2}'`
# (CPU_TIME2 - CPU_TIME1)
TOTAL_TIME=`echo ${CPU_TIME2} ${CPU_TIME1} | awk '{print $1-$2}'`
# (IDLE2-IDLE1) / (CPU_TIME2-CPU_TIME1) * 100
CPU_USAGE=`echo ${SYSTEM_IDLE} ${TOTAL_TIME} | awk '{printf "%.2f", 100-$1/$2*100}'`

echo "CPU Usage:${CPU_USAGE}%"
