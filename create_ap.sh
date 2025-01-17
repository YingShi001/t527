#!/bin/bash
# 文件名: hotspot_setup.sh

# 检查是否具有 sudo 权限
if [ "$(id -u)"!= "0" ]; then
  echo "请使用 sudo 权限运行此脚本"
  exit 1
fi

# 添加热点连接
nmcli connection add type wifi ifname wlp3s0 con-name MyHotspot autoconnect no ssid MyHotspot mode ap

# 修改热点连接的密码
nmcli connection modify MyHotspot 802-11-wireless-security.key-mgmt wpa-psk 802-11-wireless-security.psk password

# 修改热点的 IPv4 地址
nmcli connection modify MyHotspot ipv4.addresses 192.168.12.1/24

# 设置 IPv4 配置方法为手动
nmcli connection modify MyHotspot ipv4.method manual

# 激活热点连接
nmcli connection up MyHotspot 
