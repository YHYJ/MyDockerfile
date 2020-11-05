# README

包含tr环境的ziyan的构建

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

<!-- vim-markdown-toc -->

---

需要先基于base-python:3.7-slim镜像构建出doctopus:tr镜像，然后使用doctopus:tr镜像构建ziyan:tr

至于和ziyan:tr配套的chitu，目前(2020-09-03 16:28)考虑使用基于alpine的chitu即可

**tr自带的libtr.so只支持amd64，无法编译arm架构的镜像**

---

[安装opencv-python依赖（如果当前还是不管用的话再说）](https://blog.piwheels.org/new-opencv-builds)

[libjasper1 deb下载地址](http://security-cdn.debian.org/debian-security/pool/updates/main/j/jasper)
