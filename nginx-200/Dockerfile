# https://hub.docker.com/_/nginx
# https://github.com/nginxinc/docker-nginx/blob/1a8d87b69760693a8e33cd8a9e0c2e5f0e8b0e3c/stable/debian/Dockerfile
FROM nginx:1.24

COPY ./templates/default.conf.template /etc/nginx/templates/default.conf.template

ENTRYPOINT ["/docker-entrypoint.sh"]

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
