docker-compose down
docker rmi greatapp
docker build -t greatapp .
docker-compose up -d
