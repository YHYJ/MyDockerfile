#!/usr/bin/env bash

: <<!
Name: build_doctopus_image.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-09-01 13:43:46

Description: 拉取base-python，构建doctopus镜像，最后构建ziyan/chitu镜像

Attentions: base-python:3.7-alpine3.11 --> doctopus:3.7-alpine3.11 -> ziyan:latest & chitu:latest
-

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
# 基础镜像base-python的name和tag
readonly base_image_name="$username/base-python"
readonly base_image_tag="3.7-alpine3.11"
# 要构建的doctopus镜像的name和tag
readonly doctopus_name="$username/doctopus"
readonly doctopus_tag="$base_image_tag"
# 要构建的ziyan/chitu镜像的name和tag
readonly ziyan_name="$username/ziyan"
readonly ziyan_tag="latest"
readonly chitu_name="$username/chitu"
readonly chitu_tag="latest"

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo -e "Running \\e[01;32m$name\\e[0m ...\n"

# 构建alpine版doctopus镜像
echo -e "\\e[01mBuilding\\e[0m \\e[01;34m$doctopus_name:$doctopus_tag\\e[0m ..."
docker buildx build --file ./dockerfile/Dockerfile_doctopus_alpine \
                    --platform linux/amd64,linux/arm64,linux/arm/v7 \
                    --tag "$doctopus_name:$doctopus_tag" \
                    --build-arg base_image_name="$base_image_name" \
                    --build-arg base_image_tag="$base_image_tag" \
                    . --push

# 构建ziyan镜像
echo -e "\\e[01mBuilding\\e[0m \\e[01;34m$ziyan_name:$ziyan_tag\\e[0m ..."
docker buildx build --file ./dockerfile/Dockerfile_ziyan_latest \
                    --platform linux/amd64,linux/arm64,linux/arm/v7 \
                    --tag "$ziyan_name:$ziyan_tag" \
                    --build-arg base_image_name="$doctopus_name" \
                    --build-arg base_image_tag="$doctopus_tag" \
                    . --push

# 构建chitu镜像
echo -e "\\e[01mBuilding\\e[0m \\e[01;34m$chitu_name:$chitu_tag\\e[0m ..."
docker buildx build --file ./dockerfile/Dockerfile_chitu_latest \
                    --platform linux/amd64,linux/arm64,linux/arm/v7 \
                    --tag "$chitu_name:$chitu_tag" \
                    --build-arg base_image_name="$doctopus_name" \
                    --build-arg base_image_tag="$doctopus_tag" \
                    . --push
