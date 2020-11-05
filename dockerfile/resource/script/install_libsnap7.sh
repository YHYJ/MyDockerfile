#!/usr/bin/env bash

: <<!
Name: install_libsnap7.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-09-05 12:40:20

Description: 根据架构安装libsnap7.so

Attentions:
-

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
  ln -s /usr/local/lib/snap7/libsnap7_x86_64_linux.so /usr/lib/libsnap7.so
  echo -e ""
  ;;
armv7l | armv7)
  # ARM 32-bit架构
  ln -s /usr/local/lib/snap7/libsnap7_arm_v7_linux.so /usr/lib/libsnap7.so
  echo -e ""
  ;;
aarch64 | arm64)
  # ARM 64-bit架构
  ln -s /usr/local/lib/snap7/libsnap7_arm64_linux.so /usr/lib/libsnap7.so
  echo -e ""
  ;;
*)
  # 其他架构
  echo -e "\\e[31mNo libsnap7 meets the $machine architectural requirements\\e[0m"
  exit 1
  ;;
esac
