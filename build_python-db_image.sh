#!/usr/bin/env bash

: <<!
Name: build_python-db_image.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-12-21 11:20:12

Description: 构建python-db:base-python-alpine镜像

Attentions: 基于base-python:alpine构建python-db:base-python-alpine镜像，用于操作数据库

Depends:
-
!

# 命令返回值不为0即退出
set -e

####################################################################
#+++++++++++++++++++++++++ Define Variable ++++++++++++++++++++++++#
####################################################################
#------------------------- Program Variable
# program name
readonly name=$(basename "$0")

#------------------------- Parameter Variable
# 用户名
readonly username=$DOCKER_USERNAME
# 基础镜像的name和tag
readonly base_image_name="$username/base-python"
readonly base_image_tag="3.7-alpine3.11"
# 要构建的python-db镜像的name和tag
readonly image_name="$username/python-db"
readonly image_tag="base-python-alpine"

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo -e "Running $name ...\n"

# 构建redis镜像
docker buildx build --file ./dockerfile/Dockerfile_python-db_base-python-alpine \
                    --platform linux/amd64,linux/arm/v7 \
                    --build-arg base_image_name="$base_image_name" \
                    --build-arg base_image_tag="$base_image_tag" \
                    --tag "$image_name:$image_tag" \
                    . --push
