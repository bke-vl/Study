#!/bin/bash
cd /tmp/
openssl req -out $HOSTNAME.csr -new -newkey rsa:2048 -nodes -keyout privatekey.key -subj "/C=RU/ST=PK/L=Vld/O=Tenzor/OU=IT Department/CN=$HOSTNAME"
openssl x509 -signkey privatekey.key -in $HOSTNAME.csr -req -days 365 -out $HOSTNAME.crt
openssl rsa -in privatekey.key -out $HOSTNAME.key
cp /tmp/$HOSTNAME.* /etc/ssl/certs/