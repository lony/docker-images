# nginx-200

nginx image for testing, for example AWS ECS setups. It always returns an 200 return code, independent of path called. During startup you can specify the following parameters:
- NGINX_PORT - Port listening on
- NGINX_BODY - HTML content to show when called


## Usage

It can be used as follows, whereas the container port and NGINX_PORT have to match and are `2222` in this example.

*docker-compose.yml*
```
version: "3.5"
services:
  nginx:
    container_name: nginx
    build: .
    image: getgoetz/nginx-200
    ports:
      - "127.0.0.1:80:2222"
    environment:
      - NGINX_PORT=2222
      - NGINX_BODY=docker_compose_morph_new
```


## Content

Image is based on nginx

*Dockerfile*
```
# https://github.com/nginxinc/docker-nginx/blob/1a8d87b69760693a8e33cd8a9e0c2e5f0e8b0e3c/stable/debian/Dockerfile
FROM nginx:1.24

COPY ./templates/default.conf.template /etc/nginx/templates/default.conf.template

ENTRYPOINT ["/docker-entrypoint.sh"]

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
```

The added config allows changing the listener port and body of response using environment variable during startup.

*default.conf.template*
```
server {
    listen       ${NGINX_PORT};
    return 200   '${NGINX_BODY}';
    add_header   Content-Type text/plain;
}
```
