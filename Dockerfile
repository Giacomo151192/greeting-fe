FROM docker.io/library/nginx:stable
COPY --from=build-1 /app/dist/build/ /usr/share/nginx/html
COPY --from=build-1 /nginx.conf /etc/nginx/conf.d/default.conf
CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/assets/env.template.js > /usr/share/nginx/html/assets/env.js && exec nginx -g 'daemon off;'"]
