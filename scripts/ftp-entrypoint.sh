#!/bin/bash
PYTHONPATH="/srv/pydj"
DJANGO_SETTINGS_MODULE="pydj.settings"

cd /srv/pydj
source bin/activate
pip install validators
python manage.py ftp
