#!/bin/bash

./cp_to_service.sh $1 mysql /root/import.sql
./run_sql_query.sh "SOURCE /root/import.sql;" $2