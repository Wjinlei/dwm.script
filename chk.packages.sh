#!/bin/sh

# Syncs repositories and downloads updates, meant to be run as a cronjob.

ping -q -c example.org > /dev/null || exit

notify-send "📦 同步软件仓库" "检查可更新软件包..."

sudo pacman -Syyuw --noconfirm || notify-send "错误,下载更新失败.
检查你的网络连接, 或手动更新."
pkill -RTMIN+13 "${STATUSBAR:-dwmblocks}"

if pacman -Qu | grep -v "\[ignored\]"
then
	notify-send "🎁 同步软件仓库" "有可用更新. 点击状态栏图标 (📦) 开始更新."
else
	notify-send "📦 同步软件仓库"  "同步完毕. 没有可更新的软件包."
fi
