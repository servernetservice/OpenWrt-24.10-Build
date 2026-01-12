#!/bin/bash

# 修改默认主题为 bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-bootstrap/g' feeds/luci/collections/luci/Makefile

# 修复某些插件可能导致的依赖冲突
# 移除可能冲突的重复包
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-passwall

# 重新同步 feeds 以确保使用我们添加的第三方源
./scripts/feeds update -a
./scripts/feeds install -a
