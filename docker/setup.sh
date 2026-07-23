# DOCKER SETUP
docker volume create logs-volume

# API
docker image pull datascientest/fastapi:1.0.0
docker container run -p 8000:8000 --name reverent_hodgkin --mount type=volume,src=logs-volume, dst=/home/logs datascientest/fastapi:1.0.0
docker network connect api-tests reverent_hodgkin

#

# FIRST TEST
docker image build . -f Dockerfile-id-test -t dockerfile-id-test:latest
docker container run --mount type=volume,src=logs-volume,dst=/home/logs --network api-tests dockerfile-id-test:latest

# SECOND TEST
docker image build . -f Dockerfile-credential-test -t dockerfile-credential-test:latest
docker container run --mount type=volume,src=logs-volume,dst=/home/logs --network api-tests dockerfile-credential-test:latest
