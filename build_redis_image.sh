#!/usr/bin/env bash

: <<!
Name: build_redis_image.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-09-03 13:22:46

Description: 拉取并构建Redis镜像

Attentions: 基于Redis官方基础镜像构建增加默认配置参数

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
readonly base_image_name="redis"
readonly base_image_tag="6.0-alpine"
# 要构建的redis镜像的name和tag
readonly image_name="redis"
readonly image_tag="latest"

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo -e "Running $name ...\n"

# 构建redis镜像
docker buildx build --file ./dockerfile/Dockerfile_redis_latest \
                    --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
                    --build-arg base_image_name="$base_image_name" \
                    --build-arg base_image_tag="$base_image_tag" \
                    --tag "$username/$image_name:$image_tag" \
                    . --push
