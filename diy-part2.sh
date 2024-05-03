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

# Modify default IP
# sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate   # 修改默认ip
sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd    # 替换终端为bash
#sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile
#sed -i 's/+uhttpd +uhttpd-mod-ubus //g' feeds/luci/collections/luci/Makefile    # 删除uhttpd
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings    # 设置密码为空
#sed -i 's/PATCHVER:=6.1/PATCHVER:=5.4/g' target/linux/x86/Makefile   # x86机型,默认内核5.10，修改内核为5.15
sed -i '$ a uci set uhttpd.main.redirect_https='\''0'\''' package/lean/default-settings/files/zzz-default-settings
sed -i '$ a uci commit uhttpd' package/lean/default-settings/files/zzz-default-settings

# feed重建
#./scripts/feeds clean
#./scripts/feeds update -a
#./scripts/feeds install -a

#替换为新版本golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a
# rm -rf feeds/packages/utils/runc/Makefile   # 临时删除run1.0.3
# svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile feeds/packages/utils/runc/Makefile   # 添加runc1.0.2


#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
