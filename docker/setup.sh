docker image build . -f Dockerfile-id-test -t dockerfile-id-test:latest
docker container run --mount type=volume, dst=/home/logs --network api-tests dockerfile-id-test:latest
