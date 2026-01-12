#!/bin/bash
# 添加 Passwall 及其依赖源
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' >>feeds.conf.default
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >>feeds.conf.default

# 添加 SmartDNS
echo 'src-git smartdns https://github.com/pymumu/luci-app-smartdns.git;master' >>feeds.conf.default

# 使用更兼容的 AdGuardHome 源
echo 'src-git adguardhome https://github.com/kongfl888/luci-app-adguardhome.git;master' >>feeds.conf.default
