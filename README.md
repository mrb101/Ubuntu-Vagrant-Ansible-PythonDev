# Python Django Ansible

A quick and easy way to create a base VM for Django development.

This stack is based on Ubuntu Linx, Gunicorn, Nginx and Postgresql

+ Pip
+ Gunicorn
+ VirtualEnv
+ Python 2.7
+ Django 1.5
+ NGINX
+ PostgreSQL

## Use

If you already have ansible installed then getting a Django environment running is quick and easy

```
# Bring up the VM
vagrant up

# Provision the VM
vagrant provision
```

To create a new Django project

```
vagrant ssh
cd /vagrant
./django.sh
source venv/bin/activate
```

Inside the VM start the Django server which will now be available via http://localhost:8000 or 8080 via NGINX

```
manage.py runserver 0.0.0.0:8000
```

## Postgres

Postgres will already be installed on your VM. To setup a new database for your application:

```
vagrant ssh
sudo -u postgres psql
alter user postgres password 'postgres';
create database mydb;
```

Update your Django config (settings.py)

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'mydb',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'localhost',
        'PORT': '',
    }
}
```

## Gunicorn + Nginx

Install Gunicorn

```
pip install gunicorn
gunicorn YOURAPPNAME.wsgi:application -b 0.0.0.0:8000
```

## Nginx config

TODO

