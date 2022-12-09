**1.预先准备**
centos：

```
yum install ca-certificates wget -y && update-ca-trust force-enable
```

debian/ubuntu：

```
apt-get install ca-certificates wget -y && update-ca-certificates
```

**2.安装bbr**

国内

```
wget -N --no-check-certificate "https://ghproxy.com/https://raw.githubusercontent.com/chenxi-a11y/jb/main/bbr/cntcp.sh" && chmod +x cntcp.sh && ./cntcp.sh
```

或

```
bash <(curl -Lso- https://ghproxy.com/https://raw.githubusercontent.com/chenxi-a11y/jb/main/bbr/cntcp.sh)
```

国外

```
wget -N --no-check-certificate "https://raw.githubusercontent.com/chenxi-a11y/jb/main/bbr/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
```

或

```
bash <(curl -Lso- https://raw.githubusercontent.com/chenxi-a11y/jb/main/bbr/tcp.sh)
```

**3.启动**

用上面脚本安装，用下面脚本启动

地址
https://github.com/jinwyp/one_click_script/blob/master/KERNEL_CN.md#kernel

国外

```
bash <(curl -Lso- https://raw.githubusercontent.com/chenxi-a11y/jb/main/bbr/kernel.sh)
```

国内

```
bash <(curl -Lso- https://ghproxy.com/https://raw.githubusercontent.com/chenxi-a11y/jb/main/bbr/kernel.sh)
```



也可以放到root目录
ssh执行

```
chmod +x tcp.sh && ./tcp.sh
```

需要先安装对应的内核，之后再开启加速

1、以BBR Plus版本为例，输入对应的数字2回车，开始安装内核。

2、原有内核卸载完毕，新内核安装成功后，会提示重启，输入Y回车：

3、重启后再次连接VPS服务器，运行如下命令重新打开脚本：

```
./tcp.sh
```

4、在脚本菜单选项中，输入数字7 (注:对应安装的版本,7对应Plus版) 回车，开启BBR 提示BBR启动成功就说明成功了

查看bbr是否成功命令：

```
sysctl -a|grep tcp_congestion_control
```

如果返回信息中带有：

net.ipv4.tcp_congestion_control = bbr
则说明已经采用bbr技术来控制流量

如果需要安装或切换其它版本的加速，比如原版BBR、魔改BBR、锐速（LotServer）等，那么需要重新进行以上各流程，选择对应版本的内核，内核安装成功后重启系统开启加速。
