#!/bin/sh

envsubst '${GATEWAY_HOST} ${GATEWAY_PORT}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
