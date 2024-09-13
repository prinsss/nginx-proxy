FROM nginx:alpine

COPY ./conf.d/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY ./start.sh /start.sh

CMD ["sh", "/start.sh"]
