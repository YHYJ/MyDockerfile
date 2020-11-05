#!/usr/bin/env bash

: <<!
Name: install_libjasper1.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-09-07 15:01:34

Description: 因为源里没有，通过deb文件安装libjasper1

Attentions:
- libjasper1依赖：
  multiarch-support

Depends:
-
!

####################################################################
#+++++++++++++++++++++++++ Define Variable ++++++++++++++++++++++++#
####################################################################
#------------------------- Program Variable
# program name
readonly name=$(basename "$0")

#------------------------- Parameter Variable
# 获取主机硬件架构
readonly machine=$(uname -m)

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo -e "Running \\e[01;32m$name\\e[0m ..."
echo -e "Machine: $machine\n"

case $machine in
x86_64 | x86 | amd64)
  # x86-64架构
  dpkg -i ./libjasper1_1.900.1-debian1-2.4+deb8u6_amd64.deb
  ;;
armv7l | armv7)
  # ARM 32-bit架构
  dpkg -i ./libjasper1_1.900.1-debian1-2.4+deb8u6_armhf.deb
  ;;
*)
  # 其他架构
  echo -e "\\e[31mNo libsnap7 meets the $machine architectural requirements\\e[0m"
  exit 1
  ;;
esac
