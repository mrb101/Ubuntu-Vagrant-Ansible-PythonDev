if [ "$#" -ne 1 ]
then
  echo "Usage: ./django.sh project_name"
  exit 1
else
  virtualenv venv --distribute
  source venv/bin/activate
  pip install django-toolbelt
  django-admin.py startproject $1 .
  echo "Start the server with: python manage.py runserver 0.0.0.0:8000"
fi


