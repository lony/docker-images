# see https://hub.docker.com/_/python
# Debian https://en.wikipedia.org/wiki/Debian_version_history
FROM python:3.12-slim-bookworm

# Set environment variables
# - Do not compile to byte code only makes sense for things running once
# see https://stackoverflow.com/questions/59732335/is-there-any-disadvantage-in-using-pythondontwritebytecode-in-docker
#ENV PYTHONDONTWRITEBYTECODE 1
# - Output buffer is disabled
# see https://stackoverflow.com/questions/59812009/what-is-the-use-of-pythonunbuffered-in-docker-file
ENV PYTHONUNBUFFERED 1
# - Run apt in none interactive mode
# see https://askubuntu.com/questions/972516/debian-frontend-environment-variable
ENV DEBIAN_FRONTEND noninteractive

# updating docker host or host machine
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# update pip
RUN pip install --no-cache-dir --upgrade pip

# changing current working directory to /usr/src/app
WORKDIR /usr/src/app

# copying all the files to present working directory
COPY templates/code_django/ .
COPY templates/docker-entrypoint.sh .

# installing dependency in container
RUN pip install --no-cache-dir -r requirements.txt

# Create a user with UID 1000 and GID 1000
RUN groupadd -g 1000 appgroup && \
    useradd -r -u 1000 -g appgroup appuser

# Switch to this user
USER 1000:1000

# informing Docker that the container listens on the
# specified network ports at runtime i.e 8000.
EXPOSE 8000

# running server
ENTRYPOINT ["./docker-entrypoint.sh"]
