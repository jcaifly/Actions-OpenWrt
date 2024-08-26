#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改管理页面的 IP 地址
uci set network.lan.ipaddr='192.168.123.1'
uci commit network

# 自定义管理页面的密码 (请将 'your_password' 替换为你想要设置的密码)
NEW_PASSWORD='CAIjie@520.com'
echo -e "$NEW_PASSWORD\n$NEW_PASSWORD" | passwd root

# 自定义 2.4GHz WiFi 的 SSID 和密码 (请根据需要替换 'YourSSID_2G' 和 'YourWiFiPassword_2G')
uci set wireless.@wifi-iface[0].ssid='OpenWrt_2.4G'
uci set wireless.@wifi-iface[0].key='CAIjie@520.com'

# 自定义 5GHz WiFi 的 SSID 和密码 (请根据需要替换 'YourSSID_5G' 和 'YourWiFiPassword_5G')
uci set wireless.@wifi-iface[1].ssid='OpenWrt_5G'
uci set wireless.@wifi-iface[1].key='CAIjie@520.com'

# 提交无线配置
uci commit wireless

# 重新加载网络和无线配置
/etc/init.d/network reload
/etc/init.d/wireless reload
