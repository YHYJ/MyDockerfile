# MyDockerfile

<!-- File: README.md -->
<!-- Auther: YJ -->
<!-- Email: yj1516268@outlook.com -->
<!-- Created Time: 2021-04-22 08:45:08 -->

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [分支列表](#分支列表)
* [构建路线](#构建路线)
* [各镜像构建状态](#各镜像构建状态)

<!-- vim-markdown-toc -->

---

我的Dockerfile文件

镜像构建过程由Github Actions自动执行

---

## 分支列表

描述性分支有：

- [main](https://github.com/YHYJ/MyDockerfile/tree/main)

构建用分支有：

- [base-python_alpine](https://github.com/YHYJ/MyDockerfile/tree/base-python_alpine)
- [base-python_slim](https://github.com/YHYJ/MyDockerfile/tree/base-python_slim)
- [doctopus_latest](https://github.com/YHYJ/MyDockerfile/tree/doctopus_latest)
- [doctopus-tr](https://github.com/YHYJ/MyDockerfile/tree/doctopus-tr)
- [python-db_base-python-alpine](https://github.com/YHYJ/MyDockerfile/tree/python-db_base-python-alpine)
- [redis_latest](https://github.com/YHYJ/MyDockerfile/tree/redis_latest)

## 构建路线

分为4条构建路线：

- libary/python:alpine --> base-python:alpine --> doctopus:latest
- libary/python:alpine --> python-db:base-python-alpine
- libary/python:slim --> base-python:slim --> doctopus:tr
- libary/redis:6.0-alpine --> redis:latest

---

## 各镜像构建状态

| base-python:3.7-alpine3.11                                                                                                                                                                     | base-python:3.7-slim                                                                                                                                                             |
| ---                                                                                                                                                                                            | ---                                                                                                                                                                              |
| ![Build docker image - base-python:3.7-alpine3.11](https://github.com/YHYJ/MyDockerfile/workflows/Build%20docker%20image%20-%20base-python:3.7-alpine3.11/badge.svg?branch=base-python_alpine) | ![Build docker image - base-python:3.7-slim](https://github.com/YHYJ/MyDockerfile/workflows/Build%20docker%20image%20-%20base-python:3.7-slim/badge.svg?branch=base-python_slim) |

| doctopus:latest                                                                                                                                                       | doctopus:tr                                                                                                                                               |
| ---                                                                                                                                                                   | ---                                                                                                                                                       |
| ![Build docker image - doctopus:latest](https://github.com/YHYJ/MyDockerfile/workflows/Build%20docker%20image%20-%20doctopus:latest/badge.svg?branch=doctopus_latest) | ![Build docker image - doctopus:tr](https://github.com/YHYJ/MyDockerfile/workflows/Build%20docker%20image%20-%20doctopus:tr/badge.svg?branch=doctopus_tr) |

| python-db:base-python-alpine                                                                                                                                                                                 |
| ---                                                                                                                                                                                                          |
| ![Build docker image - python-db:base-python-alpine](https://github.com/YHYJ/MyDockerfile/workflows/Build%20docker%20image%20-%20python-db:base-python-alpine/badge.svg?branch=python-db_base-python-alpine) |

| redis:latest                                                                                                                                                 |
| ---                                                                                                                                                          |
| ![Build docker image - redis:latest](https://github.com/YHYJ/MyDockerfile/workflows/Build%20docker%20image%20-%20redis:latest/badge.svg?branch=redis_latest) |
