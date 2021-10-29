
# rm *.tar
args=("$@")
for arg in "${args[@]}"; do  : 
    docker load -i ${arg}.tar
done

# docker save $(docker images -q) -o ./dockersimages.tar
