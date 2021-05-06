#!/bin/bash

echo "DATABASE_HOST = '$DRONE_DATABASE_HOST'" > other_settings.py
echo "DATABASE_PASSWORD = '$DRONE_DATABASE_PASSWORD'" >> other_settings.py
echo "DATABASE_USERNAME = '$DRONE_DATABASE_USERNAME'" >> other_settings.py
echo "NEXT_PASSWORD = '$DRONE_NEXT_PASSWORD'" >> other_settings.py
echo "SA_PASSWORD = '$DRONE_SA_PASSWORD'" >> other_settings.py
echo "SA_USERNAME = '$DRONE_SA_USERNAME'" >> other_settings.py
echo "SECRET_KEY = '$DRONE_SECRET_KEY'" >> other_settings.py
