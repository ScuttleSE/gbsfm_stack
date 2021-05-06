#!/bin/bash

echo "DATABASE_HOST = '$DRONE_DATABASE_HOST'" > /srv/pydj/other_settings.py
echo "DATABASE_PASSWORD = '$DRONE_DATABASE_PASSWORD'" >> /srv/pydj/other_settings.py
echo "DATABASE_USERNAME = '$DRONE_DATABASE_USERNAME'" >> /srv/pydj/other_settings.py
echo "NEXT_PASSWORD = '$DRONE_NEXT_PASSWORD'" >> /srv/pydj/other_settings.py
echo "SA_PASSWORD = '$DRONE_SA_PASSWORD'" >> /srv/pydj/other_settings.py
echo "SA_USERNAME = '$DRONE_SA_USERNAME'" >> /srv/pydj/other_settings.py
echo "SECRET_KEY = '$DRONE_SECRET_KEY'" >> /srv/pydj/other_settings.py

sed -i "s/username:password/$DRONE_LISTENERS/g" /home/gbsfm/listeners.sh

sed -i "s/(host=''/(host='$DRONE_DATABASE_HOST'/g" remaining.py
sed -i "s/user=''/user='$DRONE_DATABASE_USERNAME'/g" remaining.py
sed -i "s/password=''/password='$DRONE_DATABASE_PASSWORD'/g" remaining.py