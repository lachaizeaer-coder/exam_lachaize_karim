#### API
docker image pull datascientest/fastapi:1.0.0

#### FIRST TEST
docker image build . -f Dockerfile-id-test -t dockerfile-id-test:latest
#### SECOND TEST
docker image build . -f Dockerfile-credential-test -t dockerfile-credential-test:latest
#### THIRD TEST
docker image build . -f Dockerfile-API-run-test -t dockerfile-api-run-test:latest

#### RUN DOCKER COMPOSE
docker compose -f docker-compose.yml up
