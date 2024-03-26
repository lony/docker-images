# python-django

Python image for testing a [Django](https://www.djangoproject.com) application, for example on AWS ECS.


## Usage

As it contains Django code it may need to be altered to copy YOUR code.
For testing it can be run as it is. It should allow requests from any IP.


## Content

Image is based on Python and and Django application

### Django

#### Bootstrap

The following commands describe how the code in `python-django/templates/code_django` was created following [this guide](https://docs.djangoproject.com/en/5.0/intro/install/):

```
python3 -m venv .venv
source .venv/bin/activate
pip install Django
pip freeze >> requirements.txt
django-admin startproject my_project .
python manage.py startapp my_app
python manage.py runserver 8000
open http://127.0.0.1:8000
```

#### Test

Use the following commands if you want to run Django locally for testing.

```
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python manage.py runserver 8000
```


## Inspired by

- https://blog.ploetzli.ch/2020/efficient-multi-stage-build-django-docker/
- https://testdriven.io/blog/deploying-django-to-ecs-with-terraform/
- https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/
- https://dev.to/daiquiri_team/deploying-django-application-on-aws-with-terraform-minimal-working-setup-587g
- https://blog.logrocket.com/dockerizing-django-app/
