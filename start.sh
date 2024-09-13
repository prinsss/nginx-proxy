#!/bin/sh

envsubst '$NGINX_PROXY_PASS $NGINX_PROXY_HOST' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
