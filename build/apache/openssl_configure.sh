#!/bin/bash
apk add openssl

cat >> openssl.cnf <<EOF
[ req ]
prompt = no
distinguished_name = req_distinguished_name

[ req_distinguished_name ]
C = GB
ST = Test State
L = Test Locality
O = Org Name
OU = Org Unit Name
CN = Common Name
emailAddress = test@email.com
EOF

openssl req -config openssl.cnf -x509 -nodes -days 1095 -newkey rsa:2048 -out /usr/local/apache2/conf/server.crt -keyout /usr/local/apache2/conf/server.key

rm openssl.cnf