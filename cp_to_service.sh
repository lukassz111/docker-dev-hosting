#!/bin/bash

container_name=$(sudo docker-compose ps | grep $2 | awk '{ print $1 }')

is_service_working=`sudo docker-compose ps | grep -v Exit | grep mysql | wc -l`
if [ $is_service_working = "0" ]
then
    echo "Service mysql not enabled, in first you need to start it"
    sudo docker-compose ps
    exit 0
fi

echo "[$2, docker cp] $1 $container_name:$3"
sudo docker cp $1 $container_name:$3