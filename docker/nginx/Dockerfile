FROM nginx:alpine

COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
COPY certs /etc/nginx/certs
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
