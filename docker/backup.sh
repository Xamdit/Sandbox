rm ./dockersimages.tar
docker save $(docker images -q) -o ./dockersimages.tar