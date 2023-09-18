#!/usr/bin/env bash

: << !
Name: create.hook.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2023-09-18 13:37:04

Description: 创建post-checkout钩子

Attentions:
-

Depends:
-
!

ln -sf ../../hooks/post-checkout .git/hooks/post-checkout
