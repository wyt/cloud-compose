#!/usr/bin/env bash
#Author: WANG YONG TAO

echo $1;

for line in $(docker images | grep "$1 " | awk '{print $1":"$2}'); do docker push $line; done