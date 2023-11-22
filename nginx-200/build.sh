#!/usr/bin/env bash

docker buildx build --platform linux/amd64,linux/arm64 -t getgoetz/nginx-200:1.24.0 -t getgoetz/nginx-200:latest . --push
