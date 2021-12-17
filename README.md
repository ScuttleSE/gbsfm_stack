This is a repo for the docker-images used in the GBSfm-stack. They have other dependencies, so just trying to build these images won't work unless you know what you are doing.

Fastest way to get up and running is to clone this repo and build a docker image with the web UI

* Clone the repo and use docker build:

Yes, there is a bunch of variables set here. Only the first three are really important, the rest can be set to whatever if it's just the web UI you want to get up and running.

docker build -t gbsfm/web --rm=true -f Dockerfile.gbsfm-web-python3 . --pull=true --build-arg DRONE_DATABASE_HOST=1.1.1.1 \
--build-arg DRONE_DATABASE_PASSWORD=db-passwd \
--build-arg DRONE_DATABASE_USERNAME=dbuser \
--build-arg DRONE_NEXT_PASSWORD=nextpw \
--build-arg DRONE_SA_PASSWORD=somethingawful-pw \
--build-arg DRONE_SA_USERNAME=somethingawfule-user \
--build-arg DRONE_SECRET_KEY=x \
--build-arg DRONE_LISTENERS=x \
--build-arg DRONE_TELNETHOST=1.1.1.1 \
--build-arg DRONE_META_USER=x \
--build-arg DRONE_META_KEY=x \
--build-arg DRONE_PORTAINER_USER=x \
--build-arg DRONE_PORTAINER_PASS=x \
--build-arg DRONE_CI=x

* Run the image

docker run -it -p 9000:9000 gbsfm/web:latest

This'll start up the web UI on port 9000