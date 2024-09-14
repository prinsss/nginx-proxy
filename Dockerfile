FROM nginx:alpine

ENV PORT=80 \
  NGINX_PROXY_TYPE=reverse \
  NGINX_PROXY_SERVER_EXTRA="" \
  NGINX_PROXY_LOCATION_EXTRA=""

COPY ./conf.d/ /etc/nginx/conf.d/
COPY ./start.sh /start.sh

CMD ["sh", "/start.sh"]
