#!/bin/sh

if [ "$NGINX_PROXY_TYPE" = "reverse" ]; then
  envsubst '$PORT $NGINX_PROXY_PASS $NGINX_PROXY_HOST $NGINX_PROXY_SERVER_EXTRA $NGINX_PROXY_LOCATION_EXTRA' \
    < /etc/nginx/conf.d/reverse.conf.template \
    > /etc/nginx/conf.d/default.conf
fi

if [ "$NGINX_PROXY_TYPE" = "redirect" ]; then
  envsubst '$PORT $NGINX_PROXY_REDIRECT_CODE $NGINX_PROXY_REDIRECT_URL $NGINX_PROXY_SERVER_EXTRA $NGINX_PROXY_LOCATION_EXTRA' \
    < /etc/nginx/conf.d/redirect.conf.template \
    > /etc/nginx/conf.d/default.conf
fi

if [ "$NGINX_PROXY_TYPE" = "remote" ]; then
  curl -L -o /etc/nginx/conf.d/default.conf $NGINX_PROXY_REMOTE_CONFIG_URL
fi

echo "Starting Nginx using the following configuration:"
cat /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
