#!/bin/bash

echo "DATABASE_HOST = '$DRONE_DATABASE_HOST'" > /srv/pydj/gbsfm/other_settings.py
echo "DATABASE_PASSWORD = '$DRONE_DATABASE_PASSWORD'" >> /srv/pydj/gbsfm/other_settings.py
echo "DATABASE_USERNAME = '$DRONE_DATABASE_USERNAME'" >> /srv/pydj/gbsfm/other_settings.py
echo "NEXT_PASSWORD = '$DRONE_NEXT_PASSWORD'" >> /srv/pydj/gbsfm/other_settings.py
echo "SA_PASSWORD = '$DRONE_SA_PASSWORD'" >> /srv/pydj/gbsfm/other_settings.py
echo "SA_USERNAME = '$DRONE_SA_USERNAME'" >> /srv/pydj/gbsfm/other_settings.py
echo "SECRET_KEY = '$DRONE_SECRET_KEY'" >> /srv/pydj/gbsfm/other_settings.py
echo "DRONE_CI = '$DRONE_CI'" >> /srv/pydj/gbsfm/other_settings.py
