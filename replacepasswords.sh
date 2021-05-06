#!/bin/bash

sed -i 's/DRONE_SA_USERNAME/$DRONE_SA_USERNAME/g' other_settings.py
sed -i 's/DRONE_SA_PASSWORD/$DRONE_SA_PASSWORD/g' other_settings.py
sed -i 's/DRONE_SECRET_KEY/$DRONE_SECRET_KEY/g' other_settings.py
sed -i 's/DRONE_NEXT_PASSWORD/$DRONE_NEXT_PASSWORD/g' other_settings.py
sed -i 's/DRONE_DATABASE_USERNAME/$DRONE_DATABASE_USERNAME/g' other_settings.py
sed -i 's/DRONE_DATABASE_PASSWORD/$DRONE_DATABASE_PASSWORD/g' other_settings.py
sed -i 's/DRONE_DATABASE_HOST/$DRONE_DATABASE_HOST/g' other_settings.py