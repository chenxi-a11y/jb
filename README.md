**同步北京时间（chrony）**
```
wget -N https://raw.githubusercontent.com/chenxi-a11y/jb/main/docs/setup_chrony.sh && chmod +x setup_chrony.sh && bash setup_chrony.sh
```


**komari-agent无root运行**
禁用远程控制 禁用自动更新 监测可用内存
```
bash <(curl -sL https://raw.githubusercontent.com/chenxi-a11y/jb/main/install_modified.sh) -e 面板地址 -t 通信密码 --disable-web-ssh --disable-auto-update --memory-mode-available
```

**komari-agent管理卸载脚本**
```
bash <(curl -sL https://raw.githubusercontent.com/chenxi-a11y/jb/main/komari-agent-menu.sh)
```

# 工具备份

**1.bbr备份** [查看](https://github.com/chenxi-a11y/jb/tree/main/bbr)

<br>

**工具箱**

```
wget -N https://raw.githubusercontent.com/misaka-gh/MisakaLinuxToolbox/master/MisakaToolbox.sh &&  chmod +x MisakaToolbox.sh && bash MisakaToolbox.sh
```

<br>

**2.开启所有端口代码**

```
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
iptables-save
```

<br>

**3.流媒体测试**

全媒体测试

```
bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
```

奈飞测试

```
wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.5/nf_2.5_linux_amd64 && chmod +x nf && clear && ./nf
```

\#第一个

```
bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
```

\# 第二个

```
bash <(curl -sSL "https://github.com/CoiaPrant/MediaUnlock_Test/raw/main/check.sh")
```

<br>

**4.一键测速脚本** 

zq/SuperSpeed 修复版
首选 

```
bash <(wget -qO- https://bench.im/hyperspeed)
```

备用1 

```
bash <(curl -Lso- https://raw.githubusercontent.com/uxh/superspeed/master/superspeed.sh)
```

备用2 

```
bash <(curl -Lso- https://git.io/superspeed_uxh)
```

<br>

性能测试

1、Bench.sh脚本，服务器基本信息与IO读写，国内三网下载测试 延迟脚本

```
wget -qO- bench.sh | bash
```

2、superbench脚本，服务器基本信息与IO读写，国内三网下载测试 延迟脚本

```
wget -qO- git.io/superbench.sh | bash
```



网络测速
1、superbench+欧美节点测速

```
wget -qO- http://depot.treesky.link/speedtest/n/superbench_f.sh | bash
```

2、国外节点测速脚本

```
curl -LsO bench.monster/speedtest.sh; bash speedtest.sh -Global
```

3、国内三网测速脚本

```
bash <(curl -Lso- https://git.io/superspeed)
```

<br>

**其他工具**

LTS Linux 内核并启用 BBR 或 BBR plus

[https://github.com/jinwyp/one_click_script/blob/master/KERNEL_CN.md](https://github.com/jinwyp/one_click_script/blob/master/KERNEL_CN.md)

v2ray (xray)(trojan-go)脚本(所有协议的终极脚本)申请SSL证书

https://github.com/jinwyp/one_click_script/blob/master/README2_CN.md

<br><br>

【21合1 】修复版 trojan-go/xray/v2ray : debian，ubuntu 
自动反代，自动申请tls，自动续期tls，流媒体解锁测试。

TG群: https://t.me/hijkclub

```
bash <(curl -ksL tiny.one/one4all)
```

