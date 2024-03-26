#!/usr/bin/env bash

docker buildx build --platform linux/amd64,linux/arm64 -t getgoetz/python-django:3.12-slim-bookworm -t getgoetz/python-django:latest . --push
