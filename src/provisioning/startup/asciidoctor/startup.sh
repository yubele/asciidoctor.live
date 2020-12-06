#!/bin/bash
. $(dirname $BASH_SOURCE)/../bootstrap.sh
cd /var/www/docker
# Compile docs
for i in $(find ./ -name '*.adoc')
do
    bash bin/generate.sh $i
done
/usr/sbin/nginx -c /etc/nginx/nginx.conf -g 'daemon off;'