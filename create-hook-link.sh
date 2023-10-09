#!/usr/bin/env bash

: << !
Name: create-hook-link.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2023-09-18 13:37:04

Description: 创建git钩子

Attentions:
-

Depends:
-
!

mkdir .git/hooks
ln -sf ../../hooks/post-checkout .git/hooks/post-checkout
