# rm *.tar
args=("$@")
for arg in "${args[@]}"; do  :
    docker commit -p ${arg} ${arg}
    docker save -o ${arg}.tar ${arg}
done

# docker save $(docker images -q) -o ./dockersimages.tar