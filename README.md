# MyDockerfile

My Dockerfile

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [各分支构建状态](#各分支构建状态)
  * [base-python](#base-python)
  * [doctopus](#doctopus)
  * [doctopus-tr](#doctopus-tr)
  * [redis](#redis)

<!-- vim-markdown-toc -->

---

构建用分支有：

- [base-python](https://github.com/YHYJ/MyDockerfile/tree/base-python)
- [doctopus](https://github.com/YHYJ/MyDockerfile/tree/doctopus)
- [doctopus-tr](https://github.com/YHYJ/MyDockerfile/tree/doctopus-tr)
- [redis](https://github.com/YHYJ/MyDockerfile/tree/redis)

分为3条构建路线：

- libary/python:alpine --> base-python:alpine --> doctopus:latest
- libary/python:slim --> base-python:slim --> doctopus:tr
- libary/redis:6.0-alpine --> redis:latest

---

## 各分支构建状态

### base-python

[![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=base-python)](https://travis-ci.org/YHYJ/MyDockerfile)

### doctopus

[![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=doctopus)](https://travis-ci.org/YHYJ/MyDockerfile)

### doctopus-tr

[![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=doctopus-tr)](https://travis-ci.org/YHYJ/MyDockerfile)

### redis

[![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=redis)](https://travis-ci.org/YHYJ/MyDockerfile)
