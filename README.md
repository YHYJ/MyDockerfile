# MyDockerfile

My Dockerfile

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [各分支构建状态](#各分支构建状态)

<!-- vim-markdown-toc -->

---

构建用分支有：

- base-python
- doctopus
- doctopus-tr
- redis

分为两条构建路线：

- base-python --> doctopus/doctopus-tr
- redis

因为doctopus/doctopus-tr是以base-python为基础镜像进行构建的，如果base-python和doctopus/doctopus-tr都更新了，但构建时doctopus/doctopus-tr先于base-python构建完成则使用的是旧版base-python

---

## 各分支构建状态

[base-python](https://github.com/YHYJ/MyDockerfile/tree/base-python) - [![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=base-python)](https://travis-ci.org/YHYJ/MyDockerfile)

[doctopus](https://github.com/YHYJ/MyDockerfile/tree/doctopus) - [![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=doctopus)](https://travis-ci.org/YHYJ/MyDockerfile)

[doctopus-tr](https://github.com/YHYJ/MyDockerfile/tree/doctopus-tr) - [![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=doctopus-tr)](https://travis-ci.org/YHYJ/MyDockerfile)

[redis](https://github.com/YHYJ/MyDockerfile/tree/redis) - [![Build Status](https://travis-ci.org/YHYJ/MyDockerfile.svg?branch=redis)](https://travis-ci.org/YHYJ/MyDockerfile)
