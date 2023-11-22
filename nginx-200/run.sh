#!/usr/bin/env bash

docker compose stop
# https://docs.docker.com/engine/reference/commandline/compose_up/
docker compose up -d --force-recreate
docker compose ps
# https://docs.docker.com/engine/reference/commandline/compose_logs/
docker compose logs -f
# docker-compose down
# https://docs.docker.com/engine/reference/commandline/compose_rm/
# docker compose rm