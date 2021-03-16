#!/bin/bash
mysql --defaults-extra-file=/root/.my.cnf $1 < /tmp/sql.sql