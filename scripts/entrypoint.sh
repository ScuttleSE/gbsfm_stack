#!/bin/bash
PYTHONPATH="/srv/pydj"
DJANGO_SETTINGS_MODULE="pydj.settings"
touch /home/gbsfm/listeners.txt

nohup /home/gbsfm/listeners.sh >/dev/null 2>&1&

nohup /home/gbsfm/metadataupdater.sh >/dev/null 2>&1&


cd /srv/pydj
source bin/activate
pip install validators pymysql

nohup /home/gbsfm/remaining.py >/dev/null 2>&1&

nohup /home/gbsfm/playjingle.py >/dev/null 2>&1&

python manage.py collectstatic --noinput
uwsgi --ini server_config/pydj_uwsgi.ini
tail -f /srv/logs/uwsgi.log
