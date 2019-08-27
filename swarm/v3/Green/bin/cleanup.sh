#!/usr/bin/env bash
#Author: WANG YONG TAO

# 删除dop服务栈
docker stack rm dop-infra dop-platform dop-apps

# 停止所有docker容器
docker kill $(docker ps -q | grep -v "java\|springboot-assy-filebeat\|task-repository\|ops-fe" | awk '{if (NR>1){print $1}}')

# 删除所有docker容器
docker rm $(docker ps -aq | grep -v "java\|springboot-assy-filebeat\|task-repository\|ops-fe" | awk '{if (NR>1){print $1}}')

# 清理所有虚镜像
yes y | head -1 | docker image prune

# 删除java springboot-assy-filebeat以外的所有镜像
docker rmi $(docker images | grep -v "java\|springboot-assy-filebeat\|task-repository\|ops-fe" | awk '{if (NR>1){print $3}}')