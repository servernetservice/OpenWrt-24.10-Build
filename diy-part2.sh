#!/bin/bash

# 修改默认主题为 bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-bootstrap/g' feeds/luci/collections/luci/Makefile

# 移除可能冲突的重复包
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-adguardhome

# 修复 AdGuardHome 路径问题（针对某些源层级过深的问题）
if [ -d "feeds/adguardhome/luci-app-adguardhome" ]; then
    mv feeds/adguardhome/luci-app-adguardhome package/
fi

# 重新同步 feeds
./scripts/feeds update -a
./scripts/feeds install -a
