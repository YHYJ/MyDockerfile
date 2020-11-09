# README

构建base-python:slim镜像

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

<!-- vim-markdown-toc -->

---

[![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=base-python)](https://travis-ci.org/YHYJ/MyDockerfile)

---

Question List:

- [] 在amd64上构建base-python:slim的时候安装gevent没问题，在arm上报错没有gcc

    猜测是在amd64上不需要编译，在arm上需要编译安装gevent,因此要用到gcc
