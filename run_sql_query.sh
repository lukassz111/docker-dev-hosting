#!/bin/bash
echo "[mysql, query] $1"
./cp_to_service.sh ./mysql.cnf mysql /root/.my.cnf
./cp_to_service.sh ./build/mysql/sqlrun.sh mysql /root/sqlrun.sh
./proxy.sh mysql chown root /root/sqlrun.sh
./proxy.sh mysql chmod +x /root/sqlrun.sh

./proxy.sh mysql chown root /root/.my.cnf
./proxy.sh mysql chmod 0444 /root/.my.cnf
mkdir ./tmp
echo $1 > ./tmp/sql.sql
./cp_to_service.sh ./tmp/sql.sql mysql /tmp/sql.sql
rm ./tmp/sql.sql
./proxy.sh mysql ls /tmp
./proxy.sh mysql /root/sqlrun.sh $2
./proxy.sh mysql rm /tmp/sql.sql