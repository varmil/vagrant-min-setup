#!/bin/sh

# fastestmirror
echo "prefer=ftp.jaist.ac.jp" >> /etc/yum/pluginconf.d/fastestmirror.conf

# Firewall、SELinux OFF
systemctl stop firewalld
systemctl disable firewalld
cp -p /etc/selinux/config /etc/selinux/config.orig
sed -i -e "s|^SELINUX=.*|SELINUX=disabled|" /etc/selinux/config

# date
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# ssh
chmod 600 .ssh/id_rsa

# yum
yum install -y git vim epel-release
