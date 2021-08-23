#/bin/bash
service_name=$1
command=${*:2}
is_service_working=`docker-compose ps | grep -v Exit | grep $1 | wc -l`
if [ $is_service_working = "0" ]
then
    echo "Service $service_name not enabled, in first you need to start it"
    docker-compose ps
fi
echo "[$service_name, run command] $command"
docker-compose exec $service_name $command