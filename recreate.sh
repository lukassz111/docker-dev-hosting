#/bin/bash
docker-compose stop
docker-compose rm
docker-compose build
docker-compose up --no-start