#!/bin/bash

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-bootstrap/g' feeds/luci/collections/luci/Makefile

# 彻底清理冲突源
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-adguardhome

# 重新安装 feeds
./scripts/feeds update -a
./scripts/feeds install -a

# 强制注入配置，防止被 defconfig 篡改
echo "CONFIG_TARGET_x86=y" >> .config
echo "CONFIG_TARGET_x86_64=y" >> .config
echo "CONFIG_TARGET_x86_64_DEVICE_generic=y" >> .config
echo "CONFIG_PACKAGE_dnsmasq-full=y" >> .config
