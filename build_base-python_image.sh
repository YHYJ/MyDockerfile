#!/usr/bin/env bash

: <<!
Name: build_base-python_image.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-09-01 13:43:46

Description: 使用python:alpine官方镜像构建base-python:alpine镜像

Attentions: libary/python:3.7-alpine3.11 --> base-python:3.7-alpine3.11

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
# 要拉取的官方python镜像的tag
readonly base_image_name="python"
readonly base_image_tag="3.7-alpine3.11"
# 要构建的base-python镜像的name和tag
readonly image_name="$username/base-python"
readonly image_tag="$base_image_tag"

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo -e "Running \\e[01;32m$name\\e[0m ...\n"

# 构建alpine版base-python镜像：使用Dockerfile_base-python_alpine文件进行构建并传递基础镜像名称变量base_image_tag，构建的镜像名为base-python:$base_image_tag
echo -e "\\e[01mBuilding\\e[0m \\e[01;34m$image_name:$image_tag\\e[0m ..."
docker buildx build --file ./dockerfile/Dockerfile_base-python_alpine \
                    --platform linux/amd64,linux/arm/v7 \
                    --build-arg base_image_name="$base_image_name" \
                    --build-arg base_image_tag="$base_image_tag" \
                    --tag "$image_name:$image_tag" \
                    . --push
