docker volume prune
# remove stop container
docker ps -q |xargs docker rm  
docker images -q |xargs docker rmi
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
