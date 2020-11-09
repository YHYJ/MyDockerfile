#!/usr/bin/env bash

: <<!
Name: configure_pip.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-09-05 17:38:44

Description: 根据架构配置pip源

Attentions:
- amd64架构使用国内镜像源（如清华源）即可
- arm架构因为官方源（包括各镜像源）需要编译，所以配置为piwheels源直接安装whl文件

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
# pip配置文件路径
readonly pip_conf="/etc/pip.conf"

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo -e "Running \\e[01;32m$name\\e[0m ..."
echo -e "Machine: $machine\n"

case $machine in
x86_64 | amd64)
  # x86-64架构
  printf "[global]\nindex-url = http://mirrors.aliyun.com/pypi/simple\ntrusted-host = mirrors.aliyun.com" >"$pip_conf"
  ;;
aarch64 | armv7l)
  # 其他架构
  printf "[global]\nextra-index-url = https://www.piwheels.org/simple" >"$pip_conf"
  ;;
*)
  # 其他架构
  echo -e "\\e[31mUnsupported architecture: $machine\\e[0m"
  exit 1
  ;;
esac
