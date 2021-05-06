#!/bin/bash

echo "DATABASE_HOST = '$DRONE_DATABASE_HOST'" > /srv/pydj/other_settings.py
echo "DATABASE_PASSWORD = '$DRONE_DATABASE_PASSWORD'" >> /srv/pydj/other_settings.py
echo "DATABASE_USERNAME = '$DRONE_DATABASE_USERNAME'" >> /srv/pydj/other_settings.py
echo "NEXT_PASSWORD = '$DRONE_NEXT_PASSWORD'" >> /srv/pydj/other_settings.py
echo "SA_PASSWORD = '$DRONE_SA_PASSWORD'" >> /srv/pydj/other_settings.py
echo "SA_USERNAME = '$DRONE_SA_USERNAME'" >> /srv/pydj/other_settings.py
echo "SECRET_KEY = '$DRONE_SECRET_KEY'" >> /srv/pydj/other_settings.py

sed -i "s/username:password/$DRONE_LISTENERS/g" /home/gbsfm/listeners.sh

sed -i "s/(host=''/(host='$DRONE_DATABASE_HOST'/g" /home/gbsfm/remaining.py
sed -i "s/user=''/user='$DRONE_DATABASE_USERNAME'/g" /home/gbsfm/remaining.py
sed -i "s/password=''/password='$DRONE_DATABASE_PASSWORD'/g" /home/gbsfm/remaining.py
sed -i "s/telnethost = ''/telnethost='$DRONE_TELNETHOST'/g" /home/gbsfm/remaining.py

sed -i "s/userid=XXX/userid=$DRONE_META_USER/g" /home/gbsfm/metadataupdater.sh
sed -i "s/key=YYY/key=$DRONE_META_KEY/g" /home/gbsfm/metadataupdater.sh
sed -i "s/username:password/$DRONE_LISTENERS/g" /home/gbsfm/metadataupdater.sh

sed -i "s/USERNAME=xxx/USERNAME=$DRONE_PORTAINER_USER/g" /home/gbsfm/restartstuff.sh
sed -i "s/PASSWORD=yyy/PASSWORD=$DRONE_PORTAINER_PASS/g" /home/gbsfm/restartstuff.sh


