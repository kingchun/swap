#!/bin/bash
set -o errexit
echo "欢迎使用垃圾增加虚拟内存脚本 !"
echo "请用root操作 !"
echo "默认swap文件存放在/var/swapfile"
echo -n  "请输入需要的虚拟内存大小单位:G 然后回车:"
read  swap_capacity
swap_capacity=$[swap_capacity*1024*1024]
dd if=/dev/zero of=/var/swapfile bs=1024 count=$swap_capacity
mkswap /var/swapfile
swapon /var/swapfile
chmod -R 0600 /var/swapfile
echo "/var/swapfile swap swap defaults 0 0" >> /etc/fstab
echo "设置完成好好享受吧"