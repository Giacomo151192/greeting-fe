FROM docker.io/library/nginx:stable
COPY /app/dist/prova-variabili-ambiente/ /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
RUN sed -i.bak 's/listen\(.*\)80;/listen 8081;/' /etc/nginx/conf.d/default.conf
CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/assets/env.template.js > /usr/share/nginx/html/assets/env.js && exec nginx -g 'daemon off;'"]
