#!/bin/bash
PYTHONPATH="/srv/pydj"
DJANGO_SETTINGS_MODULE="pydj.settings"

cd /srv/pydj
source bin/activate
python manage.py ftp
