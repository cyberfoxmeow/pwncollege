#!/bin/sh

docker container start nginx-proxy-letsencrypt
docker container start nginx-proxy 

rm -rf config.env
cp config_template.env config.env
echo "VIRTUAL_HOST="$1 >> config.env
echo "LETSENCRYPT_HOST="$1 >> config.env

./setup_afterreboot.sh sutd_syssec
./run.sh
