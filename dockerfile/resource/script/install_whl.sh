#!/usr/bin/env bash

: <<!
Name: install_whl.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-11-06 14:33:44

Description: 因为某些python库编译耗时太长，直接安装whl文件

Attentions:

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

# whl文件地址
# --- pycryptodome
readonly pycryptodome_x86="https://files.pythonhosted.org/packages/aa/36/f97c4b16619618e169b9e0d687eab78868c7474ff8c1ec6f584a8b10b29b/pycryptodome-3.9.9-cp37-cp37m-manylinux1_x86_64.whl"
# readonly pycryptodome_aarch64="https://files.pythonhosted.org/packages/2f/9b/b9c98400bab6d2188781b89ee20a479d7f54877f70167edc1090ed918356/pycryptodome-3.9.9-cp37-cp37m-manylinux2014_aarch64.whl"
readonly pycryptodome_armv7l="https://www.piwheels.org/simple/pycryptodome/pycryptodome-3.9.9-cp37-cp37m-linux_armv7l.whl"
# --- gevent
readonly gevent_x86="https://files.pythonhosted.org/packages/ff/a0/acbe4aecc341cc38641e82e2c12497f9ff4b621730e40c0c0411ad867a90/gevent-20.9.0-cp37-cp37m-manylinux2010_x86_64.whl"
# readonly gevent_aarch64="TODO"
readonly gevent_armv7l="https://www.piwheels.org/simple/gevent/gevent-20.9.0-cp37-cp37m-linux_armv7l.whl"
# --- pymssql-linux
readonly pymssql_linux_x86="https://files.pythonhosted.org/packages/ff/a1/2ed1ee1fc87adb3fd3bd2fc221edf5702bde8d7a21ea39addadcf16bde6e/pymssql_linux-2.1.6-cp37-cp37m-manylinux2010_x86_64.whl"
# readonly pymssql_linux_aarch64="TODO"
readonly pymssql_linux_armv7l="./pymssql_linux-2.1.6-cp37-cp37m-linux_armv7l.whl"

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo -e "Running \\e[01;32m$name\\e[0m ..."
echo -e "Machine: $machine\n"

case $machine in
x86_64 | amd64)
  # x86-64架构
  pip install --no-cache-dir --upgrade $pycryptodome_x86
  pip install --no-cache-dir --upgrade $gevent_x86
  pip install --no-cache-dir --upgrade $pymssql_linux_x86
  ;;
armv7l)
  # ARM 32-bit架构
  pip install --no-cache-dir --upgrade $pycryptodome_armv7l
  pip install --no-cache-dir --upgrade $gevent_armv7l
  pip install --no-cache-dir --upgrade $pymssql_linux_armv7l
  ;;
*)
  # 其他架构
  echo -e "\\e[31mUnsupported architecture: $machine\\e[0m"
  exit 1
  ;;
esac
