FROM nginx:1.19-alpine

COPY etc/default.conf .
COPY html /usr/share/nginx/html

# I use the tool envsubst to replace the value ${PORT}
# with the one supplied by Cloud Run 
CMD /bin/sh -c "envsubst < default.conf > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"