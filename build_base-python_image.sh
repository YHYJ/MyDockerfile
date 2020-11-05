#!/usr/bin/env bash

: <<!
Name: build_base-python_image.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-09-01 13:43:46

Description: 使用python官方镜像构建base-python镜像

Attentions: libary/python(3.7-alpine3.11 & 3.7-slim) --> base-python(3.7-alpine3.11 & 3.7-slim)

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
readonly python_name_alpine="python"
readonly python_tag_alpine="3.7-alpine3.11"
readonly python_name_slim="python"
readonly python_tag_slim="3.7-slim"
# 要构建的base-python镜像的name和tag
readonly base_python_name_alpine="$username/base-python"
readonly base_python_tag_alpine="$python_tag_alpine"
readonly base_python_name_slim="$username/base-python"
readonly base_python_tag_slim="$python_tag_slim"

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo -e "Running \\e[01;32m$name\\e[0m ...\n"

# 构建alpine版base-python镜像：使用Dockerfile_base-python_alpine文件进行构建并传递基础镜像名称变量base_image_tag，构建的镜像名为base-python:$python_tag_alpine
echo -e "\\e[01mBuilding\\e[0m \\e[01;34m$base_python_name_alpine:$base_python_tag_alpine\\e[0m ..."
docker buildx build --file ./dockerfile/Dockerfile_base-python_alpine \
                    --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
                    --tag "$base_python_name_alpine:$base_python_tag_alpine" \
                    --build-arg base_image_name="$python_name_alpine" \
                    --build-arg base_image_tag="$python_tag_alpine" \
                    . --push

# 构建slim版base-python镜像：使用Dockerfile_base-python_slim文件进行构建并传递基础镜像名称变量base_image_tag，构建的镜像名为base-python:$python_tag_slim
echo -e "\\e[01mBuilding\\e[0m \\e[01;34m$base_python_name_slim:$base_python_tag_slim\\e[0m ..."
docker buildx build --file ./dockerfile/Dockerfile_base-python_slim \
                    --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
                    --tag "$base_python_name_slim:$base_python_tag_slim" \
                    --build-arg base_image_name="$python_name_slim" \
                    --build-arg base_image_tag="$python_tag_slim" \
                    . --push
