#!/bin/sh

cd /usr/src/app

# Run Django Migrations
python manage.py migrate

# Run Gunicorn
# see https://docs.gunicorn.org/en/stable/settings.html
exec gunicorn \
  --bind '[::]:8000' \
  --worker-tmp-dir /dev/shm \
  --workers "${GUNICORN_WORKERS:-3}" \
  my_project.wsgi:application
