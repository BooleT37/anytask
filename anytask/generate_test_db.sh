#!/bin/bash

[[ -f sqlite3.db ]] && echo "sqlite3.db already exists!" && exit 1

./manage.py syncdb --noinput
./manage.py migrate
./manage.py createsuperuser --username=anytask --email=anytask@yandex.ru --noinput
echo 'from django.contrib.auth.models import User ; user=User.objects.get(username="anytask") ; user.set_password("P@ssw0rd") ; user.save() ; print "Password changed"' | ./manage.py shell --plain
